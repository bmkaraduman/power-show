<%@Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<script runat="server">
	public string DoCallback()
	{
		return "callback result";
	}
</script>
<html>
	<head runat="server">
		<script>
			function DoCallback()
			{
				ob_post.post(null, "DoCallback", function(result){alert('callback done -> ' + result)})
			}
			function DoExternalCallback()
			{
				ob_post.post("aspnet_externalpage.aspx", "DoExternalCallback", function(result){alert('external callback done -> ' + result)})
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
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=ASPNET">« Back to examples</a>
	</body>
</html>