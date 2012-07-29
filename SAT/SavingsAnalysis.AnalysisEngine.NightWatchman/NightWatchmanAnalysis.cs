using System;
using System.Linq;

namespace SavingsAnalysis.AnalysisEngine.NightWatchman
{
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;
    using System.Xml.Linq;

    using SavingsAnalysis.AnalysisEngine.Core;
    using Properties;

    public class NightWatchmanAnalysis 
    {

        #region Public Properties

        public string ConnectionString { get; set; }

        #endregion

        #region Public Methods and Operators

        private Dictionary<string,string> Queries;
        public NightWatchmanAnalysis()
        {
            XDocument xmlDocument = XDocument.Parse(Resources.SavingsAnalysis_NightWatchman_SQLQueries);
            Queries = (from element in xmlDocument.Descendants("query")
             select element).ToDictionary(key => key.Attribute("data").Value, value => value.Element("value").Value);

        }

        public AnalysisDictionary Analyse(string connectionString, AnalysisDictionary values)
        {
            this.ConnectionString = connectionString;
            var analysisResult = new AnalysisDictionary { Name = "NightWatchman" };
            IEnumerable<SqlAnalysisQuery> queries = this.GetQueries(analysisResult);
            this.RunQueries(queries, analysisResult, values);
            return analysisResult;
        }

        #endregion

        #region Methods

        private void CreateSQLParameterArray(AnalysisDictionary values, out SqlParameter[] sqlParamArray)
        {
            int startTimeInMns = 420;
            int endTimeInMns = 1140;

            if (values.ContainsKey("Startofworkingday"))
            {
                AnalysisAttribute startTimeValue = values["Startofworkingday"];
                string[] startTimeVal = startTimeValue.Value.Split(':');
                int hourResult, minuteResult;
                if (int.TryParse(startTimeVal[0], out hourResult) && int.TryParse(startTimeVal[1], out minuteResult))
                {
                    startTimeInMns = (hourResult * 60) + minuteResult;
                }
            }

            if (values.ContainsKey("Endofworkingday"))
            {
                AnalysisAttribute endTimeValue = values["Endofworkingday"];
                string[] endTimeVal = endTimeValue.Value.Split(':');

                int hourResult, minuteResult;
                if (int.TryParse(endTimeVal[0], out hourResult) && int.TryParse(endTimeVal[1], out minuteResult))
                {
                    endTimeInMns = (hourResult * 60) + minuteResult;
                }
            }

            sqlParamArray = new[]
                {
                    new SqlParameter("@starttime", SqlDbType.Int) { Value = startTimeInMns }, 
                    new SqlParameter("@endtime", SqlDbType.Int) { Value = endTimeInMns }
                };
        }

        private IEnumerable<SqlAnalysisQuery> GetQueries(AnalysisDictionary values)
        {
            XDocument xmlDocument = XDocument.Parse(Resources.SavingsAnalysis_NightWatchman_SQLQueries);
            var analysisQueries = new List<SqlAnalysisQuery>();
            foreach (XElement query in xmlDocument.Descendants("query"))
            {
                XElement queryAttrib = query.Element("value");
                XAttribute nameAttrib = query.Attribute("data");
                if (queryAttrib != null && nameAttrib != null && !string.IsNullOrEmpty(queryAttrib.Value)
                    && !string.IsNullOrEmpty(nameAttrib.Value))
                {
                    analysisQueries.Add(new SqlAnalysisQuery(queryAttrib.Value, nameAttrib.Value, nameAttrib.Value));
                    if (values.ContainsKey(nameAttrib.Value) == false)
                    {
                        values.Add(nameAttrib.Value, new AnalysisAttribute());
                    }
                }
            }

            return analysisQueries;
        }

        private void RunQueries(
            IEnumerable<SqlAnalysisQuery> queries, AnalysisDictionary analysisResult, AnalysisDictionary values)
        {
            using (var cnn = new SqlConnection(this.ConnectionString))
            {
                cnn.Open();
                var runner = new SqlAnalysisQueryRunner();
                foreach (SqlAnalysisQuery query in queries)
                {
                    SqlParameter[] sqlParams;
                    this.CreateSQLParameterArray(values, out sqlParams);
                    runner.Run(cnn, query, analysisResult, sqlParams);
                }

                cnn.Close();
            }
        }

        #endregion

        public int GetNumberOfDesktops()
        {
            int numberOfDesktops = 0;
            using (var connection = new SqlConnection(this.ConnectionString))
            {
                connection.Open();
                numberOfDesktops = GetValue(connection, Queries["NumberOfDesktops"], null);
                connection.Close();
            }
            return numberOfDesktops;
        }

        public int GetNumberOfLaptops()
        {
            int numberOfLaptops = 0;
            using (var connection = new SqlConnection(this.ConnectionString))
            {
                connection.Open();
                numberOfLaptops = GetValue(connection, Queries["NumberOfLaptops"], null);
                connection.Close();
            }
            return numberOfLaptops;
        }

        public int GetMachinesOnForWeekdays(int startTimeInMinutes, int endTimeInMinutes)
        {
            int numberOfMachinesOnForWeekdays = 0;
            using (var connection = new SqlConnection(this.ConnectionString))
            {
                connection.Open();
                numberOfMachinesOnForWeekdays = GetValue(connection, Queries["MachinesOnForWeekdays"], new[]
                    {
                        new SqlParameter("@starttime", SqlDbType.Int) { Value = startTimeInMinutes }, 
                        new SqlParameter("@endtime", SqlDbType.Int) { Value = endTimeInMinutes }
                    });
                connection.Close();
            }
            return numberOfMachinesOnForWeekdays;
        }

        public int GetMachinesOnForWeekends(int startTimeInMinutes, int endTimeInMinutes)
        {
            int numberOfMachinesOnForWeekends = 0;
            using (var connection = new SqlConnection(this.ConnectionString))
            {
                connection.Open();
                numberOfMachinesOnForWeekends = GetValue(connection, Queries["MachinesOnForWeekends"], new[]
                    {
                        new SqlParameter("@starttime", SqlDbType.Int) { Value = startTimeInMinutes }, 
                        new SqlParameter("@endtime", SqlDbType.Int) { Value = endTimeInMinutes }
                    });
                connection.Close();
            }
            return numberOfMachinesOnForWeekends;
        }

        private int GetValue(SqlConnection connection, string query, SqlParameter[] sqlParams)
        {
            int intValue;
            using (var cmd = connection.CreateCommand())
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = query;

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

                    intValue = reader[0] is int ? (int)reader[0] : 0;
                }
            }
            return intValue;
        }
    }
}