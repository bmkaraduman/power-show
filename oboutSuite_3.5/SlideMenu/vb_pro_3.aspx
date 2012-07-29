<%@ Page Language="VB" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	Dim osm As SlideMenu
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If Not Page.IsPostBack Then
			osm.AutoPostBack = true
			osm.StyleFolder = "styles/pro_3"

            osm.AddParent("a", "Company Home")
            osm.AddChild("a_a", "Entertainment")
            osm.AddChild("a_b", "Games")
            osm.AddChild("a_c", "Greeting Cards")
            osm.AddChild("a_d", "Downloads")

            osm.AddParent("b", "System Tasks")
            osm.AddChild("b_a", "View System info")
            osm.AddChild("b_b", "Add programs")
            osm.AddChild("b_c", "Change settings")
            osm.AddChild("b_d", "Add users")
		End If
	End Sub

	Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		osm = New SlideMenu()
		osm.ID = "pro_3"
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
	        <span class="tdText"><b>ASP.NET Slide Menu - Pro_3 style </b></span>
		    <br /><br />	
			<br /><br />
			
			<ASP:PlaceHolder runat="server" id="SMPlaceholder"></ASP:PlaceHolder>
			
			<br /><br /><br />
			
			 <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
			 
		</form>
	</body>
</html>