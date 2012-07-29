namespace SavingsAnalysis.Web.Models
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;

    using global::SavingsAnalysis.AnalysisEngine.Core;
    using global::SavingsAnalysis.AnalysisEngine.Shopping;
    using global::SavingsAnalysis.Web.ViewModels;

    public class ShoppingProgramListModel
    {
        #region Fields

        private readonly string connectionString;

        #endregion

        #region Constructors and Destructors

        public ShoppingProgramListModel(string fileName)
        {
            this.connectionString =
                Repository.BuildConnectionString(
                    EnvironmentSettings.GetInstance().DatabaseConnectionString, fileName.Replace(".zip", string.Empty));
        }

        #endregion

        #region Public Methods and Operators

        public List<ShoppingProgram> Build(ShoppingAnalysisViewModel shoppingAnalysisViewModel)
        {
            var ds = GetTopProgramList(
                shoppingAnalysisViewModel.ShopStartDate,
                shoppingAnalysisViewModel.ShopEndDate,
                shoppingAnalysisViewModel.MaxNoOfProgramsToReportOn,
                shoppingAnalysisViewModel.Threshold);

            var shoppingProgramList = new List<ShoppingProgram>();
            var dataTable = ds.Tables[0];
            foreach (DataRow row in dataTable.Rows)
            {
                var shoppingProgram = new ShoppingProgram
                    {
                        AttributeValue = Convert.ToString(row["attributevalue"]),
                        ProgramName = Convert.ToString(row["programname"]),
                        TotalCount = Convert.ToInt32(row["totalcount"]),
                        PackageName = Convert.ToString(row["packagename"])
                    };

                shoppingProgramList.Add(shoppingProgram);
            }

            return shoppingProgramList;
        }

        private DataSet GetTopProgramList(
            DateTime startDate,
            DateTime endDate,
            int top,
            int threshold)
        {
            var ds = new DataSet(); 
            
            try
            {                
                using (var connection = new SqlConnection(this.connectionString))
                {
                    connection.Open();

                    // Create the command
                    var command = new SqlCommand(GetTopProgramListSql(top), connection);
                    command.Parameters.Add("ShopEndDate", SqlDbType.Date).Value = endDate.AddDays(1);
                    command.Parameters.Add("ShopStartDate", SqlDbType.Date).Value = startDate;
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

        private string GetTopProgramListSql(int top)
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
                    SELECT TOP {0} e.attributevalue, 
                                  IsNull(f.programname, 'Deleted') programname, 
                                  e.totalcount, 
                                  IsNull(pkg.name, 'Deleted') packagename 
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
                                                                    AND    attributetime >= @ShopStartDate 
                                                                    AND    attributetime < @ShopEndDate) AS inner1 
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
    }
}