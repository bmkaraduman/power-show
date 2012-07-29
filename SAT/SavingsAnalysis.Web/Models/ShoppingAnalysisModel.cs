namespace SavingsAnalysis.Web.Models
{
    using System;
    using System.Data;
    using System.Data.SqlClient;
    using System.Reflection;

    using global::SavingsAnalysis.AnalysisEngine.Core;

    using global::SavingsAnalysis.AnalysisEngine.Shopping;
    using global::SavingsAnalysis.Web.ViewModels;

    using log4net;

    public class ShoppingAnalysisModel
    {
        #region Fields

        private readonly ShoppingInputParameterViewModel shoppingInputModel;
        
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        private readonly string connectionString;

        #endregion

        #region Constructors and Destructors

        public ShoppingAnalysisModel(ShoppingInputParameterViewModel shoppingInputModel, CommonInputParameterViewModel common)
        {
            this.shoppingInputModel = shoppingInputModel;
            this.connectionString =
                Repository.BuildConnectionString(
                    EnvironmentSettings.GetInstance().DatabaseConnectionString,
                    common.FileName.Replace(".zip", string.Empty));
        }

        #endregion

        #region Methods

        internal ShoppingAnalysisViewModel Build()
        {
            Log.Info("Building shopping analysis data.");

            var shoppingAnalysisResults = new ShoppingAnalysisViewModel
            {
                CostPerRequest = this.shoppingInputModel.CostPerRequest,
                ShopEndDate = this.shoppingInputModel.ShopEndDate,
                ManHourSavings = this.shoppingInputModel.ManHourSavings,
                NumberOfActiveMachines = this.shoppingInputModel.NumberOfActiveMachines,
                Period = this.shoppingInputModel.Period,
                ShopStartDate = this.shoppingInputModel.ShopStartDate,
                Threshold = this.shoppingInputModel.Threshold,
                MaxNoOfProgramsToReportOn = this.shoppingInputModel.MaxNoOfProgramsToReportOn
            };

            // Total number of requests
            GetTotalNumberOfRequests(shoppingAnalysisResults);

            Log.Info("Analysis data building completed.");

            return shoppingAnalysisResults;
        }

        private void GetTotalNumberOfRequests(ShoppingAnalysisViewModel shoppingAnalysisViewModel)
        {
            try
            {
                using (var connection = new SqlConnection(this.connectionString))
                {
                    connection.Open();
                    var command = new SqlCommand(GetTotalNumberOfRequestsSql(), connection);
                    command.Parameters.Add("ShopEndDate", SqlDbType.Date).Value = shoppingAnalysisViewModel.ShopEndDate.AddDays(1);
                    command.Parameters.Add("ShopStartDate", SqlDbType.Date).Value = shoppingAnalysisViewModel.ShopStartDate;
                    command.Parameters.Add("Threshold", SqlDbType.Int).Value = shoppingAnalysisViewModel.Threshold;

                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            shoppingAnalysisViewModel.TotalNumberOfOneOffRequests =
                                Convert.ToInt32(reader["TotalNumberOfOneOffRequests"]);

                            shoppingAnalysisViewModel.TotalNumberOfRequests =
                                Convert.ToInt32(reader["TotalNumberOfRequests"]);
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception e)
            {
                Log.Error(e);
                throw new Exception("Could not get total number of  requests", e);
            }
        }

        private string GetTotalNumberOfRequestsSql()
        {
            var exclusions = string.Empty;
            Exclusions.ExclusionFilter = (string)EnvironmentSettings.GetConfigSectionValues("Shopping")["ShoppingDefaultExclusions"];
            var exclusionFilter = Exclusions.GetAttributeExclusionFilter(this.connectionString);
            if (!string.IsNullOrWhiteSpace(exclusionFilter))
            {
                exclusions = string.Format("AND AttributeValue NOT IN ({0})", exclusionFilter);
            }

            return
                string.Format(
                    @"
                    SELECT	ISNULL(SUM(CASE WHEN TC.TotalCount <= 1 THEN TC.TotalCount ELSE 0 END), 0) TotalNumberOfOneOffRequests,
                            ISNULL(SUM(TC.TotalCount), 0) TotalNumberOfRequests
                    FROM	(
		                    SELECT attributevalue, 
			                       attrtime, 
			                       COUNT(1) TotalCount 
		                    FROM   (
				                    SELECT attributevalue, 
					                       attrtime, 
					                       machinename, 
					                       COUNT(1) totalcount 
				                    FROM   (SELECT attributevalue, 
							                       CASE 
								                     WHEN Datepart(HOUR, attributetime) - 12 < 0 THEN CONVERT(VARCHAR(11), attributetime) + '/AM' 
								                     ELSE CONVERT(VARCHAR(11), attributetime) + '/PM' 
							                       END AS attrtime, 
							                       machinename 
						                    FROM   vstatusmessages 
							                       INNER JOIN v_statmsgattributes 
								                     ON vstatusmessages.recordid = 
									                    v_statmsgattributes.recordid 
						                    WHERE  attributeid = 401 
						                    {0} 
						                    AND    component = 'Software Distribution' 
						                    AND    messageid = 10002 
						                    AND    attributetime >= @ShopStartDate 
						                    AND    attributetime < @ShopEndDate) AS inner1 
				                    GROUP  BY attributevalue, 
						                      attrtime, 
						                      machinename) AS c 
		                    GROUP  BY attributevalue, 
				                      attrtime
		                    ) TC",
                    exclusions);
        }

        #endregion
    }
}