<%@ Page Language="VB" Src="vb_windowsxp.aspx.vb" Inherits="vb_windowsxp" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Easy Menu examples</title>
	
	    <!--// Only needed for this page's formatting //-->
	    <style type="text/css">
		    body 
		    {
		        font-family: Verdana;
		        font-size: XX-Small; 
		        margin: 20px;
		     }
		    .title 
		    {
		        font-size: X-Large; 
		        padding: 20px; 
		        border-bottom: 2px solid gray;
		    }
		    .tdText {
                    font:11px Verdana;
                    color:#333333;
            }
			.div {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		    }
	    </style>
	</head>
	<body>
		<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - WindowsXP skin</b></span>
		    <br /><br />	
			<br /><br />
		
		    <span class="tdText">Right click this to see the Easy Menu</span>

		    <!--// Div to which the menu attaches to //-->
		    <div id="div1" class="div"></div>
    		
		    <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
	        
	        <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
		
		</form>
	</body>
</html>