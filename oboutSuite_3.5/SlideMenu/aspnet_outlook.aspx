<%@ Page Language="C#" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Slide Menu examples</title>
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
	        <span class="tdText"><b>ASP.NET Slide Menu - outlook style</b></span>
		    <br /><br />	
			<br /><br />

		    <osm:SlideMenu id = "outlook"
				    runat = "server"
				    StyleFolder = "styles/outlook"
				    Height=200>
			    <menuitems>
				    <osm:Parent id="a">Services</osm:Parent>
					    <osm:Child id="a_a" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/computer.gif" class="SMChildImage"><BR>
						    Desktop support
					    </osm:Child>
					    <osm:Child id="a_b" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/network.gif" class="SMChildImage"><BR>
						    Network services
					    </osm:Child>
					    <osm:Child id="a_c" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/publishing.gif" class="SMChildImage"><BR>
						    Publishing services
					    </osm:Child>
				    <osm:Parent id="b">Downloads</osm:Parent>
					    <osm:Child id="b_a" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/search.gif" class="SMChildImage"><BR>
						    Search
					    </osm:Child>
					    <osm:Child id="b_b" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/drive.gif" class="SMChildImage"><BR>
						    Big list
					    </osm:Child>
				    <osm:Parent id="c">Contact us</osm:Parent>
					    <osm:Child id="c_a" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/contact.gif" class="SMChildImage"><BR>
						    E-mail
					    </osm:Child>
					    <osm:Child id="c_b" Url="aspnet_outlook.aspx">
						    <BR><img src="styles/outlook/chat.gif" class="SMChildImage"><BR>
						    Talk to us live
					    </osm:Child>
			    </menuitems>
			    </osm:SlideMenu>
    			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
			
		</form>
	</body>
</html>