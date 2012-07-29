<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" TagName="CustomTextBox" Src="~/Interface/user_controls/TextBox.ascx" %>
<%@ Register TagPrefix="obout" TagName="CustomButton" Src="~/Interface/user_controls/Button.ascx" %>
<%@ Register TagPrefix="obout" TagName="LoginForm" Src="~/Interface/user_controls/Form.ascx" %>

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
		
		<span class="tdText"><b>obout Interface - Inside User Controls</b></span>
		
		<br /><br />
		
		<span class="tdText">Single TextBox inside user control:</span><br />
		<obout:CustomTextBox runat="server" ID="CustomTextBox1" Text="Some Text 1" Width="150" />
		<obout:CustomTextBox runat="server" ID="CustomTextBox2" Text="Some Text 2" Width="150" />
		
		<br /><br />
		
		<span class="tdText">Single Button inside user control:</span><br />
		<obout:CustomButton runat="server" ID="CustomButton2" Text="Click Me 1!" Width="150" />
		<obout:CustomButton runat="server" ID="CustomButton1" Text="Click Me 2!" Width="150" />
		
		<br /><br />
		
		<span class="tdText">Multiple controls inside user control:</span><br />
		<obout:LoginForm runat="server" />
		<br />
		<obout:LoginForm ID="LoginForm1" runat="server" />
				
		<br /><br />
		
		<span class="tdText">
		    The Interface Controls can easily be placed inside ASP.NET user controls (ascx files).<br />
		    The user controls will expose the properties / methods needed for the interaction with the underlying Interface Controls.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>