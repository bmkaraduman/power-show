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
	</style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - SRight To Left skin</b></span>
		    <br /><br />	
			<br /><br />
	
	        <span class="tdText">Right click this to see the Easy Menu:</span>
        	
	        <!--// Div to which the menu attaches to //-->
	        <div style="width:50%;" align="right"><div id="div1" class="div"></div></div>

	        <!--// The menus //-->
	        <oem:easymenu id="EasyMenu1" runat="server" StyleFolder="styles/righttoleft" IconsFolder="icons" Width="150" UseIcons="true" IconsPosition="Left" AttachTo="div1" ShowEvent="ContextMenu" Align="Advanced" AlignMenuCorner="TopRight" AlignElementCorner="BottomRight">
		        <Components>
			        <oem:MenuItem UrlTarget="_blank" ID="menuItem1" Url="http://www.obout.com"><span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'>Home</b></span></oem:MenuItem>
			        <oem:MenuItem OnClientClick="alert('you just clicked Alert')" InnerHtml="Alert" ID="menuItem2"></oem:MenuItem>
			        <oem:MenuItem ID="menuItem3"><input type='checkbox' style='height:14px; width:14px;' checked='true'> Any <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span></oem:MenuItem>
			        <oem:MenuItem Icon="new.gif" UrlTarget="_blank" ID="menuItem4" Url="about:blank">Open new page</oem:MenuItem>
			        <oem:MenuItem OnClientClick="try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};" Icon="delete.gif" ID="menuItem5">Close This Page</oem:MenuItem>
			        <oem:MenuItem Icon="xpRecycle.gif" ID="menuItem6">Recycle</oem:MenuItem>
		        </Components>
	        </oem:easymenu>
	        <oem:easymenu id="Easymenu2" runat="server" StyleFolder="styles/righttoleft" IconsFolder="icons" Width="150"
		        UseIcons="true" AttachTo="menuItem5" ShowEvent="MouseOver" Align="Left">
		        <Components>
			        <oem:MenuItem Icon="delete.gif" OnClientClick="alert('Item 5 - SubItem 1')" InnerHtml="SubMenu Item 1" ID="menuItem51"></oem:MenuItem>
			        <oem:MenuItem Icon="delete.gif" OnClientClick="alert('Item 5 - SubItem 2')" InnerHtml="SubMenu Item 2" ID="menuItem52"></oem:MenuItem>
			        <oem:MenuItem Icon="delete.gif" OnClientClick="alert('Item 5 - SubItem 3')" InnerHtml="SubMenu Item 3" ID="menuItem53"></oem:MenuItem>
		        </Components>
	        </oem:easymenu>
	        <oem:easymenu id="Easymenu3" runat="server" StyleFolder="styles/righttoleft" IconsFolder="icons" Width="150"
		        UseIcons="true" AttachTo="menuItem6" ShowEvent="MouseOver" Align="Left">
		        <Components>
			        <oem:MenuItem Icon="xpRecycle.gif" OnClientClick="alert('Item 6 - SubItem 1')" InnerHtml="SubMenu Item 1" ID="menuItem61"></oem:MenuItem>
			        <oem:MenuItem Icon="xpRecycle.gif" OnClientClick="alert('Item 6 - SubItem 2')" InnerHtml="SubMenu Item 2" ID="menuItem62"></oem:MenuItem>
			        <oem:MenuItem Icon="xpRecycle.gif" OnClientClick="alert('Item 6 - SubItem 3')" InnerHtml="SubMenu Item 3" ID="menuItem63"></oem:MenuItem>
			        <oem:MenuItem Icon="xpRecycle.gif" OnClientClick="alert('Item 6 - SubItem 4')" InnerHtml="SubMenu Item 4" ID="menuItem64"></oem:MenuItem>
		        </Components>
	        </oem:easymenu>
	        
	        <br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	    </form>
    </body>
</html>