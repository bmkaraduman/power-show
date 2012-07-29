<%@ Page Language="vb" Inherits="vb_showconfirmationdialog" Src="vb_showconfirmationdialog.aspx.vb" %>
<html>
	<head runat="server">
		<script language="JavaScript">
			function ShowConfirmationDialog() {
				ob_post.post(null, 'ServerUseConfirmDialog', 
					function(r)
					{
						alert('the response is: ' + r)
					}
				);
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
					<span class="title">ShowConfirmationDialog</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button1" onclick="ShowConfirmationDialog()" value="Callback now!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=VBNET">« Back to examples</a>
	</body>
</html>