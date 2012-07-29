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
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Enable specific states</b></span>
		
		<br /><br />
		
		<span class="tdText">Enabled states: Normal, Over, Focused, Pressed</span><br />
		<obout:OboutImageButton runat="server" ID="OboutImageButton1"
		    ImageUrl="images/ok_normal.gif" ImageUrl_Over="images/ok_over.gif"
		    ImageUrl_Focused="images/ok_focused.gif" ImageUrl_Pressed="images/ok_pressed.gif"
		     />
		     
		<br /><br />
		
		<span class="tdText">Enabled states: Normal, Over</span><br />
		<obout:OboutImageButton runat="server" ID="OboutImageButton2"
		    ImageUrl="images/buy_normal.gif" ImageUrl_Over="images/buy_over.gif"
		     />
		
        <br /><br />
        
        <span class="tdText">Enabled states: Normal, Focused</span><br />
		<obout:OboutImageButton runat="server" ID="OboutImageButton3"
		    ImageUrl="images/ICQ_normal.gif" ImageUrl_Focused="images/ICQ_focused.gif"
		     />
		
        <br /><br />
		
		<span class="tdText">
		    You can enable the specific states of the button, using the <b>ImageUrl</b>, <b>ImageUrl_Over</b>, <b>ImageUrl_Focused</b> and <b>ImageUrl_Pressed</b> properties.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>