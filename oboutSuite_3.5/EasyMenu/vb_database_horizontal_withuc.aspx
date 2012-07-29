<%@ Page language="VB" %>
<%@ Register TagPrefix="uc1" TagName="vb_inside_usercontrol" Src="vb_database_horizontal_uc.ascx" %>

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
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal 1 skin inside User Control - menu build from database</b></span>
		    <br /><br />	
			<br /><br />
		
		    Easy Menu from database inside User Control
		    <div style="border:1px solid black;width:400px;padding:30px">
			    <uc1:vb_inside_usercontrol id="Horizontal_11" runat="server"></uc1:vb_inside_usercontrol>
		    </div>	
		    
		    <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
		
		</form>	
	</body>
</html>
