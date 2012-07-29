namespace SavingsAnalysis.Plugin.NightWatchman
{
    using System;
    using System.Data;
    using System.Collections.Generic;
    using System.Data.SqlClient;
    using System.Reflection;

    using SavingsAnalysis.Client.Common;
    using System.IO;

    using log4net;

    public class NightWatchmanDataExtractor : BaseDataExtractor
    {
        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);
        IQueryExecutor queryExecutor;

        public override IQueryExecutor QueryExecutor
        {
            set
            {
                queryExecutor = value;
            }
        }

        public override string Name
        {
            get { return "NightWatchman"; }
        }

        public override void ExtractData(string outputDirectory, CommonExtractionContext context, Dictionary<string, object> pluginSettings)
        {
            GlobalContext.Properties[Name] = Name + " Plugin";

            var settings = new NightWatchmanSettings(Path.Combine(context.PluginsDirectory, "SavingsAnalysis.Plugin.NightWatchman.xml"));
            if (!RunValidationQueries(settings, context))
            {
                return;
            }

            SqlQueryResultSerializer resultSerializer = new SqlQueryResultSerializer(queryExecutor, context.SccmConnection, outputDirectory);
            foreach (var query in settings.Queries)
            {
                var queryParameters = new[]
                        {
                            new SqlParameter("@startdate", SqlDbType.DateTime) { Value = context.StartDate },
                            new SqlParameter("@enddate", SqlDbType.DateTime) { Value = context.EndtDate }
                        };

                resultSerializer.SerializeQueryResult(query.SelectionQuery, query.Name, queryParameters, (msg) => NotifyProgress(
                            new ExtractionEventArgs()
                            {
                               Status = ExtractionStatus.Succeeded,
                               Message = msg
                            }));

                Log.Info("Successfully extracted data for " + query.Name);
            }

            if (settings.Queries.Count > 0)
            {
                NotifyProgress(
                    new ExtractionEventArgs()
                        {
                            Status = ExtractionStatus.Succeeded, Message = "All query results collected successfully." 
                        });
            }
        }

        private bool ValidateQueryResult(QuerySettings query, DataTable result)
        {
            if (query.Name == "MachineActivityData")
            {
                DataRow row = result.Rows[0];

                if (row["Maxday"] is DBNull || row["Minday"] is System.DBNull)
                {
                    NotifyProgress(
                        new ExtractionEventArgs() { Status = ExtractionStatus.Failed, Message = "Insufficient Data" });

                    Log.Warn("No data returned for " + Name);
                    return false;
                }

                DateTime maxDate = Convert.ToDateTime(row["Maxday"]);
                DateTime minDate = Convert.ToDateTime(row["Minday"]);

                TimeSpan ts = maxDate - minDate;
                int totalDays = (int)ts.TotalDays;

                const int MinimumDays = 7; // TODO: Get minimum days from somewhere else
                if (totalDays < MinimumDays)
                {
                    NotifyProgress(
                        new ExtractionEventArgs() { Status = ExtractionStatus.Failed, Message = "Insufficient Data" });

                    Log.Warn("Insufficient data returned for " + Name);

                    return false;
                }
            }

            return true;
        }

        private bool RunValidationQueries(NightWatchmanSettings settings, CommonExtractionContext context)
        {
            foreach (var query in settings.Queries)
            {
                if (!string.IsNullOrEmpty(query.ValidationQuery))
                {
                    var validationParameters = new[]
                        {
                            new SqlParameter("@startdate", SqlDbType.DateTime) { Value = context.StartDate },
                            new SqlParameter("@enddate", SqlDbType.DateTime) { Value = context.EndtDate }
                        };

                    var validationData = queryExecutor.ExecuteQuery(
                        query.ValidationQuery, "Validate_" + query.Name, validationParameters);
                    if (!ValidateQueryResult(query, validationData))
                    {
                        return false;
                    }
                }
            }

            return true;
        }

    }
}
