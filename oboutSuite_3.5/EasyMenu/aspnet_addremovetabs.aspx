<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
				ob_em_SelectItem("menuitem" + itemID);
				document.getElementById('tabIframe').src="htmlPages/pageitem" + itemID + ".html";
			}
			function AddTab()
			{
				lastAddedTabIndex++;
				var htmlTabContent = "<table cellpadding=\"0\" cellspacing=\"0\"><tr><td width=\"100%\" class=\"itemText\">Tab " + lastAddedTabIndex + "</td><td valign=\"top\" class=\"itemImage\"><img src=\"images/close.gif\" onclick=\"RemoveTab('" + lastAddedTabIndex + "')\" /></td></tr></table>";
				ob_em_EasymenuTabStrip.AddItem("menuitem" + lastAddedTabIndex, "MenuItem", htmlTabContent, "", "", "", "SelectTab(" + lastAddedTabIndex + ")"); 
			}
			function RemoveTab(itemID)
			{
				ob_em_EasymenuTabStrip.RemoveItem("menuitem" + itemID); 
			}
		</script>
		<style type="text/css">
			.itemText
			{
				font-size:13px;
				font-weight:bold;
				cursor:pointer;
				padding-left:5px;
			}
			.itemImage
			{
				padding-right:5px;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
		</style>
	</head>
	<body>
	 <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Add / Remove Tabs</b></span>
		    <br /><br />	
			<br /><br />
	
		    <a href="javascript:AddTab()">Add New Tab</a>
		    <br /><br />
		    <table>
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
					    <iframe style="border:1px solid #9EA7B8" frameborder="0" width="596px" height="150px" src="htmlPages/pageitem1.html" id="tabIframe"></iframe>
				    </td>
			    </tr>
		    </table>
		    <br /><br /><br /><br /><br />
	    
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        
	     </form>
	</body>
</html>