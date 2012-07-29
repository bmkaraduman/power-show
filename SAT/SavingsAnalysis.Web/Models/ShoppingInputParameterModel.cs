namespace SavingsAnalysis.Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Reflection;
    using System.Text;
    using System.Text.RegularExpressions;

    using log4net;

    using global::SavingsAnalysis.AnalysisEngine.Core;

    using global::SavingsAnalysis.AnalysisEngine.Shopping;

    using global::SavingsAnalysis.Web.ViewModels;

    public class ShoppingInputParameterModel
    {
        #region Fields

        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly string connectionString;

        #endregion

        #region Constructors and Destructors

        public ShoppingInputParameterModel(string fileName)
        {
            this.connectionString =
                Repository.BuildConnectionString(
                    EnvironmentSettings.GetInstance().DatabaseConnectionString, fileName.Replace(".zip", string.Empty));
        }

        #endregion

        #region Public Methods and Operators

        public ShoppingInputParameterViewModel Build()
        {
            DateTime startDate;
            DateTime endDate;
            var totalDistributionCount = 0;
            var period = Convert.ToInt32(EnvironmentSettings.GetConfigSectionValues("Shopping")["Period"]);
            GetShoppingStartAndEndDates(
                ref period, out startDate, out endDate, ref totalDistributionCount);

            var numberOfActiveMachines = this.GetShoppingNoOfActiveMachines(startDate, endDate);
            var advertCount = numberOfActiveMachines * 0.0005;
            var threshold = advertCount < 1 ? 1 : Math.Round(advertCount, 0);
            var exclusionFilter = ExclusionFilters();
            var excludedPackages = new List<string>();
            var includedPackages = new List<string>();
            GetInclusionsAndExclusions(exclusionFilter, includedPackages, excludedPackages);

            Exclusions.ExclusionFilter = (string)EnvironmentSettings.GetConfigSectionValues("Shopping")["ShoppingDefaultExclusions"];

            var shoppingInputParameterViewModel = new ShoppingInputParameterViewModel
                {

                    ExcludedPackages = excludedPackages,
                    ExclusionFilter = exclusionFilter,
                    IncludedPackages = includedPackages,
                    NumberOfActiveMachines = numberOfActiveMachines,
                    Period = period,
                    ShopEndDate = endDate,
                    ShopStartDate = startDate,
                    Threshold = (int)threshold,
                    TotalDistributionCount = totalDistributionCount
                };

            return shoppingInputParameterViewModel;
        }

        public int GetShoppingNoOfActiveMachines(DateTime startDate, DateTime endDate)
        {
            int numberOfActiveMachines;

            try
            {
                using (var connection = new SqlConnection(this.connectionString))
                {
                    connection.Open();
                    var command = new SqlCommand(this.GetShoppingNoOfActiveMachinesSql(), connection);
                    command.Parameters.Add("ShopEndDate", SqlDbType.DateTime).Value = endDate.AddDays(1);
                    command.Parameters.Add("ShopStartDate", SqlDbType.DateTime).Value = startDate;
                    numberOfActiveMachines = Convert.ToInt32(command.ExecuteScalar());
                }
            }
            catch (Exception e)
            {
                Log.Error(e);
                throw new Exception("Could not get number of active machines.", e);
            }

            return numberOfActiveMachines;
        }

        public void GetShoppingStartAndEndDates(
            ref int period, out DateTime startDate, out DateTime endDate, ref int totalDistributionCount)
        {
            try
            {
                endDate = DateTime.Now.Date;
                startDate = endDate.AddDays(-period);

                using (var connection = new SqlConnection(this.connectionString))
                {
                    connection.Open();
                    var command = new SqlCommand(this.GetShoppingStartAndEndDatesSql(), connection);
                    command.Parameters.Add("@Period", SqlDbType.Int).Value = period;
                    command.CommandTimeout = 600;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            startDate = Convert.ToDateTime(reader["ShopStartDate"]);
                            endDate = Convert.ToDateTime(reader["ShopEndDate"]);
                            totalDistributionCount = Convert.ToInt32(reader["TotalDistributionCount"]);

                            // The period could be reduced if there isn't enough data
                            period = Convert.ToInt32(reader["Period"]);
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception e)
            {
                Log.Error(e);
                throw new Exception("Unable to get shopping start and end dates.", e);
            }
        }

        private string GetShoppingNoOfActiveMachinesSql()
        {
            return
                @"
                SELECT  COUNT(1) AS NoOfActiveMachines
                FROM    v_gs_workstation_status 
                            INNER JOIN dbo.v_r_system 
                                ON v_gs_workstation_status.resourceid = v_r_system.resourceid 
                WHERE   creation_date0 <= @ShopEndDate
                AND     lasthwscan >= @ShopStartDate";
        }

        private string GetShoppingStartAndEndDatesSql()
        {
            return
                @"
                DECLARE @DateRange INT
                SET @DateRange = @Period		-- days

                -- Get a list of the software distribution count for each day
                DECLARE @Distribution TABLE
                (
	                DistributionDate	DATE	NOT NULL,
	                DistributionCount	INT		NOT NULL
	                PRIMARY KEY (DistributionDate) 
                )

                INSERT INTO @Distribution (DistributionDate, DistributionCount)
	                SELECT	CAST(SA.AttributeTime AS DATE), COUNT(1)
	                FROM	vstatusmessages SM
			                    INNER JOIN v_statmsgattributes SA ON SM.recordid = SA.recordid 
	                WHERE	SA.AttributeId = 401
	                AND		SM.Component = 'Software Distribution'
	                AND		SM.MessageId = 10002
	                GROUP BY CAST(SA.AttributeTime AS DATE)

                -- Get a list of each day
                DECLARE @EachDay TABLE
                (
	                DistributionDate	DATE	NOT NULL
	                PRIMARY KEY (DistributionDate) 
                )

                INSERT INTO @EachDay (DistributionDate)
	                SELECT	DistributionDate
	                FROM	@Distribution

                SELECT	ED.DistributionDate ShopStartDate,
		                MAX(D.DistributionDate) ShopEndDate,
		                DATEDIFF(day, ED.DistributionDate, MAX(D.DistributionDate)) + 1 Period,
		                SUM(D.DistributionCount) TotalDistributionCount
                FROM	@EachDay ED
			                INNER JOIN @Distribution D ON D.DistributionDate BETWEEN ED.DistributionDate AND DATEADD(day, @DateRange - 1, ED.DistributionDate)
                GROUP BY ED.DistributionDate, DATEADD(day, @DateRange - 1, ED.DistributionDate)
                ORDER BY 4 DESC";
        }

        public void GetInclusionsAndExclusions(string exclusionFilter, List<string> includedList, List<string> excludedList)
        {
            var sql = string.Format(
                @"
                SELECT	DISTINCT
                        P.Name,
                        CASE
                            WHEN {0} THEN CAST(1 AS BIT)
                            ELSE CAST(0 AS BIT)
                        END Excluded
                FROM	v_StatMsgAttributes a
			                INNER JOIN v_Advertisement f ON f.AdvertisementID = a.AttributeValue
			                INNER JOIN v_Package p ON p.PackageID = f.PackageID
                ORDER BY P.Name",
                GenerateExclusionFilter(exclusionFilter));

            // Retrieve the packages from the database
            var ds = new DataSet();
            using (var connection = new SqlConnection(this.connectionString))
            {
                connection.Open();

                // Create the command
                var command = new SqlCommand(sql, connection);

                // Create the DataAdapter & DataSet
                var da = new SqlDataAdapter(command);

                // fill the DataSet using default values for DataTable names, etc.
                da.Fill(ds);
            }

            var table = ds.Tables[0];
            foreach (DataRow row in table.Rows)
            {
                var name = Convert.ToString(row["Name"]);
                var excluded = Convert.ToBoolean(row["Excluded"]);
                (excluded ? excludedList : includedList).Add(name);
            }
        }

        private string GenerateExclusionFilter(string exclusionFilter)
        {
            var where = new StringBuilder("1 = 0");

            try
            {
                var filters = Regex.Split(exclusionFilter, "\n");

                foreach (var filter in filters)
                {
                    var filterTrimmed = filter.Trim();
                    if (filterTrimmed.Length != 0)
                    {
                        where.Append(" OR P.Name LIKE '");
                        where.Append(filterTrimmed.Replace("'", "''"));
                        where.Append("'");
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("Could not retrieve exclusions from file", e);
            }

            return where.ToString();
        }

        private string ExclusionFilters()
        {
            var exclusionFilter =
                (string)EnvironmentSettings.GetConfigSectionValues("Shopping")["ShoppingDefaultExclusions"];

            string[] programs = exclusionFilter.Split(',');
            var builder = new StringBuilder();
            foreach (string program in programs)
            {
                builder.Append(program).Append("\n");
            }

            return builder.ToString().Trim();
        }



        #endregion
    }
}