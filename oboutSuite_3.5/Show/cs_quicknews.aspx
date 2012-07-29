<%@ Page Language="C#" Src="cs_quicknews.aspx.cs" Inherits="cs_quicknews" %>
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
			width:420px;
			padding:4px;
			border:1px solid #cccccc;
		}
		.images
		{
			
		}
		.title
		{	
			font-family:Verdana;
			font-size:11px;
			font-weight:bold;
			color:#444444;
		}
		.textTitle
		{
			font-family:Verdana;
			font-size:11px;
			font-weight:bold;
		}
		.textContent
		{
			font-family:Verdana;
			font-size:11px;
		}
		.textLink
		{
			text-decoration:none;
		}
		.textLink:hover
		{
			text-decoration:underline;
			color:#315686;
		}
		.newsTable
		{
			background-color:#EEEEDD;
		}
		.image
		{
			cursor:pointer;
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
	        <span class="tdText"><b>ASP.NET Show - Quick News</span>
		    <br /><br />
		
	        <div class="showContainer">
	        <obshow:Show id="Show1" runat="server">
		        <Panels>
			        <obshow:Panel>
				        <table class="newsTable">
					        <tr>
						        <td colspan="4"><span class="title">FEATURES, VIEWS, ANALYSIS </span></td>
					        </tr>
					        <tr>
						        <td width="68px"><img src="images/news/news1.jpg" border="1" class="image" /></td>
						        <td width="130px">
							        <a href="#" class="textLink">
							        <span class="textTitle">Arctic adventure</span>
							        <span class="textContent">Explorers' 4,300km trek to map changes to frozen landscape</span>
							        </a>
						        </td>
						        <td width="68px" stype="padding-left:20px"><img src="images/news/news2.jpg" border="1" class="image" /></td>
						        <td width="140px">
							        <a href="#" class="textLink">
							        <span class="textTitle"> Survival by satellite</span>
							        <span class="textContent">Iraqis use Google Earth to avoid getting kidnapped or killed</span>
							        </a>
						        </td>
					        </tr>
				        </table>
			        </obshow:Panel>
			        <obshow:Panel>
				        <table class="newsTable">
					        <tr>
						        <td colspan="4"><span class="title">FEATURES, VIEWS, ANALYSIS </span></td>
					        </tr>
					        <tr>
						        <td width="68px"><img src="images/news/news3.jpg" border="1" class="image" /></td>
						        <td width="130px">
							        <a href="#" class="textLink">
							        <span class="textTitle">Data 'snooping'</span>
							        <span class="textContent">What can US learn from Europe's plans for keeping data? </span>
							        </a>
						        </td>
						        <td width="68px" stype="padding-left:20px"><img src="images/news/news4.jpg" border="1" class="image" /></td>
						        <td width="140px">
							        <a href="#" class="textLink">
							        <span class="textTitle">Cell-uloid magic</span>
							        <span class="textContent">Sunshine duo's new film for the fourth screen - the mobile</span>
							        </a>
						        </td>
					        </tr>
				        </table>
			        </obshow:Panel>
			        <obshow:Panel>
				        <table class="newsTable">
					        <tr>
						        <td colspan="4"><span class="title">FEATURES, VIEWS, ANALYSIS </span></td>
					        </tr>
					        <tr>
						        <td width="68px"><img src="images/news/news5.jpg" border="1" class="image" /></td>
						        <td width="130px">
							        <a href="#" class="textLink">
							        <span class="textTitle">Colourful character</span>
							        <span class="textContent">Brits host Russell Brand's stop-start climb to fame</span>
							        </a>
						        </td>
						        <td width="68px" stype="padding-left:20px"><img src="images/news/news6.jpg" border="1" class="image" /></td>
						        <td width="140px">
							        <a href="#" class="textLink">
							        <span class="textTitle">Life thru a lens</span>
							        <span class="textContent">A profile of Robbie Williams' solo success after Take That</span>
							        </a>
						        </td>
					        </tr>
				        </table>
			        </obshow:Panel>
		        </Panels>
	        </obshow:Show>	
	        </div>
        	
		        <br /><br /><br />
		        
		        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
		</form>
	</body>
</html>
	
