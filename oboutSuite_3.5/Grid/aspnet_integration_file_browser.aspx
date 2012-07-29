<%@ Page Language="C#" AspCompat="TRUE" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="C#" runat="server">
    string initialDirectory = "resources/FileBrowser";
    string DefaultFolder;
    int expandedLevel = 0;

    void Page_Load(object sender, EventArgs e)
    {

        DefaultFolder = Server.MapPath(initialDirectory);

        ThrowExceptionsAtClient = true;
        ShowErrorsAtClient = true;

        LoadTreeView();

        // set default initial directory
        if (!IsPostBack)
            SelectDir(string.Empty);
    }

    private void LoadTreeView()
    {
        Node rootNode = new Node() { Text = "File Browser", Expanded = true };
        ObTree.Nodes.Add(rootNode);

        DirectoryInfo rootFolder = new DirectoryInfo(DefaultFolder);
        LoadDirRecursive(rootNode, rootFolder);
    }

    private void LoadDirRecursive(Node ParentNode, DirectoryInfo rootFolder)
    {
        expandedLevel++;

        foreach (DirectoryInfo dir in rootFolder.GetDirectories())
        {
            string dirName = dir.Name;
            string dirID = dirName;

            bool expanded = true;
            if (expandedLevel >= 15)
                expanded = false;

            Node child = new Node() { ClientID = dirID, Text = dirName, Expanded = expanded, ImageUrl = "../TreeView/icons/folder.gif" };
            ParentNode.ChildNodes.Add(child);

            LoadDirRecursive(child, new DirectoryInfo(rootFolder + "/" + dirName));
        }
    }

    // populate grid with directory content
    public void SelectDir(string dirID)
    {
        dirID = initialDirectory + "\\" + dirID;

        ViewState["dirID"] = dirID;

        LoadGrid();

        UpdatePanel("cpDir");
    }

    public void LoadGrid()
    {
        string dirID = ViewState["dirID"].ToString();

        DataSet dsDir = new DataSet();
        dsDir.Tables.Add(new DataTable());
        dsDir.Tables[0].Columns.Add(new DataColumn("name", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("size", System.Type.GetType("System.Int32")));
        dsDir.Tables[0].Columns.Add(new DataColumn("type", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("datemodified", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("imageType", System.Type.GetType("System.String")));

        if (dirID == "root_tree_0")
            dirID = initialDirectory;

        DirectoryInfo rootFolder = new DirectoryInfo(Server.MapPath(dirID.Replace("_", "/")));

        foreach (DirectoryInfo dir in rootFolder.GetDirectories())
        {
            string dirName = dir.Name;
            string dirDateTime = dir.LastAccessTime.ToString("d/M/yyyy h:m:s tt");
            string dirImageType = "Folder";
            dsDir.Tables[0].Rows.Add(new object[] { dirName, 0, "File Folder", dirDateTime, dirImageType });
        }

        foreach (FileInfo file in rootFolder.GetFiles())
        {
            string fileName = file.Name;
            string fileSize = file.Length.ToString();
            string fileType = file.Extension.Replace(".", "");
            string fileImageType = "File";
            string fileDateTime = file.LastAccessTime.ToString("d/M/yyyy h:m:s tt");

            dsDir.Tables[0].Rows.Add(new object[] { fileName, fileSize, fileType, fileDateTime, fileImageType });
        }

        gridDir.DataSource = dsDir;
        gridDir.DataBind();
    }
	
</script>
<html>
<head runat="server">
    <script language="JavaScript">
        function SelectDir(dirID) {
            ob_post.AddParam("dirID", dirID);
            ob_post.post(null, "SelectDir", function () { });
        }
					
    </script>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        
        a:hover
        {
            color: crimson;
        }
        
        .ob_spl_rightpanelcontent
        {
            position: relative;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
        function ob_OnNodeSelect(sender, args) {
            var value = args.node.id;
            var parent = sender.getParentNode(args.node);
            while (parent != null) {
                value = parent.id + '/' + value;
                parent = sender.getParentNode(parent);
            }
            SelectDir(value);
        }
    </script>
    <br />
    <span class="tdText"><b>ASP.NET Grid - File Browser</b></span>
    <br />
    <br />
    <table border="0">
        <tr>
            <td valign="top" class="h5">
                <div style="border: 1px solid gray; width: 680px; height: 370px;">
                    <div style="width: 680px; height: 370px;">
                        <spl2:Splitter ID="sp1" runat="server" StyleFolder="../Splitter/styles/default">
                            <LeftPanel WidthDefault="169" WidthMin="169" WidthMax="350">
                                <Header Height="30">
                                    <div style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px; background-color: #C0C0C0"
                                        class="tdText">
                                        <b style="font-size: 12px">Folders</b>
                                    </div>
                                </Header>
                                <Content>
                                    <div style="padding-top: 7px; padding-left: 10px; border-top: 1px solid gray">
                                        <obout:Tree ID="ObTree" runat="server" OnNodeSelect="ob_OnNodeSelect">
                                        </obout:Tree>
                                    </div>
                                </Content>
                            </LeftPanel>
                            <RightPanel>
                                <Content>
                                    <div style="padding-top: 0px; padding-left: 0px;">
                                        <oajax:CallbackPanel ID="cpDir" runat="server">
                                            <Content>
                                                <ogrid:Grid ID="gridDir" runat="server" AllowRecordSelection="true" ShowFooter="true"
                                                    AllowPaging="false" AllowPageSizeSelection="false" KeepSelectedRecords="false"
                                                    AllowAddingRecords="false" CallbackMode="true" Serialize="true" AllowColumnResizing="true"
                                                    ShowHeader="true" PageSize="100" FolderStyle="styles/premiere_blue" AutoGenerateColumns="false">
                                                    <Columns>
                                                        <ogrid:Column ID="Column1" DataField="imageType" HeaderText="" Align="center" Width="75"
                                                            runat="server">
                                                            <TemplateSettings TemplateId="tplImageType" />
                                                        </ogrid:Column>
                                                        <ogrid:Column ID="Column2" DataField="Name" HeaderText="Name" Width="120" runat="server" />
                                                        <ogrid:Column ID="Column3" DataField="Size" HeaderText="Size" Width="80" runat="server">
                                                            <TemplateSettings TemplateId="tplSize" />
                                                        </ogrid:Column>
                                                        <ogrid:Column ID="Column4" DataField="Type" HeaderText="Type" Width="83" runat="server" />
                                                        <ogrid:Column ID="Column5" DataField="DateModified" HeaderText="Date Modified" Width="167"
                                                            runat="server" />
                                                    </Columns>
                                                    <Templates>
                                                        <ogrid:GridTemplate runat="server" ID="tplImageType">
                                                            <Template>
                                                                <img src="resources/images/filebrowser/<%# Container.Value %>.gif" />
                                                            </Template>
                                                        </ogrid:GridTemplate>
                                                        <ogrid:GridTemplate runat="server" ID="tplSize">
                                                            <Template>
                                                                <div style="width: 100%; height: 100%; padding-left: 10px; padding-top: 6px">
                                                                    <%# Container.Value == "0" ? "" : Container.Value + " KB" %>
                                                                </div>
                                                            </Template>
                                                        </ogrid:GridTemplate>
                                                    </Templates>
                                                </ogrid:Grid>
                                            </Content>
                                            <Loading>
                                                <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center">
                                                            <img src="resources/loading_icons/1.gif">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Loading>
                                        </oajax:CallbackPanel>
                                        <oajax:CallbackPanel ID="cpLabel" runat="server">
                                            <Content>
                                                <asp:Label ID="lblDir" runat="server" />
                                            </Content>
                                        </oajax:CallbackPanel>
                                    </div>
                                </Content>
                            </RightPanel>
                        </spl2:Splitter>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
