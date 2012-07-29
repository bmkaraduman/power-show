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
		
		    .easyMenuItemContainer {
		    display:inline-table;
		    min-width:140px !important;
		    width:100% !important;
		    }
    		
		    #ob_em_mc {
		    width:100%;
		    }
		    .menuHead {
	            color:#FF3300;
                font-family:"Segoe UI",Arial,sans-serif";
                font-size:13px;
                font-weight:normal;
                padding-top:6px !important;
                padding-left:10px !important;
                padding-bottom:4px !important;
                height:15px;
                white-space:nowrap;
	        }
	    </style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Multi Column Easy Menu with Icons</b></span>
		    <br /><br />	
			<br /><br />
            
            <div>
	            <!--// The head of the menus //-->
	            <oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/horizontal6"
		            Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="500">
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
			            <oem:MenuItem InnerHtml="ASP.NET Controls" ID="item1"></oem:MenuItem>
			            <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator1"></oem:MenuSeparator>
			            <oem:MenuItem InnerHtml="ASP.NET MVC Controls" ID="item2"></oem:MenuItem>
			            <oem:MenuSeparator InnerHtml="&nbsp;" ID="mainMenuSeparator2"></oem:MenuSeparator>
			            <oem:MenuItem InnerHtml="Utilities" ID="item3"></oem:MenuItem>
		            </Components>
	            </oem:EasyMenu>
                    
	            <!--// The menus //-->
	            <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" RepeatColumns="3" Position="Horizontal" AttachTo="item1" Align="Under" Width="600" StyleFolder="styles/horizontal6" IconsFolder="../Resources/products" UseIcons="true" KeepOpen="false">
		            <Components>
			            <oem:MenuItem OnClientClick="alert('ASP.NET Easy Menu')" InnerHtml="ASP.NET Easy Menu" ID="menuItem12" AllowsIcon="true" Icon="easymenu.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET TreeView')" InnerHtml="ASP.NET TreeView" ID="menuItem13" AllowsIcon="true" Icon="treeview.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET TextMenu')" InnerHtml="ASP.NET TextMenu" ID="menuItem14" AllowsIcon="true" Icon="textmenu.png"></oem:MenuItem>		
			            <oem:MenuItem OnClientClick="alert('ASP.NET Slide Menu')" InnerHtml="ASP.NET Slide Menu" ID="menuItem15" AllowsIcon="true" Icon="slidemenu.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET Grid')" InnerHtml="ASP.NET Grid" ID="menuItem16" AllowsIcon="true" Icon="grid.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET Combobox')" InnerHtml="ASP.NET Combobox" ID="menuItem17" AllowsIcon="true" Icon="combobox.png"></oem:MenuItem>		
			            <oem:MenuItem OnClientClick="alert('ASP.NET Editor')" InnerHtml="ASP.NET Editor" ID="menuItem18" AllowsIcon="true" Icon="editor.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET Scheduler')" InnerHtml="ASP.NET Scheduler" ID="menuItem19" AllowsIcon="true" Icon="scheduler.png"></oem:MenuItem>		
			            <oem:MenuItem OnClientClick="alert('ASP.NET Splitter')" InnerHtml="ASP.NET Splitter" ID="menuItem110" AllowsIcon="true" Icon="splitter.png"></oem:MenuItem>		
			            <oem:MenuItem OnClientClick="alert('ASP.NET Calendar')" InnerHtml="ASP.NET Calendar" ID="menuItem111" AllowsIcon="true" Icon="calendar.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('ASP.NET Context Menu')" InnerHtml="ASP.NET Contex Menu" ID="menuItem112" AllowsIcon="true" Icon="easymenu.png"></oem:MenuItem>		
			            <oem:MenuItem OnClientClick="alert('ASP.NET Tab Strip')" InnerHtml="ASP.NET Tab strip" ID="menuItem113" AllowsIcon="true" Icon="tabstrip.png"></oem:MenuItem>		
		            </Components>
	            </oem:EasyMenu>
            	
	            <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" Width="380" RepeatColumns="2" Position="Horizontal" StyleFolder="styles/horizontal6" UseIcons="true" IconsFolder="../Resources/products">
		            <Components>
			            <oem:MenuItem InnerHtml="obout MVC Button" ID="menuItem21" Icon="button.png"></oem:MenuItem>
			            <oem:MenuItem InnerHtml="obout MVC Textbox" ID="menuItem22" Icon="textbox.png"></oem:MenuItem>
			            <oem:MenuItem InnerHtml="obout MVC Radio Button" ID="menuItem23" Icon="radiobutton.png"></oem:MenuItem>
			            <oem:MenuItem InnerHtml="obout MVC Checkbox" ID="menuItem24" Icon="checkbox.png"></oem:MenuItem>
		            </Components>
	            </oem:EasyMenu>
            	
	            <oem:EasyMenu id="Easymenu3" Width="350"  runat="server" Position="Horizontal" ShowEvent="MouseOver" AttachTo="item3" Align="Under" StyleFolder="styles/horizontal6" UseIcons="true" IconsFolder="../Resources/products">
		            <Components>
			            <oem:MenuItem OnClientClick="alert('obout Solutions')" InnerHtml="obout Solutions" ID="menuItem31" Icon="window.png"></oem:MenuItem>
			            <oem:MenuItem OnClientClick="alert('obout Site Monitering')" InnerHtml="obout Site Monitering" ID="menuItem32" Icon="window.png"></oem:MenuItem>
		            </Components>
	            </oem:EasyMenu>

	      </div>
	
	      <br /><br /><br /><br />
	      
	      <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
	    </form>
    </body>
</html>