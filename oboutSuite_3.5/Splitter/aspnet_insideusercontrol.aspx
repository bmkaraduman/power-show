<%@ Register Src="aspnet_insideusercontrol.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	    <title>obout ASP.NET Splitter examples</title>
    	   
		<style type="text/css">
            .tdText {
				        font:11px Verdana;
				        color:#333333;
            }
            body
            {
	            font-family:Verdana;
	            margin:0px;
            }
            .text
            {
	            font-size:11px;
	            background-color:#cccccc;
	            text-align:center;
            }
            .textContent
            {
	            font-size:11px;
	            text-align:center;
            }
        </style>
    </head>
    <body>
        <form id="Form1" runat="server">
	        <br />
		    <span class="tdText"><b>ASP.NET Splitter - Inside User Control </b></span>
    	
		    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
	        <div style="width:80%;height:80%;border:1px solid black;">
		        <uc1:WebUserControl ID="WebUserControl1" runat="server" />
	        </div>
        </form>
    </body>
</html>
