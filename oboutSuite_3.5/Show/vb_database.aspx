<%@ Page Language="vb" Src="vb_database.aspx.vb" Inherits="vb_database" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.name
		{
			color:crimson;
			text-decoration:underline;
			font-weight:bold;
			font-size:16px;
			cursor:pointer;
		}
		.desc
		{
			padding-top:20px;
			font-weight:normal;
			font-size:14px;
		}
		.price
		{
			padding-top:60px;
			font-weight:normal;
			color:red;
			font-size:13px;
		}
		.tdText {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - From Database</b></span>
		    <br /><br />
		
		    <obshow:Show id="Show1" runat="server" Width="500" Height="150" ScrollDirection="top" ShowType="show" TransitionType="QuickScroll" />
        	
	        <br /><br /><br />
        		
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VBNET">« Back to examples</a>
	        
		</form>
	</body>
</html>
