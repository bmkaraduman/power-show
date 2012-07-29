<%@ Page Language="C#" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout slide menu example - slideshow style</title>
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
	        <span class="tdText"><b>ASP.NET Slide Menu - slide show style</b></span>
		    <br /><br />	
			<br /><br />
			 
		    <osm:SlideMenu id = "proshow"
				    runat = "server"
				    StyleFolder = "styles/slideshow"
				    SelectedId = "a_a">
			    <menuitems>
				    <osm:Parent id="a">Yacht</osm:Parent>
					    <osm:Child >
						    <img src="styles/slideshow/show_yacht.gif" border="0">
					    </osm:Child>
				    <osm:Parent id="b">Surfboard</osm:Parent>
					    <osm:Child >
						    <img src="styles/slideshow/show_yacht2.jpg" border="0">
					    </osm:Child>
				    <osm:Parent id="c">Blue sky</osm:Parent>
					    <osm:Child >
						    <img src="styles/slideshow/show_clouds.gif" border="0">
					    </osm:Child>
			    </menuitems>
		    </osm:SlideMenu>
    			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
			
		</form>
	</body>
</html>