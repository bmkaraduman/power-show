<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim btn1 As OboutButton
    Dim chk1 As OboutCheckBox
    Dim ddl1 As OboutDropDownList
    Dim rbtn1 As OboutRadioButton
    Dim rbtn2 As OboutRadioButton
    Dim txt1 As OboutTextBox
    Dim ta1 As OboutTextBox
	
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        btn1 = New OboutButton()
        btn1.ID = "btn1"
        btn1.Width = Unit.Pixel(200)
        btn1.Text = "Press Me!"
        
        btnPlaceHolder.Controls.Add(btn1)
        
        chk1 = New OboutCheckBox()
        chk1.ID = "chk1"
        chk1.Text = "Select Me!"
        
        chkPlaceHolder.Controls.Add(chk1)
        
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)

        ddl1.Items.Add(New ListItem("Item 1"))
        ddl1.Items.Add(New ListItem("Item 2"))
        ddl1.Items.Add(New ListItem("Item 3"))
        ddl1.Items.Add(New ListItem("Item 4"))
        ddl1.Items.Add(New ListItem("Item 5"))
        ddl1.Items.Add(New ListItem("Item 6"))
        ddl1.Items.Add(New ListItem("Item 7"))
        ddl1.Items.Add(New ListItem("Item 8"))
        ddl1.Items.Add(New ListItem("Item 9"))
        ddl1.Items.Add(New ListItem("Item 10"))

        ddlPlaceHolder.Controls.Add(ddl1)
        
        rbtn1 = New OboutRadioButton()
        rbtn1.ID = "rbtn1"
        rbtn1.Text = "Option 1"
        rbtn1.GroupName = "SomeGroup"
        
        rbtnPlaceHolder1.Controls.Add(rbtn1)

        rbtn2 = New OboutRadioButton()
        rbtn2.ID = "rbtn2"
        rbtn2.Text = "Option 2"
        rbtn2.GroupName = "SomeGroup"

        rbtnPlaceHolder2.Controls.Add(rbtn2)
       
        txt1 = New OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(200)

        txtPlaceHolder.Controls.Add(txt1)
        
        ta1 = New OboutTextBox()
        ta1.ID = "ta1"
        ta1.Width = Unit.Pixel(200)
        ta1.Height = Unit.Pixel(100)
        ta1.TextMode = TextBoxMode.MultiLine

        taPlaceHolder.Controls.Add(ta1)
        
        If Not IsPostBack Then
            ChangeStyle(Me, New EventArgs())
        End If
    End Sub

    Sub ChangeStyle(ByVal sender As Object, ByVal e As EventArgs)
        btn1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutButton"
        chk1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutCheckBox"
        ddl1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutDropDownList"
        rbtn1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutRadioButton"
        rbtn2.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutRadioButton"
        txt1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutTextBox"
        ta1.FolderStyle = "styles/" + ddlStyles.SelectedValue + "/OboutTextBox"
    End Sub

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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>