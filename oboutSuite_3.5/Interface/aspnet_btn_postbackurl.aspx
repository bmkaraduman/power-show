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
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutButton - Using the PostBackUrl Property</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="OboutTextBox1" FolderStyle="styles/premiere_blue/OboutTextBox" Text="Some Text"  />
		
		<br /><br />
		
		<obout:OboutButton runat="server" ID="OboutButton1"
		    FolderStyle="styles/premiere_blue/OboutButton" Text="Post to other page >>"
		    PostBackUrl="aspnet_btn_postbackurl_target.aspx" />
		  
        <br /><br />
		
		<span class="tdText">
		    To post the form to a different page, specify that page using the <b>PostBackUrl</b> property.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>