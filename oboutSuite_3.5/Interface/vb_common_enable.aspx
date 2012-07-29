<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim btn1 As OboutButton
    Dim chk1 As OboutCheckBox
    Dim ddl1 As OboutDropDownList
    Dim rbtn1 As OboutRadioButton
    Dim rbtn2 As OboutRadioButton
    Dim txt1 As OboutTextBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        btn1 = New OboutButton()
        btn1.ID = "btn1"
        btn1.Width = Unit.Pixel(200)
        btn1.Text = "Click Me!"

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
        
        rbtn1 = new OboutRadioButton()
        rbtn1.ID = "rbtn1"
        rbtn1.Text = "Option 1"
        rbtn1.GroupName = "SomeGroup"

        rbtnPlaceHolder1.Controls.Add(rbtn1)

        rbtn2 = new OboutRadioButton()
        rbtn2.ID = "rbtn2"
        rbtn2.Text = "Option 2"
        rbtn2.GroupName = "SomeGroup"

        rbtnPlaceHolder2.Controls.Add(rbtn2)

        txt1 = New OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(200)
        txt1.Text = "Some text ..."

        txtPlaceHolder.Controls.Add(txt1)
    End Sub
    
    Sub Disable(ByVal sender As Object, ByVal e As EventArgs)
        btn1.Enabled = False
        chk1.Enabled = False
        ddl1.Enabled = False
        rbtn1.Enabled = False
        rbtn2.Enabled = False
        txt1.Enabled = False
    End Sub

    Sub Enable(ByVal sender As Object, ByVal e As EventArgs)
        btn1.Enabled = True
        chk1.Enabled = True
        ddl1.Enabled = True
        rbtn1.Enabled = True
        rbtn2.Enabled = True
        txt1.Enabled = True
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
			
			.btn 
			{
			    font: 11px Verdana;
				color: #333333;
				width: 150px;
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
		<script type="text/javascript">
		    function disable() {
		        btn1.disable();
		        chk1.disable();
		        ddl1.disable();
		        rbtn1.disable();
		        rbtn2.disable();
		        txt1.disable();
		    }

		    function enable() {
		        btn1.enable();
		        chk1.enable();
		        ddl1.enable();
		        rbtn1.enable();
		        rbtn2.enable();
		        txt1.enable();
		    }
        </script>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - Enable / Disable</b></span>
		
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
		
		<input type="button" class="btn" value="Disable on client-side" onclick="disable()" />&#160;<input type="button" class="btn" value="Enable on client-side" onclick="enable()" />
		
		<br />
		
		<asp:Button runat="server" CssClass="btn" Text="Disable on server-side" OnClick="Disable" />&#160;<asp:Button runat="server" CssClass="btn" Text="Enable on server-side" OnClick="Enable"/>
		
		<br /><br /><br />
		
		<span class="tdText">
		    To enable / disable the controls on the client-side, use the <span class="option2">enable</span> / <span class="option2">disable</span> methods.<br />
		    On the server-side, use the <b>Enabled</b> property.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>