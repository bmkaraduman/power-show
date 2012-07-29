<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim txt1 As OboutTextBox
    Dim txt2 As OboutTextBox
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        txt1 = new OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(150)
        txt1.WatermarkText = "Username"
        txt1.FolderStyle = "styles/premiere_blue/OboutTextBox"

        PlaceHolder1.Controls.Add(txt1)
        
        txt2 = new OboutTextBox()
        txt2.ID = "txt2"
        txt2.Width = Unit.Pixel(150)
        txt2.WatermarkText = "Password"
        txt2.FolderStyle = "styles/premiere_blue/OboutTextBox"

        PlaceHolder2.Controls.Add(txt2)
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
		
		<span class="tdText"><b>obout Interface - OboutTextBox - WatermarkText property</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
				
		<br /><br />
		
		<span class="tdText">
		    Use the <b>WatermarkText</b> property to set a default text for the text box.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>