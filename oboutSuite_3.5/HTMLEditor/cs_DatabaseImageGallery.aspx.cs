using System;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Obout.Ajax.UI.HTMLEditor;
using Obout.Ajax.UI.HTMLEditor.Popups;
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using Obout.Ajax.UI.HTMLEditor.ContextMenu;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.OleDb;
using System.Text.RegularExpressions;

public partial class HTMLEditor_cs_DatabaseImageGallery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Find 'Insert image' button in the top toolbar and change the associated popup
        Collection<CommonButton> buttons = editor.TopToolbar.GetButtonsByType(typeof(InsertImage));
        if (buttons.Count > 0)
        {
            InsertImage button = buttons[0] as InsertImage;
            button.RelatedPopupType = typeof(ImagePropertiesWithDatabaseBrowse).AssemblyQualifiedName;
        }

        // Find 'Edit image' item in the context menu and change the associated popup
        buttons = editor.EditPanel.ContextMenu.GetButtonsByType(typeof(EditImageItem));
        if (buttons.Count > 0)
        {
            EditImageItem item = buttons[0] as EditImageItem;
            item.RelatedPopupType = typeof(ImagePropertiesWithDatabaseBrowse).AssemblyQualifiedName;
        }

        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
    }

    // override OnInit to draw the Image
    protected override void OnInit(EventArgs e)
    {
        string imageID = Context.Request.QueryString[MyImageBrowser.ViewParameterName];
        if (!String.IsNullOrEmpty(imageID)) // it is the 'file system' gallery image 
        {
            Page.Response.ContentType = "image/gif";
            Page.Response.BinaryWrite((new MyImageBrowser()).GetImageBytes(int.Parse(imageID)));
            Page.Response.End();
        }
        else
        {
            base.OnInit(e);
        }
    }
}

#region [ Customized 'Image properties' popup class ]

// Declare the customized 'Image properties' popup class
public class ImagePropertiesWithDatabaseBrowse : Obout.Ajax.UI.HTMLEditor.Popups.ImageProperties
{
    #region [ Fields ]

    private BrowseButton _Button = null;

    #endregion

    #region [ Properties ]

    // redefine the 'Browse' button of the popup
    protected override BrowseButton Browse
    {
        get
        {
            if (_Button == null)
            {
                _Button = new MyImageBrowseButton(this);
                _Button.Style[HtmlTextWriterStyle.Width] = "70px";
            }
            return _Button;
        }
    }

    #endregion
}

#endregion

#region [ Custom 'BrowseButton' class ]

public class MyImageBrowseButton : BrowseButton
{
        #region [ Fields ]

        private Popup _relatedPopup = null;

        #endregion

        #region [ Constructors ]

        /// <summary>
        /// Initializes a new button
        /// </summary>
        public MyImageBrowseButton(Popup ownerPopup)
            : base(ownerPopup)
        {
        }

        #endregion

        #region [ Properties ]

        public sealed override Popup RelatedPopup
        {
            get
            {
                if (_relatedPopup == null)
                {
                    _relatedPopup = new MyImageBrowser();
                }
                return _relatedPopup;
            }
        }

        #endregion
}

#endregion

#region [ Custom 'ImageBrowser' class ]

public class MyImageBrowser : ImageBrowser
{
    // Virtual path of the database
    protected virtual string DbPath
    {
        get { return "~/App_Data/FilesRepository.mdb"; }
    }

    // [19.10.2010 7:43:02] ilyabutorine: connect timeout=3600;server=OBOUTDB\OBOUTDB;database=obout_site;uid=oboutPublic;pwd=kl3$08
    // [19.10.2010 7:43:26] ilyabutorine: table names:  Editor_tbFolder, Editor_tbImage
    // Connection string
    protected virtual string ConnectionString
    {
        get { return "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath(ResolveUrl(DbPath)) + ";"; }
    }

    // Path to the image viewer
    protected virtual string ViewerPath
    {
        get { return System.Web.HttpContext.Current.Request.Path; }
    }

    // Name of 'id' parameter for the Viewer
    static public string ViewParameterName
    {
        get { return "databaseimageid";  }
    }

    // Name of database 'protocol'
    protected virtual string DatabaseProtocol
    {
        get { return "database:"; }
    }

    // override the property: get the structure of the tree for the Browser popup
    protected override System.Xml.XmlTextReader[] XmlTextReaderObject
    {
        get
        {
            string xmlData = "<root>\n";

            OleDbConnection connection = new OleDbConnection();
            try
            {
                connection.ConnectionString = ConnectionString;
                connection.Open();
                xmlData += DbFolderDive(connection, 0, DatabaseProtocol + "/", "DataBase Image Gallery", true);
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }

            xmlData += "</root>";

            // we use the base 'file system' image gallery also here
            return new System.Xml.XmlTextReader[] { base.XmlTextReaderObject[0], new System.Xml.XmlTextReader(new StringReader(xmlData)) };
        }
    }

    // Parse the database's virtual folder
    protected virtual string DbFolderDive(OleDbConnection connection, int id, string folderUrl, string folderName, bool expanded)
    {
        // section leaf
        string result = "<section text=\"" + folderName + "\" expanded=\"" + expanded.ToString().ToLower() + "\"";
        result += " url=\"" + folderUrl + "\"";
        result += " >\n";
        string temp = "";

        // inspect for child folders
        string sqlString = "Select * from tbFolder Where fldFolderId="+id.ToString();
        OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
        DataTable eTable = new DataTable();

        eAdapter.Fill(eTable);
        for (int i = 0; i < eTable.Rows.Count; i++)
        {
            DataRow row = eTable.Rows[i];
            string childFolderName = (string)row["fldName"];
            int childFolderID = (int)row["id"];
            temp += DbFolderDive(connection, childFolderID, folderUrl + childFolderName + "/", childFolderName, false);
        }
        eAdapter.Dispose();
        eTable.Dispose();

        // inspect for child images
        sqlString = "Select * from tbImage Where fldFolderId=" + id.ToString();
        eAdapter = new OleDbDataAdapter(sqlString, connection);
        eTable = new DataTable();

        eAdapter.Fill(eTable);
        for (int i = 0; i < eTable.Rows.Count; i++)
        {
            DataRow row = eTable.Rows[i];
            string name = (string)row["fldName"];
            string description = (string)row["fldDescription"];
            byte[] content = (byte[])row["fldContent"];
            int imageID = (int)row["id"];

            // get the width and height of the image
            string width = "";
            string height = "";
            MemoryStream objStream = new MemoryStream(content);
            objStream.Position = 0;
            try
            {
                System.Drawing.Image objImage = System.Drawing.Image.FromStream(objStream);
                width = objImage.Width.ToString();
                height = objImage.Height.ToString();
                objImage.Dispose();
            }
            catch { }
            objStream.Close();

            // item node
            temp += "<item text=\"" + name + "\" virtualpath=\"" + folderUrl + name + "\" title=\"" + description + "\" url=\"" + (ViewerPath + "?" + ViewParameterName + "=" + imageID) + "\"";
            temp += " height=\"" + height + "\" width=\"" + width + "\"";
            temp += " />\n";
        }
        eAdapter.Dispose();
        eTable.Dispose();

        if (temp.Length == 0)
        {
            temp += "<item text=\"\" title=\"\" height=\"\" width=\"\" url=\"\" />\n";
        }
        result += temp;
        result += "</section>\n";
        return result;
    }

    // OleDbCommand for SELECT @@IDENTITY statement
    private OleDbCommand cmdGetIdentity;

    // override the 'Create new folder' method
    protected override void ExecAddFolderCommand(string sourceUrl, string name)
    {
        Regex regex = new Regex("^" + DatabaseProtocol, RegexOptions.Compiled);
        if (!regex.IsMatch(sourceUrl)) // it is the 'file system' gallery command 
        {
            // call the base method
            base.ExecAddFolderCommand(sourceUrl, name);
            return;
        }
        string url = regex.Replace(sourceUrl, "");

        string temp = url;
        if (temp.Substring(temp.Length - 1, 1) == "/") temp = temp.Substring(0, temp.Length - 1);
        if (temp.Substring(0, 1) == "/") temp = temp.Substring(1, temp.Length - 1);
        string[] folders = temp.Split(new char[] { '/' });
        int parentId = 0;

        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = ConnectionString;
            connection.Open();
            for (int i = 0; i < folders.Length; i++)
            {
                string folderName = folders[i];
                // inspect for child folders
                string sqlString = "Select * from tbFolder Where fldFolderId=" + parentId.ToString();
                OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);

                DataTable eTable = new DataTable();

                eAdapter.Fill(eTable);
                bool found = false;
                // search for the folder
                for (int j = 0; j < eTable.Rows.Count; j++)
                {
                    DataRow row = eTable.Rows[j];
                    string childFolderName = (string)row["fldName"];
                    if (childFolderName == folderName)
                    {
                        parentId = (int)row["id"];
                        found = true;
                        break;
                    }
                }

                // not found - create it
                if (!found)
                {
                    OleDbCommand cmdInsert = new OleDbCommand("INSERT INTO tbFolder (fldName, fldFolderId) VALUES(?, ?)", connection);

                    cmdInsert.Parameters.Add(new OleDbParameter("fldName", OleDbType.VarChar, 100, "fldName"));
                    cmdInsert.Parameters.Add(new OleDbParameter("fldFolderId", OleDbType.Integer, 0, "fldFolderId"));
                    eAdapter.InsertCommand = cmdInsert;

                    // Create a command to get IDENTITY Value
                    cmdGetIdentity = new OleDbCommand("SELECT @@IDENTITY", connection);

                    eAdapter.RowUpdated += new OleDbRowUpdatedEventHandler(HandleRowUpdated);

                    DataRow newRow = eTable.NewRow();
                    newRow["fldName"] = folderName;
                    newRow["fldFolderId"] = parentId;
                    eTable.Rows.Add(newRow);
                    eAdapter.Update(eTable);

                    parentId = (int)newRow["id"];

                    // Release the Resources
                    cmdGetIdentity = null;
                    cmdInsert = null;
                }

                eAdapter.Dispose();
                eTable.Dispose();
            }
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
    }

    // Event Handler for RowUpdated Event
    private void HandleRowUpdated(object sender, OleDbRowUpdatedEventArgs e)
    {
        if (e.Status == UpdateStatus.Continue && e.StatementType == StatementType.Insert)
        {
            // Get the Identity column value
            e.Row["id"] = Int32.Parse(cmdGetIdentity.ExecuteScalar().ToString());
            e.Row.AcceptChanges();
        }
    }

    // override the 'Delete file/folder' method
    protected override void ExecDeleteCommand(string sourceUrl, string name)
    {
        Regex regex1 = new Regex("^"+DatabaseProtocol, RegexOptions.Compiled);
        Regex regex2 = new Regex(ViewParameterName + "=", RegexOptions.Compiled);
        if (!regex1.IsMatch(sourceUrl) && !regex2.IsMatch(sourceUrl)) // it is the 'file system' gallery command 
        {
            // call the base method
            base.ExecDeleteCommand(sourceUrl, name);
            return;
        }
        string url = sourceUrl;
        if (regex1.IsMatch(sourceUrl))
        {
            url = regex1.Replace(sourceUrl, "");
        }

        bool isFolder =  !regex2.IsMatch(url);

        if (isFolder) // folder deleting
        {
            OleDbConnection connection = new OleDbConnection();
            try
            {
                connection.ConnectionString = ConnectionString;
                connection.Open();
                int folderId = findFolderId(connection, url);
                if (folderId > 0)
                {
                    OleDbCommand myComm = new OleDbCommand("DELETE FROM tbFolder WHERE id = @FolderID", connection);
                    myComm.Parameters.Add("@FolderID", OleDbType.Integer).Value = folderId;
                    myComm.ExecuteNonQuery();
                }
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        else // image deleting
        {
            Regex regex = new Regex(@"(.+\?"+ViewParameterName + @"=)(\d+)", RegexOptions.Compiled);
            string idStr = regex.Replace(url, "$2");

            OleDbConnection connection = new OleDbConnection();
            try
            {
                connection.ConnectionString = ConnectionString;
                connection.Open();
                OleDbCommand myComm = new OleDbCommand("DELETE FROM tbImage Where id=" + idStr, connection);
                myComm.ExecuteNonQuery();
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
    }

    // override the 'Save uploaded file' method
    protected override string SaveUploadedFile(string folder, string name, string title, Stream stream)
    {
        Regex regex = new Regex("^" + DatabaseProtocol, RegexOptions.Compiled);
        if (!regex.IsMatch(folder)) // it is the 'file system' gallery command 
        {
            // call the base method
            return base.SaveUploadedFile(folder, name, title, stream);
        }
        string url = regex.Replace(folder, "");

        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = ConnectionString;
            connection.Open();
            int folderId = findFolderId(connection, url);
            if (folderId >= 0)
            {
                string sqlString = "Select * from tbImage Where fldFolderId=" + folderId.ToString() + " AND fldName=\""+name+"\"";
                OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
                DataTable eTable = new DataTable();
                eAdapter.Fill(eTable);

                // Delete the duplicate if it is present
                if (eTable.Rows.Count > 0)
                {
                    OleDbCommand myComm = new OleDbCommand("DELETE FROM tbImage Where fldFolderId=" + folderId.ToString() + " AND fldName=\"" + name + "\"", connection);
                    myComm.ExecuteNonQuery();
                }

                eAdapter.Dispose();
                eTable.Dispose();

                sqlString = "Select * from tbImage Where fldFolderId=" + folderId.ToString();
                eAdapter = new OleDbDataAdapter(sqlString, connection);
                eTable = new DataTable();
                eAdapter.Fill(eTable);

                OleDbCommand cmdInsert = new OleDbCommand("INSERT INTO tbImage (fldName, fldFolderId, fldDescription, fldContent) VALUES(?, ?, ?, ?)", connection);
                cmdInsert.Parameters.Add(new OleDbParameter("fldName", OleDbType.VarChar, 50, "fldName"));
                cmdInsert.Parameters.Add(new OleDbParameter("fldFolderId", OleDbType.Integer, 0, "fldFolderId"));
                cmdInsert.Parameters.Add(new OleDbParameter("fldDescription", OleDbType.VarChar, 100, "fldDescription"));
                cmdInsert.Parameters.Add(new OleDbParameter("fldContent", OleDbType.Binary, 0, "fldContent"));
                eAdapter.InsertCommand = cmdInsert;

                DataRow newRow = eTable.NewRow();
                newRow["fldName"] = name;
                newRow["fldFolderId"] = folderId;
                newRow["fldDescription"] = title;
                byte[] content = new byte[stream.Length];
                stream.Read(content, 0, (int)stream.Length);
                newRow["fldContent"] = content;

                eTable.Rows.Add(newRow);
                eAdapter.Update(eTable);

                // Release the Resources
                cmdInsert = null;
                eAdapter.Dispose();
                eTable.Dispose();
            }
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
        return name;
    }

    public byte[] GetImageBytes(int id)
    {
        byte[] content = null;
        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = ConnectionString;
            connection.Open();
            string sqlString = "Select * from tbImage Where id=" + id.ToString();
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
            DataTable eTable = new DataTable();
            eAdapter.Fill(eTable);

            if (eTable.Rows.Count > 0)
            {
                content = (byte[])eTable.Rows[0]["fldContent"];
            }

            eAdapter.Dispose();
            eTable.Dispose();
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
        return content;
    }

    // override the function that gets Image's binary content
    public override byte[] GetImageBytes(string url)
    {
        Regex regex = new Regex(ViewParameterName + "=", RegexOptions.Compiled);
        if (!regex.IsMatch(url)) // it is the 'file system' gallery image 
        {
            return base.GetImageBytes(url);
        }

        regex = new Regex(@"(.+\?" + ViewParameterName + @"=)(\d+)", RegexOptions.Compiled);
        string idStr = regex.Replace(url, "$2");
        return GetImageBytes(int.Parse(idStr));
    }

    // override the function that gets the type of Image
    public override string GetImageType(string url)
    {
        Regex regex = new Regex(ViewParameterName + "=", RegexOptions.Compiled);
        if (!regex.IsMatch(url)) // it is the 'file system' gallery image 
        {
            return base.GetImageType(url);
        }
        regex = new Regex(@"(.+\?" + ViewParameterName + @"=)(\d+)", RegexOptions.Compiled);
        string idStr = regex.Replace(url, "$2");
        string extension = "";

        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = ConnectionString;
            connection.Open();
            string sqlString = "Select * from tbImage Where id=" + idStr;
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
            DataTable eTable = new DataTable();
            eAdapter.Fill(eTable);

            if (eTable.Rows.Count > 0)
            {
                extension = Path.GetExtension((string)eTable.Rows[0]["fldName"]).ToLower().Replace(".", "");
            }

            eAdapter.Dispose();
            eTable.Dispose();
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
        return extension;
    }

    // override the function that gets the Image's description
    public override string GetImageDescription(string url)
    {
        Regex regex = new Regex(ViewParameterName + "=", RegexOptions.Compiled);
        if (!regex.IsMatch(url)) // it is the 'file system' gallery image 
        {
            return base.GetImageDescription(url);
        }
        regex = new Regex(@"(.+\?" + ViewParameterName + @"=)(\d+)", RegexOptions.Compiled);
        string idStr = regex.Replace(url, "$2");
        string description = "";

        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = ConnectionString;
            connection.Open();
            string sqlString = "Select * from tbImage Where id=" + idStr;
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
            DataTable eTable = new DataTable();
            eAdapter.Fill(eTable);

            if (eTable.Rows.Count > 0)
            {
                description = (string)eTable.Rows[0]["fldDescription"];
            }

            eAdapter.Dispose();
            eTable.Dispose();
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
        return description;
    }

    // find the ID of the folder by its url
    private int findFolderId(OleDbConnection connection, string url)
    {
        string temp = url;
        if (temp.Length > 0)
        {
            if (temp.Substring(temp.Length - 1, 1) == "/") temp = temp.Substring(0, temp.Length - 1);
        }
        if (temp.Length > 0)
        {
            if (temp.Substring(0, 1) == "/") temp = temp.Substring(1, temp.Length - 1);
        }
        string[] folders = temp.Split(new char[] { '/' });
        int folderId = 0;

        for (int i = 0; i < folders.Length; i++)
        {
            string folderName = folders[i];
            if (folderName.Length == 0)
            {
                continue;
            }
            // inspect for child folders
            string sqlString = "Select * from tbFolder Where fldFolderId=" + folderId.ToString();
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);

            DataTable eTable = new DataTable();

            eAdapter.Fill(eTable);
            bool found = false;
            // search for the folder
            for (int j = 0; j < eTable.Rows.Count; j++)
            {
                DataRow row = eTable.Rows[j];
                string childFolderName = (string)row["fldName"];
                if (childFolderName == folderName)
                {
                    folderId = (int)row["id"];
                    found = true;
                    break;
                }
            }

            if (!found)
            {
                folderId = -1;
                break;
            }

            eAdapter.Dispose();
            eTable.Dispose();
        }

        return folderId;
    }
}

#endregion
