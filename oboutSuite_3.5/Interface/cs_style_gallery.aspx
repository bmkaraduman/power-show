<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="C#" runat="server">
    OboutButton btn1;
    OboutCheckBox chk1;
    OboutDropDownList ddl1;
    OboutRadioButton rbtn1;
    OboutRadioButton rbtn2;
    OboutTextBox txt1;
    OboutTextBox ta1;        
	
    void Page_load(object sender, EventArgs e)		
	{
        btn1 = new OboutButton();
        btn1.ID = "btn1";
        btn1.Width = Unit.Pixel(200);
        btn1.Text = "Press Me!";

        btnPlaceHolder.Controls.Add(btn1);
        
        chk1 = new OboutCheckBox();
        chk1.ID = "chk1";
        chk1.Text = "Select Me!";
        
        chkPlaceHolder.Controls.Add(chk1);
        
        ddl1 = new OboutDropDownList();
        ddl1.ID = "ddl1";
        ddl1.Width = Unit.Pixel(200);

        ddl1.Items.Add(new ListItem("Item 1"));
        ddl1.Items.Add(new ListItem("Item 2"));
        ddl1.Items.Add(new ListItem("Item 3"));
        ddl1.Items.Add(new ListItem("Item 4"));
        ddl1.Items.Add(new ListItem("Item 5"));
        ddl1.Items.Add(new ListItem("Item 6"));
        ddl1.Items.Add(new ListItem("Item 7"));
        ddl1.Items.Add(new ListItem("Item 8"));
        ddl1.Items.Add(new ListItem("Item 9"));
        ddl1.Items.Add(new ListItem("Item 10"));

        ddlPlaceHolder.Controls.Add(ddl1);
        
        rbtn1 = new OboutRadioButton();
        rbtn1.ID = "rbtn1";
        rbtn1.Text = "Option 1";
        rbtn1.GroupName = "SomeGroup";
        
        rbtnPlaceHolder1.Controls.Add(rbtn1);

        rbtn2 = new OboutRadioButton();
        rbtn2.ID = "rbtn2";
        rbtn2.Text = "Option 2";
        rbtn2.GroupName = "SomeGroup";

        rbtnPlaceHolder2.Controls.Add(rbtn2);
        
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);        

        txtPlaceHolder.Controls.Add(txt1);

        ta1 = new OboutTextBox();
        ta1.ID = "ta1";
        ta1.Width = Unit.Pixel(200);
        ta1.Height = Unit.Pixel(100);
        ta1.TextMode = TextBoxMode.MultiLine;

        taPlaceHolder.Controls.Add(ta1);
        
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
		<asp:PlaceHolder runat="server" ID="btnPlaceHolder" />
		
		<br /><br />
		
		<span class="tdText">CheckBox:</span><br />
		<asp:PlaceHolder runat="server" ID="chkPlaceHolder" />
		
		<br /><br />
		
		<span class="tdText">DropDownList:</span><br />
		<asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
		
		<br /><br />
		
		<span class="tdText">RadioButton:</span><br />
		<asp:PlaceHolder runat="server" ID="rbtnPlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="rbtnPlaceHolder2" />
		
		<br /><br />
		
		<span class="tdText">TextBox:</span><br />
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
		
		<br /><br />
		
		<span class="tdText">MultiLine TextBox:</span><br />
		<asp:PlaceHolder runat="server" ID="taPlaceHolder" />
		
		<br /><br /><br />
		
		<span class="tdText">The styles can be switched very easily using the <b>FolderStyle</b> property.</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>