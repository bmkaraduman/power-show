<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
			background-color:white;
			height:100%;
			width:100%;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showContainer
		{
			width:490px;
			padding:4px;
			border:1px solid #cccccc;
		}
		.tdQuotes
		{
			padding-left:25px;
		}
		.aQuotes
		{
			text-decoration:none;
		}
		body
		{
			font-family:Tahoma;
		}
		.tdText
	    {
		    font:11px Verdana;
	        color:#333333;
	    }
		.examples
		{
			font-size:12px;
		}
		a
		{
			font-size:12px;
		}
		</style>
	</head>
	<body>
		 <form id="Form1" runat="server">
	
		     <span class="tdText"><b>ASP.NET Show - Live quotes</b></span>
	         <br /><br /><br />
		     <div class="showContainer">
	        <obshow:Show id="Show1" runat="server" Width="490" ScrollingStep="2" TimeBetweenPanels="1" 
		        ScrollingSpeed="5000" Height="16" ShowType="show" TransitionType="scrolling" ScrollDirection="left" StopScrolling="true">
		        <Panels>
			        <obshow:Panel>
				        <table class="panelTable">
					        <tr>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_usa.png" border="1" /><a href="#" class="aQuotes"> 1USD - 1.17CAD </a><img src="images/livequotes/flag_canada.png" border="1"  />
						        </td>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_usa.png" border="1" /><a href="#" class="aQuotes"> 1USD - 1.25CHF </a><img src="images/livequotes/flag_switzerland.png" border="1"  />
						        </td>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_usa.png" border="1" /><a href="#" class="aQuotes"> 1USD - 122.08JPY </a><img src="images/livequotes/flag_japan.png" border="1"  />
						        </td>
					        </tr>
				        </table>
			        </obshow:Panel>
			        <obshow:Panel>
				        <table class="panelTable">
					        <tr>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_great_britain.png" border="1" /><a href="#" class="aQuotes"> 1GBP - 238.79JPY </a><img src="images/livequotes/flag_japan.png" border="1"  />
						        </td>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_great_britain.png" border="1" /><a href="#" class="aQuotes"> 1GBP - 1.95USD </a><img src="images/livequotes/flag_usa.png" border="1"  />
						        </td>
						        <td class="tdText tdQuotes">
							        <img src="images/livequotes/flag_great_britain.png" border="1" /><a href="#" class="aQuotes"> 1GBP - 2.29CAD </a><img src="images/livequotes/flag_canada.png" border="1"  />
						        </td>
					        </tr>
				        </table>
			        </obshow:Panel>
		        </Panels>
	        </obshow:Show>	
	        <obshow:Show id="Show2" runat="server" StyleFolder="/show/showstyles/default" 
		        Width="480" ScrollingStep="1" TimeBetweenPanels="1" ScrollingSpeed="20" Height="16" ShowType="show" TransitionType="scrolling" ScrollDirection="left" StopScrolling="true">
		        <Panels>
			        <obshow:Panel>
				        <div class="tdText"><a href="#">obout inc</a> - ASP.NET Show - Live quotes example</div>
			        </obshow:Panel>
			        <obshow:Panel>
				        <div class="tdText"><a href="#">obout inc</a> - ASP.NET Show - Live quotes example</div>
			        </obshow:Panel>
		        </Panels>
	        </obshow:Show>
	        </div>
        	
            <br /><br /><br />
            <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
        </form>
	</body>
</html>
	
