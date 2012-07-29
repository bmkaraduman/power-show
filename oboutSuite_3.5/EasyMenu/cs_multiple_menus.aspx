<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="C#" Inherits="cs_multiple_menus" Src="cs_multiple_menus.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
    </style>
	</head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Easy Menu - Multiple menus</b></span>
	
		<br />
		<br /><br />
		<table width="100%">
            <tr>
	            <td stye="width:50%" valign="top" class="tdText">
		            <b>Easy Menu 1</b>
		            <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
	            </td>
	            <td class="tdText">
		            <b>Easy Menu 2</b>
		            <asp:PlaceHolder ID="placeHolder2" runat="server"></asp:PlaceHolder>
	            </td>
            </tr>
        </table>
         <br /><br /><br /><br />
	    
		<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
		
        </form>
	</body>
</html>