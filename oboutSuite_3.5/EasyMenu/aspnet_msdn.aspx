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
	</style>
	
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - MSDN skin</b></span>
		    <br /><br />	
			<br /><br />
	
	        <span class="tdText">Click on "Home" tab.</span><br /><br />
	        <div style="padding-left:100px;">
	        <!--// The head of the menus //-->
	        <oem:EasyMenu EventsScriptPath="events_script" id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/MSDN"
		        Position="Horizontal" CSSMenu="ParentMenu" CSSMenuItemContainer="ParentItemContainer" Width="570">
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
			        <oem:MenuItem InnerHtml="Home" ID="item1" Url=""></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Library" ID="item2"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Learn" ID="item3"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Downloads" ID="item4"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Support" ID="item5"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu1" runat="server" OffsetHorizontal="-100" Position="Horizontal" ShowEvent="MouseClick" AttachTo="item1" Align="Under"
		        Width="600px" StyleFolder="styles/MSDN">
		        <Components>
			        <oem:MenuItem Url="#" InnerHtml="Developer Centers" ID="menuItem11"></oem:MenuItem>
			        <oem:MenuItem Url="#" InnerHtml="Getting Started" ID="menuItem12"></oem:MenuItem>
			        <oem:MenuItem Url="#" InnerHtml="Evaluation" ID="menuItem13"></oem:MenuItem>
			        <oem:MenuItem Url="#" InnerHtml="Webcasts" ID="menuItem14"></oem:MenuItem>
			        <oem:MenuItem Url="#" InnerHtml="How to Buy" ID="menuItem15"></oem:MenuItem>
			        <oem:MenuItem Url="#" InnerHtml="MSDN Worldwide" ID="menuItem16"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	        </div>
	        
	        <br /><br /><br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	     
	     </form>   
    </body>
</html>