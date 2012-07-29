<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Inherits="OboutInc.oboutAJAXPage" Title="ASPNET ImageZoom example" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.TreeView" TagPrefix="obout" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>


<script language="C#" runat="server">
    Tree obClassicTree = null;
    string initialDirectory = "resources/ImageGallery";
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
            SelectDir(initialDirectory);
    }

    private void LoadTreeView()
    {
        string ParentID = initialDirectory.Replace("/", "_"); ;

        DirectoryInfo rootFolder = new DirectoryInfo(DefaultFolder);

        obClassicTree = new Tree()
        {
            ID = "ObClassicTree",
            OnNodeSelect = "clientOnNodeSelect",
            CssClass = "default",
            Width = 150
        };

        Node nodeLib = new Node()
        {
            Text = "<span style='cursor:pointer'>File Browser</span>",
            Expanded = true,
            ClientID = ParentID,
            ImageUrl = "~/TreeView/img/library.png"
        };
        this.obClassicTree.Nodes.Add(nodeLib);
        LoadDirRecursive(rootFolder, nodeLib);
        this.TreePlaceHolder.Controls.Add(obClassicTree);
    }

    private void LoadDirRecursive(DirectoryInfo rootFolder, Node oNode)
    {
        string nodeId;
        expandedLevel++;

        foreach (DirectoryInfo dir in rootFolder.GetDirectories())
        {
            string dirName = dir.Name;
            string dirID = dirName;

            bool expanded = true;
            if (expandedLevel >= 15)
                expanded = false;

            nodeId = oNode.ClientID + "_" + dirID;

            string textDirName = "<span style='cursor:pointer'>" + dirName + "</span>";
            if (dirName != "IZ_cache")
            {
                Node newNode = new Node()
                {
                    Text = textDirName,
                    Expanded = expanded,
                    ClientID = nodeId,
                    ImageUrl = "~/TreeView/img/folder.png"
                };
                oNode.ChildNodes.Add(newNode);
                LoadDirRecursive(new DirectoryInfo(rootFolder + "/" + dirName), newNode);
            }
        }
    }

    // populate ImageGallery with directory content
    public void SelectDir(string dirID)
    {
        cpDir.Content.Controls.Clear();
        ImageZoom ImageZoom1 = new ImageZoom()
        {
            ID = "ImageZoom1_" + dirID.Replace("/","_"),
            zIndex=0,
            StyleFolder="styles/simple",
            ShowLoading=false,
            Effect = OboutInc.ImageZoom.Enums.ImageZoomEffects.Fading,
            Position = OboutInc.ImageZoom.Enums.ImageZoomPositions.SCREEN_CENTER,
            BackgroundOpacity=2,
            RenderingMode = OboutInc.ImageZoom.Enums.RenderingModes.HttpHandler,
            Width= new Unit("100%"), Height=new Unit("100%"),
            ShowFooter=false,
            PageSize=100, NumberOfFrames=10,
            DataUrlField="name", DataDescriptionField="description"
        };
        cpDir.Content.Controls.Add(ImageZoom1);
        
        ViewState["dirID"] = dirID;

        LoadGallery(ImageZoom1);

        UpdatePanel("cpDir");
    }

    public void LoadGallery(ImageZoom ImageZoom1)
    {
        string dirId = ViewState["dirID"].ToString();

        DataSet dsDir = new DataSet();
        dsDir.Tables.Clear();
        dsDir.Tables.Add(new DataTable());
        dsDir.Tables[0].Columns.Add(new DataColumn("name", System.Type.GetType("System.String")));
        dsDir.Tables[0].Columns.Add(new DataColumn("description", System.Type.GetType("System.String")));

        DirectoryInfo rootFolder = new DirectoryInfo(Server.MapPath(dirId.Replace("_", "/")));

        foreach (FileInfo file in rootFolder.GetFiles())
        {
            StringBuilder sbDescription = new StringBuilder();

            string url = dirId.Replace("_", "/");

            string fileName = url + "/" + file.Name;

            sbDescription.Append("File name: " + file.Name);
            sbDescription.AppendLine("<br/>");
            sbDescription.Append("Size: "+ file.Length.ToString()+" Bytes");
            string fileType = file.Extension.Replace(".", "");
            
            
            if (fileType.ToLower() == "jpeg" || fileType.ToLower() == "jpg" || fileType.ToLower() == "gif" || fileType.ToLower() == "png")
            {
                dsDir.Tables[0].Rows.Add(new object[] { fileName, sbDescription.ToString() });
            }
        }

        ImageZoom1.DataSource = dsDir;
        ImageZoom1.DataBind();
    }
	
</script>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

		<script language="JavaScript" type="text/javascript">		
			function SelectDir(dirID)
			{
				ob_post.AddParam("dirID", dirID);
				ob_post.post(null, "SelectDir", function(){});
			}
			function clientOnNodeSelect(sender, args) {
			    SelectDir(args.node.id);
			}
					
		</script>
		<style type="text/css">
			
			.ob_spl_rightpanelcontent
			{
			    position: relative;
			}
			.simple_oizg .ImageZoomEntryContainer
			{
				border:0 !important;
				text-align:left !important;
				padding-left:3px !important;
			}


		</style>

		<span class="tdText"><b>ASP.NET ImageZoom - File Browser</b></span>		

		<br /><br />
		<table border="0">
			<tr>
				<td valign="top" class="h5">	            			            
					<div style="border:1px solid gray;width:680px;height:370px;">
						<div style="width:680px;height:370px;">
							<spl2:Splitter id="sp1" runat="server">
								<LeftPanel WidthDefault="169" WidthMin="169" WidthMax="350">
									<Header height="30">
										<div style="padding-left:10px;padding-top:5px;padding-bottom:5px;background-color:#C0C0C0" class="tdText">
											<b style="font-size:12px">Folders</b>
										</div>
									</Header>
									<Content>
										<div style="padding-top:7px;padding-left:10px;border-top:1px solid gray">
                                            <asp:PlaceHolder ID="TreePlaceHolder" runat="server"></asp:PlaceHolder>
										</div>
									</Content>
								</LeftPanel>
								<RightPanel>
									<Content>
                                        &nbsp;
										<div style="padding-top:0px;padding-left:0px; height:370px; overflow:auto">
											<oajax:CallbackPanel id="cpDir" runat="server">
												<content>
												</content>
												<loading>
													<table width=100% height=100% cellpadding=0 cellspacing=0>
														<tr>
															<td align=center>
																<img src="../ajaxpage/loading_icons/1.gif">
															</td>
														</tr>
													</table>
												</loading>
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
</asp:Content>