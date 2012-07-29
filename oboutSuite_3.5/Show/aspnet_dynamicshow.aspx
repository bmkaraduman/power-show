<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>
<%@ Import Namespace="System.IO "%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	void Page_Load(object sender, EventArgs e) {
	
		DynamicShow();
	}
	
	// dynamically build the show - use html template
	private void DynamicShow()
	{
		/* panel 1 */
		string template1 = new System.IO.StreamReader(Server.MapPath("resources/tut_dynamicshow.tpl")).ReadToEnd();

        template1 = template1.Replace("{ProductImage}", "images/laptops/notebook1.jpg");
		template1 = template1.Replace("{ProductName}", "Notebook nw8440 Centrino Duo T7600");
		template1 = template1.Replace("{ProductCPUType}", "Intel Core 2 Duo");
		template1 = template1.Replace("{ProductCPUName}", "Centrino Duo T7600");
		template1 = template1.Replace("{ProductCPUMhz}", "2330 MHz");
		template1 = template1.Replace("{ProductOther}", "160GB, SATA, 5400 rpm");
		template1 = template1.Replace("{ProductOptic}", "DVD+/-RW Dual Layer Fixed");
		template1 = template1.Replace("{ProductVideo}", "ATI Mobility FireGL V5200");
		
		Show1.AddHtmlPanel(template1);
		
		/* panel 2 */
        string template2 = new System.IO.StreamReader(Server.MapPath("resources/tut_dynamicshow.tpl")).ReadToEnd();

        template2 = template2.Replace("{ProductImage}", "images/laptops/notebook2.jpg");
		template2 = template2.Replace("{ProductName}", "Notebook 5005WLHi, Turion 64 X2");
		template2 = template2.Replace("{ProductCPUType}", "Mobile AMD");
		template2 = template2.Replace("{ProductCPUName}", "Turion 64 X2 TL60");
		template2 = template2.Replace("{ProductCPUMhz}", "2000 MHz");
		template2 = template2.Replace("{ProductOther}", "160GB, SATA, 5400 rpm");
		template2 = template2.Replace("{ProductOptic}", "HD-DVD");
		template2 = template2.Replace("{ProductVideo}", "ATI Mobility Radeon X1600");
		
		Show1.AddHtmlPanel(template2);
		
		/* panel 3 */
        string template3 = new System.IO.StreamReader(Server.MapPath("resources/tut_dynamicshow.tpl")).ReadToEnd();
		
		template3 = template3.Replace("{ProductImage}", "images/laptops/notebook3.jpg");
		template3 = template3.Replace("{ProductName}", "Notebook P1610 Centrino U1400");
		template3 = template3.Replace("{ProductCPUType}", "Centrino");
		template3 = template3.Replace("{ProductCPUName}", "Intel Core Solo U1400");
		template3 = template3.Replace("{ProductCPUMhz}", "1200 MHz");
		template3 = template3.Replace("{ProductOther}", "ATA100, 4200 rpm");
		template3 = template3.Replace("{ProductOptic}", "DVD-RW Dual Layer (Extern)");
		template3 = template3.Replace("{ProductVideo}", "Graphic Media Accelerator 950");
		
		Show1.AddHtmlPanel(template3);
	}
	
</script>

<html>
	<head>
		<style type="text/css">
			.panelTable
			{
				background-color:white;
				padding:7px;
				width:400px;
				height:180px;
				border:0px solid red;
				border-collapse: separate;
				border-spacing: expression(cellSpacing=0);
				border-spacing: 0px;
				border-padding: expression(cellPadding=0);
				border-padding: 0px;
			}
			.showContainer
			{
				width:400px;
				padding:7px;
				border:1px solid #cccccc;
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
	
		     <span class="tdText"><b>ASP.NET Show - Dynamically build show</b></span>
	         <br />
		     <br /><br />
		     <span class="tdText">Show panels are dynamically built using <span class="optional">AddHtmlPanel</span> method.</span><br />
		     <br />
		     <div class="showContainer">
		     <obshow:Show id="Show1" 
			    runat="server" 
			    Width="430" 
			    Height="240" 
			    ShowType="show" 
			    SelectedPanel="1" 
			    TransitionType="scrolling" 
			    ScrollDirection="top">
		     </obshow:Show>	
		     </div>
	         <br /><br /><br />
		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
    </body>
</html>