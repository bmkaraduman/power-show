<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	void Page_Load(object sender, EventArgs e) 
	{
		DynamicShow();
	}
	
	// dynamically build the show - use html template
	private void DynamicShow()
	{
		/* panel 1 */
		string template1 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();
				
		template1 = template1.Replace("{ItemFlashMovie}", "images/flash_logo/seat.swf");
		template1 = template1.Replace("{ItemName}", "Seat");
				
		Show1.AddHtmlPanel(template1);
		
		/* panel 2 */
        string template2 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template2 = template2.Replace("{ItemFlashMovie}", "images/flash_logo/subaru.swf");
		template2 = template2.Replace("{ItemName}", "Subaru");
				
		Show1.AddHtmlPanel(template2);
		
		/* panel 3 */
        string template3 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template3 = template3.Replace("{ItemFlashMovie}", "images/flash_logo/peugeot.swf");
		template3 = template3.Replace("{ItemName}", "Peugeot");
		
		/* panel 4 */
        string template4 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template4 = template4.Replace("{ItemFlashMovie}", "images/flash_logo/alfaromeo.swf");
		template4 = template4.Replace("{ItemName}", "Alfa Romeo");
				
		Show1.AddHtmlPanel(template4);
		
		/* panel 5 */
        string template5 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template5 = template5.Replace("{ItemFlashMovie}", "images/flash_logo/citroen.swf");
		template5 = template5.Replace("{ItemName}", "Citroen");
				
		Show1.AddHtmlPanel(template5);
		
		/* panel 6 */
        string template6 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template6 = template6.Replace("{ItemFlashMovie}", "images/flash_logo/fiat.swf");
		template6 = template6.Replace("{ItemName}", "Fiat");
				
		Show1.AddHtmlPanel(template6);
		
		/* panel 7 */
        string template7 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template7 = template7.Replace("{ItemFlashMovie}", "images/flash_logo/ford.swf");
		template7 = template7.Replace("{ItemName}", "Ford");
				
		Show1.AddHtmlPanel(template7);
		
		/* panel 8 */
        string template8 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template8 = template8.Replace("{ItemFlashMovie}", "images/flash_logo/honda.swf");
		template8 = template8.Replace("{ItemName}", "Honda");
				
		Show1.AddHtmlPanel(template8);
		
		/* panel 9 */
        string template9 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template9 = template9.Replace("{ItemFlashMovie}", "images/flash_logo/hyundai.swf");
		template9 = template9.Replace("{ItemName}", "Hyundai");
				
		Show1.AddHtmlPanel(template9);
		
		/* panel 10 */
        string template10 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template10 = template10.Replace("{ItemFlashMovie}", "images/flash_logo/mazda.swf");
		template10 = template10.Replace("{ItemName}", "Mazda");
				
		Show1.AddHtmlPanel(template10);
		
		/* panel 11 */
        string template11 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template11 = template11.Replace("{ItemFlashMovie}", "images/flash_logo/mercedes.swf");
		template11 = template11.Replace("{ItemName}", "Mercedes");
				
		Show1.AddHtmlPanel(template11);
		
		/* panel 12 */
        string template12 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template12 = template12.Replace("{ItemFlashMovie}", "images/flash_logo/nissan.swf");
		template12 = template12.Replace("{ItemName}", "Nissan");
				
		Show1.AddHtmlPanel(template12);
		
		/* panel 13 */
        string template13 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template13 = template13.Replace("{ItemFlashMovie}", "images/flash_logo/renault.swf");
		template13 = template13.Replace("{ItemName}", "Renault");
				
		Show1.AddHtmlPanel(template13);
		
		/* panel 14 */
        string template14 = new System.IO.StreamReader(Server.MapPath("resources/show_usingflash.tpl")).ReadToEnd();

        template14 = template14.Replace("{ItemFlashMovie}", "images/flash_logo/toyota.swf");
		template14 = template14.Replace("{ItemName}", "Toyota");
				
		Show1.AddHtmlPanel(template14);
	}
	
	
	
</script>

<html>
	<head>
	<title>obout ASP.NET Show examples</title>
	   
	<!--// Only needed for this page's formatting //-->
		<style type="text/css">
        .tdText {
				    font:11px Verdana;
				    color:#333333;
        }
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
		</style>
	</head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Show -  Dynamically build show panels that contain flash movies</b></span>
	
		<br />
		<br /><br />
		<br />
		<span class="tdText">Dynamically build show with panels that use flash movies</span>
		<br />
		<span class="tdText">Show panels are dynamically built using <span class="optional">AddHtmlPanel</span> method.</span><br />
		<br /><br />
		<div class="showContainer">
		<obshow:Show id="Show1" 
			runat="server" 
			Width="400" 
			Height="210" 
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
	