<%@ Page Language="C#" Debug="true" %>
<script language="C#" runat="server">
        void Page_Load(object sender, EventArgs e) {
                
                obout_ASPTreeView_2_NET.Tree oTree;
                //build TreeView
                oTree = new obout_ASPTreeView_2_NET.Tree();
                        
                string Html;
                
                oTree.AddRootNode("I am Root node!", "xpPanel.gif");
                
                Html = "<span style='cursor:pointer;'>Obout Inc</span>";
                oTree.Add("root", "r1", Html, null, null, null);
                
                Html = "<span style='cursor:pointer;'>Brooklyn Bridge</span>";
                oTree.Add("root", "r2", Html, true, null, null);
                
                        Html = "<span style='cursor:pointer;'>Drawing</span>";
                        oTree.Add("r2", "r2_0", Html, null, null, null);
                
                        Html = "<span style='cursor:pointer;'>Picture</span>";
                        oTree.Add("r2", "r2_1", Html, null, null, null);
                
                Html = "<span style='cursor:pointer;'>Pictures</span>";
                oTree.Add("root", "r3", Html, true, null, null);
                
                        Html = "<span style='cursor:pointer;'>Obout Inc</span>";
                        oTree.Add("r3", "r3_0", Html, null, null, null);
                
                        Html = "<span style='cursor:pointer;'>My Pictures</span>";
                        oTree.Add("r3", "r3_1", Html, null, null, null);

                oTree.FolderIcons = "../TreeView/tree2/icons";
                oTree.FolderScript = "../TreeView/tree2/script";
                oTree.FolderStyle = "../TreeView/tree2/style/Classic";
                
                oTree.SelectedId = "r1";
                
                treeView.Text = oTree.HTML();
        }       
</script>
<html>
	<head>
	</head>
	<body>
		<div style="margin:5px;font:11px verdana;"> 
			<span style="color:crimson">In this splitter panel is loaded another page.</span>
			<br /><br />
			<asp:Literal id="treeView" runat="server" />
		</div>
	</body>
</html>

