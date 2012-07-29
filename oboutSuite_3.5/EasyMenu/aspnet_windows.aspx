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
		        margin: 0px; 
		        padding: 20px
		        }
		    .title 
		    {
		        font-size: X-Large; 
		        padding: 20px; 
		        border-bottom: 2px solid gray;}
		    .div 
		    {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		        }
	        .tdText {
                font:11px Verdana;
                color:#333333;
            }
	    </style>
    </head>
    <body>
	    <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu -  Windows skin</b></span>
		    <br /><br />	
			<br /><br /> 
	    
	    <span class="tdText">Right click this to see the Easy Menu:</span>
    	<br /><br />
	    <!--// Div to which the menu attaches to //-->
	    <div id="div1" class="div"></div>

	    <!--// The menus //-->
            <oem:easymenu id="EasyMenu1" runat="server" StyleFolder="styles/windows" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="div1" ShowEvent="ContextMenu" Align="Under">
	            <Components>
		            <oem:MenuItem ID="menuItem1" Url="http://www.obout.com" UrlTarget="_blank"><span style='color:#666666; font:bold; cursor:pointer;'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span></oem:MenuItem>
		            <oem:MenuItem ID="menuItem2" OnClientClick="alert('you just clicked Alert')" InnerHtml="Alert"></oem:MenuItem>
		            <oem:MenuItem ID="menuItem3"><input type='checkbox' style='height:14px; width:14px;' checked='1'> Any <span style='background-color:gold; padding-left:2px; padding-right:2px;'>HTML</span></oem:MenuItem>
		            <oem:MenuSeparator ID="menuSeparator1" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
		            <oem:MenuItem InnerHtml="Browser Operations" ID="menuItem4"></oem:MenuItem>
		            <oem:MenuSeparator ID="menuSeparator2" InnerHtml="&amp;nbsp;"></oem:MenuSeparator>
		            <oem:MenuItem ID="menuItem6" Icon="xpRecycle.gif">Recycle</oem:MenuItem>
	            </Components>
            </oem:easymenu>
            <oem:easymenu id="EasyMenu2" runat="server" StyleFolder="styles/windows" IconsFolder="icons" Width="140" UseIcons="true" AttachTo="menuItem4" ShowEvent="MouseOver" Align="Right" OffsetHorizontal="-2" OffsetVertical="-2">
	            <Components>
		            <oem:MenuItem UrlTarget="_blank" InnerHtml="Open New Page" ID="menuItem21" Url="about:blank" Icon="new.gif"></oem:MenuItem>
		            <oem:MenuItem OnClientClick="try {window.opener.focus(); window.opener = this; window.close();} catch (e) {};"
			            InnerHtml="Close This Page" ID="menuItem22" Icon="delete.gif"></oem:MenuItem>
	            </Components>
            </oem:easymenu>
            
         <br /><br /><br />
         
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	     
         </form>
    </body>
</html>