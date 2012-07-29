namespace SavingsAnalysis.AnalysisEngine.Shopping
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Xml.Linq;

    using SavingsAnalysis.AnalysisEngine.Core;
    using SavingsAnalysis.AnalysisEngine.Shopping.Properties;

    public class ShoppingAnalysis : IAnalysisEngine
    {
        #region Public Properties

        public string ConnectionString { get; set; }

        #endregion

        #region Public Methods and Operators

        public AnalysisDictionary Analyse(string connectionString, AnalysisDictionary values)
        {
            this.ConnectionString = connectionString;
            var analysisResult = new AnalysisDictionary { Name = "Shopping" };
            var period = Convert.ToInt32(values["Period"].Value);
            var startDate = Convert.ToDateTime(values["StartDate"].Value);
            var endDate = Convert.ToDateTime(values["EndDate"].Value);
            var threshold = Convert.ToInt32(values["Threshold"].Value);
            var costPerRequest = Convert.ToInt32(values["CostPerRequest"].Value);
            var currencySymbol = Convert.ToString(values["CurrencySymbol"].Value);

            analysisResult.Add("Period", new AnalysisAttribute { Value = string.Format("{0:n0}", period) });
            analysisResult.Add("StartDate", new AnalysisAttribute { Value = startDate.ToString("d-MMMM-yyyy") });
            analysisResult.Add("EndDate", new AnalysisAttribute { Value = endDate.ToString("d-MMMM-yyyy") });
            analysisResult.Add("CurrencySymbol", new AnalysisAttribute { Value = currencySymbol });
            analysisResult.Add("CostPerRequest", new AnalysisAttribute { Value = string.Format("{0:n0}", costPerRequest) });

            var exclusionFilter = Exclusions.GetExclusionFilter(this.ConnectionString);

            // Total number of requests
            GetTotalNumberOfRequests(analysisResult, exclusionFilter, startDate, endDate, period, threshold, costPerRequest, currencySymbol);

            // Top program list
            var maximumNoOfProgramsToRetreive = Convert.ToInt32(values["MaximumNoOfProgramsToRetreive"].Value);

            // This will be used later when the report supports it.
            var ds = GetTopProgramList(exclusionFilter, startDate, endDate, maximumNoOfProgramsToRetreive, threshold);

            return analysisResult;
        }

        private void GetTotalNumberOfRequests(
            AnalysisDictionary analysisResult,
            string exclusionFilter,
            DateTime startDate,
            DateTime endDate,
            int period,
            int threshold,
            int costPerRequest,
            string currencySymbol)
        {
            try
            {
                using (var connection = new SqlConnection(this.ConnectionString))
                {
                    connection.Open();
                    var command = new SqlCommand(GetTotalNumberOfRequestsSql(exclusionFilter), connection);
                    command.Parameters.Add("EndDate", SqlDbType.Date).Value = endDate.AddDays(1);
                    command.Parameters.Add("StartDate", SqlDbType.Date).Value = startDate;
                    command.Parameters.Add("Threshold", SqlDbType.Int).Value = threshold;

                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // Total Number Of One Off Requests
                            var totalNumberOfOneOffRequest = Convert.ToInt32(reader["TotalNumberOfOneOffRequest"]);
                            var analysisAttribute = new AnalysisAttribute
                                {
                                    Value = string.Format("{0:n0}", totalNumberOfOneOffRequest)
                                };

                            analysisResult.Add("TotalNumberOfOneOffRequest", analysisAttribute);

                            // Total Number Of Requests
                            var totalNumberOfRequests = Convert.ToInt32(reader["TotalNumberOfRequests"]);
                            analysisAttribute = new AnalysisAttribute
                            {
                                Value = string.Format("{0:n0}", totalNumberOfRequests)
                            };
                            analysisResult.Add("TotalNumberOfRequests", analysisAttribute);

                            // Total Number Of Requests in a year
                            analysisAttribute = new AnalysisAttribute
                            {
                                Value = string.Format("{0:n0}", 365 * totalNumberOfRequests / period)
                            };
                            analysisResult.Add("TotalNumberOfRequestsInAYear", analysisAttribute);

                            // Total Number Of One Off Requests in a year
                            var totalNumberOfOneOffRequestInAYear = 365 * totalNumberOfOneOffRequest / period;
                            analysisAttribute = new AnalysisAttribute
                            {
                                Value = string.Format("{0:n0}", 365 * totalNumberOfOneOffRequest / period)
                            };
                            analysisResult.Add("TotalNumberOfOneOffRequestInAYear", analysisAttribute);

                            // Total Number Of One Off Requests Cost
                            analysisAttribute = new AnalysisAttribute
                                {
                                    Value = string.Format("{0}{1:n0}", currencySymbol, totalNumberOfOneOffRequestInAYear * costPerRequest)
                                };

                            analysisResult.Add("TotalNumberOfOneOffRequestCost", analysisAttribute);

                            // Total Number Of One Off Requests in a year Cost
                            analysisAttribute = new AnalysisAttribute
                            {
                                Value = string.Format("{0}{1:n0}", currencySymbol, totalNumberOfOneOffRequest * costPerRequest)
                            };

                            analysisResult.Add("TotalNumberOfOneOffRequestInAYearCost", analysisAttribute);
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception e)
            {
                // Need logging
                throw new Exception("Could not get total number of  requests", e);
            }
        }

        private string GetTotalNumberOfRequestsSql(string exclusionFilter)
        {
            var exclusions = string.Empty;
            if (!string.IsNullOrWhiteSpace(exclusionFilter))
            {
                exclusions = string.Format("AND AttributeValue NOT IN ({0})", exclusionFilter);
            }

            return
                string.Format(
                    @"
                    SELECT	SUM(CASE WHEN TC.TotalCount <= @Threshold THEN TC.TotalCount ELSE 0 END) TotalNumberOfOneOffRequest,
		                    SUM(TC.TotalCount) TotalNumberOfRequests
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
						                    AND    attributetime >= @StartDate 
						                    AND    attributetime < @EndDate) AS inner1 
				                    GROUP  BY attributevalue, 
						                      attrtime, 
						                      machinename) AS c 
		                    GROUP  BY attributevalue, 
				                      attrtime
		                    ) TC",
                    exclusions);
        }

        private DataSet GetTopProgramList(
            string exclusionFilter,
            DateTime startDate,
            DateTime endDate,
            int top,
            int threshold)
        {
            var ds = new DataSet(); 
            
            try
            {
                using (var connection = new SqlConnection(this.ConnectionString))
                {
                    connection.Open();

                    // Create the command
                    var command = new SqlCommand(GetTopProgramListSql(top, exclusionFilter), connection);
                    command.Parameters.Add("EndDate", SqlDbType.Date).Value = endDate.AddDays(1);
                    command.Parameters.Add("StartDate", SqlDbType.Date).Value = startDate;
                    command.Parameters.Add("Threshold", SqlDbType.Int).Value = threshold;

                    // Create the DataAdapter & DataSet
                    var da = new SqlDataAdapter(command);

                    // fill the DataSet using default values for DataTable names, etc.
                    da.Fill(ds); 
                }
            }
            catch (Exception e)
            {
                // Need logging
                throw new Exception("Could not get program list", e);
            }

            return ds;
        }

        private string GetTopProgramListSql(int top, string exclusionFilter)
        {
            var exclusions = string.Empty;
            if (!string.IsNullOrWhiteSpace(exclusionFilter))
            {
                exclusions = string.Format("AND AttributeValue NOT IN ({0})", exclusionFilter);
            }

            return
                string.Format(
                    @"
                    SELECT TOP {0} e.attributevalue, 
                                  Isnull(f.programname, 'Deleted') programname, 
                                  e.totalcount, 
                                  Isnull(pkg.name, 'Deleted')      packagename 
                    FROM   (SELECT attributevalue, 
                                   SUM(totalcount) totalcount 
                            FROM   (SELECT attributevalue, 
                                                     attrtime, 
                                                     COUNT(1) totalcount 
                                            FROM   (SELECT 
                                                              attributevalue,
                                                              attrtime,
                                                              machinename,
                                                              COUNT(1) totalcount 
                                                        FROM   (SELECT attributevalue, 
                                                                             CASE 
                                                                                 WHEN Datepart(HOUR, attributetime) - 12 < 0 THEN 
                                                                                 CONVERT(VARCHAR(11), attributetime) + '/AM' 
                                                                                 ELSE CONVERT(VARCHAR(11), attributetime) + '/PM' 
                                                                             END      AS attrtime, 
                                                                             machinename                       
                                                                    FROM   vstatusmessages 
                                                                             INNER JOIN v_statmsgattributes 
                                                                                 ON vstatusmessages.recordid = 
                                                                                      v_statmsgattributes.recordid 
                                                                    WHERE  attributeid = 401 
                                                                            {1}
                                                                    AND    component = 'Software Distribution' 
                                                                    AND    messageid = 10002 
                                                                    AND    attributetime >= @StartDate 
                                                                    AND    attributetime < @EndDate) AS inner1 
                                                        GROUP  BY attributevalue, 
                                                                      attrtime, 
                                                                      machinename) AS c 
                                            GROUP  BY attributevalue, 
                                                          attrtime 
                                    HAVING COUNT(1) <= @Threshold) AS d 
                            GROUP  BY attributevalue) AS e 
                           LEFT OUTER JOIN v_advertisement f 
                             ON f.advertisementid = e.attributevalue 
                           LEFT OUTER JOIN v_package pkg 
                             ON pkg.packageid = f.packageid 
                    ORDER  BY totalcount DESC",
                    top,
                    exclusions);
        }

        #endregion

        #region Methods

        private void CreateSQLParameterArray(AnalysisDictionary values, out SqlParameter[] sqlParamArray)
        {
            // Period
            var period = new AnalysisAttribute();
            if (values.ContainsKey("Period"))
            {
                period = values["Period"];
            }

            // Start Date
            var startDate = new AnalysisAttribute();
            if (values.ContainsKey("StartDate"))
            {
                startDate = values["StartDate"];
            }

            // End Date
            var endDate = new AnalysisAttribute();
            if (values.ContainsKey("EndDate"))
            {
                endDate = values["EndDate"];
            }

            sqlParamArray = new[]
                {
                    new SqlParameter("@Period", SqlDbType.Int) { Value = period.Value },
                    new SqlParameter("@StartDate", SqlDbType.DateTime) { Value = startDate.Value },
                    new SqlParameter("@EndDate", SqlDbType.DateTime) { Value = endDate.Value }
                };
        }

        #endregion
    }
}