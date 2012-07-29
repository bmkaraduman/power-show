<%@ Page Language="vb" Inherits="vb_redirect" Src="vb_redirect.aspx.vb"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<html>
	<head runat="server">
		<script>		
			function DoCallback()
			{
				ob_post.post(null, "ServerRedirect", CallbackEnd);
			}
			
			// never gets here because the execution of the page ends
			function CallbackEnd()
			{
				alert('callback done');
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
					<span class="title">Redirect</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table border="0">
			<tr>
				<td class="tdText" valign="top">
					<input type="button" value="Do Callback" onclick="DoCallback();" />
				</td>
			</tr>
		</table>
			<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
	</body>
</html>