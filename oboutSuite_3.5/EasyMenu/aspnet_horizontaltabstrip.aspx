<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>
	    <style type="text/css">
			    .tdText {
				    font:11px Verdana;
				    color:#333333;
			    }
        </style>
    </head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Easy Menu - Multiple menus - Horizontal menu and Tab Strip</b></span>
	
		<br />
		<br /><br />
		<table style="width:600px">
			<tr>
				<td stye="width:50%" valign="top" class="tdText">
					<b>Easy Menu - Horizontal</b><br /><br />
					<div id="divEasyMenu1">
						<oem:EasyMenu id="EasymenuMain1" runat="server" ShowEvent="Always" StyleFolder="styles/TSH_Horizontal"
							Position="Horizontal" Width="330">
							<Components>
								<oem:MenuItem InnerHtml="Item 1" ID="item11"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 2" ID="item12"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 3" ID="item13"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 4" ID="item14"></oem:MenuItem>
							</Components>
						</oem:EasyMenu>
						<oem:EasyMenu id="Easymenu1" runat="server" ShowEvent="MouseOver" AttachTo="item11" StyleFolder="styles/TSH_Horizontal"
							Position="Vertical" Width="130" Align="Under">
							<Components>
								<oem:MenuItem InnerHtml="Item 11" ID="item111"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 12" ID="item112"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 13" ID="item113"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Item 14" ID="item114"></oem:MenuItem>
							</Components>
						</oem:EasyMenu>
					</div>
				</td>
				<td class="tdText" style="padding-left:20px">
					<b>Easy Menu - Tab Strip</b><br /><br />
					<div id="divEasyMenu2">
						<oem:EasyMenu id="TabStrip" runat="server" ShowEvent="Always" StyleFolder="styles/TSH_TabStrip"
							Position="Horizontal" CSSMenu="TabStripMenu" CSSMenuItemContainer="TabStripItemContainer" Width="330">
							<CSSClassesCollection>
								<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" 
									Component="TabStripItem" ComponentOver="TabStripItemOver"
									ComponentContentCell="TabStripItemContentCell" ComponentContentCellOver="TabStripItemContentCellOver"
									ComponentLeftRoundCornerCell="TabStripItemLeftRoundCornerCell" ComponentLeftRoundCornerCellOver="TabStripItemLeftRoundCornerCellOver"
									ComponentRightRoundCornerCell="TabStripItemRightRoundCornerCell" ComponentRightRoundCornerCellOver="TabStripItemRightRoundCornerCellOver" />
							</CSSClassesCollection>
							<Components>
								<oem:MenuItem InnerHtml="Tab 1" ID="item1"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Tab 2" ID="item2"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Tab 3" ID="item3"></oem:MenuItem>
								<oem:MenuItem InnerHtml="Tab 4" ID="item4"></oem:MenuItem>
							</Components>
						</oem:EasyMenu>
					</div>
				</td>
			</tr>
		</table>
		
		<br /><br /><br />
	        
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
	</body>
</html>