<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	    <title>obout ASP.NET Show examples</title>
		<style type="text/css">
	    .tdText {
			    font:11px Verdana;
			    color:#333333;
        }
		.panelTable
		{
			border:1px solid #cccccc;
			
			padding:7px;
			height:135px;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.panelTable2
		{
			border:1px solid crimson;
			
			padding:7px;
			height:135px;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.imageText
		{
			color:#CCCCCC;
			font-weight:bold;
			font-size:15px;
		}
		.imageText2
		{
			color:crimson;
			font-weight:bold;
			font-size:15px;
		}
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Show -  Multiple Shows with different styles on the same page</b></span>
	
		<br />
		<br /><br />
				<obshow:Show StyleFolder="styles/style7" id="Show1" runat="server" Width="370" Height="185" ShowType="manual" ManualChanger="true" TransitionType="fading">
					<Changer Height="30" Type="Both"></Changer>
					<Panels>
						<obshow:Panel>
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree1.jpg" alt="Panel 1 image" border="0" /><br />
										<span class="imageText2">Image 1</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										<h4>Panel 1 content</h4>
										<h5>Panel 1 content</h5>
										<h6>Panel 1 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
						<obshow:Panel>
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree2.jpg" alt="Panel 2 image" border="0" /><br />
										<span class="imageText2">Image 2</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										<h4>Panel 2 content</h4>
										<h5>Panel 2 content</h5>
										<h6>Panel 2 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
						<obshow:Panel Selected="true">
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree3.jpg" alt="Panel 3 image" border="0" /><br />
										<span class="imageText2">Image 3</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										<h4>Panel 3 content</h4>
										<h5>Panel 3 content</h5>
										<h6>Panel 3 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
						<obshow:Panel>
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree4.jpg" alt="Panel 4 image" border="0" /><br />
										<span class="imageText2">Image 4</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										<h4>Panel 4 content</h4>
										<h5>Panel 4 content</h5>
										<h6>Panel 4 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
						<obshow:Panel Selected="false">
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree5.jpg" alt="Panel 5 image" border="0" /><br />
										<span class="imageText2">Image 5</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">									
										<h4>Panel 5 content</h4>
										<h5>Panel 5 content</h5>
										<h6>Panel 5 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
						<obshow:Panel Selected="false">
							<table class="panelTable2">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/tree6.jpg" alt="Panel 6 image" border="0" /><br />
										<span class="imageText2">Image 6</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
										<h4>Panel 6 content</h4>
										<h5>Panel 6 content</h5>
										<h6>Panel 6 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
					</Panels>
				</obshow:Show>	
				<br /><br /><br /><br />
				<obshow:Show 
					CSSPath="styles/style5_1/style.css" CSSShowPanelsHolder="ob_show_panelsholder_1" CSSShowPanel="ob_show_panel_1" CSSShowChanger="ob_show_changer_1" 
					CSSShowChangerNumber="ob_show_changernumber_1" CSSShowChangerNumberOver="ob_show_changernumber_over_1" CSSShowChangerNumberSelected="ob_show_changernumber_selected_1"
					CSSShowChangerPlay="ob_show_changerplay_1" CSSShowChangerPlayOver="ob_show_changerplay_over_1" CSSShowChangerPause="ob_show_changerpause_1" CSSShowChangerPauseOver="ob_show_changerpause_over_1"
					CSSShowChangerLeft="ob_show_changerleft_1" CSSShowChangerLeftOver="ob_show_changerleft_over_1" CSSShowChangerRight="ob_show_changerright_1" CSSShowChangerRightOver="ob_show_changerright_over_1"
					CSSShowChangerTop="ob_show_changertop_1" CSSShowChangerTopOver="ob_show_changertop_over_1" CSSShowChangerBottom="ob_show_changerbottom_1" CSSShowChangerBottomOver="ob_show_changerbottom_over_1"
					id="Show2" runat="server" Width="370" Height="185" ShowType="manual" ManualChanger="true" TransitionType="fading">
					<Changer Height="30" Type="Both"></Changer>
					<Panels>
						<obshow:Panel>
							<table class="panelTable">
								<tr>
									<td style="padding-top:7px" class="tdText">
										<img src="images/mixed2/bridge1.jpg" alt="Panel 1 image" border="0" /><br />
										<span class="imageText">Image 1</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
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
										<img src="images/mixed2/bridge2.jpg" alt="Panel 2 image" border="0" /><br />
										<span class="imageText">Image 2</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
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
										<img src="images/mixed2/bridge3.jpg" alt="Panel 3 image" border="0" /><br />
										<span class="imageText">Image 3</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
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
										<img src="images/mixed2/bridge4.jpg" alt="Panel 4 image" border="0" /><br />
										<span class="imageText">Image 4</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
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
										<img src="images/mixed2/bridge5.jpg" alt="Panel 5 image" border="0" /><br />
										<span class="imageText">Image 5</span>
									</td>
									<td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">									
										<h4>Panel 5 content</h4>
										<h5>Panel 5 content</h5>
										<h6>Panel 5 content</h6>
									</td>
								</tr>
							</table>
						</obshow:Panel>
					</Panels>
				</obshow:Show>	
	        <br /><br /><br />
		
		   <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
    </body>
</html>