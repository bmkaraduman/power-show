<%@ Page Language="C#" %>
<%@ Register Src="aspnet_insideusercontrol.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
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
	<body style="width:100%;height:100%">
		<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal 1 skin inside User Control</b></span>
		    <br /><br />	
			<br /><br /> 
			
			Easy Menu inside User Control
			<div style="border:1px solid black;width:350px;padding:30px">
				<uc1:WebUserControl ID="WebUserControl1" runat="server" />
			</div>
			
			<br /><br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
			
		</form>
	</body>
</html>
