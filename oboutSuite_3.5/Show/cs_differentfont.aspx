<%@ Page Language="C#" Inherits="cs_differentfont" Src="cs_differentfont.aspx.cs" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.title
		{
			color:crimson;
			font-size:14px;
			font-weight:bold;
		}
		body
		{
			font-family:Tahoma;
			font-size:12px;
		}
		.simpleText1
		{
			font-size:14px;
			font-family:Verdana;
			font-weight:bold;
		}
		.simpleText2
		{
			font-size:13px;
			font-family:Arial;
		}
		.tdText {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - With different font content</b></span>
		    <br /><br />
		
		    <obshow:Show id="Show1" runat="server">
		    <Panels>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td>
							    <a href="http://www.obout.com/em/">
								    <img src="images/components/easymenu.jpg" border="0" />
							    </a>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:20px;" valign="top">
							    <span class="title">ASP.NET EasyMenu </span>
							    <br />
							    <br />
							    <div class="simpleText1">
							    <ul>
								    <li>Fully programmable.</li>
								    <li>Can work from database.</li>
								    <li>Links are accessible to search engine spiders.</li>
								    <li>Cross-browser: IE, Netscape Navigator, Mozilla Firefox, Opera, Safari, etc.</li>
							    </ul>
							    </div>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td>
							    <a href="http://www.obout.com/tcm/">
								    <img src="images/components/tcm.jpg" border="0" />
							    </a>					
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:20px;" valign="top">
							    <span class="title">Two Colors Menu</span>
							    <br />
							    <br />
							    <div class="simpleText2">
							    <ul>
								    <li>Simplest menu in the world.</li>
								    <li>No menu builders.</li>
								    <li>Populated declaratively or with a few lines of code.</li>
								    <li>Can work from database.</li>
								    <li>100% compatible with search engine web crawlers.</li>
							    </ul>
							    </div>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
		    </Panels>
	    </obshow:Show>	
    	
	    <br /><br /><br />
    		    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>

		</form>
	</body>
</html>
