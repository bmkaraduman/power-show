<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<html>
	<head runat="server">
		<style>
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Callback Panel - UpdatePanelFromPage</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<b style="font-size:12px">Container</b>
		<div id="containerFromPage1" style="border: gray 1px solid;height:37px;text-align:center;width:200px;" >
			<br />
		</div>
		<br />
		<br />
		<input type="button" id="button13" onclick="ob_post.UpdatePanelFromPage('postbackPanel1', 'containerFromPage1', 'aspnet_callbackPanels1.aspx');"
			value="Callback Now!"></input>
			
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>
		
