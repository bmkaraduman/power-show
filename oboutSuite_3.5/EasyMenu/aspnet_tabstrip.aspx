<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Page Language="C#" %>

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
		<script type="text/javascript">
			function SelectTab(itemID)
			{
				ob_em_SelectItem(itemID);
				document.getElementById('tabIframe').src="htmlPages/page" + itemID + ".html";
			}
		</script>
	</head>
	<body>
	<form id="Form1" runat="server">
	            <span class="tdText"><b>ASP.NET Easy Menu - Tab Strip </b></span>
		        <br /><br /><br />
		        <table>
			        <tr>
				        <td>
					        <table cellpadding="0" cellspacing="0">
						        <tr>
							        <td>
								        <oem:EasyMenu SelectedItemId="item1" id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="styles/TabStrip1"
									        Position="Horizontal" Width="530">
									        <Components>
										        <oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 1</span>" OnClientClick="SelectTab('item1')" ID="item1"></oem:MenuItem>
										        <oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 2</span>" OnClientClick="SelectTab('item2')" ID="item2"></oem:MenuItem>
										        <oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 3</span>" OnClientClick="SelectTab('item3')" ID="item3"></oem:MenuItem>
										        <oem:MenuItem InnerHtml="<span style='cursor:default'>Tab 4</span>" OnClientClick="SelectTab('item4')" ID="item4"></oem:MenuItem>
									        </Components>
								        </oem:EasyMenu>
							        </td>
						        </tr>
						        <tr>
							        <td style="padding-left:3px;">
								        <iframe style="border:3px solid #c0cff0" frameborder="0" width="519px" height="150px" src="htmlPages/pageitem1.html" id="tabIframe"></iframe>
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