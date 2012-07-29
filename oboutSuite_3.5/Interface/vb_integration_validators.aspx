<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim ddl1 As OboutDropDownList
    Dim txt1 As OboutTextBox
    
    Dim OboutButton1 As OboutButton
    Dim OboutButton2 As OboutButton

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ddl1 = New OboutDropDownList()
        ddl1.ID = "ddl1"
        ddl1.Width = Unit.Pixel(200)

        ddl1.Items.Add(New ListItem("Select an item ..."))
        ddl1.Items.Add(New ListItem("Item 1"))
        ddl1.Items.Add(New ListItem("Item 2"))
        ddl1.Items.Add(New ListItem("Item 3"))
        ddl1.Items.Add(New ListItem("Item 4"))
        ddl1.Items.Add(New ListItem("Item 5"))
        ddl1.Items.Add(New ListItem("Item 6"))
        ddl1.Items.Add(New ListItem("Item 7"))
        
        ddlPlaceHolder.Controls.Add(ddl1)

        txt1 = New OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(200)
        
        txtPlaceHolder.Controls.Add(txt1)
        
        OboutButton1 = new OboutButton()
        OboutButton1.Text = "Validate"
        
        PlaceHolder1.Controls.Add(OboutButton1)
        
        OboutButton2 = new OboutButton()
        OboutButton2.Text = "Skip Validation"
        OboutButton2.CausesValidation = false
        
        PlaceHolder2.Controls.Add(OboutButton2)
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
		<asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
		
		<asp:RequiredFieldValidator runat="server" ControlToValidate="ddl1" 
		    ErrorMessage="Please select an item" InitialValue="Select an item ..."
		    Display="Dynamic" CssClass="validator" />
		
		<br /><br />
		
		<span class="tdText">TextBox:</span><br />
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
		
		<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt1" 
		    ErrorMessage="Please type some text"
		    Display="Dynamic" CssClass="validator" />
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<br /><br /><br />
		
		<span class="tdText">
		    The Interface controls can be validated using ASP.NET validators.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>