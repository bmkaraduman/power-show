<%@ Page Language="C#" Inherits="cs_clientevents" Src="cs_clientevents.aspx.cs" %>

<html>
	<head runat="server">
		<script language="JavaScript">
		
		function DoCallback() {
			document.getElementById('divResult').innerHTML = "";
		
			var withTimeout = false;
			
			if (document.getElementById('chkTimeout').status || document.getElementById('chkTimeout').checked)
				withTimeout = true;
				
			ob_post.AddParam("withTimeout", withTimeout);
			ob_post.post(null, "MyServerMethod", function(){alert('callback is done')});
		}
		
		function ob_OnRequestStart(page, serverMethod, params) {
			document.getElementById('divResult').innerHTML += "<br />&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnRequestStart</span> was triggered<br /><br />";
			
			return true;
		}
		
		function ob_OnRequestSend(page, serverMethod, params) {
			document.getElementById('divResult').innerHTML += "&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnRequestSend</span> was triggered<br /><br /> ";
		}
		
		function ob_OnResponseReceived(page, serverMethod, params, status) {
			document.getElementById('divResult').innerHTML += "&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnResponseReceived</span> was triggered<br /><br /> ";
		}
		
		function ob_OnResponseEnd(page, serverMethod, params, status) {
			document.getElementById('divResult').innerHTML += "&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:red'>ob_OnResponseEnd</span> was triggered";
		}
		
		function ob_OnTimeout(page, serverMethod, params) {
			document.getElementById('divResult').innerHTML += "&nbsp;&nbsp;&nbsp;<b>&middot;</b>&nbsp;&nbsp;<span style='color:navy'>ob_OnTimeout</span> was triggered<br /><br />";
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
					<span class="title">Client-side events</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<input type="button" id="button1" onclick="DoCallback();" value="Do Callback" />
		&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="checkbox" id="chkTimeout" /> Simulate Server Timeout (5 sec)
		<br />
		<br />
		In the panel below you will see the order of the client-side events execution.
		<br /><br />
		<div id="divResult" style="width:270px;height:205px;border:1px solid gray">
				
		</div>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>