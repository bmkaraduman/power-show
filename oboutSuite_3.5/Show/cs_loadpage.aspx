<%@ Page Language="C#" Src="cs_loadpage.aspx.cs" Inherits="cs_loadpage" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.showContainer
		{
			padding:7px;
			width:370px;
			border:1px solid #cccccc;
		}
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		.tdText {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Load page inside panel </span>
		    <br /><br />
		
		    <div class="showContainer">
			    <asp:PlaceHolder ID="PlaceHolder1" runat="server" />
	        </div>
    	
		    <br /><br /><br />
		    
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>

	    </form>
	</body>
</html>
	
