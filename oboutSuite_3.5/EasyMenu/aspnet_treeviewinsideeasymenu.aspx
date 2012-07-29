<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Import Namespace="System.Data.OleDb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) 
	{		
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		string html;
		
		// Root node is optional. You can delete this line.
		oTree.AddRootNode("I am Root node!", true, "xpMyComp.gif");

		// Populate Treeview.
		oTree.Add("root", "a0", "obout.com", true, null, null);
		oTree.Add("a0", "a0_0", "ASP TreeView", true, null, null);
		oTree.Add("a0", "a0_1", "Fast", true, null, null);
		oTree.Add("a0", "a0_2", "Easy", true, "page.gif", null);
		oTree.Add("root", "a1", "Links & Notes since 1998", false, "book.gif", null);
		
		html = "<a href='http://www.memobook.com' class=ob_a2>MemoBook.com</a>";
		oTree.Add("a1", "a1_0", html, true, null, null);

		oTree.FolderIcons = "../TreeView/tree2/icons";
		oTree.FolderScript = "../TreeView/tree2/script";
		oTree.FolderStyle = "../TreeView/tree2/style/Classic";
						
		oTree.SelectedId = "a0_1";
		    
	    oTree.Width = "200px";
	
		// Write treeview to your page.	
		Easymenu1.AddSeparator("menuItem1", oTree.HTML());	
	}
</script>

<html>
	<head>
	    <title>obout ASP.NET Easy Menu examples</title>
		<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; padding: 20px
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
	        <span class="tdText"><b>ASP.NET Easy Menu - TreeView inside Easy Menu</b></span>
		    <br /><br />	
			<br /><br /> 
		
		    <span class="tdText">Hover "<b>TreeView</b>" item.</span><br /><br />
		    <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/horizontal1"
			    Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="330">
			    <CSSClassesCollection>
				    <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="ParentItemSubMenuCellOver"
					    ComponentContentCell="ParentItemContentCell" Component="ParentItem" ComponentSubMenuCell="ParentItemSubMenuCell"
					    ComponentIconCellOver="ParentItemIconCellOver" ComponentIconCell="ParentItemIconCell"
					    ComponentOver="ParentItemOver" ComponentContentCellOver="ParentItemContentCellOver"></oem:CSSClasses>
				    <oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="ParentSeparatorSubMenuCellOver"
					    ComponentContentCell="ParentSeparatorContentCell" Component="ParentSeparator"
					    ComponentSubMenuCell="ParentSeparatorSubMenuCell" ComponentIconCellOver="ParentSeparatorIconCellOver"
					    ComponentIconCell="ParentSeparatorIconCell" ComponentOver="ParentSeparatorOver"
					    ComponentContentCellOver="ParentSeparatorContentCellOver"></oem:CSSClasses>
			    </CSSClassesCollection>
			    <Components>
				    <oem:MenuItem InnerHtml="TreeView" ID="item1"></oem:MenuItem>
				    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator1"></oem:MenuSeparator>
				    <oem:MenuItem InnerHtml="Item2" ID="item2"></oem:MenuItem>
				    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator2"></oem:MenuSeparator>
				    <oem:MenuItem InnerHtml="Item3" ID="item3"></oem:MenuItem>
				    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator3"></oem:MenuSeparator>
				    <oem:MenuItem InnerHtml="Item4" ID="item4"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
    		
		    <oem:EasyMenu id="Easymenu1" EventList="OnBeforeItemClick" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
    				
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
				    <oem:MenuItem InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="item3" Align="Under"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Item31" ID="menuItem31"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Item32" ID="menuItem32"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 3')" InnerHtml="Item33" ID="menuItem33"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 4')" InnerHtml="Item34" ID="menuItem34"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 5')" InnerHtml="Item35" ID="menuItem35"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6')" InnerHtml="Item36" ID="menuItem36"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu4" runat="server" ShowEvent="MouseOver" AttachTo="item4" Align="Under"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 1')" InnerHtml="Item41" ID="menuItem41"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2')" InnerHtml="Item42" ID="menuItem42"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 3')" InnerHtml="Item43" ID="menuItem43"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 4')" InnerHtml="Item44" ID="menuItem44"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu13" runat="server" ShowEvent="MouseOver" AttachTo="menuItem13" Align="Right"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 1')" InnerHtml="Item131" ID="menuItem131"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 2')" InnerHtml="Item132" ID="menuItem132"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3 - SubItem 3')" InnerHtml="Item133" ID="menuItem133"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu21" runat="server" ShowEvent="MouseOver" AttachTo="menuItem21" Align="Right"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1 - SubItem 1')" InnerHtml="Item211" ID="menuItem211"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu22" runat="server" ShowEvent="MouseOver" AttachTo="menuItem22" Align="Right"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 1')" InnerHtml="Item221" ID="menuItem221"></oem:MenuItem>
				    <oem:MenuItem InnerHtml="Item222" ID="menuItem222"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 3')" InnerHtml="Item223" ID="menuItem223"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
		    <oem:EasyMenu id="Easymenu222" runat="server" ShowEvent="MouseOver" AttachTo="menuItem222" Align="Right"
			    Width="140" StyleFolder="styles/horizontal1">
			    <Components>
				    <oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2 - SubItem 2 - SubItem 1')" InnerHtml="Item2221"
					    ID="menuItem2221"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2 - SubItem 2 - SubItem 2')" InnerHtml="Item2222"
					    ID="menuItem2222"></oem:MenuItem>
				    <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2 - SubItem 2 - SubItem 3')" InnerHtml="Item2223"
					    ID="menuItem2223"></oem:MenuItem>
			    </Components>
		    </oem:EasyMenu>
            <br /><br /><br />
            
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
</script>

