<%@ Page Language="C#" ASPCOMPAT="TRUE" Inherits="OboutInc.oboutAJAXPage"%>

<%@ Import Namespace="obout_ASPTreeView_2_NET" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<script language="C#" runat="server">
    string initialDirectory = "resources/FileBrowser";
	string DefaultFolder;
	int expandedLevel = 0;
    void Page_Load(object sender, EventArgs e) {
        DefaultFolder = Server.MapPath(initialDirectory);
		
		ThrowExceptionsAtClient = false;
		ShowErrorsAtClient = false;
		
		LoadTreeView();

        // set default initial directory
        if (!IsPostBack)
            SelectDir(initialDirectory);
    }
	
	private void LoadTreeView() {
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		oTree.id = "tree_0";
		string ParentID = "root";
	
		oTree.AddRootNode("<span style='cursor:pointer'>File Browser</span>", "Folder.gif");

		DirectoryInfo rootFolder = new DirectoryInfo(DefaultFolder); 
		LoadDirRecursive(ParentID, rootFolder, oTree);

		oTree.Width = "150px";
		oTree.DragAndDropEnable = false;
		oTree.KeyNavigationEnable = true;
		oTree.SelectedEnable = true;
		//oTree.SelectedId = "root_tree_0";
		oTree.EventList = "OnNodeSelect";

        oTree.FolderIcons = "../TreeView/tree2/icons";
        oTree.FolderScript = "../TreeView/tree2/script";
        oTree.FolderStyle = "../TreeView/tree2/style/Explorer";
		
		TreeView.Text = oTree.HTML();            
	}
	
	private void LoadDirRecursive(string ParentID, DirectoryInfo rootFolder, obout_ASPTreeView_2_NET.Tree oTree) {
		string nodeId;
		expandedLevel++;
		
		foreach (DirectoryInfo dir in rootFolder.GetDirectories()) {
			string dirName = dir.Name;
			string dirID = dirName;
			
			bool expanded = true;
			if (expandedLevel >= 15)
				expanded = false;
				
			nodeId = ParentID == "root" ? "resources_FileBrowser_" : ParentID + "_";
			nodeId += dirID;
			
			string textDirName = "<span style='cursor:pointer'>" + dirName + "</span>";
			//oTree.Add(ParentID, nodeId , textDirName, expanded, "folder.gif" + "\" onclick=\"ob_t23(document.getElementById('" + nodeId + "'))", null);
			oTree.Add(ParentID, nodeId , textDirName, expanded, "folder.gif", null);
			
			LoadDirRecursive(nodeId, new DirectoryInfo(rootFolder + "/" + dirName), oTree);
		}
	}
	
	// populate grid with directory content
	public void SelectDir(string dirID) {
		ViewState["dirID"] = dirID;

        LoadGrid();

        UpdatePanel("cpDir");
	}
	
	public void LoadGrid() {
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
		
		foreach (DirectoryInfo dir in rootFolder.GetDirectories()) {
			string dirName = dir.Name;
			string dirDateTime = dir.LastAccessTime.ToString("d/M/yyyy h:m:s tt");
			string dirImageType = "Folder";
			dsDir.Tables[0].Rows.Add(new object[] {dirName, 0, "File Folder", dirDateTime, dirImageType});
		}
		
		foreach (FileInfo file in rootFolder.GetFiles()) {
			string fileName = file.Name;
			string fileSize = file.Length.ToString();
			string fileType = file.Extension.Replace(".", "");
			string fileImageType = "File";
			string fileDateTime = file.LastAccessTime.ToString("d/M/yyyy h:m:s tt");
			
			dsDir.Tables[0].Rows.Add(new object[] {fileName, fileSize, fileType, fileDateTime, fileImageType});
		}
		
		gridDir.DataSource = dsDir;
		gridDir.DataBind();
	}
	
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head runat="server">
		<script language="JavaScript">		
			function SelectDir(dirID)
			{
				ob_post.AddParam("dirID", dirID);
				ob_post.post(null, "SelectDir", EndSelectDir);
			}
			
			function EndSelectDir(result, ex)
			{
				ob_post.UpdatePanel("cpDir");
			}		
		</script>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
			.ob_spl_rightpanelcontent
			{
			    position: relative;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		<table border="0">
			<tr>
				<td valign="top" class="h5">	            			            
					<div style="border:1px solid gray;width:680px;height:370px;">
						<div style="width:680px;height:370px;">
							<spl2:Splitter id="sp1" runat="server" StyleFolder="../Splitter/styles/default">
								<LeftPanel WidthDefault="169" WidthMin="169" WidthMax="350">
									<Header height="30">
										<div style="padding-left:10px;padding-top:5px;padding-bottom:5px;background-color:#C0C0C0" class="tdText">
											<b style="font-size:12px">Folders</b>
										</div>
									</Header>
									<Content>
										<div style="padding-top:7px;padding-left:10px;border-top:1px solid gray">
											<asp:Label id="TreeView" runat="server">Label</asp:Label>
										</div>
									</Content>
								</LeftPanel>
								<RightPanel>
									<Content>
										<div style="padding-top:0px;padding-left:0px;">
											<oajax:CallbackPanel id="cpDir" runat="server">
												<content>
													<ogrid:Grid id="gridDir" runat="server" AllowRecordSelection="true" ShowFooter="true"
													    AllowPaging="false" AllowPageSizeSelection="false"
														KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="true" 
														AllowColumnResizing="true" ShowHeader="true" 
														PageSize="100" FolderStyle="styles/premiere_blue" AutoGenerateColumns="false">
														<Columns>
															<ogrid:Column ID="Column1" DataField="imageType" HeaderText="" Align="center" Width="75" runat="server">
															    <TemplateSettings TemplateID="tplImageType" />
															</ogrid:Column>
															<ogrid:Column ID="Column2" DataField="Name" HeaderText="Name" Width="120" runat="server" />
															<ogrid:Column ID="Column3" DataField="Size" HeaderText="Size" Width="80" runat="server">
															    <TemplateSettings TemplateID="tplSize"/>
															</ogrid:Column>
															<ogrid:Column ID="Column4" DataField="Type" HeaderText="Type" Width="83" runat="server" />
															<ogrid:Column ID="Column5" DataField="DateModified" HeaderText="Date Modified" Width="167" runat="server" />
														</Columns>	
														<Templates>
															<ogrid:GridTemplate runat="server" ID="tplImageType">
																<Template>
																    <img src="resources/images/filebrowser/<%# Container.Value %>.gif" />
																</Template>
															</ogrid:GridTemplate>
															<ogrid:GridTemplate runat="server" ID="tplSize">
																<Template>
																	<div style="width:100%;height:100%;padding-left:10px;padding-top:6px">
																		<%# Container.Value == "0" ? "" : Container.Value + " KB" %>
																	</div>
																</Template>
															</ogrid:GridTemplate>
														</Templates>
													</ogrid:Grid>	
												</content>
												<loading>
													<table width=100% height=100% cellpadding=0 cellspacing=0>
														<tr>
															<td align=center>
																<img src="resources/loading_icons/1.gif">
															</td>
														</tr>
													</table>
												</loading>
											</oajax:CallbackPanel>
											<oajax:CallbackPanel id="cpLabel" runat="server">
												<content>
													<asp:Label id="lblDir" runat="server" />
												</content>
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
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>

<script language="JavaScript">
// add load event
function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      if (oldonload) {
        oldonload();
      }
      func();
    }
  }
}
// first time loading - default category selected - first email is listed in the details area
addLoadEvent(function() {
	document.getElementById('root_tree_0').onclick();
});
function ob_OnNodeSelect(id) {   
	SelectDir(id);
}
</script>