<%@ Page Language="C#" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout slide menu example - pro_2 style</title>
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
	        <span class="tdText"><b>ASP.NET Slide Menu - pro_2 style</b></span>
		    <br /><br />	
			<br /><br />
			
			<osm:SlideMenu id = "pro_2"
					runat = "server"
					AutoPostback="true"
					StyleFolder="styles/pro_2">
				<menuitems>
				<osm:Parent id="a">Company Home</osm:Parent>
					<osm:Child>
						Entertainment
					</osm:Child>
					<osm:Child>
						Games
					</osm:Child>
					<osm:Child>
						Greeting Cards
					</osm:Child>
					<osm:Child>
						Downloads
					</osm:Child>
				<osm:Parent id="b">System Tasks</osm:Parent>
					<osm:Child>
						View system info
					</osm:Child>
					<osm:Child>
						Add programs
					</osm:Child>
					<osm:Child>
						Change settings
					</osm:Child>
					<osm:Child>
						Add users
					</osm:Child>
				</menuitems>
			</osm:SlideMenu>
			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
			
		</form>
	</body>
</html>