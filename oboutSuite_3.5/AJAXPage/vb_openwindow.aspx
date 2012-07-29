<%@ Page Language="vb" Inherits="vb_openwindow" Src="vb_openwindow.aspx.vb" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
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
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
	</body>
</html>
