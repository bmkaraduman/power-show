<%@ Page Inherits="cs_postback" Src="vb_postback.aspx.vb" Language="vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	
	<!--// Only needed for this page's formatting //-->
	<style>
		.tdText {
				    font:11px Verdana;
				    color:#333333;
			    }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
        <span class="tdText"><b>ASP.NET Easy Menu - Postback persistance</b></span>
	    <br /><br />	
		<br /><br />
		
	    <span class="tdText">Hover these to see the menus.</span><br><br>
	    <!--// This is where the head of the menus (the parent menu) will appear //-->
	    <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
	    <br />
	    <br />
	    <br />
	    <span class="tdText">
	    Click this button to make a postback.<br />
	    Menu is persistent on page postback.</span><br /><br />
	    <asp:Button id="btnPostback" runat="server" Text="Postback" />
	    
        <br /><br /><br /><br />
	    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	
	</form>
	</body>
</html>