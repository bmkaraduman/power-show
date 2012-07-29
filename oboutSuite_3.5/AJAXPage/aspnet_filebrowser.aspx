<%@ Page Language="C#" AspCompat="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<style type="text/css">
    .rootNode
    {
        cursor: pointer;
    }
</style>

<script language="C#" runat="server">
    string DefaultFolder;
    int expandedLevel = 0;

    void Page_Load(object sender, EventArgs e)
    {

        //DefaultFolder = "c:\\oboutSuite\\AJAXPage\\resources\\FileBrowser\\";
        DefaultFolder = Server.MapPath("resources/FileBrowser/");

        ThrowExceptionsAtClient = false;
        ShowErrorsAtClient = false;

        LoadTreeView();

        // set default initial directory
        if (!IsPostBack)
        {
            SelectDir(DefaultFolder);
        }
    }

    private void LoadTreeView()
    {
        Node rootNode = new Node() { Text = "File Browser",Expanded=true, CssClass = "rootNode", Value = DefaultFolder.Replace("\\", "|") };
        ObTree.Nodes.Add(rootNode);

        DirectoryInfo rootFolder = new DirectoryInfo(DefaultFolder);
        LoadDirRecursive(rootNode, rootFolder);
    }

    private void LoadDirRecursive(Node Parent, DirectoryInfo rootFolder)
    {
       expandedLevel++;

        foreach (DirectoryInfo dir in rootFolder.GetDirectories())
        {
            bool expanded = true;
            if (expandedLevel >= 15)
                expanded = false;
            Node child = new Node() {Expanded=expanded, ImageUrl = "../TreeView/icons/folder.gif", Text = dir.Name, Value = dir.FullName.Replace("\\", "|") };
            Parent.ChildNodes.Add(child);
            LoadDirRecursive(child, new DirectoryInfo(rootFolder + "/" + dir.Name));
        }
    }

    public void SelectDir(string dirID)
    {
        // replace back from | to \ char (path delimiter)
        dirID = dirID.Replace("|", "\\\\");

        DataSet dsDir = new DataSet();
        dsDir.Tables.Add(new DataTable());
        dsDir.Tables[0].Columns.Add(new DataColumn("name", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("size", System.Type.GetType("System.Int32")));
        dsDir.Tables[0].Columns.Add(new DataColumn("type", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("datemodified", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("imageType", System.Type.GetType("System.String")));

        DirectoryInfo rootFolder = new DirectoryInfo(dirID);

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

    public bool cpDir_OnBeforePanelUpdate(string panelId, string containerId)
    {
        if (this.UpdatePanelParams["dirID"] != null)
            SelectDir(this.UpdatePanelParams["dirID"].ToString());
        else
            SelectDir(DefaultFolder);

        return true;
    }
	
</script>

<html>
<head runat="server">
    <title>obout ASP.NET Splitter Examples</title>
</head>
<body>
    <form runat="server">
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <script type="text/javascript">
    function clientNodeSelect(sender,args){
        var dirId=sender.getNodeValue(args.node);
        if(dirId==null ||dirId=="" )
            return;
        
        ob_post.AddParam("dirID", dirId);	

        ob_post.UpdatePanel("cpDir");
    }
    </script>
    <h1>
        File Browser example</h1>
    <a style="font-size: 8pt; font-family: Tahoma" href="Default.aspx?type=ASPNET">« Back
        to examples</a>
    <br />
    <br />
    <br>
    <table border="0">
        <tr>
            <td valign="top" class="h5" width="630">
                You can browse a folder on your disk, <span style="color: crimson;">without reloading
                    the page</span>.
                <br />
            </td>
        </tr>
        <tr>
            <td valign="top" class="h5">
                <div style="border: 1px solid gray; width: 680px; height: 370px;">
                    <div style="width: 680px; height: 370px;">
                        <obspl:Splitter ID="sp1" runat="server" StyleFolder="../Splitter/styles/default"
                            CookieDays="0">
                            <LeftPanel WidthDefault="167" WidthMin="167" WidthMax="350">
                                <Header Height="30">
                                    <div style="padding-left: 10px; padding-top: 5px; padding-bottom: 5px; background-color: #C0C0C0"
                                        class="tdText">
                                        <b style="font-size: 10px">Folders</b>
                                    </div>
                                </Header>
                                <Content>
                                    <div style="padding-top: 7px; padding-left: 10px; border-top: 1px solid gray">
                                        <obout:Tree ID="ObTree" runat="server" OnNodeSelect="clientNodeSelect">
                                        </obout:Tree>
                                    </div>
                                </Content>
                            </LeftPanel>
                            <RightPanel>
                                <Content>
                                    <div style="padding-top: 0px; padding-left: 0px;">
                                        <oajax:CallbackPanel ID="cpDir" runat="server" OnBeforePanelUpdate="cpDir_OnBeforePanelUpdate">
                                            <Content>
                                                <ogrid:Grid ID="gridDir" runat="server" AllowRecordSelection="true" ShowFooter="false"
                                                    KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="true"
                                                    AllowColumnResizing="true" ShowHeader="true" Width="100%" PageSize="100" FolderStyle="../grid/styles/style_5"
                                                    AutoGenerateColumns="false">
                                                    <Columns>
                                                        <ogrid:Column DataField="imageType" HeaderText="" Width="53" runat="server">
                                                            <TemplateSettings TemplateId="tplImageType" />
                                                        </ogrid:Column>
                                                        <ogrid:Column DataField="Name" HeaderText="Name" Width="120" runat="server" />
                                                        <ogrid:Column DataField="Size" HeaderText="Size" Width="80" runat="server">
                                                            <TemplateSettings TemplateId="tplSize" />
                                                        </ogrid:Column>
                                                        <ogrid:Column DataField="Type" HeaderText="Type" Width="83" runat="server" />
                                                        <ogrid:Column DataField="DateModified" HeaderText="Date Modified" Width="167" runat="server" />
                                                    </Columns>
                                                    <Templates>
                                                        <ogrid:GridTemplate runat="server" ID="tplImageType">
                                                            <Template>
                                                                <div style="width: 100%; height: 100%; text-align: right; padding-top: 4px">
                                                                    <img src="images/filebrowser/<%# Container.Value %>.gif" />
                                                                </div>
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
                                                            <img src="loading_icons/1.gif">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </Loading>
                                        </oajax:CallbackPanel>
                                    </div>
                                </Content>
                            </RightPanel>
                        </obspl:Splitter>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <br />
    </form>
</body>
</html>

<script type="text/javascript">
function onClientNodeSelect(sendr,args){

}
function ob_OnNodeSelect(id)
{   
	if (ob_t2_Data[id] != null)
		ob_post.AddParam("dirID", ob_t2_Data[id].DirectoryPath);
	
	ob_post.UpdatePanel("cpDir");
}
</script>

<br>
