<%@ Page Language="C#" Inherits="cs_weather" Src="cs_weather.aspx.cs" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 

<html>
	<head runat="server">
		<script>
		
		function ob_OnBeforePanelUpdate(panelId, containerId, page) {
		
			document.getElementById('clientEvent').innerHTML = "Your request has been sent. Waiting for weather information update.";
		
			return true;
		}
		
		function ob_OnPanelUpdate(panelId) {
			document.getElementById('clientEvent').innerHTML = "The weather information is updated.";
		}
		
		function UpdateWeather()
		{
			ob_post.UpdatePanel("cp_weather");
		}
		
		</script>
		<style>
		TABLE.Basic2
		{
			background-color:#FFFFFF;
			font-family: Verdana,Arial,Sans Serif;
			font-size:11px;
			color:black;
			border:1px #F8F6E7 solid;
			margin:0px 0px 6px 0px;
		}
		.obsTextA
		{
			font-size:11px;
			color:#666666;
		}
		.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Weather information</span><br /><br /><br />
				</td>
			</tr>
		</table>
		Update weather information.
		<br />
		Client-side events are triggered when the update starts and when the update ends.
		<br />
		<br />
		<br />
		<div style="color:red;font-size:14x;font-weight:bold;height:20px" id="clientEvent"></div>
		<table width="500px" height="120px" border="0" cellpadding="0" cellspacing="0"  class="Basic2">
			<tr>
				<td valign="top" class="vbgE" style="padding: 10px 10px 0px 10px;" colspan="2">
					<oajax:CallbackPanel id="cp_weather" runat="server">
						<content style="width:500px;height:110px">
							<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="50%" valign="top">
										<table border="0" cellpadding="0" cellspacing="0" width="100%" class="Basic2"  height="70">
											<tr>
												<td width="50%" valign="middle" align="center" style="padding:0px 0px 10px 0px;">
													<img src='<asp:Literal id="lImage" runat="server"/>' width="52" height="52" border="0" alt="">
													<br />
												</td>
												<td width="50%" valign="middle" align="center">
													<div style="padding: 10px 0px 3px 5px;">
														<b class="obsTempTextA"><asp:Literal id="lDegree1" runat="server" />&deg;F</b>
														<br />
														<b class="obsTextA">Feels Like<br /> <asp:Literal id="lDegree2" runat="server" />&deg;F</b>
													</div>
												</td>
											</tr>
										</table>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr>
												<td valign="middle" align="left" style="font-family:arial,verdana;font-size:10px;color:#0B2C58;padding:0px 0px 5px 0px;">
													Updated <asp:Literal id="lDate" Runat="server"></asp:Literal>
												</td>
											</tr>  
										</table>
									</td>
									<td width="50%" valign="top">
										<table cellpadding="0" border="0" cellspacing="0" valign="top" align="left">
											<tr>
												<td valign="top" align="left" style="padding:0px 0px 0px 10px;">
													<table border="0" cellpadding="0" cellspacing="0" width="100%">
														<tr>
															<td valign="top" class="obsTextA" width="75" >UV Index:</td>
															<td><img SRC="/AJAXPage/images/Weather/blank.gif" width="10" height="1" border="0" alt=""></td>
															<td valign="top" class="obsTextA"><asp:Literal id="l1" runat="server" /></td>
														</tr>
														<tr>
															<td valign="top" class="obsTextA" width="75" >Wind:</td>
															<td><img src="/AJAXPage/images/Weather/blank.gif" width="10" height="1" border="0" alt=""></td>
															<td valign="top" class="obsTextA"><asp:Literal id="l2" runat="server" /> mph</td>
														</tr>
														<tr>
															<td valign="top" class="obsTextA">Humidity:</td>
															<td><img src="/AJAXPage/images/Weather/blank.gif" width="10" height="1" border="0" alt=""></td>
															<td valign="top" class="obsTextA"><asp:Literal id="l3" runat="server" />%</td>
														</tr>
														<tr>
															<td valign="top" class="obsTextA">Pressure:</td>
															<td><img src="/AJAXPage/images/Weather/blank.gif" width="10" height="1" border="0" alt=""></td>									  
															<td valign="top" class="obsTextA"><asp:Literal id="l4" runat="server" />&nbsp;in.
																<img src="/AJAXPage/images/Weather/blank.gif" width="5" height="1" border="0" alt="">
															</td>
														</tr>
														<tr>
															<td valign="top" class="obsTextA">Visibility:</td>
															<td><img src="/AJAXPage/images/Weather/blank.gif" width="10" height="1" border="0" alt=""></td>
															<td valign="top" class="obsTextA"><asp:Literal id="l5" runat="server" /> miles</td>
														</tr>
														<tr>
															<td colspan="3" valign="top"><img SRC="/AJAXPage/images/Weather/blank.gif" width="1" height="3" border="0" alt=""></td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</content>
						<loading style="width:500px;height:110px">
							 <table width=100% height=100% cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
										<img src="loading_icons/5.gif">
									</td>
								</tr>
							</table>
						</loading>
					</oajax:CallbackPanel>
				</td>
			</tr>
		</table>
		<br />
		<a onclick="UpdateWeather()" style="cursor:pointer;font-weight:bold;text-decoration:underline">Update Weather</a>
		<br />
		<br />
		<small style="font-size:11px;font-weight:bold">The information in this example are not real.
		<br />In a real life application the weather information is taken from a live web service.
		</small>
		<br />
		<br />
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>
