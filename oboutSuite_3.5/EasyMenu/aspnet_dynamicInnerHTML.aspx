<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Import Namespace="System.Data.OleDb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) 
	{		
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		string attachTo = "";
		oTree.id = "tree";

		oTree.FolderIcons = "../TreeView/tree2/icons";
		oTree.FolderScript = "../TreeView/tree2/script";
		oTree.FolderStyle = "../TreeView/tree2/style/Classic";
		oTree.AddRootNode("Hello, I am Root node!", null);

		string Html = "<span style='color:#666666; font:bold; cursor:pointer;' onclick='ob_t25(this)'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span>";
		oTree.Add("root", "r1", Html, true, "xpPanel.gif\" onclick=\"ob_t25(document.getElementById('r1'))", null);
		attachTo += "r1,";

		Html = "ASPTreeView";
		oTree.Add("r1", "a0", Html, true, "Folder.gif\" onclick=\"ob_t25(document.getElementById('a0'))", null);
		attachTo += "a0,";
	
		oTree.Add("a0", "a0_0", "Small", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_0'))", null);
		attachTo += "a0_0,";
		oTree.Add("a0", "a0_1", "Fast", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_1'))", null);
		attachTo += "a0_1,";
		oTree.Add("a0", "a0_2", "Easy", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_2'))", null);
		attachTo += "a0_2,";
	
		Html = "More nodes";
		oTree.Add("r1", "a1", Html, true, "Folder.gif\" onclick=\"ob_t25(document.getElementById('a1'))", null);
		attachTo += "a1,";
	
		Html = "Different color";
		oTree.Add("a1", "a1_0", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_0'))", null);
		attachTo += "a1_0,";
	
		Html = "Any HTML";
		oTree.Add("a1", "a1_1", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_1'))", null);
		attachTo += "a1_1,";
	
		oTree.Add("a1", "a1_2", "Select Icons", null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_2'))", null);
		attachTo += "a1_2,";
	
		Html = "Memobook";
		oTree.Add("a1", "a1_3", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_3'))", null);
		attachTo += "a1_3,";

		Html = "Recycle :)";
		oTree.Add("root", "a2", Html, true, "xpRecycle.gif\" onclick=\"ob_t25(document.getElementById('a2'))", null);
		attachTo += "a2,";

		Html = "Dynamic Load";
		oTree.Add("root", "a3", Html, true, "Folder.gif\" onclick=\"ob_t25(document.getElementById('a3'))", "DynTreeView.aspx");
		attachTo += "a3";
		
		TreeView.Text = oTree.HTML();
		oTree.Width = "150px";
		EasyMenu1.AttachTo = attachTo;
	}
</script>

<html>
	<head>
		<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
			}
			.title 
			{
			    font-size: X-Large; 
			    padding: 20px; 
			    border-bottom: 2px solid gray;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
		   
	</style>
	</head>
	<body>
		<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Dynamic menu item inner HTML</b></span>
		    <br /><br />	
			<br /><br />  
		
		    <table cellpadding="10" cellspacing="5" border="0" width="100%">
			    <tr>
				    <td width="200" valign="top">
					    <asp:Label id="TreeView" runat="server">Label</asp:Label>
				    </td>
			    </tr>
		    </table>

		    <oem:EasyMenu id="EasyMenu1" EventList="OnAfterMenuOpen" runat="server" StyleFolder="styles" Width="150">
			    <components>
				    <oem:MenuItem id="menuItem5"  OnClientClick="try {alert(targetEl.innerHTML);} catch (e) {}" InnerHtml="Show Node's HTML"></oem:MenuItem>
				    <oem:MenuItem id="menuItem6" OnClientClick="try {targetEl.parentNode.firstChild.firstChild.onclick();} catch (e) {}"
					    InnerHtml="Expand/Collapse Node"></oem:MenuItem>
			    </components>
		    </oem:EasyMenu>
            
            <br /><br /><br /><br />
            
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
	</body>
</html>

<script type="text/javascript">
// ob_em_EasyMenu1 is the ID of our EasyMenu (ob_em_ + the id from the aspx page).

function ob_OnNodeExpand(id, dynamic)
{
    // add client side code here	
	//alert("OnNodeExpand on: " + id + " " + dynamic);
        
    if(ob_ev("OnNodeExpand"))
	{
		if(document.getElementById(id).parentNode.parentNode.firstChild.firstChild.className == "ob_t8") {
			id = "root";
		}
	    if(typeof ob_post == "object")
	    {
	        ob_post.AddParam("id", id);	        
	        //Change "TreeEvents.aspx" with the name of your server-side processing file
	        ob_post.post("TreeEvents.aspx", "OnNodeExpand");
	    }
	    else
	    {
	        alert("Please add obout_AJAXPage control to your page to use the server-side events");
	    }
	}
	
	//attach menu to dynamic node
	if ( dynamic ){
		ob_attachMenuToNode( document.getElementById( id ), true );
	}
}

function ob_attachMenuToNode( node, attToChild ){
	if ( ob_em_Menus != null )
	{
		if ( ob_em_EasyMenu1 == "undefine" )
		{
			return;
		}
		var childCount = ob_getChildCount ( node );
		for ( var i=0; i< childCount; i++)
		{
			var child = ob_getChildAt ( node, i, false );
			// attach menu to node
			try{
				var childId = child.id;
				if ( childId == null )
				{
					continue;
				}
				ob_em_EasyMenu1.attachToControl( child.id );
				if ( attToChild == true )
				{
					//continue attach to childs node.
					if ( ob_getChildCount ( child ) > 0 )
					{
						ob_attachMenuToNode( child, true );
					}
				}
			}catch(ex){}
		}
	}
}

function ob_em_OnAfterMenuOpen(menu)
{
	// get the node inner html
	var nodeInnerHtml = menu.object.el.innerHTML;
	
	// set the item value
	document.getElementById('menuItem6').firstChild.firstChild.firstChild.firstChild.nextSibling.innerHTML = "Expand/Collapse node " + nodeInnerHtml;
	
	return true;
}
</script>

