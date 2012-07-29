<%@ Page Inherits="vb_horizontal_1" Src="vb_horizontal_1.vb" CodeBehind="vb_horizontal_1.vb" Language="vb" %>

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
       </style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Codebehind Example - Horizontal 1</b></span>
		    <br /><br />	
			<br /><br />
	
	        Hover these to see the menus.<br><br>
	        <!--// This is where the head of the menus (the parent menu) will appear //-->
	        <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
	        
	        <br /><br /><br /><br />
        	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	</form>
</body>
</html>