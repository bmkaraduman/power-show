<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Page Language="vb" Src="vb_timebetweenpanels.aspx.vb" Inherits="vb_timebetweenpanels" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
			border:1px solid #cccccc;
			padding:7px;
			height:165px;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showContainer
		{
			padding:7px;
			width:370px;
			border:0px solid red;
		}
		.imageText
		{
			color:#CCCCCC;
			font-weight:bold;
			font-size:15px;
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
        <span class="tdText"><b>ASP.NET Show - Time between panels </b></span>
	    <br /><br />
		
		<div class="showContainer">
	    <obshow:Show id="Show1" runat="server">
		    <Panels>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/bridge/bridge1.jpg" alt="Panel 1 image" border="0" /><br />
							    <span class="imageText">Image 1</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 1 content</h3>
							    <h4>Panel 1 content</h4>
							    <h5>Panel 1 content</h5>
							    <h6>Panel 1 content</h6>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/bridge/bridge2.jpg" alt="Panel 2 image" border="0" /><br />
							    <span class="imageText">Image 2</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 2 content</h3>
							    <h4>Panel 2 content</h4>
							    <h5>Panel 2 content</h5>
							    <h6>Panel 2 content</h6>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel Selected="true">
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/bridge/bridge3.jpg" alt="Panel 3 image" border="0" /><br />
							    <span class="imageText">Image 3</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 3 content</h3>
							    <h4>Panel 3 content</h4>
							    <h5>Panel 3 content</h5>
							    <h6>Panel 3 content</h6>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/bridge/bridge4.jpg" alt="Panel 4 image" border="0" /><br />
							    <span class="imageText">Image 4</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 4 content</h3>
							    <h4>Panel 4 content</h4>
							    <h5>Panel 4 content</h5>
							    <h6>Panel 4 content</h6>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel Selected="false">
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/bridge/bridge5.jpg" alt="Panel 5 image" border="0" /><br />
							    <span class="imageText">Image 5</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 5 content</h3>
							    <h4>Panel 5 content</h4>
							    <h5>Panel 5 content</h5>
							    <h6>Panel 5 content</h6>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
		    </Panels>
	    </obshow:Show>	
	    </div>
	    <table style="width:370px;">
		    <tr>
			    <td class="tdText" align="left" style="padding-left:8px;">
				    Time between panels transition: 
				    <select onchange="Show1.TimeBetweenPanels = this.value">
					    <option value="10">10</option>
					    <option value="100">100</option>
					    <option value="1000">1000</option>
					    <option value="3000" selected="true">3000</option>
					    <option value="5000">5000</option>
				    </select>
				    milliseconds
			    </td>
		    </tr>
	    </table>
	
		<br /><br /><br />
		
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VBNET">« Back to examples</a>

	    </form>
	</body>
</html>
	
