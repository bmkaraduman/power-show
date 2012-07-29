<%@ Page Language="vb" Inherits="emailclient_detail" Src="vb_emailclient_detail.aspx.vb" %>
<html>
<head>
<style>
.emailDetailsSubject
{
	padding-left:20px;
	font-family:Tahoma;
	font-size:9pt;
}
.emailDetailTo
{
	font-family:Tahoma;
	font-size:9pt;
}
.emailDetailFrom
{
	font-family:Tahoma;
	font-size:9pt;
}
.textTo
{
	font-family:Tahoma;
	font-size:9pt;
	color:gray;
	font-weight:bold;
}
.emailDetailMessage
{
	font-family:Tahoma;
	font-size:9pt;
}
</style>
</head>
<body>
<div style="background-color:white;width:100%;height:100%;">
	<table style="width:100%;" style="display:<%=emailDisplay%>" border=0>
		<tr>
			<td class="emailDetailsSubject" colspan="2">
				<b><asp:Label id="lblSubject" runat="server" /></b>
			</td>
		</tr>
		<tr>
			<td width="5px"><img src="images/icon.gif" /></td>
			<td class="emailDetailFrom" style="align:left;width:100%" valign="middle">
				<asp:Label id="lblFrom" runat="server" />
			</td>
		</tr>
		<tr>
			<td class="emailDetailTo" colspan="2">
				<span class="textTo">To:</span> <asp:Label id="lblTo" runat="server" />
			</td>
		</tr>
		<tr style="height:1px;background-color:gray">
			<td colspan="2"></td>
		</tr>
		<tr >
			<td class="emailDetailMessage" colspan="2">
				<asp:Label id="lblMessage" runat="server" />
			</td>
		</tr>
	</table>
</div>
</body>
</html>