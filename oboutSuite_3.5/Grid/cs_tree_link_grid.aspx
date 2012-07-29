<%@ Page Language="C#" ASPCOMPAT="TRUE"%>
<%@ Import Namespace="obout_ASPTreeView_2_NET" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{		
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		
		// Root node is optional. You can delete this line.
		oTree.AddRootNode("<div style=\"height: 19px;\">Working time</div>", true, "xpMyComp.gif");

		// Populate Treeview.
		oTree.Add("root", "a_0", "<div style=\"height: 18px;\">Albert Yap</div>", true, null, null);
		oTree.Add("a_0", "a_1", "<div style=\"height: 18px;\">1st half of March</div>", true, "page.gif", null);
		oTree.Add("a_0", "a_2", "<div style=\"height: 18px;\">2nd half of March</div>", true, "page.gif", null);
		oTree.Add("a_0", "a_3", "<div style=\"height: 18px;\">1st half of April</div>", true, "page.gif", null);
		oTree.Add("a_0", "a_4", "<div style=\"height: 18px;\">2nd half of April</div>", true, "page.gif", null);

		oTree.Add("root", "a_5", "<div style=\"height: 18px;\">Mike Baker</div>", true, null, null);
		oTree.Add("a_5", "a_6", "<div style=\"height: 18px;\">1st half of March</div>", true, "page.gif", null);
		oTree.Add("a_5", "a_7", "<div style=\"height: 18px;\">2nd half of March</div>", true, "page.gif", null);
		oTree.Add("a_5", "a_8", "<div style=\"height: 18px;\">1st half of April</div>", true, "page.gif", null);
		oTree.Add("a_5", "a_9", "<div style=\"height: 18px;\">2nd half of April</div>", true, "page.gif", null);
		oTree.Add("root", "a_10", "<span style='height: 20px; cursor:pointer;color:crimson;'><b><nobr>Load Jan&Feb Dyn.</nobr></b></span>", null, null, "tree_link_grid_sub.aspx");

		oTree.FolderIcons = "../TreeView/tree2/icons";
		oTree.FolderScript = "../TreeView/tree2/script";
		oTree.FolderStyle = "../TreeView/tree2/style/Classic";
						
		oTree.SelectedId = "a_2,a_7";
		    
	    oTree.Width = "160px";
	
		// Write treeview to your page.
		TreeView.Text = oTree.HTML();

		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/timesheet.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT *, (Sun + Mon + Tue + Wed + Thu + Fri + Sat) AS Total,(Sun2 + Mon2 + Tue2 + Wed2 + Thu2 + Fri2 + Sat2) AS Total2 FROM March ORDER BY ID ASC", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	
	</script>		

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color___:#f6f9fc;
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
		</style>		
			<script language="javascript">
			function imgClick( img , value ){
				if ( img.src.indexOf("plusik_r.gif") < 0 )
				{
					img.src = "../TreeView/tree2/style/Classic/plusik_r.gif";

					var td = img.parentNode.nextSibling;
					td.style.display = "none";

					if ( value  == 1)
					{
						grid1.hideColumn("Mon");
						grid1.hideColumn("Tue");
						grid1.hideColumn("Wed");
						grid1.hideColumn("Thu");
						grid1.hideColumn("Fri");
					}else{
						grid1.hideColumn("Mon2");
						grid1.hideColumn("Tue2");
						grid1.hideColumn("Wed2");
						grid1.hideColumn("Thu2");
						grid1.hideColumn("Fri2");
					}
				}else{
					img.src = "../TreeView/tree2/style/Classic/minus_r.gif";

					var td = img.parentNode.nextSibling;
					td.style.display = "";

					if ( value  == 1)
					{
						grid1.showColumn("Mon");
						grid1.showColumn("Tue");
						grid1.showColumn("Wed");
						grid1.showColumn("Thu");
						grid1.showColumn("Fri");
					}else{
						grid1.showColumn("Mon2");
						grid1.showColumn("Tue2");
						grid1.showColumn("Wed2");
						grid1.showColumn("Thu2");
						grid1.showColumn("Fri2");
					}

				}
			}
			
		function onRecordSelect(arrSelectedRecords) {
			var sMessage;
			var node_id;

			if ( 0 < grid1.SelectedRecords.length ) {
				var id = grid1.SelectedRecords[0].ID;

				node_id = "a_" + ( id - 1 );	
			}

			if (tree_selected_id == node_id || node_id == null || node_id == "root_tree1")
			{
				return;
			}
			var node = document.getElementById( node_id );
			node.onclick();
		}

		function onDblClick(id) {
			var node_id;

			if ( 0 <grid1.SelectedRecords.length ) {
				var id = grid1.SelectedRecords[0].ID;

				node_id = "a_" + (id - 1);
			}
			if ( node_id == null || node_id == "root_tree1" )
			{
				return;
			}
			// get -/+ image on Node
			var node = document.getElementById( node_id ).previousSibling.previousSibling.firstChild;
			if (node.onclick)
			{	
				node.onclick();
			}
			

		}
	</script>

	</head>
	<body style="margin: 0px;">	
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using withTreeView</b></span>
		<br /><br />
		<span class="tdtext">When a node is collapsed/expanded (and all its children are hidden) <br>
		the corresponding rows from the Grid are hidden/shown.<br><br>
		When the -/+ buttons on the left of the Weeks are clicked,<br> the groups of columns are hidden/shown.<br><br>
		When the row on the grid is double clicked,<br> the corresponding node is collapsed/expanded.
</span><br/><br/>

<table>
	<tr>
	<td valign="top">
		<div style="padding-top: 35px;">
		<ASP:Literal id="TreeView" EnableViewState="false" runat="server" />
		</div>
	</td>
	<td valign="top">
		<table>
			<tr>
				<td class="tdText"><img src="../TreeView/tree2/style/Classic/minus_r.gif" onclick="imgClick(this, 1);" style="cursor:pointer;" width="19" height="16"/></td><td class="tdText"  width="230" valign="middle">Week 1</td>
				<td class="tdText"><img src="../TreeView/tree2/style/Classic/minus_r.gif" onclick="imgClick(this, 2);" style="cursor:pointer;" width="19" height="16"/></td><td class="tdText" valign="middle">Week 2</td>
			</tr>
		</table>
		<span class="tdText">
		
		
		</span>
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"  GenerateRecordIds="true" FolderStyle="styles/premiere_blue" AutoGenerateColumns="false" AllowAddingRecords="false"  AllowPaging="false" AllowPageSizeSelection="false" AllowSorting="false" PageSize="21">
			 <ClientSideEvents onClientSelect="onRecordSelect" OnClientDblClick="onDblClick"/>
			<Columns>
				<obout:Column DataField="ID" ReadOnly="true" Visible="false" HeaderText="ID" runat="server"/>
				<obout:Column DataField="Mon" ReadOnly="true" HeaderText="Mon" Width="50" runat="server"/>
				<obout:Column DataField="Tue" ReadOnly="true" HeaderText="Tue" Width="50" runat="server"/>
				<obout:Column DataField="Wed" ReadOnly="true" HeaderText="Wed" Width="50" runat="server"/>
				<obout:Column DataField="Thu" ReadOnly="true" HeaderText="Thu" Width="50" runat="server"/>
				<obout:Column DataField="Fri" ReadOnly="true" HeaderText="Fri" Width="50" runat="server"/>

				<obout:Column DataField="Mon2" ReadOnly="true" HeaderText="Mon" Width="50" runat="server"/>
				<obout:Column DataField="Tue2" ReadOnly="true" HeaderText="Tue" Width="50" runat="server"/>
				<obout:Column DataField="Wed2" ReadOnly="true" HeaderText="Wed" Width="50" runat="server"/>
				<obout:Column DataField="Thu2" ReadOnly="true" HeaderText="Thu" Width="50" runat="server"/>
				<obout:Column DataField="Fri2" ReadOnly="true" HeaderText="Fri" Width="50" runat="server"/>
			</Columns>
		</obout:Grid>				
	</td>
</tr>
</table>
		<br /><br /><br />
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
		<script language="javascript">
		grid1.selectRecord(7);
		
		var rowPrefix;

		// find out the row Prefix 
		function getRowPrefix()
		{
			var row0 = grid1.getRecordsIds().split(",")[0];
			
			if ( row0 != null)
			{
				var lastPos = -1;
				for ( var i = row0.length-1; i>=0; i--)
				{
					if ( row0.charAt(i)== '_' )
					{
						lastPos = i;
						break;
					}
				}

				if (lastPos > -1)
				{
					// get Prefix
					return row0.substring(0,lastPos + 1);
				}
			}

			

			return "";
		}

		hideRow();
	

		function hideRow(){
			if ( rowPrefix == null)
			{
				rowPrefix = getRowPrefix();
			}
			var display = "none";

			document.getElementById(rowPrefix + 11).style.display= display;
			document.getElementById(rowPrefix + 12).style.display= display;
			document.getElementById(rowPrefix + 13).style.display= display;
			document.getElementById(rowPrefix + 14).style.display= display;
			document.getElementById(rowPrefix + 15).style.display= display;
			document.getElementById(rowPrefix + 16).style.display= display;
			document.getElementById(rowPrefix + 17).style.display= display;
			document.getElementById(rowPrefix + 18).style.display= display;
			document.getElementById(rowPrefix + 19).style.display= display;
			document.getElementById(rowPrefix + 20).style.display= display;
		}

		function ob_OnNodeCollapse(id)
		{
			var display = "none";
			
			// find out the start and end position of all hide records of child nodes
			var startHideRow = parseInt ( id.replace("a_", "") );
			var endHideRow = parseInt( getChildWithMaxIndex( document.getElementById(id) ).id.replace("a_", "") );

			// hide all records of child nodes.
			for ( var i = startHideRow + 1; i <= endHideRow; i++)
			{
				document.getElementById(rowPrefix + i ).style.display= display;
			}
			if(true){
			}

		}

		function getChildWithMaxIndex(node){
			var lastChild = ob_getLastChildOfNode( node );
			
			if ( lastChild == null)
			{
				return node;
			}else{
				return getChildWithMaxIndex(lastChild);
			}
		}

		// tree1 node expand event
		function ob_OnNodeExpand(id){

			if ( id == "root_tree1") return;
			expandChild( document.getElementById(id) );
		}

		// traveling all expaned child node and show the corresponding record.
		function expandChild(node){
			var display = "";

			var n = ob_getFirstChildOfNode( node );
			while ( n != null )
			{
				// show the record of this node
				document.getElementById(rowPrefix + n.id.replace( "a_", "" ) ).style.display = display;
				if ( ob_isExpanded( n ) )
				{
					expandChild(n);
				}
				

				//
				n = ob_getNodeDown(n);
			}
		}

		function ob_OnNodeSelect(id)
		{
			var row = -1;
		
			if ( id != "root_tree1")
			{
				row = id.replace("a_", "") ;
			}
			if ( row >= 0)
			{
				for ( var i=0; i< 21; i++ )
				{
					if (i== row)
					{
						grid1.selectRecord( i );
					}else{
						grid1.deselectRecord( i );
					}
				}
			}
		}
		</script>

			<style type="text/css">

	.ob_gC 
	{
		cursor: default;
		padding-right: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		padding-left: 0px;
		border-right: 0px;
		border-top: 0px;				
		font-family: Verdana;
		font-size: 10px;
		color: #000000;	
		height: 20px;	
		vertical-align: middle;		
	}
		</style>		