<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim OboutImageButton1 As OboutImageButton
    Dim OboutImageButton2 As OboutImageButton
    Dim OboutImageButton3 As OboutImageButton
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutImageButton1 = New OboutImageButton()
        OboutImageButton1.ID = "OboutImageButton1"
        OboutImageButton1.ImageUrl = "images/ok_normal.gif"
        OboutImageButton1.ImageUrl_Over = "images/ok_over.gif"
        OboutImageButton1.ImageUrl_Focused = "images/ok_focused.gif"
        OboutImageButton1.ImageUrl_Pressed = "images/ok_pressed.gif"

        PlaceHolder1.Controls.Add(OboutImageButton1)
        
        OboutImageButton2 = New OboutImageButton()
        OboutImageButton2.ID = "OboutImageButton2"
        OboutImageButton2.ImageUrl = "images/buy_normal.gif"
        OboutImageButton2.ImageUrl_Over = "images/buy_over.gif"

        PlaceHolder2.Controls.Add(OboutImageButton2)
        
        OboutImageButton3 = New OboutImageButton()
        OboutImageButton3.ID = "OboutImageButton3"
        OboutImageButton3.ImageUrl = "images/ICQ_normal.gif"
        OboutImageButton3.ImageUrl_Focused = "images/ICQ_focused.gif"

        PlaceHolder3.Controls.Add(OboutImageButton3)
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
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Enable specific states</b></span>
		
		<br /><br />
		
		<span class="tdText">Enabled states: Normal, Over, Focused, Pressed</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
        <br /><br />
        
        <span class="tdText">Enabled states: Normal, Over</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		    
        <br /><br />
        
        <span class="tdText">Enabled states: Normal, Focused</span><br />
		<asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		    
        <br /><br />
		
		<span class="tdText">
		    You can enable the specific states of the button, using the <b>ImageUrl</b>, <b>ImageUrl_Over</b>, <b>ImageUrl_Focused</b> and <b>ImageUrl_Pressed</b> properties.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>