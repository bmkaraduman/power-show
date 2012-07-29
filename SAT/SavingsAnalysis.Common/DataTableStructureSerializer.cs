namespace SavingsAnalysis.Common
{
    using System;
    using System.Data;
    using System.Globalization;
    using System.Xml;

    /// <summary>
    /// Serializes and deserializes the basic structure of a DataTable to/from Xml
    /// </summary>
    /// <remarks>
    /// Creates a structure like...
    /// 
    /// <![CDATA[
    /// <xml>
    /// <columns>
    ///     <column name="MyStringColumn" type="System.String" nullable="true" length="255" />
    ///     <column name="MyIntegerColumn" type="System.Int32" nullable="false" />
    /// </columns>
    /// 
    /// ]]>
    /// </remarks>
    public class DataTableStructureSerializer
    {
        private const string ColumnCollectionElementName = "columns";
        private const string ColumnElementName = "column";

        public XmlDocument Serialize(DataTable table)
        {
            if (table == null)
            {
                throw new ArgumentNullException("table");
            }

            if (table.Columns.Count == 0)
            {
                throw new ArgumentOutOfRangeException("table", "DataTable specified contains no columns");
            }

            var doc = new XmlDocument();
            var xmlDeclaration = doc.CreateXmlDeclaration("1.0", "utf-8", null);

            doc.PrependChild(xmlDeclaration);

            var root = doc.CreateElement(ColumnCollectionElementName);
            doc.AppendChild(root);

            foreach (var dataCol in table.Columns)
            {
                var col = (DataColumn)dataCol;
                var el = doc.CreateElement(ColumnElementName);

                el.SetAttribute(AttributeNames.Name, col.ColumnName);
                el.SetAttribute(AttributeNames.Type, col.DataType.FullName);
                el.SetAttribute(AttributeNames.Nullable, col.AllowDBNull.ToString(CultureInfo.InvariantCulture));

                // MaxLength only relevant for strings
                if (col.DataType == typeof(string))
                {
                    el.SetAttribute(AttributeNames.Length, col.MaxLength.ToString(CultureInfo.InvariantCulture));
                }

                root.AppendChild(el);
            }

            return doc;
        }

        public DataTable Deserialize(string xml)
        {
            var doc = new XmlDocument();
            doc.LoadXml(xml);
            return Deserialize(doc);
        }

        public DataTable Deserialize(XmlDocument doc)
        {
            if (doc == null)
            {
                throw new ArgumentNullException("doc");
            }

            var columnElements = doc.GetElementsByTagName(ColumnElementName);
            if (columnElements.Count == 0)
            {
                throw new ArgumentOutOfRangeException("doc", "Specified document does not contain any column definitions");
            }

            var table = new DataTable();
            foreach (var e in columnElements)
            {
                var el = (XmlElement)e;

                var name = GetAttributeOrThrow(el, AttributeNames.Name);
                var type = Type.GetType(GetAttributeOrThrow(el, AttributeNames.Type));
                var nullable = bool.Parse(GetAttributeOrThrow(el, AttributeNames.Nullable));

                var col = new DataColumn(name, type) { AllowDBNull = nullable };

                if (type == typeof(string))
                {
                    col.MaxLength = int.Parse(GetAttributeOrThrow(el, AttributeNames.Length));
                }

                table.Columns.Add(col);
            }

            return table;
        }

        private static string GetAttributeOrThrow(XmlElement el, string attributeName)
        {
            if (!el.HasAttribute(attributeName))
            {
                var msg = string.Format("Xml \"{0}\" is missing its '{1}' attribute", el.InnerXml, attributeName);
                throw new FormatException(msg);
            }

            return el.GetAttribute(attributeName);
        }

        private static class AttributeNames
        {
            public const string Name = "name";
            public const string Type = "type";
            public const string Nullable = "nullable";
            public const string Length = "length";
        }
    }
}
