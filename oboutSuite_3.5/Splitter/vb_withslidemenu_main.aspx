<%@ Page Language="vb" Inherits="vb_withslidemenu_main" Src="vb_withslidemenu_main.aspx.vb" %>
<html>
	<head>
		<style type="text/css">
			.SMParentSelected {
				background-image:url(../slidemenu/styles/pro_7/background_parentselected.gif);
				background-repeat:repeat-x;
				border-top:1px solid #DADBDB;
				font:bold 8pt Tahoma;
				color:white;
				text-align:left;
				padding: 2px;
				padding-left: 12px;
				height:21px;
				width:480px;
			}
		</style>
	</head>
	<body>
		<div class="SMParentSelected">
			Current Category -> <asp:Literal id="lHeader" runat="server" />
		</div>
		<div style="padding:30px;font:bold 12pt Tahoma;">
			<asp:Literal id="lContent" runat="server" />.html page was loaded.
		</div>
	</body>
</html>