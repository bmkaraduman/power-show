<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<html>
	<head>
	<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
    </style>
		<script type="text/javascript">
			var lastAddedTabIndex = 3;
			function SelectTab(itemID)
			{
				// show the tab container
				var divTab = document.getElementById("tab" + itemID);
				divTab.style.display = "";
				
				// make the other containers invisible
				for (index=1;index<=lastAddedTabIndex;index++)
				{
					var divTab = document.getElementById("tab" + index);
					if (divTab != null && index != itemID)
						divTab.style.display = "none";
				}
				
				// select the menu item
				ob_em_SelectItem("menuitem" + itemID);
			}
			function AddTab()
			{
				// add new menu item
				lastAddedTabIndex++;
				var htmlTabContent = "<table cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"100%\" class=\"itemText\">Tab " + lastAddedTabIndex + "</td><td valign=\"top\" class=\"itemImage\"><img src=\"images/close.gif\" onclick=\"RemoveTab('" + lastAddedTabIndex + "')\" /></td></tr></table>";
				ob_em_EasymenuTabStrip.AddItem("menuitem" + lastAddedTabIndex, "MenuItem", htmlTabContent, "", "", "", "SelectTab(" + lastAddedTabIndex + ")"); 
				
				// add the div container
				var divTab = document.createElement("div");
				divTab.id = "tab" + lastAddedTabIndex;
				divTab.innerHTML = "Tab content " + lastAddedTabIndex;
				divTab.style.display = "none";
				var divContent = document.getElementById("divContent");
				divContent.appendChild(divTab);
			}
			function RemoveTab(itemID)
			{
				// remove the EasyMenu item
				ob_em_EasymenuTabStrip.RemoveItem("menuitem" + itemID); 
				
				// remove the div tab
				var divTab = document.getElementById("tab" + itemID);
				var divContent = document.getElementById("divContent");
				divContent.removeChild(divTab);
			}
		</script>
		<style type="text/css">
			.itemText
			{
				font-size:10px;
				font-weight:bold;
				cursor:pointer;
				padding-left:5px;
			}
			.itemImage
			{
				padding-right:5px;
			}
		</style>
	</head>
	<body>
	<form name="myForm">
        <span class="tdText"><b>ASP.NET Easy Menu - Add / Remove Tabs with div</b></span>
	    <br /><br />	
		<br /><br /> 
	- <a href="javascript:AddTab()">Add New Tab</a><br />
			- The dynamic content is loaded inside div element.<br />
			- Click on <img src="images/close.gif" /> to remove a tab.
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<oem:EasyMenu SelectedItemId="menuitem1" id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="styles/TabStripYahoo"
						Position="Horizontal" Width="600">
						<Components>
							<oem:MenuItem OnClientClick="SelectTab('1')" ID="menuitem1">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td width="100%" class="itemText">
											Tab 1
										</td>
										<td valign="top" class="itemImage"><img src="images/close.gif" onclick="RemoveTab('1')" /></td>
									</tr>
								</table>
							</oem:MenuItem>
							<oem:MenuItem OnClientClick="SelectTab('2')" ID="menuitem2">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td width="100%" class="itemText">
											Tab 2
										</td>
										<td valign="top" class="itemImage"><img src="images/close.gif" onclick="RemoveTab('2')" /></td>
									</tr>
								</table>
							</oem:MenuItem>
							<oem:MenuItem OnClientClick="SelectTab('3')" ID="menuitem3">
								<table cellpadding="0" cellspacing="0">
									<tr>
										<td width="100%" class="itemText">
											Tab 3
										</td>
										<td valign="top" class="itemImage"><img src="images/close.gif" onclick="RemoveTab('3')" /></td>
									</tr>
								</table>
							</oem:MenuItem>
						</Components>
					</oem:EasyMenu>
				</td>
			</tr>
			<tr>
				<td style="padding-left:1px">
					<table style="border:1px solid #9EA7B8;width:596px;height:150px;">
						<tr>
							<td align="center" valign="middle" id="divContent">
								<div id="tab1">
									Tab content 1
								</div>
								<div id="tab2" style="display:none;">
									Tab content 2
								</div>
								<div id="tab3" style="display:none;">
									Tab content 3
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		 <br /><br /><br />
	    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
	    </form>
	</body>
</html>