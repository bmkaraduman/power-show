<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="C#" %>

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
	</head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Easy Menu - Multiple menus</b></span>
	
		<br />
		<br /><br />
		<table width="100%">
            <tr>		
				<td stye="width:50%" valign="top" class="tdText">
					<b>Easy Menu 1</b>
					<oem:EasyMenu id="EasymenuMain1" runat="server" ShowEvent="Always" StyleFolder="styles/style1_multiple_menus"
						Position="Horizontal" Width="330">
						<Components>
							<oem:MenuItem InnerHtml="Item1" ID="item11"></oem:MenuItem>
							<oem:MenuItem InnerHtml="Item2" ID="item12"></oem:MenuItem>
							<oem:MenuItem InnerHtml="Item3" ID="item13"></oem:MenuItem>
							<oem:MenuItem InnerHtml="Item4" ID="item14"></oem:MenuItem>
						</Components>
					</oem:EasyMenu>
				</td>
				<td class="tdText">
					<b>Easy Menu 2</b>
					<oem:EasyMenu id="EasymenuMain2" runat="server" ShowEvent="Always" StyleFolder="styles/style2_multiple_menus"
						Position="Horizontal" CSSMenu="easyMenu2" CSSMenuItemContainer="easyMenuItemContainer2" Width="330">
						<CSSClassesCollection>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuItem" ComponentSubMenuCellOver="easyMenuItemSubMenuCellOver2"
								ComponentContentCell="easyMenuItemContentCell2" Component="easyMenuItem2" ComponentSubMenuCell="easyMenuItemSubMenuCell2"
								ComponentIconCellOver="easyMenuItemIconCellOver2" ComponentIconCell="easyMenuItemIconCell2"
								ComponentOver="easyMenuItemOver2" ComponentContentCellOver="easyMenuItemContentCellOver2"></oem:CSSClasses>
							<oem:CSSClasses ObjectType="OboutInc.EasyMenu_Pro.MenuSeparator" ComponentSubMenuCellOver="easyMenuSeparatorSubMenuCellOver2"
								ComponentContentCell="easyMenuSeparatorContentCell2" Component="easyMenuSeparator2"
								ComponentSubMenuCell="easyMenuSeparatorSubMenuCell2" ComponentIconCellOver="easyMenuSeparatorIconCellOver2"
								ComponentIconCell="easyMenuSeparatorIconCell2" ComponentOver="easyMenuSeparatorOver2"
								ComponentContentCellOver="easyMenuSeparatorContentCellOver2"></oem:CSSClasses>
						</CSSClassesCollection>
						<Components>
							<oem:MenuItem InnerHtml="Item1" ID="item21"></oem:MenuItem>
							<oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator21"></oem:MenuSeparator>
							<oem:MenuItem InnerHtml="Item2" ID="item22"></oem:MenuItem>
							<oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator22"></oem:MenuSeparator>
							<oem:MenuItem InnerHtml="Item3" ID="item23"></oem:MenuItem>
							<oem:MenuSeparator InnerHtml="|" ID="mainMenuSeparator23"></oem:MenuSeparator>
							<oem:MenuItem InnerHtml="Item4" ID="item24"></oem:MenuItem>
						</Components>
					</oem:EasyMenu>
				</td>
			</tr>
		</table>
		
		<oem:EasyMenu id="Easymenu11" runat="server" ShowEvent="MouseOver" AttachTo="item11" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item11" ID="menuItem111"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item12" ID="menuItem112"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item13" ID="menuItem113"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu12" runat="server" ShowEvent="MouseOver" AttachTo="item12" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item21" ID="menuItem121"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item22" ID="menuItem122"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu13" runat="server" ShowEvent="MouseOver" AttachTo="item13" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item31" ID="menuItem131"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item32" ID="menuItem132"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item33" ID="menuItem133"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item34" ID="menuItem134"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item35" ID="menuItem135"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item36" ID="menuItem136"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu14" runat="server" ShowEvent="MouseOver" AttachTo="item14" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item41" ID="menuItem141"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item42" ID="menuItem142"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item43" ID="menuItem143"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item44" ID="menuItem144"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>



		<oem:EasyMenu id="Easymenu21" runat="server" ShowEvent="MouseOver" AttachTo="item21" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item11" ID="menuItem211"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item12" ID="menuItem212"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item13" ID="menuItem213"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu22" runat="server" ShowEvent="MouseOver" AttachTo="item22" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item21" ID="menuItem221"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu23" runat="server" ShowEvent="MouseOver" AttachTo="item23" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item31" ID="menuItem231"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item32" ID="menuItem232"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item33" ID="menuItem233"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item34" ID="menuItem234"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
		<oem:EasyMenu id="Easymenu24" runat="server" ShowEvent="MouseOver" AttachTo="item24" Align="Under"
			Width="140" StyleFolder="styles/style1_multiple_menus">
			<Components>
				<oem:MenuItem InnerHtml="Item41" ID="menuItem241"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item42" ID="menuItem242"></oem:MenuItem>
				<oem:MenuItem InnerHtml="Item43" ID="menuItem243"></oem:MenuItem>
			</Components>
		</oem:EasyMenu>
	
		<br /><br /><br />
	        
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
        </form>
	</body>
</html>