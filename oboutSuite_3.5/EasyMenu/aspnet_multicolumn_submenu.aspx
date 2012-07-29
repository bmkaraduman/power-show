<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
			.div 
		    {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		        }
		    .easyMenuItemContainer {
		    display:inline-table;
		    min-width:140px !important;
		    width:100% !important;
		    }
    		
		    #ob_em_mc {
		    width:100%;
		    }
    		
	    </style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Multi column submenu</b></span>
		    <br /><br />	
			<br /><br />
	
	        <div>
	        <!--// The head of the menus //-->
	        <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/horizontal7"
		        Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="430">
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
			        <oem:MenuItem InnerHtml="Item1" ID="item1"></oem:MenuItem>
			        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator1"></oem:MenuSeparator>
			        <oem:MenuItem InnerHtml="Item2" ID="item2"></oem:MenuItem>
			        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator2"></oem:MenuSeparator>
			        <oem:MenuItem InnerHtml="Item3" ID="item3"></oem:MenuItem>
			        <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator3"></oem:MenuSeparator>
			        <oem:MenuItem InnerHtml="Item4" ID="item4"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <!--// The menus //-->
	        <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" RepeatColumns="2" Position="Horizontal" AttachTo="item1" Align="Under" Width="340" StyleFolder="styles/horizontal7" KeepOpen="true">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="Item11" ID="menuItem11"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="Item12" ID="menuItem12"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3')" InnerHtml="Item13" ID="menuItem13"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 1 - SubItem 4')" InnerHtml="Item14" ID="menuItem14"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" Width="280" RepeatColumns="2" Position="Horizontal" StyleFolder="styles/horizontal7">
		        <Components>
			        <oem:MenuItem InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu3" Width="400"  runat="server" Position="Horizontal" RepeatColumns="3" ShowEvent="MouseOver" AttachTo="item3" Align="Under" StyleFolder="styles/horizontal7" UseIcons="true">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 1')" InnerHtml="Item31" ID="menuItem31"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 2')" InnerHtml="Item32" ID="menuItem32"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 3')" InnerHtml="Item33" ID="menuItem33"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 4')" InnerHtml="Item34" ID="menuItem34"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 5')" InnerHtml="Item35" ID="menuItem35"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 6')" InnerHtml="Item36" ID="menuItem36"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 7')" InnerHtml="Item37" ID="menuItem37"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 8')" InnerHtml="Item38" ID="menuItem38"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 9')" InnerHtml="Item39" ID="menuItem39"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 10')" InnerHtml="Item310" ID="menuItem310"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 11')" InnerHtml="Item311" ID="menuItem311"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 3 - SubItem 12')" InnerHtml="Item312" ID="menuItem312"></oem:MenuItem>

		        </Components>
	        </oem:EasyMenu>
	        <oem:EasyMenu id="Easymenu4" runat="server" ShowEvent="MouseOver" AttachTo="item4" Align="Under" Width="300" RepeatColumns="2" Position="Horizontal" StyleFolder="styles/horizontal7">
		        <Components>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 1')" InnerHtml="Item41" ID="menuItem41"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 2')" InnerHtml="Item42" ID="menuItem42"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 3')" InnerHtml="Item43" ID="menuItem43"></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('Item 4 - SubItem 4')" InnerHtml="Item44" ID="menuItem44"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>

	    </div>
	    
	    <br /><br /><br /><br />
	    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	    <script type="text/javascript">

            function showMenu(e, obj) {
                ob_em_documentMouseDown(e);
            }
        </script>
	    </form>
    </body>
</html>