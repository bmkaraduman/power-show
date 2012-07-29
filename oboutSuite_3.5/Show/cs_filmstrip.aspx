<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>
<%@ Page Language="C#" Src="cs_filmstrip.aspx.cs" Inherits="cs_filmstrip" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
.panelDiv
{
	background-color:#cccccc;
	padding:7px;
}
.imageText
{
	color:#CCCCCC;
	font-weight:bold;
	font-size:15px;
}
.title
{
	font-size:16px;
	font-weight:bold;
	color:#6B89AF;
	display:block;
}
.content
{
}
.tdText {
    font:11px Verdana;
    color:#333333;
}
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Film strip </span>
		    <br /><br />
		
	        <table align="center">
		        <tr>
			        <td>
				        <obshow:Show id="Show1" runat="server">
				        <Changer />
				        <Panels>
					        <obshow:Panel>
						        <div align="center">
							        <table cellspacing="0" cellpadding="17" background="images/filmstrip/filmstrip_resize.jpg">
								        <tr>
									        <td>
										        <table cellspacing="0" cellpadding="2">
											        <tr>
												        <td class="tdText">
													        <img src="images/flowers/P1020291_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1010914_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1010921_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020003_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
											        </tr>
										        </table>
									        </td>
								        </tr>
							        </table>
						        </div>
					        </obshow:Panel>
					        <obshow:Panel>
						        <div align="center">
							        <table cellspacing="0" cellpadding="17" background="images/filmstrip/filmstrip_resize.jpg">
								        <tr>
									        <td>
										        <table cellspacing="0" cellpadding="2">
											        <tr>
												        <td class="tdText">
													        <img src="images/flowers/P1020294_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020162_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020159_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020153_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
											        </tr>
										        </table>
									        </td>
								        </tr>
							        </table>
						        </div>
					        </obshow:Panel>
					        <obshow:Panel>
						        <div align="center">
							        <table cellspacing="0" cellpadding="17" background="images/filmstrip/filmstrip_resize.jpg">
								        <tr>
									        <td>
										        <table cellspacing="0" cellpadding="2">
											        <tr>
												        <td class="tdText">
													        <img src="images/flowers/P1020151_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020147_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020145_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
												        <td class="tdText">
													        <img src="images/flowers/P1020143_resize.JPG" alt="slide 1 image" border="1" />
												        </td>
											        </tr>
										        </table>
									        </td>
								        </tr>
							        </table>
						        </div>
					        </obshow:Panel>
				        </Panels>
			        </obshow:Show>	
			        </td>
		        </tr>
		        <tr>
			        <td align="left" class="tdText">
			        </td>
		        </tr>
	        </table>
	        
		    <br /><br /><br />
        		
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
	        
	    </form>    
	</body>
</html>