<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	private string StyleFolder = "styles/";
	
	void Page_Load(object sender, EventArgs e) {
	
		if (!IsPostBack)
			Show1.StyleFolder = "";
	}
	
	private void ChangeStyle(object sender, System.EventArgs e)
	{
		if (lbLiveStyles.SelectedValue.ToString() == "Default")
			Show1.StyleFolder = "";
		else
			Show1.StyleFolder = StyleFolder + lbLiveStyles.SelectedValue.ToString();
	}
	
	override protected void OnInit(EventArgs e)
	{
		this.lbLiveStyles.SelectedIndexChanged += new System.EventHandler(this.ChangeStyle);
	}
	
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
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
		body
		{
			font-family:Tahoma;
		}
		.tdText
		{
			font-size:12px;
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
	        <span class="tdText"><b>ASP.NET Show - Style gallery</b></span>
		    <br /><br />
		
		    <table>
			    <tr>
				    <td valign="top">
					    <span class="tdText">Change the style of the Show:</span>
				    </td>
				    <td valign="top">
					    <asp:ListBox id="lbLiveStyles" style="overflow:hidden;height:250px;" runat="server" AutoPostBack="True">
						    <asp:ListItem Value="Default" Selected="True">Default</asp:ListItem>
						    <asp:ListItem Value="Style1">Style1</asp:ListItem>
						    <asp:ListItem Value="Style2">Style2</asp:ListItem>
						    <asp:ListItem Value="Style3">Style3</asp:ListItem>
						    <asp:ListItem Value="Style4">Style4</asp:ListItem>
						    <asp:ListItem Value="Style5">Style5</asp:ListItem>
						    <asp:ListItem Value="Style6">Style6</asp:ListItem>
						    <asp:ListItem Value="Style7">Style7</asp:ListItem>
						    <asp:ListItem Value="Style8">Style8</asp:ListItem>
						    <asp:ListItem Value="Style9">Style9</asp:ListItem>
						    <asp:ListItem Value="Style10">Style10</asp:ListItem>
						    <asp:ListItem Value="Lite_earth">Lite_earth</asp:ListItem>
						    <asp:ListItem Value="Lite_sky">Lite_sky</asp:ListItem>
						    <asp:ListItem Value="Vista_beige">Vista_beige</asp:ListItem>
						    <asp:ListItem Value="Vista_blue">Vista_blue</asp:ListItem>
						    <asp:ListItem Value="Vista_gray">Vista_gray</asp:ListItem>
						    <asp:ListItem Value="Vista_green">Vista_green</asp:ListItem>
						    <asp:ListItem Value="Vista_purple">Vista_purple</asp:ListItem>
						    <asp:ListItem Value="Xp_beige">Xp_beige</asp:ListItem>
						    <asp:ListItem Value="Xp_blue_dark">Xp_blue_dark</asp:ListItem>
						    <asp:ListItem Value="Xp_gray_dark">Xp_gray_dark</asp:ListItem>
						    <asp:ListItem Value="Xp_green_dark">Xp_green_dark</asp:ListItem>
						    <asp:ListItem Value="Xp_purple_dark">Xp_purple_dark</asp:ListItem>
					    </asp:ListBox>
				    </td>
			    </tr>
		    </table>
		    <br /><br />
		    <obshow:Show id="Show1" runat="server" Width="370" Height="195" ShowType="manual" ManualChanger="true">
		    <Changer Width="370" Type="Both" Height="30" HorizontalAlign="center" />
		    <Panels>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/default/bfly_on_green.jpg" alt="panel 1 image" border="0" /><br />
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
							    <img src="images/default/bfly_red.jpg" alt="Panel 2 image" border="0" /><br />
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
							    <img src="images/default/bfly_red2.jpg" alt="Panel 3 image" border="0" /><br />
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
							    <img src="images/default/bfly_sunflower.jpg" alt="Panel 4 image" border="0" /><br />
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
							    <img src="images/default/bfly_yellow.jpg" alt="Panel 5 image" border="0" /><br />
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
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td style="padding-top:7px" class="tdText">
							    <img src="images/default/camomile.jpg" alt="Panel 6 image" border="0" /><br />
							    <span class="imageText">Image 6</span>
						    </td>
						    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
							    <h3>Panel 6 content</h3>
							    <h4>Panel 6 content</h4>
							    <h5>Panel 6 content</h5>
							    <h6>Panel 6 content</h6>
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
	
