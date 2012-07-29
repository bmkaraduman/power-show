<%@ Page Language="vb" Inherits="vb_show_image" Src="vb_show_image.aspx.vb" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelDiv
		{
			background-color:#cccccc;
			padding:7px;
		}
		.title
		{
			font-family:Tahoma;
			font-size:16px;
			font-weight:bold;
			color:#6B89AF;
			display:block;
		}
		.content
		{
			font-size:12px;
			font-family:Tahoma;
		}
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.tdText {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Show Image</b></span>
		    <br /><br />
	
		    <table>
			    <tr>
				    <td>
					    <obshow:Show id="Show1" runat="server" />				
				    </td>
			    </tr>
			    <tr>
				    <td align="left" class="tdText">
				    </td>
			    </tr>
		    </table>
    		
		    <br /><br /><br />
    		
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VBNET">« Back to examples</a>
	        
    	</form>
	</body>
</html>
	
