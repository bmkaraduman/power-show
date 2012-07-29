<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" %>
<%@ Import Namespace="obout_ASPTreeView_2_NET" %>

<!-- For sub tree do NOT put any HTML tags above and below code -->

<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) {
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		
		oTree.SubTree = true;

		oTree.Add("root", "b0", "<NOBR>Dynamic Node 1</NOBR>", false, "ball_glass_blueS.gif", null);

		oTree.Add("root", "b1", "<NOBR>Dynamic Node 2</NOBR>", false, "ball_glass_blueS.gif", null);

		oTree.Add("root", "b2", "<NOBR>Dynamic Node 3</NOBR>", false, "ball_glass_blueS.gif", null);		
		
		oTree.FolderIcons = "../TreeView/tree2/icons";
		oTree.FolderScript = "../TreeView/tree2/script";
		oTree.FolderStyle = "../TreeView/tree2/style/Classic";
		Response.Write(oTree.HTML());
}
</script>

<!-- For sub tree do NOT put any HTML tags above and below code -->
