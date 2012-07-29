<%@ Page Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	public void UpdateSlideMenu(string cId)
	{
		pro7.SelectedId = cId;	
		UpdatePanel("cp_slidemenu");
	}
</script>
<html>
	<head runat="server">
		<script language="javascript">
			function LoadMainPage(id)
			{
				// select the click-ed node from the slidemenu using a callback to the server and a callbackpanel for update
				ob_post.post(null, 'UpdateSlideMenu', function(){}, {"cId":id});
				
				// load the right content page with the details
				window.parent.mySpl.loadPage('RightContent', 'aspnet_slidemenu_main.aspx?cId=' + id)
			}
		</script>
	</head>
	<body>
		<oajax:CallbackPanel id="cp_slidemenu" runat="server">
			<content>
				<osm:SlideMenu
						id = "pro7"
						runat = "server"
						StyleFolder = "../slidemenu/styles/pro_7"
						Height = 183
						SelectedId = "a_a"
						Speed = 25>
					<menuitems>
					<osm:Parent id="a">Company Home</osm:Parent>
							<osm:Child id="a_a" OnClientClick="LoadMainPage('a_a')">
								Entertainment
							</osm:Child>
							<osm:Child id="a_b" OnClientClick="LoadMainPage('a_b')">
								Games
							</osm:Child>
							<osm:Child id="a_c" OnClientClick="LoadMainPage('a_c')">
								Greeting Cards
							</osm:Child>
							<osm:Child id="a_d" OnClientClick="LoadMainPage('a_d')">
								Downloads
							</osm:Child>
							<osm:Child id="a_e" OnClientClick="LoadMainPage('a_e')">
								New Cars
							</osm:Child>
							<osm:Child id="a_f" OnClientClick="LoadMainPage('a_f')">
								Used Vehicles
							</osm:Child>
							<osm:Child id="a_g" OnClientClick="LoadMainPage('a_g')">
								Smart Stuff
							</osm:Child>
						<osm:Parent id="b">System Tasks</osm:Parent>
							<osm:Child id="b_a" OnClientClick="LoadMainPage('b_a')">
								View system info
							</osm:Child>
							<osm:Child id="b_b" OnClientClick="LoadMainPage('b_b')">
								Add programs
							</osm:Child>
							<osm:Child id="b_c" OnClientClick="LoadMainPage('b_c')">
								Change settings
							</osm:Child>
							<osm:Child id="b_d" OnClientClick="LoadMainPage('b_d')">
								Add users
							</osm:Child>
						<osm:Parent id="c">Other places</osm:Parent>
							<osm:Child id="c_a" OnClientClick="LoadMainPage('c_a')">
								My Network Places
							</osm:Child>
							<osm:Child id="c_b" OnClientClick="LoadMainPage('c_b')">
								My Documents
							</osm:Child>
							<osm:Child id="c_c" OnClientClick="LoadMainPage('c_c')">
								Shared Documents
							</osm:Child>
							<osm:Child id="c_d" OnClientClick="LoadMainPage('c_d')">
								Control Panel
							</osm:Child>
						<osm:Parent id="d">Short Parent</osm:Parent>
							<osm:Child id="d_a" OnClientClick="LoadMainPage('d_a')">
								Make a new folder
							</osm:Child>
							<osm:Child id="d_b" OnClientClick="LoadMainPage('d_b')">
								Publish to the Web
							</osm:Child>
							<osm:Child id="d_c" OnClientClick="LoadMainPage('d_c')">
								Share this folder
							</osm:Child>
						<osm:Parent id="e">Explore Site</osm:Parent>
							<osm:Child id="e_a" OnClientClick="LoadMainPage('e_a')">
								Business
							</osm:Child>
							<osm:Child id="e_b" OnClientClick="LoadMainPage('e_b')">
								Buy Tickets
							</osm:Child>
							<osm:Child id="e_c" OnClientClick="LoadMainPage('e_c')">
								Careers
							</osm:Child>
						<osm:Parent id="f">Resources</osm:Parent>
							<osm:Child id="f_a" OnClientClick="LoadMainPage('f_a')">
								E-newsletters
							</osm:Child>
							<osm:Child id="f_b" OnClientClick="LoadMainPage('f_b')">
								Discussion Center
							</osm:Child>
							<osm:Child id="f_c" OnClientClick="LoadMainPage('f_c')">
								White Papers
							</osm:Child>
							<osm:Child id="f_d" OnClientClick="LoadMainPage('f_d')">
								Online Courses
							</osm:Child>
							<osm:Child id="f_e" OnClientClick="LoadMainPage('f_e')">
								Online Book Library
							</osm:Child>
							<osm:Child id="f_f" OnClientClick="LoadMainPage('f_f')">
								Books & CDs
							</osm:Child>
							<osm:Child id="f_g" OnClientClick="LoadMainPage('f_g')">
								Free Product Info
							</osm:Child>
					</menuitems>
				</osm:SlideMenu>
			</content>
		</oajax:CallbackPanel>	
	</body>
</html>