namespace SavingsAnalysis.Web.Core.OpenXml
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Globalization;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Text.RegularExpressions;

    using DocumentFormat.OpenXml;
    using DocumentFormat.OpenXml.Packaging;
    using DocumentFormat.OpenXml.Wordprocessing;

    using SavingsAnalysis.AnalysisEngine.Core;

    public class WordManager
    {
        /// <summary>
        /// Regex used to parse MERGEFIELDs in the provided document.
        /// </summary>
        private readonly Regex instructionRegEx =
            new Regex(
                        @"^[\s]*MERGEFIELD[\s]+(?<name>[#\w]*){1}               # This retrieves the field's name (Named Capture Group -> name)
                            [\s]*(\\\*[\s]+(?<Format>[\w]*){1})?                # Retrieves field's format flag (Named Capture Group -> Format)
                            [\s]*(\\b[\s]+[""]?(?<PreText>[^\\]*){1})?         # Retrieves text to display before field data (Named Capture Group -> PreText)
                                                                                # Retrieves text to display after field data (Named Capture Group -> PostText)
                            [\s]*(\\f[\s]+[""]?(?<PostText>[^\\]*){1})?",
        RegexOptions.Compiled | RegexOptions.CultureInvariant | RegexOptions.ExplicitCapture | RegexOptions.IgnoreCase | RegexOptions.IgnorePatternWhitespace | RegexOptions.Singleline);

        public string FileName { get; set; }

        public AnalysisDictionary MergeColsValues { get; set; }

        public bool IsCleanEmptyTablesRows { get; set; }

        public byte[] Bind()
        {
            return GetWordReport();
        }

        /// <summary>
        /// Fills in a .docx file with the provided data.
        /// </summary>
        /// <returns>The filled-in document.</returns>
        private byte[] GetWordReport()
        {
            var dataset = new DataSet();

            // first read document in as stream
            byte[] original = File.ReadAllBytes(FileName);

            using (var stream = new MemoryStream())
            {
                stream.Write(original, 0, original.Length);

                // Create a Wordprocessing document object. 
                using (var docx = WordprocessingDocument.Open(stream, true))
                {
                    // 2010/08/01: addition
                    ConvertFieldCodes(docx.MainDocumentPart.Document);

                    // first: process all tables
                    string[] switches;
                    foreach (var field in docx.MainDocumentPart.Document.Descendants<SimpleField>())
                    {
                        string fieldname = GetFieldName(field, out switches);
                        if (!string.IsNullOrEmpty(fieldname) &&
                        fieldname.StartsWith("tbl_"))
                        {
                            var wrow = GetFirstParent<TableRow>(field);
                            if (wrow == null)
                            {
                                continue;   // can happen: is because table contains multiple fields, and after 1 pass, the initial row is already deleted
                            }

                            var wtable = GetFirstParent<Table>(wrow);
                            if (wtable == null)
                            {
                                continue;   // can happen: is because table contains multiple fields, and after 1 pass, the initial row is already deleted
                            }

                            string tablename = GetTableNameFromFieldName(fieldname);

                            if (dataset == null ||
                                !dataset.Tables.Contains(tablename) ||
                                dataset.Tables[tablename].Rows.Count == 0)
                            {
                                continue;   // don't remove table here: will be done in next pass
                            }

                            var table = dataset.Tables[tablename];

                            var props = new List<TableCellProperties>();
                            var cellcolumnnames = new List<string>();
                            var paragraphInfo = new List<string>();
                            var cellfields = new List<SimpleField>();

                            foreach (TableCell cell in wrow.Descendants<TableCell>())
                            {
                                props.Add(cell.GetFirstChild<TableCellProperties>());
                                var p = cell.GetFirstChild<Paragraph>();
                                if (p != null)
                                {
                                    var pp = p.GetFirstChild<ParagraphProperties>();
                                    paragraphInfo.Add(pp != null ? pp.OuterXml : null);
                                }
                                else
                                {
                                    paragraphInfo.Add(null);
                                }

                                var colname = string.Empty;
                                SimpleField colfield = null;
                                foreach (SimpleField cellfield in cell.Descendants<SimpleField>())
                                {
                                    colfield = cellfield;
                                    colname = GetColumnNameFromFieldName(GetFieldName(cellfield, out switches));
                                    break;  // supports only 1 cellfield per table
                                }

                                cellcolumnnames.Add(colname);
                                cellfields.Add(colfield);
                            }

                            // keep reference to row properties
                            var rprops = wrow.GetFirstChild<TableRowProperties>();

                            foreach (DataRow row in table.Rows)
                            {
                                var nrow = new TableRow();

                                if (rprops != null)
                                {
                                    nrow.Append(new TableRowProperties(rprops.OuterXml));
                                }

                                for (int i = 0; i < props.Count; i++)
                                {
                                    var cellproperties = new TableCellProperties(props[i].OuterXml);
                                    var cell = new TableCell();
                                    cell.Append(cellproperties);
                                    var p = new Paragraph(new ParagraphProperties(paragraphInfo[i]));
                                    cell.Append(p);   // cell must contain at minimum a paragraph !

                                    if (!string.IsNullOrEmpty(cellcolumnnames[i]))
                                    {
                                        if (!table.Columns.Contains(cellcolumnnames[i]))
                                        {
                                            throw new Exception(string.Format("Unable to complete template: column name '{0}' is unknown in parameter tables !", cellcolumnnames[i]));
                                        }

                                        if (!row.IsNull(cellcolumnnames[i]))
                                        {
                                            string val = row[cellcolumnnames[i]].ToString();
                                            p.Append(GetRunElementForText(val, cellfields[i]));
                                        }
                                    }

                                    nrow.Append(cell);
                                }

                                wtable.Append(nrow);
                            }

                            // finally : delete template-row (and thus also the mergefields in the table)
                            wrow.Remove();
                        }
                    }

                    // clean empty tables
                    foreach (var field in docx.MainDocumentPart.Document.Descendants<SimpleField>())
                    {
                        string fieldname = GetFieldName(field, out switches);
                        if (!string.IsNullOrEmpty(fieldname) &&
                            fieldname.StartsWith("tbl_"))
                        {
                            var wrow = GetFirstParent<TableRow>(field);
                            if (wrow == null)
                            {
                                continue;   // can happen: is because table contains multiple fields, and after 1 pass, the initial row is already deleted
                            }

                            var wtable = GetFirstParent<Table>(wrow);
                            if (wtable == null)
                            {
                                continue;   // can happen: is because table contains multiple fields, and after 1 pass, the initial row is already deleted
                            }

                            var tablename = GetTableNameFromFieldName(fieldname);
                            if (dataset == null ||
                                !dataset.Tables.Contains(tablename) ||
                                dataset.Tables[tablename].Rows.Count == 0)
                            {
                                // if there's a 'dt' switch: delete Word-table
                                if (switches.Contains("dt"))
                                {
                                    wtable.Remove();
                                }
                            }
                        }
                    }

                    // next : process all remaining fields in the main document
                    FillWordFieldsInElement(MergeColsValues, docx.MainDocumentPart.Document);

                    docx.MainDocumentPart.Document.Save();  // save main document back in package

                    // process header(s)
                    foreach (HeaderPart hpart in docx.MainDocumentPart.HeaderParts)
                    {
                        // 2010/08/01: addition
                        ConvertFieldCodes(hpart.Header);
                        FillWordFieldsInElement(MergeColsValues, hpart.Header);
                        hpart.Header.Save();    // save header back in package
                    }

                    // process footer(s)
                    foreach (FooterPart fpart in docx.MainDocumentPart.FooterParts)
                    {
                        // 2010/08/01: addition
                        ConvertFieldCodes(fpart.Footer);
                        FillWordFieldsInElement(MergeColsValues, fpart.Footer);
                        fpart.Footer.Save();    // save footer back in package
                    }
                }

                // get package bytes
                stream.Seek(0, SeekOrigin.Begin);
                byte[] data = stream.ToArray();

                // WdRetrieveToc(FileName);
                return data;
            }
        }
      
        private string[] ApplyFormatting(string format, string fieldValue, string preText, string postText)
        {
            var valuesToReturn = new string[3];

            if ("UPPER".Equals(format))
            {
                // Convert everything to uppercase.
                valuesToReturn[0] = fieldValue.ToUpper(CultureInfo.CurrentCulture);
                valuesToReturn[1] = preText.ToUpper(CultureInfo.CurrentCulture);
                valuesToReturn[2] = postText.ToUpper(CultureInfo.CurrentCulture);
            }
            else if ("LOWER".Equals(format))
            {
                // Convert everything to lowercase.
                valuesToReturn[0] = fieldValue.ToLower(CultureInfo.CurrentCulture);
                valuesToReturn[1] = preText.ToLower(CultureInfo.CurrentCulture);
                valuesToReturn[2] = postText.ToLower(CultureInfo.CurrentCulture);
            }
            else if ("FirstCap".Equals(format))
            {
                // Capitalize the first letter, everything else is lowercase.
                if (!string.IsNullOrEmpty(fieldValue))
                {
                    valuesToReturn[0] = fieldValue.Substring(0, 1).ToUpper(CultureInfo.CurrentCulture);
                    if (fieldValue.Length > 1)
                    {
                        valuesToReturn[0] = valuesToReturn[0] + fieldValue.Substring(1).ToLower(CultureInfo.CurrentCulture);
                    }
                }

                if (!string.IsNullOrEmpty(preText))
                {
                    valuesToReturn[1] = preText.Substring(0, 1).ToUpper(CultureInfo.CurrentCulture);
                    if (fieldValue != null)
                    {
                        if (fieldValue.Length > 1)
                        {
                            valuesToReturn[1] = valuesToReturn[1] + preText.Substring(1).ToLower(CultureInfo.CurrentCulture);
                        }
                    }
                }

                if (!string.IsNullOrEmpty(postText))
                {
                    valuesToReturn[2] = postText.Substring(0, 1).ToUpper(CultureInfo.CurrentCulture);
                    if (fieldValue != null)
                    {
                        if (fieldValue.Length > 1)
                        {
                            valuesToReturn[2] = valuesToReturn[2] + postText.Substring(1).ToLower(CultureInfo.CurrentCulture);
                        }
                    }
                }
            }
            else if ("Caps".Equals(format))
            {
                // Title casing: the first letter of every word should be capitalized.
                valuesToReturn[0] = ToTitleCase(fieldValue);
                valuesToReturn[1] = ToTitleCase(preText);
                valuesToReturn[2] = ToTitleCase(postText);
            }
            else
            {
                valuesToReturn[0] = fieldValue;
                valuesToReturn[1] = preText;
                valuesToReturn[2] = postText;
            }

            return valuesToReturn;
        }

        /// <summary>
        /// Executes the field switches on a given element.
        /// The possible switches are:
        /// <list>
        /// <li>dt : delete table</li>
        /// <li>dr : delete row</li>
        /// <li>dp : delete paragraph</li>
        /// </list>
        /// </summary>
        /// <param name="element">The element being operated on.</param>
        /// <param name="switches">The switched to be executed.</param>
        private void ExecuteSwitches(OpenXmlElement element, string[] switches)
        {
            if (switches == null || !switches.Any())
            {
                return;
            }

            // check switches (switches are always lowercase)
            if (switches.Contains("dp"))
            {
                var p = GetFirstParent<Paragraph>(element);
                if (p != null)
                {
                    p.Remove();
                }
            }
            else if (switches.Contains("dr"))
            {
                var row = GetFirstParent<TableRow>(element);
                if (row != null)
                {
                    row.Remove();
                }
            }
            else if (switches.Contains("dt"))
            {
                var table = GetFirstParent<Table>(element);
                if (table != null)
                {
                    table.Remove();
                }
            }
        }

        /// <summary>
        /// Fills all the <see cref="OpenXmlElement"></see>
        ///   that are found in a given <see cref="OpenXmlElement"/>.
        /// </summary>
        /// <param name="values">The values to insert; keys should match the placeholder names, values are the data to insert.</param>
        /// <param name="element">The document element taht will contain the new values.</param>
        private void FillWordFieldsInElement(AnalysisDictionary values, OpenXmlElement element)
        {
            var emptyfields = new Dictionary<SimpleField, string[]>();

            // First pass: fill in data, but do not delete empty fields.  Deletions silently break the loop.
            var list = element.Descendants<SimpleField>().ToArray();
            foreach (var field in list)
            {
                string[] switches;
                string[] options;
                string fieldname = GetFieldNameWithOptions(field, out switches, out options);
                if (!string.IsNullOrEmpty(fieldname))
                {
                    if (values.ContainsKey(fieldname)
                        && !string.IsNullOrEmpty(values[fieldname].Value))
                    {
                        string[] formattedText = ApplyFormatting(options[0], values[fieldname].Value, options[1], options[2]);

                        // Prepend any text specified to appear before the data in the MergeField
                        if (!string.IsNullOrEmpty(options[1]))
                        {
                            // ReSharper disable RedundantTypeArgumentsOfMethod
                            field.Parent.InsertBeforeSelf<Paragraph>(GetPreOrPostParagraphToInsert(formattedText[1], field));
                            // ReSharper restore RedundantTypeArgumentsOfMethod
                        }

                        // Append any text specified to appear after the data in the MergeField
                        if (!string.IsNullOrEmpty(options[2]))
                        {
                            // ReSharper disable RedundantTypeArgumentsOfMethod
                            field.Parent.InsertAfterSelf<Paragraph>(GetPreOrPostParagraphToInsert(formattedText[2], field));
                            // ReSharper restore RedundantTypeArgumentsOfMethod
                        }

                        // replace mergefield with text
                        // ReSharper disable RedundantTypeArgumentsOfMethod
                        field.Parent.ReplaceChild<SimpleField>(GetRunElementForText(formattedText[0], field), field);
                        // ReSharper restore RedundantTypeArgumentsOfMethod
                    }
                    else
                    {
                        // keep track of unknown or empty fields
                        emptyfields[field] = switches;
                    }
                }
            }

            // second pass : clear empty fields
            foreach (KeyValuePair<SimpleField, string[]> kvp in emptyfields)
            {
                // if field is unknown or empty: execute switches and remove it from document !
                ExecuteSwitches(kvp.Key, kvp.Value);
                kvp.Key.Remove();
            }
        }

        /// <summary>
        /// Returns the columnname from a given fieldname from a Mergefield
        /// The instruction of a table-Mergefield is formatted as TBL_tablename_columnname
        /// </summary>
        /// <param name="fieldname">The field name.</param>
        /// <returns>The column name.</returns>
        /// <exception cref="ArgumentException">Thrown when fieldname is not formatted as TBL_tablename_columname.</exception>
        private string GetColumnNameFromFieldName(string fieldname)
        {
            // Column name is after the second underscore.
            int pos1 = fieldname.IndexOf('_');
            if (pos1 <= 0)
            {
                throw new ArgumentException("Error: table-MERGEFIELD should be formatted as follows: TBL_tablename_columnname.");
            }

            int pos2 = fieldname.IndexOf('_', pos1 + 1);
            if (pos2 <= 0)
            {
                throw new ArgumentException("Error: table-MERGEFIELD should be formatted as follows: TBL_tablename_columnname.");
            }

            return fieldname.Substring(pos2 + 1);
        }

        /// <summary>
        /// Returns the fieldname and switches from the given mergefield-instruction
        /// Note: the switches are always returned lowercase !
        /// </summary>
        /// <param name="field">The field being examined.</param>
        /// <param name="switches">An array of switches to apply to the field.</param>
        /// <returns>The name of the field.</returns>
        private string GetFieldName(SimpleField field, out string[] switches)
        {
            var a = field.GetAttribute("instr", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
            switches = new string[0];
            string fieldname = string.Empty;
            string instruction = a.Value;

            if (!string.IsNullOrEmpty(instruction))
            {
                Match m = this.instructionRegEx.Match(instruction);
                if (m.Success)
                {
                    fieldname = m.Groups["name"].ToString().Trim();
                    int pos = fieldname.IndexOf('#');
                    if (pos > 0)
                    {
                        // Process the switches, correct the fieldname.
                        // ReSharper disable RedundantExplicitArrayCreation
                        switches = fieldname.Substring(pos + 1).ToLower().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                        // ReSharper restore RedundantExplicitArrayCreation
                        fieldname = fieldname.Substring(0, pos);
                    }
                }
            }

            return fieldname;
        }

        /// <summary>
        /// Returns the fieldname and switches from the given mergefield-instruction
        /// Note: the switches are always returned lowercase !
        /// Note 2: options holds values for formatting and text to insert before and/or after the field value.
        ///         options[0] = Formatting (Upper, Lower, Caps a.k.a. title case, FirstCap)
        ///         options[1] = Text to insert before data
        ///         options[2] = Text to insert after data
        /// </summary>
        /// <param name="field">The field being examined.</param>
        /// <param name="switches">An array of switches to apply to the field.</param>
        /// <param name="options">Formatting options to apply.</param>
        /// <returns>The name of the field.</returns>
        private string GetFieldNameWithOptions(SimpleField field, out string[] switches, out string[] options)
        {
            var a = field.GetAttribute("instr", "http://schemas.openxmlformats.org/wordprocessingml/2006/main");
            switches = new string[0];
            options = new string[3];
            string fieldname = string.Empty;
            string instruction = a.Value;

            if (!string.IsNullOrEmpty(instruction))
            {
                Match m = this.instructionRegEx.Match(instruction);
                if (m.Success)
                {
                    fieldname = m.Groups["name"].ToString().Trim();
                    options[0] = m.Groups["Format"].Value.Trim();
                    options[1] = m.Groups["PreText"].Value.Trim();
                    options[2] = m.Groups["PostText"].Value.Trim();
                    int pos = fieldname.IndexOf('#');
                    if (pos > 0)
                    {
                        // Process the switches, correct the fieldname.
                        // ReSharper disable RedundantExplicitArrayCreation
                        switches = fieldname.Substring(pos + 1).ToLower().Split(new char[] { '#' }, StringSplitOptions.RemoveEmptyEntries);
                        // ReSharper restore RedundantExplicitArrayCreation
                        fieldname = fieldname.Substring(0, pos);
                    }
                }
            }

            return fieldname;
        }

        /// <summary>
        /// Returns the first parent of a given <see cref="OpenXmlElement"/> that corresponds
        /// to the given type.
        /// This methods is different from the Ancestors-method on the OpenXmlElement in the sense that
        /// this method will return only the first-parent in direct line (closest to the given element).
        /// </summary>
        /// <typeparam name="T">The type of element being searched for.</typeparam>
        /// <param name="element">The element being examined.</param>
        /// <returns>The first parent of the element of the specified type.</returns>
        private T GetFirstParent<T>(OpenXmlElement element) where T : OpenXmlElement
        {
            if (element.Parent == null)
            {
                return null;
            }

            if (element.Parent.GetType() == typeof(T))
            {
                return element.Parent as T;
            }
            
            return GetFirstParent<T>(element.Parent);
        }

        /// <summary>
        /// Creates a paragraph to house text that should appear before or after the MergeField.
        /// </summary>
        /// <param name="text">The text to display.</param>
        /// <param name="fieldToMimic">The MergeField that will have its properties mimiced.</param>
        /// <returns>An OpenXml Paragraph ready to insert.</returns>
        private Paragraph GetPreOrPostParagraphToInsert(string text, SimpleField fieldToMimic)
        {
            var runToInsert = GetRunElementForText(text, fieldToMimic);
            var paragraphToInsert = new Paragraph();
            paragraphToInsert.Append(runToInsert);

            return paragraphToInsert;
        }

        /// <summary>
        /// Returns a <see cref="Run"/>-openxml element for the given text.
        /// Specific about this run-element is that it can describe multiple-line and tabbed-text.
        /// The <see cref="SimpleField"/> placeholder can be provided too, to allow duplicating the formatting.
        /// </summary>
        /// <param name="text">The text to be inserted.</param>
        /// <param name="placeHolder">The placeholder where the text will be inserted.</param>
        /// <returns>A new <see cref="Run"/>-openxml element containing the specified text.</returns>
        private Run GetRunElementForText(string text, SimpleField placeHolder)
        {
            string rpr = null;
            if (placeHolder != null)
            {
                // ReSharper disable LoopCanBeConvertedToQuery
                foreach (RunProperties placeholderrpr in placeHolder.Descendants<RunProperties>())
                // ReSharper restore LoopCanBeConvertedToQuery
                {
                    rpr = placeholderrpr.OuterXml;
                    break;  // break at first
                }
            }

            var r = new Run();
            if (!string.IsNullOrEmpty(rpr))
            {
                r.Append(new RunProperties(rpr));
            }

            if (!string.IsNullOrEmpty(text))
            {
                // first process line breaks
                // ReSharper disable RedundantExplicitArrayCreation
                string[] split = text.Split(new string[] { "\n" }, StringSplitOptions.None);
                // ReSharper restore RedundantExplicitArrayCreation
                bool first = true;
                foreach (string s in split)
                {
                    if (!first)
                    {
                        r.Append(new Break());
                    }

                    first = false;

                    // then process tabs
                    bool firsttab = true;
                    // ReSharper disable RedundantExplicitArrayCreation
                    string[] tabsplit = s.Split(new string[] { "\t" }, StringSplitOptions.None);
                    // ReSharper restore RedundantExplicitArrayCreation
                    foreach (string tabtext in tabsplit)
                    {
                        if (!firsttab)
                        {
                            r.Append(new TabChar());
                        }

                        r.Append(new Text(tabtext));
                        firsttab = false;
                    }
                }
            }

            return r;
        }

        /// <summary>
        /// Returns the table name from a given fieldname from a Mergefield.
        /// The instruction of a table-Mergefield is formatted as TBL_tablename_columnname
        /// </summary>
        /// <param name="fieldname">The field name.</param>
        /// <returns>The table name.</returns>
        /// <exception cref="ArgumentException">Thrown when fieldname is not formatted as TBL_tablename_columname.</exception>
        private string GetTableNameFromFieldName(string fieldname)
        {
            int pos1 = fieldname.IndexOf('_');
            if (pos1 <= 0)
            {
                throw new ArgumentException("Error: table-MERGEFIELD should be formatted as follows: TBL_tablename_columnname.");
            }

            int pos2 = fieldname.IndexOf('_', pos1 + 1);
            if (pos2 <= 0)
            {
                throw new ArgumentException("Error: table-MERGEFIELD should be formatted as follows: TBL_tablename_columnname.");
            }

            return fieldname.Substring(pos1 + 1, pos2 - pos1 - 1);
        }

        /// <summary>
        /// Title-cases a string, capitalizing the first letter of every word.
        /// </summary>
        /// <param name="value">The string to convert.</param>
        /// <returns>The string after title-casing.</returns>
        private string ToTitleCase(string value)
        {
            return ToTitleCaseHelper(value, string.Empty);
        }

        /// <summary>
        /// Title-cases a string, capitalizing the first letter of every word.
        /// </summary>
        /// <param name="value">The string to convert.</param>
        /// <param name="alreadyConverted">The part of the string already converted.  Seed with an empty string.</param>
        /// <returns>The string after title-casing.</returns>
        private string ToTitleCaseHelper(string value, string alreadyConverted)
        {
            /*
             * Tail-recursive title-casing implementation.
             * Edge case: toConvert is empty, null, or just white space.  If so, return alreadyConverted.
             * Else: Capitalize the first letter of the first word in toConvert, append that to alreadyConverted and recur.
             */
            if (string.IsNullOrEmpty(value))
            {
                return alreadyConverted;
            }

            int indexOfFirstSpace = value.IndexOf(' ');
            string firstWord, restOfString;

            // Check to see if we're on the last word or if there are more.
            if (indexOfFirstSpace != -1)
            {
                firstWord = value.Substring(0, indexOfFirstSpace);
                restOfString = value.Substring(indexOfFirstSpace).Trim();
            }
            else
            {
                firstWord = value.Substring(0);
                restOfString = string.Empty;
            }

            var sb = new StringBuilder();

            sb.Append(alreadyConverted);
            sb.Append(" ");
            sb.Append(firstWord.Substring(0, 1).ToUpper(CultureInfo.CurrentCulture));

            if (firstWord.Length > 1)
            {
                sb.Append(firstWord.Substring(1).ToLower(CultureInfo.CurrentCulture));
            }

            return ToTitleCaseHelper(restOfString, sb.ToString());
        }

        /// <summary>
        /// Since MS Word 2010 the SimpleField element is not longer used. It has been replaced by a combination of
        /// Run elements and a FieldCode element. This method will convert the new format to the old SimpleField-compliant 
        /// format.
        /// </summary>
        /// <param name="mainElement"></param>
        private void ConvertFieldCodes(OpenXmlElement mainElement)
        {
            // Search for all the Run elements 
            var runs = mainElement.Descendants<Run>().ToArray();
            if (runs.Length == 0)
            {
                return;
            }

            var newfields = new Dictionary<Run, Run[]>();

            int cursor = 0;
            do
            {
                var run = runs[cursor];

                if (run.HasChildren && run.Descendants<FieldChar>().Count() > 0
                    && (run.Descendants<FieldChar>().First().FieldCharType & FieldCharValues.Begin) == FieldCharValues.Begin)
                {
                    var innerRuns = new List<Run> { run };

                    // loop until we find the 'end' FieldChar
                    bool found = false;
                    string instruction = null;
                    RunProperties runprop = null;
                    do
                    {
                        cursor++;
                        run = runs[cursor];

                        innerRuns.Add(run);
                        if (run.HasChildren && run.Descendants<FieldCode>().Count() > 0)
                        {
                            instruction += run.GetFirstChild<FieldCode>().Text;
                        }

                        if (run.HasChildren && run.Descendants<FieldChar>().Count() > 0
                            && (run.Descendants<FieldChar>().First().FieldCharType & FieldCharValues.End) == FieldCharValues.End)
                        {
                            found = true;
                        }

                        if (run.HasChildren && run.Descendants<RunProperties>().Count() > 0)
                        {
                            runprop = run.GetFirstChild<RunProperties>();
                        }
                    } 
                    while (found == false && cursor < runs.Length);

                    // something went wrong : found Begin but no End. Throw exception
                    if (!found)
                    {
                        throw new Exception("Found a Begin FieldChar but no End !");
                    }

                    if (!string.IsNullOrEmpty(instruction))
                    {
                        // build new Run containing a SimpleField
                        var newrun = new Run();
                        if (runprop != null)
                        {
                            newrun.AppendChild(runprop.CloneNode(true));
                        }

                        var simplefield = new SimpleField { Instruction = instruction };
                        newrun.AppendChild(simplefield);

                        newfields.Add(newrun, innerRuns.ToArray());
                    }
                }

                cursor++;
            } 
            while (cursor < runs.Length);

            // replace all FieldCodes by old-style SimpleFields
            foreach (KeyValuePair<Run, Run[]> kvp in newfields)
            {
                kvp.Value[0].Parent.ReplaceChild(kvp.Key, kvp.Value[0]);
                for (int i = 1; i < kvp.Value.Length; i++)
                {
                    kvp.Value[i].Remove();
                }
            }
        }
    }
}
