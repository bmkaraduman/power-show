<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<script language="C#" runat="server">
	public void ServerShowAlert() {
		// this will show an alert at client side
		ShowAlert("This alert was sent by server");
	}
	
</script>

<html>
	<head runat="server">
		<script language="JavaScript">
			function ShowAlert() {
				ob_post.post(null, 'ServerShowAlert', function(){});
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
					<span class="title">ShowAlert</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button2" onclick="ShowAlert()" value="Callback now!"></input>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>