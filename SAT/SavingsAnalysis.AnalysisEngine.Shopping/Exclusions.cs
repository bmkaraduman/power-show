namespace SavingsAnalysis.AnalysisEngine.Shopping
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.IO;
    using System.Text;

    public class Exclusions
    {
        public static string ExclusionFilter { get; set; }

        private static List<ExclusionDetails> ExclusionDetailsList { get; set; }

        public static string GetAttributeExclusionFilter(string connectionString)
        {
            DetermineExclusionAttributeValue(connectionString);
            return GetAttributeExclusionFilter();
        }

        public static void GenerateIncludedAndExcludedFiles(string includedFilename, string excludedFilename)
        {
            var exclusionsStringBuilder = new StringBuilder();
            var inclusionsStringBuilder = new StringBuilder();

            var excludedList = new List<string>();
            var includedList = new List<string>();
            if (ExclusionDetailsList != null)
            {
                foreach (var exclusion in ExclusionDetailsList)
                {
                    if (exclusion.Excluded)
                    {
                        if (!excludedList.Contains(exclusion.Name))
                        {
                            excludedList.Add(exclusion.Name);
                            exclusionsStringBuilder.AppendLine(exclusion.Name);
                        }
                    }
                    else
                    {
                        if (!includedList.Contains(exclusion.Name))
                        {
                            includedList.Add(exclusion.Name);
                            inclusionsStringBuilder.AppendLine(exclusion.Name);
                        }
                    }
                }
            }

            // Save to excluded file
            using (var file = new StreamWriter(excludedFilename))
            {
                file.WriteLine(exclusionsStringBuilder.ToString());
            }

            // Save to included file
            using (var file = new StreamWriter(includedFilename))
            {
                file.WriteLine(inclusionsStringBuilder.ToString());
            }
        }

        private static string GetAttributeExclusionFilter()
        {
            var first = true;
            var sb = new StringBuilder();
            foreach (var exclusion in ExclusionDetailsList)
            {
                if (exclusion.Excluded)
                {
                    if (first)
                    {
                        first = false;
                    }
                    else
                    {
                        sb.Append(",");
                    }

                    sb.Append("'");
                    sb.Append(exclusion.AttributeValue);
                    sb.Append("'");
                }
            }

            return sb.ToString();
        }

        private static string GenerateExclusionFilter()
        {
            var where = new StringBuilder("1 = 0");

            try
            {
                var filters = ExclusionFilter.Split(',');
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

        private static void DetermineExclusionAttributeValue(string connectionString)
        {
            ExclusionDetailsList = new List<ExclusionDetails>();

            try
            {
                // Sql
                var sql =
                    string.Format(
                        @"
                        SELECT	DISTINCT A.AttributeValue,
                                P.Name,
                                CASE WHEN {0} THEN CAST(1 AS BIT) ELSE CAST(0 AS BIT) END Excluded
                        FROM	v_StatMsgAttributes A
            			            INNER JOIN v_Advertisement F ON F.AdvertisementID = A.AttributeValue
            			            INNER JOIN v_Package P ON P.PackageID = F.PackageID
                        ORDER BY P.Name",
                    GenerateExclusionFilter());

                // Retrieve the packages from the database
                var ds = new DataSet();
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Create the command
                    var command = new SqlCommand(sql, connection);

                    // Create the DataAdapter & DataSet
                    var da = new SqlDataAdapter(command);

                    // fill the DataSet using default values for DataTable names, etc.
                    da.Fill(ds);
                }

                // Convert the package dataset to a list
                var table = ds.Tables[0];
                foreach (DataRow row in table.Rows)
                {
                    var value = Convert.ToString(row["AttributeValue"]);
                    var name = Convert.ToString(row["Name"]);
                    var excluded = Convert.ToBoolean(row["Excluded"]);

                    var exclusionDetails = new ExclusionDetails(name, value, excluded);
                    ExclusionDetailsList.Add(exclusionDetails);
                }
            }
            catch (Exception e)
            {
                // Need logging
                throw new Exception("Could not retrieve exclusion attributes", e);
            }
        }
    }
}
