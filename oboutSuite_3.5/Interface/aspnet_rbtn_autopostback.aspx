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
		
		<span class="tdText"><b>obout Interface - OboutRadioButton - AutoPostBack property</b></span>
		
		<br /><br />
		
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton1" GroupName="g1"
		    FolderStyle="styles/premiere_blue/OboutRadioButton" Text="Option 1" AutoPostBack="true" />
		    
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton2" GroupName="g1"
		    FolderStyle="styles/premiere_blue/OboutRadioButton" Text="Option 1" AutoPostBack="true" />
		
		<br /><br />
		
		<span class="tdText">
		    By setting <b>AutoPostBack</b> to <span class="option2">true</span>, the page will be posted back to the server when the radio button is checked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>