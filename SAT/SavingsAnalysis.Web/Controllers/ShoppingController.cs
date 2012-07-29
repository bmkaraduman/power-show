namespace SavingsAnalysis.Web.Controllers
{
    using System.Collections.Generic;
    using System.Data;
    using System.Globalization;

    using Microsoft.Reporting.WebForms;

    using global::SavingsAnalysis.Web.BaseClasses;
    using global::SavingsAnalysis.Web.Models;
    using global::SavingsAnalysis.Web.ViewModels;

    public class ShoppingController : BaseController
    {
        public static string GenerateReport(OutputParametersViewModel analysisResults, ReportType reportType)
        {
            var reportViewer = new ReportViewer();
            reportViewer.LocalReport.ReportEmbeddedResource = "SavingsAnalysis.Web.Reports.Shopping.rdlc";

            // Program list
            var dataSetShoppingProgramList = CreateDataSource(analysisResults.ShoppingProgramListResults.ProgramList, "DataSetShoppingProgramList");
            reportViewer.LocalReport.DataSources.Add(dataSetShoppingProgramList);

            reportViewer.LocalReport.SetParameters(
                new[]
                    {
                        // Common
                        new ReportParameter("CompanyName", analysisResults.CommonResults.CompanyName),
                        new ReportParameter("CurrencySymbol", analysisResults.CommonResults.CurrencySymbol),

                        // Shopping
                        new ReportParameter("CostPerRequest", analysisResults.ShoppingResults.CostPerRequest.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("EndDate", analysisResults.ShoppingResults.ShopEndDate.ToString(CultureInfo.CurrentCulture.DateTimeFormat)),
                        new ReportParameter("NumberOfActiveMachines", analysisResults.ShoppingResults.NumberOfActiveMachines.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("Period", analysisResults.ShoppingResults.Period.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("StartDate", analysisResults.ShoppingResults.ShopStartDate.ToString(CultureInfo.CurrentCulture.DateTimeFormat)),
                        new ReportParameter("Threshold", analysisResults.ShoppingResults.Threshold.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("TotalNumberOfOneOffRequests", analysisResults.ShoppingResults.TotalNumberOfOneOffRequests.ToString(CultureInfo.InvariantCulture)),
                        new ReportParameter("TotalNumberOfRequests", analysisResults.ShoppingResults.TotalNumberOfRequests.ToString(CultureInfo.InvariantCulture))
                    });
            
            var filename = DetermineFilename("Shopping", reportType);

            SaveReport(filename, reportType, reportViewer);

            return filename;
        }

        private static ReportDataSource CreateDataSource(IEnumerable<ShoppingProgram> programList, string name)
        {
            var dt = new DataTable();
            dt.Columns.Add("ProgramName", typeof(string));
            dt.Columns.Add("PackageName", typeof(string));
            dt.Columns.Add("TotalCount", typeof(int));
            foreach (var shoppingProgram in programList)
            {
                var row = dt.NewRow();
                row["ProgramName"] = shoppingProgram.ProgramName;
                row["PackageName"] = shoppingProgram.PackageName;
                row["TotalCount"] = shoppingProgram.TotalCount;

                dt.Rows.Add(row);
            }

            return new ReportDataSource { Name = name, Value = dt };
        }
    }
}
