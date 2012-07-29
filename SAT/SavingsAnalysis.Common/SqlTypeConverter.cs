namespace SavingsAnalysis.Common
{
    using System;
    using System.Globalization;

    /// <summary>
    /// Provides conversion mechanisms between SQL server types and their .Net equivalents
    /// </summary>
    public static class SqlTypeConverter
    {
        /// <summary>
        /// Return T-SQL data type definition, based on schema definition for a column
        /// </summary>
        public static string BuildSqlType(Type type, int columnSize, int numericPrecision, int numericScale)
        {
            if (type == typeof(string))
            {
                return "VARCHAR(" + ((columnSize == -1) ? "255" : (columnSize > 8000) ? "MAX" : columnSize.ToString(CultureInfo.InvariantCulture)) + ")";
            }

            if (type == typeof(decimal))
            {
                if (numericScale > 0)
                {
                    return "REAL";
                }

                if (numericPrecision > 10)
                {
                    return "BIGINT";
                }

                return "INT";
            }

            if (type == typeof(double) || type == typeof(float))
            {
                return "REAL";
            }

            if (type == typeof(long))
            {
                return "BIGINT";
            }

            if (type == typeof(short) || type == typeof(int))
            {
                return "INT";
            }

            if (type == typeof(DateTime))
            {
                return "DATETIME";
            }

            if (type == typeof(bool))
            {
                return "BIT";
            }

            if (type == typeof(byte))
            {
                return "TINYINT";
            }

            if (type == typeof(Guid))
            {
                return "UNIQUEIDENTIFIER";
            }

            throw new NotImplementedException(type + " not implemented.");
        }
    }
}
