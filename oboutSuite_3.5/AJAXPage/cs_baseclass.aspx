<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage"%>
<%@ Page Language="C#" Inherits="cs_baseclass" Src="cs_baseclass.aspx.cs" %>
<html>
	<head runat="server">
		<style>
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
		
		<script language="javascript">

			function PanelUpdate() 
			{
				ob_post.post(null, "PanelUpdate", function(){});
			}
		
		</script>
		
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Simple Literal Update - use a base class</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		<table>
			<tr>
				<td class="tdText">
					Callback Panel with Literal control<br /><br />
					<oajax:CallbackPanel id="callbackPanel1" runat="server">
						<content style="border:1px solid gray;width:300px;height:100px">
							<asp:Literal id="literal" runat="server" />
						</content>
					</oajax:CallbackPanel>
				</td>
			</tr>
		</table>
			<br />
			<br />
			<input type="button" value="Update Panel" onclick="PanelUpdate()" />
		
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>