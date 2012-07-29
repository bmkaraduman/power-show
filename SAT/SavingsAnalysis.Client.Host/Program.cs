namespace SavingsAnalysis.Client.Host
{
    using System;
    using System.Configuration;
    using System.Data.SqlClient;
    using System.IO;
    using System.Reflection;

    using log4net;

    using SavingsAnalysis.Client.Common;

    /// <summary>
    /// Entry point
    /// </summary>
    internal static class Program
    {
        #region Static Fields

        private static readonly ILog Log = LogManager.GetLogger(MethodBase.GetCurrentMethod().DeclaringType);

        #endregion

        #region Enums

        private enum ExitCodes
        {
            Success = 0, 

            InvalidSyntax = 1, 

            Error = 2
        }

        #endregion

        #region Public Methods and Operators

        public static void Main(string[] args)
        {
            ExitCodes exitCode = ExitCodes.Success;
            try
            {
                CommandLine.DisplayBanner();
                var commandLine = new CommandLine(new Arguments(args));
                if (commandLine.Valid())
                {
                    // Create common configuration context
                    string connectionString = BuildConnectionString(commandLine);
                    Console.WriteLine("Using database connection string " + connectionString);
                    string assemblyPath = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
                    var context = new CommonExtractionContext
                        {
                            CompanyName = commandLine.CompanyName, 
                            SccmConnection = connectionString, 
                            StartDate = commandLine.StartDate, 
                            EndtDate = commandLine.EndDate, 
                            BaseWorkDirectory = assemblyPath, 
                            PluginsDirectory = Path.Combine(assemblyPath, "Plugins")
                        };

                    // Create DataExtractor Plugin Factory
                    var factory = new DataExtractorFactory(context.PluginsDirectory);

                    int commandExecutionTimeout = SqlCommandExecutionTimeout();
                    var queryExecutor = new SqlQueryExecutor(context.SccmConnection, commandExecutionTimeout);

                    // Create Data Extractor and build package
                    var extractor = new DataExtractor(factory, queryExecutor);
                    string zipPath = extractor.BuildPackage(context);

                    if (extractor.Succeded())
                    {
                        string uploadurl = ConfigurationManager.AppSettings["fileUploadUrl"].Replace(
                            "[SERVERNAME]", commandLine.UploadServerName);

                        FileUploader.UploadFile(uploadurl, zipPath);
                    }
                }
            }
            catch (Exception ex)
            {
                DisplayError(ex);
                exitCode = ExitCodes.Error;
            }

            Environment.Exit((int)exitCode);
        }

        #endregion

        #region Methods

        private static string BuildConnectionString(CommandLine commandLine)
        {
            SqlConnectionStringBuilder builder = null;
            if (ConfigurationManager.ConnectionStrings["SccmConnectionStringTemplate"] != null)
            {
                builder =
                    new SqlConnectionStringBuilder(
                        ConfigurationManager.ConnectionStrings["SccmConnectionStringTemplate"].ConnectionString);
            }
            else
            {
                builder = new SqlConnectionStringBuilder();
            }

            builder["Server"] = commandLine.DatabaseServerName;
            builder["Database"] = commandLine.DatabaseName;

            return builder.ConnectionString;
        }

        private static void DisplayError(Exception ex)
        {
            Console.WriteLine("An error occured during data extraction\n\nError Details: {0}", ex);
            Log.Error(ex);
        }

        private static int SqlCommandExecutionTimeout()
        {
            int commandExecutionTimeout = 900;
            if (ConfigurationManager.AppSettings["SqlCommandExecutionTimeoutSeconds"] != null)
            {
                int result = 0;
                if (int.TryParse(ConfigurationManager.AppSettings["SqlCommandExecutionTimeoutSeconds"], out result))
                {
                    commandExecutionTimeout = result;
                }
            }

            return commandExecutionTimeout;
        }

        #endregion
    }
}