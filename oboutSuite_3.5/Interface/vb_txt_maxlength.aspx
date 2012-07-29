<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim txt1 As OboutTextBox
    Dim txt2 As OboutTextBox
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        txt1 = New OboutTextBox()
        txt1.ID = "txt1"
        txt1.Width = Unit.Pixel(150)
        txt1.FolderStyle = "styles/grand_gray/OboutTextBox"
        txt1.MaxLength = 10

        txtPlaceHolder1.Controls.Add(txt1)

        txt2 = New OboutTextBox()
        txt2.ID = "txt1"
        txt2.Width = Unit.Pixel(150)
        txt2.FolderStyle = "styles/grand_gray/OboutTextBox"
        txt2.MaxLength = 5

        txtPlaceHolder2.Controls.Add(txt2)
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
		
		<span class="tdText"><b>obout Interface - OboutTextBox - MaxLength property</b></span>
		
		<br /><br />
		
		<span class="tdText"> MaxLength="10"</span><br />
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder1" />
		
		<br />
		
	    <span class="tdText"> MaxLength="5"</span><br />
	    <asp:PlaceHolder runat="server" ID="txtPlaceHolder2" />
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>MaxLength</b> property to specify the maximum number of characters that can be typed into the textbox. 
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>