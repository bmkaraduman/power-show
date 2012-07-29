<%@ Page language="c#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>
<html>
	<head>
	</head>
	<body>
<obout:CallbackPanel runat="server" ID="postbackPanel5">
	<content style="border: 1px solid gray; background-color: #EFEFEF;">
		<table width=100% height=100% cellpadding=0 cellspacing=0>
			<tr>
				<td align=center valign="middle" class="tdText">
					<osm:SlideMenu
							id = "pro7"
							runat = "server"
							StyleFolder = "../slidemenu/styles/pro_7"
							Height = 110
							SelectedId = "a_a"
							Speed = 25>
						<menuitems>
						<osm:Parent id="a">Company Home</osm:Parent>
								<osm:Child id="a_a">
									Entertainment
								</osm:Child>
								<osm:Child id="a_b">
									Games
								</osm:Child>
								<osm:Child id="a_c">
									Greeting Cards
								</osm:Child>
								<osm:Child id="a_d">
									Downloads
								</osm:Child>
								<osm:Child id="a_e">
									New Cars
								</osm:Child>
								<osm:Child id="a_f">
									Used Vehicles
								</osm:Child>
								<osm:Child id="a_g">
									Smart Stuff
								</osm:Child>
							<osm:Parent id="b">System Tasks</osm:Parent>
								<osm:Child id="b_a">
									View system info
								</osm:Child>
								<osm:Child id="b_b">
									Add programs
								</osm:Child>
								<osm:Child id="b_c">
									Change settings
								</osm:Child>
								<osm:Child id="b_d">
									Add users
								</osm:Child>
						</menuitems>
					</osm:SlideMenu>
				</td>
			</tr>
		</table>
	</content>
</obout:CallbackPanel>
	</body>
</html>