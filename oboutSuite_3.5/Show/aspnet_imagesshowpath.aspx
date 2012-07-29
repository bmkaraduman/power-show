<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
			.showContainer
			{
				padding:7px;
				width:180px;
				height:180px;
				border:1px solid silver;
			}
			.tdText
			    {
				    font:11px Verdana;
			        color:#333333;
			    }
		</style>
	</head>
	<body>
		 <form id="Form1" runat="server">
	
		     <span class="tdText"><b>ASP.NET Show - Images show from folder</b></span>
	         <br /><br /><br />

		    You can specify the path to a folder with images. <br />
		    All the images will be loaded as panels into the show. Supported images types are 'jpg', 'gif' and 'png'. <br /><br />
    		
		    <div class="showContainer">
			<obshow:Show id="Show1" runat="server" ImagesShowPath="images/members" Width="180" Height="180" ShowType="show" TransitionType="QuickScroll" />
		</div>
		<br /><br />
		<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
	</body>
</html>
	
