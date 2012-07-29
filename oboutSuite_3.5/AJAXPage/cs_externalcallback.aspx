<%@Page Language="C#" Inherits="cs_externalcallback" Src="cs_externalcallback.aspx.cs" %>
<html>
	<head runat="server">
		<script>
			function DoCallback()
			{
				ob_post.post(null, "DoCallback", function(result){alert('callback done -> ' + result)})
			}
			function DoExternalCallback()
			{
				ob_post.post("cs_externalpage.aspx", "DoExternalCallback", function(result){alert('external callback done -> ' + result)})
			}
		</script>
	</head>
	<body>
		<br /><br />
		page content ...
		<br /><br />
		<a href="javascript:DoCallback()">Do callback</a>
		<br /><br />
		<a href="javascript:DoExternalCallback()">Do external callback</a>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>