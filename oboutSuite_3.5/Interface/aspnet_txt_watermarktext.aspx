<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}			
			
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - WatermarkText property</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="txt1" Width="150" WatermarkText="Username"
		    FolderStyle="styles/premiere_blue/OboutTextBox" />
		&#160;
		<obout:OboutTextBox runat="server" ID="txt2" Width="150" WatermarkText="Password"
		    FolderStyle="styles/premiere_blue/OboutTextBox" />
				
		<br /><br />
		
		<span class="tdText">
		    Use the <b>WatermarkText</b> property to set a default text for the text box.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>