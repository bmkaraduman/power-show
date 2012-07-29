namespace SavingsAnalysis.Common
{
    using System.Collections.Generic;
    using System.Data.SqlTypes;
    using System.IO;
    using System.Text;

    public class CsvWriter
    {
        private readonly List<string> fields = new List<string>();
        private readonly List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();

        /// <summary>
        /// Returns the current row
        /// </summary>
        private Dictionary<string, object> CurrentRow
        {
            get
            {
                return rows[rows.Count - 1];
            }
        }

        /// <summary>
        /// Set a value on this column
        /// </summary>
        public object this[string field]
        {
            set
            {
                // Keep track of the field names, because the dictionary loses the ordering
                if (!fields.Contains(field))
                {
                    fields.Add(field);
                }

                CurrentRow[field] = value;
            }
        }

        /// <summary>
        /// Exports to a file
        /// </summary>
        public void ExportToFile(string path)
        {
            File.WriteAllText(path, Export());
        }

        /// <summary>
        /// Exports to a file
        /// </summary>
        public void AppendToFile(string path)
        {
            File.AppendAllText(path, Export(false));
        }

        /// <summary>
        /// Call this before setting any fields on a row
        /// </summary>
        public void AddRow()
        {
            rows.Add(new Dictionary<string, object>());
        }

        /// <summary>
        /// Converts a value to how it should output in a csv file
        /// </summary>
        /// <remarks>
        /// If it has a comma, it needs surrounding with double quotes
        /// Eg Sydney, Australia -> "Sydney, Australia"
        /// Also if it contains any double quotes ("), then they need to be replaced with quad quotes[sic] ("")
        /// </remarks>
        private static string MakeValueCsvFriendly(object value)
        {
            if (value == null)
            {
                return string.Empty;
            }

            if (value is INullable && ((INullable)value).IsNull)
            {
                return string.Empty;
            }

            var output = value.ToString();

            // TODO: A hack to remove \r\n from the input string
            if (output.Contains("\r"))
            {
                output = output.Replace("\r", string.Empty);
            }

            if (output.Contains("\n"))
            {
                output = output.Replace("\n", string.Empty);
            }

            if (output.Contains(",") || output.Contains("\""))
            {
                output = '"' + output.Replace("\"", "\"\"") + '"';
            }

            return output;
        }

        /// <summary>
        /// Output all rows as a CSV returning a string
        /// </summary>
        private string Export(bool addHeader = true)
        {
            var sb = new StringBuilder();

            // The header
            if (addHeader)
            {
               foreach (var field in fields)
               {
                  sb.Append(field).Append(",");
               }

               sb.AppendLine();
            }

            // The rows
            foreach (var row in rows)
            {
                foreach (var field in fields)
                {
                    sb.Append(MakeValueCsvFriendly(row[field])).Append(",");
                }

                sb.AppendLine();
            }

            return sb.ToString();
        }
    }
}
