<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Easy Menu examples</title>
		<script type="text/javascript">
			function SelectTab(itemID)
			{
				ob_em_SelectItem(itemID);
				window.frames['tabIframe'].location.replace("htmlPages/page" + itemID + ".html");
			}
		</script>
		<title>Example Page - TabStrip3</title>
	
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
	        <span class="tdText"><b>ASP.NET Easy Menu - TabStrip3 skin</b></span>
		    <br /><br />	
			<br /><br /> 
		
		    <table>
			    <tr>
				    <td>
					    <table cellpadding="0" cellspacing="0">
						    <tr>
							    <td>
								    <oem:EasyMenu SelectedItemId="item1" id="EasymenuTabStrip" runat="server" ShowEvent="Always" StyleFolder="styles/TabStrip3"
									    Position="Horizontal" Width="530">
									    <Components>
										    <oem:MenuItem InnerHtml="<span style='cursor:default'>Apples</span>" OnClientClick="SelectTab('item1')" ID="item1"></oem:MenuItem>
										    <oem:MenuItem InnerHtml="<span style='cursor:default'>Strawberries</span>" OnClientClick="SelectTab('item2')" ID="item2"></oem:MenuItem>
										    <oem:MenuItem InnerHtml="<span style='cursor:default'>Melons</span>" OnClientClick="SelectTab('item3')" ID="item3"></oem:MenuItem>
										    <oem:MenuItem InnerHtml="<span style='cursor:default'>Cherry</span>" OnClientClick="SelectTab('item4')" ID="item4"></oem:MenuItem>
									    </Components>
								    </oem:EasyMenu>
							    </td>
						    </tr>
						    <tr>
							    <td style="padding-left:1px;">
								    <iframe style="border:3px solid #FFE100;" name="tabIframe"  frameborder="0" width="522px" height="150px" src="htmlPages/pageitem1.html" id="tabIframe"></iframe>
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