<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@ Page Language="C#" %>
<%@ Register Src="aspnet_inside_usercontrol.ascx" TagName="WebUserControl" TagPrefix="uc1" %>
<html>
	<head>
		<title>Obout TextMenu Horizontal Example inside User Control</title>
	</head>
	<body style="font: Tahoma 11px;">
		<h2>Obout TextMenu Horizontal Example inside User Control</h2>
		<br />
		<a class="examples" href="Default.aspx?type=ASPNET">« Back to examples</a>
		<br />
		<br />
		... Page Content ...
		<br />
		<br />
		User Control
		<div style="width:400px;height:30px;border:1px solid black;padding:30px;">
			<uc1:WebUserControl ID="WebUserControl1" runat="server" />
		</div>
	</body>
</html>