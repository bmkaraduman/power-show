<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
 	public void ServerOpenWindow() {
		// this will open a new window at client
		OpenWindow("aspnet_SomePage.aspx", "_blank", "width=400, height=250");
	}
	
</script>
<html>
	<head runat="server">
		<script>
			function OpenWindow() {
				ob_post.post(null, 'ServerOpenWindow', function(){});
			}
		</script>
		<style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">OpenWindow</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button3" onclick="OpenWindow()" value="Callback now!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>
