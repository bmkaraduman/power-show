<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{
        if (!this.IsPostBack)
        {
            ChangeStyle(this, new EventArgs());
        }
	}

	void ChangeStyle(object sender, EventArgs e)
	{
        btn1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutButton";
        chk1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutCheckBox";
        ddl1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutDropDownList";
        rbtn1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutRadioButton";
        rbtn2.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutRadioButton";
        txt1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutTextBox";
        ta1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutTextBox";
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
		
		<br /><br />				
		
		<span class="tdText"><b>obout Interface - Style Gallery</b></span>
		
		<br /><br />
		
		<table>
		    <tr>
		        <td valign="top">
		            <span class="tdText">Change the style:</span>
		        </td>
		        <td>
		            <asp:ListBox ID="ddlStyles" Rows="4" runat="server" OnSelectedIndexChanged="ChangeStyle"  AutoPostBack="true" CssClass="tdText">
			            <asp:ListItem Value="black_glass" Selected="True">black_glass</asp:ListItem>
			            <asp:ListItem Value="grand_gray">grand_gray</asp:ListItem>
			            <asp:ListItem Value="premiere_blue">premiere_blue</asp:ListItem>
                        <asp:ListItem Value="plain">plain</asp:ListItem>
		            </asp:ListBox>
		        </td>
		    </tr>						
		</table>
		
		<br /><br />
		
		<span class="tdText">Button:</span><br />
		<obout:OboutButton runat="server" ID="btn1" Width="200" Text="Press Me!" />
		
		<br /><br />
		
		<span class="tdText">CheckBox:</span><br />
		<obout:OboutCheckBox runat="server" ID="chk1" Text="Select Me!" />
		
		<br /><br />
		
		<span class="tdText">DropDownList:</span><br />
		<obout:OboutDropDownList runat="server" ID="ddl1" Width="200">
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
		<obout:OboutTextBox runat="server" ID="txt1" Width="200" Text="Some text" />
		
		<br /><br />
		
		<span class="tdText">MultiLine TextBox:</span><br />
		<obout:OboutTextBox runat="server" ID="ta1" Width="200" Height="150" TextMode="MultiLine" Text="Some text" />
		
		<br /><br /><br />
		
		<span class="tdText">The styles can be switched very easily using the <b>FolderStyle</b> property.</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>