<%@ Control Language="C#" %>
<%@ Register Assembly="obout_AJAXPage" Namespace="OboutInc" TagPrefix="oajax" %>
<script runat="server">
	public string DoCallbackFromUC()
	{
		return "string from User Control method.";
	}
</script>
<script language="javascript" type="text/javascript">
	function DoCallback()
	{
		ob_post.post(null, "DoCallback", function(){alert('callback ended...')});
	}
	
	function DoCallbackFromUC()
	{
		ob_post.post(null, "DoCallbackFromUC", function(result){alert('The result is: ' + result)});
	}
</script>
<div>
	<br />
	Callback panel
	<oajax:CallbackPanel ID="CallbackPanel1" runat="server">
		<Content style="border:1px solid black;height:40px;color:red">
			<asp:Literal ID="lblText" runat="server"></asp:Literal>
		</Content>
	</oajax:CallbackPanel>
	<br />
	<input type="button" onclick="DoCallback()" value="Update Panel" />
	<br /><br /><br /><br />
	Callback and call a method from the User Control.<br />
	<input type="button" onclick="DoCallbackFromUC()" value="CallbackUC" />
</div>

