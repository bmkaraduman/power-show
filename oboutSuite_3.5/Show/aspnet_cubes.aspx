<%@ Page Language="C#" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Slide Menu example</title>
		<style type="text/css">
			body {
				font:11px Verdana;
				color:#333333;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}
			a:hover {
				color:crimson;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Slide Menu - Cubes style</b></span>
		    <br /><br />	
			<br /><br />
	        
			<osm:SlideMenu id = "cubes"
					runat = "server"
					AutoPostback="true"
					StyleFolder="styles/cubes">
				<menuitems>
					<osm:Parent>Cameras/Camcorders</osm:Parent>
						<osm:Child>
							Hot Picks
						</osm:Child>
						<osm:Child>
							Great Deals
						</osm:Child>
						<osm:Child>
							Digital Cameras
						</osm:Child>
						<osm:Child>
							Camcorders
						</osm:Child>
					<osm:Parent>Computers/Peripherals</osm:Parent>
						<osm:Child>
							Hot Picks
						</osm:Child>
						<osm:Child>
							Great Deals
						</osm:Child>
						<osm:Child>
							VAIO Notebooks
						</osm:Child>
						<osm:Child>
							VAIO Desktops
						</osm:Child>
				</menuitems>
			</osm:SlideMenu>
			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	     
	     </form>
	</body>
</html>