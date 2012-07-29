<%@ Page Language="C#" Theme="InterfaceTheme"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{
        if (!this.IsPostBack)
        {
          
        }
	}

	
</script>

<html>
	<head runat="server">
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
		
		<br />				
		
		<span class="tdText"><b>ASP.NET Interface Controls - Customize using ASP.NET Themes/Skins </b></span>
		
		<br /><br />
		
		<span class="tdText">Button:</span><br />
		<obout:OboutButton runat="server" ID="btn1" Text="Press Me!" />
		
		<br /><br />
		
		<span class="tdText">CheckBox:</span><br />
		<obout:OboutCheckBox runat="server" ID="chk1" Text="Select Me!" />
		
		<br /><br />
		
		<span class="tdText">DropDownList:</span><br />
		<obout:OboutDropDownList runat="server" ID="ddl1">
		    <asp:ListItem>Item 1</asp:ListItem>
		    <asp:ListItem>Item 2</asp:ListItem>
		    <asp:ListItem>Item 3</asp:ListItem>
		    <asp:ListItem>Item 4</asp:ListItem>
		    <asp:ListItem>Item 5</asp:ListItem>
		    <asp:ListItem>Item 6</asp:ListItem>
		    <asp:ListItem>Item 7</asp:ListItem>
		    <asp:ListItem>Item 8</asp:ListItem>
		    <asp:ListItem>Item 9</asp:ListItem>
		    <asp:ListItem>Item 10</asp:ListItem>
		</obout:OboutDropDownList>
		
		<br /><br />
		
		<span class="tdText">RadioButton:</span><br />
		<obout:OboutRadioButton runat="server" ID="rbtn1" Text="Option 1" GroupName="SomeGroup" /> &#160;
		<obout:OboutRadioButton runat="server" ID="rbtn2" Text="Option 2" GroupName="SomeGroup" />
		
		<br /><br />
		
		<span class="tdText">TextBox:</span><br />
		<obout:OboutTextBox runat="server" ID="txt1" Text="Some text" />
		
		<br /><br />
		
		<span class="tdText">MultiLine TextBox:</span><br />
		<obout:OboutTextBox runat="server" ID="ta1" TextMode="MultiLine" Text="Some text" />
		
		<br /><br />
		
		<span class="tdText">The ASP.NET Interface Controls can be customized using ASP.NET Themes/Skins. It is recommended to use
        this approach, <br />so that you keep the common settings for all the interface controls in your project in a single
        location (in the .skin file). <br />Thus, each time you need to propagate a change related to the controls in all the pages of your project, you need to modify <br />a single file, which saves time and prevents you from generating bugs.</span>
		
		<br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>