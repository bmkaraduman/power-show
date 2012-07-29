<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim OboutImageButton1 As OboutImageButton
    Dim OboutImageButton2 As OboutImageButton
    Dim OboutTextBox1 As OboutTextBox
    Dim OboutTextBox2 As OboutTextBox
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutTextBox1 = new OboutTextBox()
        OboutTextBox1.ID = "OboutTextBox1"
        OboutTextBox1.FolderStyle = "styles/premiere_blue/OboutTextBox"

        PlaceHolder1.Controls.Add(OboutTextBox1)
        
        OboutTextBox2 = new OboutTextBox()
        OboutTextBox2.ID = "OboutTextBox2"
        OboutTextBox2.FolderStyle = "styles/premiere_blue/OboutTextBox"

        PlaceHolder2.Controls.Add(OboutTextBox2)
        
        OboutImageButton1 = New OboutImageButton()
        OboutImageButton1.ID = "OboutImageButton1"
        OboutImageButton1.ImageUrl = "images/buy_normal.gif"
        OboutImageButton1.ImageUrl_Over = "images/buy_over.gif"
        OboutImageButton1.ImageUrl_Focused = "images/buy_focused.gif"
        OboutImageButton1.ImageUrl_Pressed = "images/buy_pressed.gif"
                
        AddHandler OboutImageButton1.Click, AddressOf Btn_Click

        PlaceHolder3.Controls.Add(OboutImageButton1)

        OboutImageButton2 = New OboutImageButton()
        OboutImageButton2.ID = "OboutImageButton2"
        OboutImageButton2.ImageUrl = "images/ICQ_normal.gif"
        OboutImageButton2.ImageUrl_Over = "images/ICQ_over.gif"
        OboutImageButton2.ImageUrl_Focused = "images/ICQ_focused.gif"
        OboutImageButton2.ImageUrl_Pressed = "images/ICQ_pressed.gif"

        AddHandler OboutImageButton2.Click, AddressOf Btn_Click

        PlaceHolder4.Controls.Add(OboutImageButton2)
    End Sub
    
    Protected Sub Btn_Click(ByVal sender As Object, ByVal e As ImageClickEventArgs)
        Literal1.Text = "<br /><br />" + CType(sender, OboutImageButton).ID + " has been clicked."
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
		<form id="Form1" runat="server" defaultbutton="OboutImageButton1">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Default Button</b></span>
		
		<br /><br />
				
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<br /><br />				
		    
        <asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder4" />
		  
		<span class="tdText">
		    <asp:Literal runat="server" ID="Literal1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>defaultbutton</b> property of the <b>&lt;form&gt;</b> element to specify the default button of the page.<br />
		    When hitting Enter in any textbox, the default button will be activated.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>