<%@ Page AspCompat="true" Inherits="EM_Examples.horizontal_7" Src="cs_horizontal_7.cs" CodeBehind="cs_horizontal_7.cs" Language="c#" AutoEventWireup="false" %>

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
	<!--// Needed styles for the table cells (the head of the menus) //-->
	<style type="text/css">
	    .menu .gagf {width:5px;background-image:url(styles/horizontal7/gagf.gif);background-repeat:no-repeat;background-position:0 0;}
	    .menu .gagl {width:5px;background-image:url(styles/horizontal7/gagl.gif);background-repeat:no-repeat;background-position:0 0;}
	</style>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Codebehind Example - Horizontal 7</b></span>
		    <br /><br />	
			<br /><br />
	
	    <!--// This is where the head of the menus (the parent menu) will appear //-->
	    <table cellpadding="0" cellspacing="0" class="menu">
		    <tr>
			    <td class="gagf"><div></div></td>
			    <td>
				    <asp:PlaceHolder ID="placeHolder1" runat="server"></asp:PlaceHolder>
			    </td>
			    <td class="gagl"><div></div></td>
		    </tr>
	    </table>
	   
	   <br /><br /><br /><br />
	   
	   <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
	
	    </form>
    </body>
</html>