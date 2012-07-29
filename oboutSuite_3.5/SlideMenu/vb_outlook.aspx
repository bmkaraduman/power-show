<%@ Page Language="VB" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	Dim osm As SlideMenu
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If Not Page.IsPostBack Then
			osm.AutoPostBack = true
			osm.StyleFolder = "styles/outlook"

            osm.Height = 200
            osm.AddParent("a", "Services")
            osm.AddChild("a_a", "<BR><img src='styles/outlook/computer.gif' class='SMChildImage'><BR>Desktop support")
            osm.AddChild("a_b", "<BR><img src='styles/outlook/network.gif' class='SMChildImage'><BR>Network services")
            osm.AddChild("a_c", "<BR><img src='styles/outlook/publishing.gif' class='SMChildImage'><BR>Publishing services")

            osm.AddParent("b", "Downloads")
            osm.AddChild("b_a", "<BR><img src='styles/outlook/search.gif' class='SMChildImage'><BR>Search")
            osm.AddChild("b_b", "<BR><img src='styles/outlook/drive.gif' class='SMChildImage'><BR>Big list")

            osm.AddParent("c", "Contact us")
            osm.AddChild("c_a", "<BR><img src='styles/outlook/contact.gif' class='SMChildImage'><BR>E-mail")
            osm.AddChild("c_b", "<BR><img src='styles/outlook/chat.gif' class='SMChildImage'><BR>Talk to us live")

		End If
	End Sub

	Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		osm = New SlideMenu()
		osm.ID = "outlook"
		SMPlaceholder.Controls.Add(osm)
	End Sub

</script>
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
	        <span class="tdText"><b>ASP.NET Slide Menu - Outlook style</b></span>
		    <br /><br />	
			<br /><br />
			
			<ASP:PlaceHolder runat="server" id="SMPlaceholder"></ASP:PlaceHolder>
			
			<br /><br /><br />
			
			 <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
			 
		</form>
	</body>
</html>