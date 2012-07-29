<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<title>obout ASP.NET Easy Menu examples</title>
	
	<!--// Only needed for this page's formatting //-->
	<style>
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
	        <span class="tdText"><b>ASP.NET Easy Menu - UrlTarget</b></span>
		    <br /><br />	
			<br /><br />
	  
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
    	<br /><br /><br />
    	
	    <span class="tdText">Click on menu subitems.</span>
    	
	    <!--// The head of the menus //-->
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
			    <oem:MenuItem InnerHtml="New Window" ID="item1"></oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator1"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="Same Window" ID="item2"></oem:MenuItem>
			    <oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator2"></oem:MenuSeparator>
			    <oem:MenuItem InnerHtml="Inside IFrame" ID="item3"></oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
    	
	    <!--// The menus //-->
	    <oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under" OffsetVertical="-2" Width="140" StyleFolder="styles/horizontal1">
		    <Components>
			    <oem:MenuItem InnerHtml="www.obout.com" Url="http://www.obout.com/" UrlTarget="_blank" ID="menuItem11"></oem:MenuItem>
			    <oem:MenuItem InnerHtml="www.msn.com" Url="http://www.msn.com/" UrlTarget="_blank" ID="menuItem13"></oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under" OffsetVertical="-2" Width="140" StyleFolder="styles/horizontal1">
		    <Components>
			    <oem:MenuItem InnerHtml="www.obout.com" Url="http://www.obout.com/" UrlTarget="_self" ID="menuItem21"></oem:MenuItem>
			    <oem:MenuItem InnerHtml="www.msn.com" Url="http://www.msn.com/" UrlTarget="_self" ID="menuItem23"></oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
	    <oem:EasyMenu id="Easymenu3" runat="server" ShowEvent="MouseOver" AttachTo="item3" Align="Under" OffsetVertical="-2" Width="140" StyleFolder="styles/horizontal1">
		    <Components>
			    <oem:MenuItem InnerHtml="www.obout.com" Url="http://www.obout.com/" UrlTarget="myiframe" ID="menuItem31"></oem:MenuItem>
			    <oem:MenuItem InnerHtml="www.msn.com" Url="http://www.msn.com/" UrlTarget="myiframe" ID="menuItem33"></oem:MenuItem>
		    </Components>
	    </oem:EasyMenu>
    	
	    <br /><br />
	    <b>IFrame: &lt;iframe name="myiframe" /&gt;</b>
	    <br /><br />
	    <iframe width="600px" height="450px" name="myiframe" />
    	
	    </form>
    </body>
</html>