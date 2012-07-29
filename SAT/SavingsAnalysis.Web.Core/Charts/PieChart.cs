namespace SavingsAnalysis.Web.Core.Charts
{
    using System;
    using System.Collections.Generic;
    using System.Drawing;
    using System.Web.UI.DataVisualization.Charting;
    using SavingsAnalysis.AnalysisEngine.Core;

    public struct PieChart
    {
        public PieChart(AnalysisDictionary dataSource, List<string> keys, string imageFile)
            : this()
        {
            if (dataSource == null)
            {
                throw new InvalidOperationException("Data source is invalid");
            }

            if (keys == null)
            {
                throw new InvalidOperationException("Graph keys are invalid");
            }

            if (string.IsNullOrWhiteSpace(imageFile))
            {
                throw new InvalidOperationException("Image path is invalid");
            }

            DataSource = dataSource;
            Keys = keys;
            ImageFile = imageFile;
        }
        
        public SeriesChartType ChartType { get; set; }

        internal string ImageFile { get; set; }

        internal List<string> Keys { get; set; }

        internal AnalysisDictionary DataSource { get; set; }

        public void GeneratePieChartImage()
        {
            var yaxisValues = new double[Keys.Count];
            var xaxisValues = new string[Keys.Count];

            var idx = 0;
            foreach (var entry in Keys)
            {
                xaxisValues.SetValue(string.Format("{0}", entry), idx);
                yaxisValues.SetValue(Convert.ToDouble(DataSource[entry].Value), idx);
                idx++;
            }

            var objSeries = RenderSeries();
            objSeries.Points.DataBindXY(xaxisValues, yaxisValues);
            CustomizeSeries(objSeries);

            var objChart = new Chart { BackColor = Color.Transparent };
            objChart.Series.Add(objSeries);
            objChart.ChartAreas.Add(RenderChartArea());
            objChart.ImageType = ChartImageType.Png;
            objChart.SaveImage(ImageFile);
        }

        private Series RenderSeries()
        {
            var objSeries = new Series
            {
                ChartType = SeriesChartType.Pie,
                Label = "#VALX\n#VALY%",
                Font = new Font("Segoe UI", 14),
                IsValueShownAsLabel = true,
                CustomProperties = "DrawingStyle=Cylinder, PieStartAngle=85"
            };
            return objSeries;
        }

        private void CustomizeSeries(Series objSeries)
        {
            // Explode selected country
            foreach (var point in objSeries.Points)
            {
                if (point.AxisLabel.ToLower() == "off")
                {
                    point["Exploded"] = "true";
                    point.Color = ColorTranslator.FromHtml("#376092");
                    point.LabelForeColor = Color.White;
                }
                else
                {
                    point["Exploded"] = "false";
                    point.Color = Color.DarkOrange;
                    point.LabelForeColor = ColorTranslator.FromHtml("#376092");
                }
            }

            objSeries["PieDrawingStyle"] = "Default";
            objSeries["BarLabelStyle"] = "Center";
        }

        private ChartArea RenderChartArea()
        {
            var objChartArea = new ChartArea("piechart")
            {
                BackColor = Color.Transparent,
                AlignmentStyle = AreaAlignmentStyles.All,
                AlignmentOrientation = AreaAlignmentOrientations.All,
                Position = { X = 0, Y = 0, Width = 90, Height = 90 }
            };

            return objChartArea;
        }
    }
}
