<%@ Page Language="vb" Inherits="vb_withslidemenu" Src="vb_withslidemenu.aspx.vb" %>
<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		
		<style type="text/css">
		   .tdText {
		        font:11px Verdana;
		        color:#333333;
            }
            body
            {
	            font-family:Verdana;
	            font-size:8pt;
            }			
            .text
            {
	            background-color:#ebe9ed;
	            font-size:11px;
	            text-align:center;
            }
            .textContent
            {
	            font-size:11px;
	            text-align:center;
            }
        </style>
    </head>
    <body>
    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - With Slide Menu</b></span>
		<br /><br />
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	    <br /><br />	
            <obspl:Splitter id="mySpl" runat="server" StyleFolder="styles/default_light" CookieDays="0">
	            <LeftPanel WidthDefault="170" WidthMin="150" WidthMax="350">
		            <content Url="vb_withslidemenu_left.aspx" />
	            </LeftPanel>
	            <RightPanel>
		            <content Url="vb_withslidemenu_main.aspx?cId=a_a" />					
	            </RightPanel>
            </obspl:Splitter>
        </form>
    </body>
<html>
