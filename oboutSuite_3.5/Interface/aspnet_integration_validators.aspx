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
		
		<span class="tdText"><b>obout Interface - Validate using ASP.NET Validators</b></span>
		
		<br /><br />
		
		<span class="tdText">DropDownList:</span><br />
		<obout:OboutDropDownList runat="server" ID="ddl1" Width="200">
		    <asp:ListItem>Select an item ...</asp:ListItem>
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		</obout:OboutDropDownList>
		
		<asp:RequiredFieldValidator runat="server" ControlToValidate="ddl1" 
		    ErrorMessage="Please select an item" InitialValue="Select an item ..."
		    Display="Dynamic" CssClass="validator" />
		
		<br /><br />
		
		<span class="tdText">TextBox:</span><br />
		<obout:OboutTextBox runat="server" ID="txt1" Width="200" Text="" />
		
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt1" 
		    ErrorMessage="Please type some text"
		    Display="Dynamic" CssClass="validator" />
		
		<br /><br />
		
		<obout:OboutButton runat="server" Text="Validate" /> <obout:OboutButton runat="server" Text="Skip Validation" CausesValidation="false" />
		
		<br /><br /><br />
		
		<span class="tdText">
		    The Interface controls can be validated using ASP.NET validators. <br />
		    For the OboutButton, you can use the <b>CausesValidation</b> and <b>ValidationGroup</b> properties to customize the validation process.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>