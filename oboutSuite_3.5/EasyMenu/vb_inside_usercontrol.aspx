<%@ Page language="vb" %>
<%@ Register TagPrefix="uc1" TagName="vb_inside_usercontrol" Src="vb_inside_usercontrol.ascx" %>

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
		<!--
		If you want to run this example from VS.NET project you need to change in file horizontal_1UC.ascx 
		the Page directive attribute from "Src" to "CodeBehind"
		-->
	</head>
	<body>
		<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal 1 skin inside User Control</b></span>
		    <br /><br />	
			<br /><br /> 
		    <!--// This is where the head of the menus (the parent menu) will appear //-->
		    Easy Menu inside User Control
		    <div style="border:1px solid black;width:350px;padding:30px">
			    <uc1:vb_inside_usercontrol id="Horizontal_11" runat="server"></uc1:vb_inside_usercontrol>
		    </div>
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    <br />
		    If you want to run this example from VS.NET project you need to change in file vb_inside_usercontrol.ascx the following line
		    <br />
		    <br />
		    <i style="background-color:yellow">&lt;%@ Control Language="vb" <b>Src</b>="vb_inside_usercontrol.ascx.vb" Inherits="EM_Examples.vb_inside_usercontrol" %&gt;</i>
		    <br />
		    <br />
		    to
		    <br />
		    <br />
		    <i style="background-color:yellow">&lt;%@ Control Language="vb" <b>CodeBehind</b>="vb_inside_usercontrol.ascx.vb" Inherits="EM_Examples.vb_inside_usercontrol" %&gt;</i>
		    
		    <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
		</form>
	</body>
</html>
