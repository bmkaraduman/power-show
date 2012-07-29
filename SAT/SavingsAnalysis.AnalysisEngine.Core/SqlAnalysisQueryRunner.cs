namespace SavingsAnalysis.AnalysisEngine.Core
{
    using System;
    using System.Data;
    using System.Data.SqlClient;

    /// <summary>
    /// Runs SQL analysis queries against a database connection and gathers statistics defined by those queries
    /// </summary>
    public class SqlAnalysisQueryRunner
    {
        public void Run(SqlConnection connection, SqlAnalysisQuery query, AnalysisDictionary dictionary, SqlParameter[] sqlParams)
        {
            using (var cmd = connection.CreateCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query.QueryText;

                if (sqlParams != null)
                {
                    cmd.Parameters.AddRange(sqlParams);
                }

                using (var reader = cmd.ExecuteReader())
                {
                    if (!reader.HasRows || !reader.Read())
                    {
                        throw new InvalidOperationException("No data returned by query");
                    }

                    // Go through each defined statistic, read the value for that column and put it in our dictionary
                    var statsMap = query.StatisticNamesToColumnsMap;
                    foreach (var stat in statsMap)
                    {
                        var statisticKey = stat.Key; // We map the static name...
                        var columnName = stat.Value; // ... to the column to be read

                        var value = reader[columnName];
                        if (DBNull.Value.Equals(value))
                        {
                            dictionary[statisticKey].Value = string.Empty;
                        }
                        else
                        {
                            dictionary[statisticKey].Value = value.ToString();
                        }
                    }
                }
            }
        }
    }
}