<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	
	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
			}
			.title 
			{
			    font-size: X-Large; 
			    padding: 20px; 
			    border-bottom: 2px solid gray;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
	</style>
		<script type="text/javascript">
			// this event is fired before the menu is closed
			// menu - the menu that is being closed
			// you can return false to prevent the menu from being closed, or true to allow the closing to continue
			function ob_em_OnBeforeMenuClose(menu)
			{
				pausecomp(1000);	
				
				return true;
			}
			
			function pausecomp(millis) 
			{
				var date = new Date();
				var curDate = null;
			
				do { curDate = new Date(); } 
				while(curDate-date < millis);
			} 
		</script>
	</head>
	<body>
	<form id="Form1" runat="server">
		<span class="tdText"><b>ASP.NET Easy Menu - Hide menu with time delay</b></span>
		<br /><br /><br /><br />
			
		<table>
			<tr>
				<td valign="top" class="tdText">
					<span class="tdText">Mouse over any item then mouse out.</span> 
					<br />
					<span class="tdText">1 second will pass till the menu will disappear.</span><br /><br /><br />
					<oem:EasyMenu id="EasymenuMain" runat="server" ShowEvent="Always" StyleFolder="styles/horizontal1"
						Position="Horizontal" Width="286">
						<Components>
							<oem:MenuItem InnerHtml="Item1" ID="item1"></oem:MenuItem>
							<oem:MenuItem InnerHtml="Item2" ID="item2"></oem:MenuItem>
						</Components>
					</oem:EasyMenu>
				</td>
			</tr>
		</table>
		<br /><br />
		<oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item1" Align="Under"
			Position="Vertical" Width="144" StyleFolder="styles/horizontal1" EventList="OnBeforeMenuClose">
			<Components>
				<oem:MenuItem OnClientClick="alert('Item 1 - SubItem 1')" InnerHtml="Item11" ID="menuItem11"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 1 - SubItem 2')" InnerHtml="Item12" ID="menuItem12"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 1 - SubItem 3')" InnerHtml="Item13" ID="menuItem13"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 1 - SubItem 4')" InnerHtml="Item14" ID="menuItem14"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 1 - SubItem 5')" InnerHtml="Item15" ID="menuItem15"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu2" runat="server" ShowEvent="MouseOver" AttachTo="item2" Align="Under"
			Position="Vertical" Width="144" StyleFolder="styles/horizontal1" EventList="OnBeforeMenuClose">
			<Components>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 1')" InnerHtml="Item21" ID="menuItem21"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 2')" InnerHtml="Item22" ID="menuItem22"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 3')" InnerHtml="Item23" ID="menuItem23"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 4')" InnerHtml="Item24" ID="menuItem24"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 5')" InnerHtml="Item25" ID="menuItem25"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 6')" InnerHtml="Item26" ID="menuItem26"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 7')" InnerHtml="Item27" ID="menuItem27"></oem:MenuItem>
				<oem:MenuItem OnClientClick="alert('Item 2 - SubItem 8')" InnerHtml="Item28" ID="menuItem28"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		
	    <br /><br /><br /><br /><br />
	        
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
	</body>
</html>