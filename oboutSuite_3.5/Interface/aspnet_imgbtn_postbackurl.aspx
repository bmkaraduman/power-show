<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Using the PostBackUrl Property</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="OboutTextBox1" FolderStyle="styles/premiere_blue/OboutTextBox" Text="Some Text"  />
		
		<br /><br />
		
		<obout:OboutImageButton runat="server" ID="OboutImageButton1" 
		    PostBackUrl="aspnet_imgbtn_postbackurl_target.aspx"
		    ImageUrl="images/ok_normal.gif" ImageUrl_Over="images/ok_over.gif"
		    ImageUrl_Focused="images/ok_focused.gif" ImageUrl_Pressed="images/ok_pressed.gif"
		     />
		
        <br /><br />
		
		<span class="tdText">
		    To post the form to a different page, specify that page using the <b>PostBackUrl</b> property.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>