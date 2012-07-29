namespace SavingsAnalysis.Web.Controllers
{
    using System.Data;
    using System.Globalization;

    using Microsoft.Reporting.WebForms;

    using global::SavingsAnalysis.Web.BaseClasses;
    using global::SavingsAnalysis.Web.ViewModels;

    public class NightWatchmanController : BaseController
    {
        public static string GenerateReport(OutputParametersViewModel analysisResults, ReportType reportType)
        {
            var reportViewer = new ReportViewer();
            reportViewer.LocalReport.ReportEmbeddedResource = "SavingsAnalysis.Web.Reports.NightWatchman.rdlc";

            // Power State
            var dataSetShoppingProgramList = CreateDataSource("DataSetNightwatchmanOvernightPowerState");
            reportViewer.LocalReport.DataSources.Add(dataSetShoppingProgramList);

            reportViewer.LocalReport.SetParameters(
                new[]
                    {
                        // Common
                        new ReportParameter("CompanyName", analysisResults.CommonResults.CompanyName),
                        new ReportParameter("CurrencySymbol", analysisResults.CommonResults.CurrencySymbol),

                        // Nightwatchman
                        new ReportParameter("NumberOfDesktops", analysisResults.NightWatchmanResults.NumberOfDesktops.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("NumberOfLaptops", analysisResults.NightWatchmanResults.NumberOfLaptops.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("PassengerCars", analysisResults.NightWatchmanResults.PassengerCars.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("Period", analysisResults.NightWatchmanResults.Period.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("PotentialYearlyCO2Savings", analysisResults.NightWatchmanResults.PotentialYearlyCO2Savings.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("PotentialYearlyKwhSavings", analysisResults.NightWatchmanResults.PotentialYearlyKwhSavings.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("PowerStateOff", analysisResults.NightWatchmanResults.PowerStateOff.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("PowerStateOn", analysisResults.NightWatchmanResults.PowerStateOn.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("ShowCars", analysisResults.NightWatchmanResults.ShowCars.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("ShowNuclear", analysisResults.NightWatchmanResults.ShowNuclear.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("ShowStars", analysisResults.NightWatchmanResults.ShowStars.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("ShowTrees", analysisResults.NightWatchmanResults.ShowTrees),
                        new ReportParameter("ShowZ", analysisResults.NightWatchmanResults.ShowZ.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("StartDate", analysisResults.NightWatchmanResults.NWStartDate.ToString("dd MMM yyyy")),
                        new ReportParameter("YearlyCostSavings", analysisResults.NightWatchmanResults.YearlyCostSavings.ToString(CultureInfo.InvariantCulture)),
                    });

            var filename = DetermineFilename("NightWatchmanNew", reportType);
            SaveReport(filename, reportType, reportViewer);

            return filename;
        }

        private static ReportDataSource CreateDataSource(string name)
        {
            var dt = new DataTable();
            dt.Columns.Add("SeriesName", typeof(string));
            dt.Columns.Add("Value", typeof(double));

            var row = dt.NewRow();
            row["SeriesName"] = "On";
            row["Value"] = 90.4;
            dt.Rows.Add(row);

            row = dt.NewRow();
            row["SeriesName"] = "Off";
            row["Value"] = 9.6;
            dt.Rows.Add(row);

            return new ReportDataSource { Name = name, Value = dt };
        }
    }
}
