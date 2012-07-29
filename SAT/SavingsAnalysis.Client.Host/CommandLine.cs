namespace SavingsAnalysis.Client.Host
{
    using System;
    using System.Collections.Generic;
    using System.Configuration;

    internal class CommandLine
    {
        #region Fields

        private readonly Dictionary<string, CommandLineOptionInfo> supportCommandLineOptions =
            new Dictionary<string, CommandLineOptionInfo>
                {
                    {
                        Option.CompanyName, 
                        new CommandLineOptionInfo { Mandatory = true, HelpString = "Name of the company" }
                        }, 
                    {
                        Option.DatabaseServerName, 
                        new CommandLineOptionInfo { Mandatory = true, HelpString = "Database server name" }
                        }, 
                    {
                        Option.DatabaseInstanceName, 
                        new CommandLineOptionInfo { Mandatory = false, HelpString = "Database instance name" }
                        }, 
                    {
                        Option.DatabaseName, new CommandLineOptionInfo { Mandatory = true, HelpString = "Database name" }
                        }, 
                    {
                        Option.StartDate, 
                        new CommandLineOptionInfo
                            {
                               Mandatory = false, HelpString = "Start date of data collection in YYYY-MM-DD format" 
                            }
                        }, 
                    {
                        Option.EndDate, 
                        new CommandLineOptionInfo
                            {
                               Mandatory = false, HelpString = "End date of data collection in YYYY-MM-DD format" 
                            }
                        }, 
                    {
                        Option.UploadServer, 
                        new CommandLineOptionInfo { Mandatory = true, HelpString = "Name of server to upload file" }
                        }, 
                    {
                        Option.UploadFile, 
                        new CommandLineOptionInfo { Mandatory = false, HelpString = "Upload any file to test limit" }
                        }, 
                };

        private readonly Arguments arguments;

        private readonly bool commandLineOptionsValid;

        #endregion

        #region Constructors and Destructors

        internal CommandLine(Arguments args)
        {
            this.arguments = args;
            this.commandLineOptionsValid = this.ValidateCommandline();
        }

        #endregion

        #region Properties

        internal string CompanyName
        {
            get
            {
                return this.arguments[Option.CompanyName];
            }
        }

        internal string DatabaseInstanceName
        {
            get
            {
                return this.arguments[Option.DatabaseInstanceName];
            }
        }

        internal string DatabaseName
        {
            get
            {
                return this.arguments[Option.DatabaseName];
            }
        }

        internal string DatabaseServerName
        {
            get
            {
                string server = string.Empty;
                if (this.arguments.Contains(Option.DatabaseServerName))
                {
                    server = this.arguments[Option.DatabaseServerName];
                }

                if (this.arguments.Contains(Option.DatabaseInstanceName))
                {
                    server = string.Format("{0}\\{1}", server, this.arguments[Option.DatabaseInstanceName]);
                }

                return server;
            }
        }

        internal DateTime EndDate { get; private set; }

        internal DateTime StartDate { get; private set; }

        internal string UploadServerName
        {
            get
            {
                return this.arguments[Option.UploadServer];
            }
        }

        #endregion

        #region Methods

        internal static void DisplayBanner()
        {
            Console.WriteLine();
            Console.WriteLine("1E Savings Analysis Data Extraction Tool");
            Console.WriteLine("Copyright (c) 2012 1E - http://www.1e.com");
            Console.WriteLine();
        }

        internal bool Valid()
        {
            return this.commandLineOptionsValid;
        }

        internal bool ValidateCommandline()
        {
            bool valid = true;
            if (this.arguments.Count == 0 || this.arguments.ContainsHelpSwitch)
            {
                this.DisplayUsage();
                return false;
            }

            if (this.arguments.Contains(Option.UploadFile))
            {
                return this.QaTestValidation();
            }

            foreach (var option in this.supportCommandLineOptions)
            {
                if (option.Value.Mandatory && !this.arguments.Contains(option.Key))
                {
                    MissingArgument(option.Key);
                    valid = false;
                }
            }

            if (this.arguments.Contains(Option.StartDate))
            {
                DateTime startDateValue;

                if (!DateTime.TryParse(this.arguments[Option.StartDate], out startDateValue))
                {
                    Console.WriteLine(string.Format("Unable to parse '{0}' switch", Option.StartDate));
                    valid = false;
                }
                else
                {
                    this.StartDate = startDateValue;
                }
            }
            else
            {
                this.StartDate = DateTime.Now.AddDays(-Convert.ToInt32(ConfigurationManager.AppSettings["MaxDays"]));
            }

            if (this.arguments.Contains(Option.EndDate))
            {
                DateTime endDateValue;

                if (!DateTime.TryParse(this.arguments[Option.EndDate], out endDateValue))
                {
                    Console.WriteLine(string.Format("Unable to parse '{0}' switch", Option.EndDate));
                    valid = false;
                }
                else
                {
                    this.EndDate = endDateValue;
                }
            }
            else
            {
                this.EndDate = DateTime.Now;
            }

            return valid;
        }

        private static void MissingArgument(string argumentName)
        {
            Console.WriteLine(string.Format("Missing '{0}' switch", argumentName));
        }

        private void DisplayUsage()
        {
            // TODO: Once plug-in architecture is done, this will need reworking to display possible plugin configuration options
            // TODO: Derive EXE name from runnning executable
            Console.WriteLine("Usage");
            Console.WriteLine(
                @"SavingsAnalysis.Client.Host -companyName=ACME -databaseserver=DATABASESERVER -database=DATABASENAME");
            Console.WriteLine(@"Supported command line options");
            foreach (var option in this.supportCommandLineOptions)
            {
                if (option.Key == Option.UploadFile)
                {
                    continue;
                }

                Console.WriteLine(
                    "-{0}\t{1} {2}\t", 
                    option.Key, 
                    option.Value.HelpString, 
                    option.Value.Mandatory ? "[MANDATORY]" : "[OPTIONAL]");
            }
        }

        private bool QaTestValidation()
        {
            // Assist QA to test file upload with files of any size
            if (!this.arguments.Contains(Option.UploadServer))
            {
                Console.WriteLine(
                    string.Format("ERROR: '{0}' switch is required to test test file upload", Option.UploadServer));
                return false;
            }

            return QATest.UploadFile(this.arguments[Option.UploadServer], this.arguments[Option.UploadFile]);
        }

        #endregion

        internal class CommandLineOptionInfo
        {
            #region Properties

            internal string HelpString { get; set; }

            internal bool Mandatory { get; set; }

            #endregion
        }

        private static class Option
        {
            #region Static Fields

            internal static readonly string CompanyName = "companyname";

            internal static readonly string DatabaseInstanceName = "instance";

            internal static readonly string DatabaseName = "database";

            internal static readonly string DatabaseServerName = "databaseserver";

            internal static readonly string EndDate = "enddate";

            internal static readonly string StartDate = "startdate";

            // FOR TESTING ONLY
            internal static readonly string UploadFile = "uploadfile";

            internal static readonly string UploadServer = "uploadserver";

            #endregion
        }
    }
}