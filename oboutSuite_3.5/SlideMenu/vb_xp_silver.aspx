<%@ Page Language="VB" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

	Dim osm As SlideMenu
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If Not Page.IsPostBack Then
			osm.AutoPostBack = true
			osm.StyleFolder = "styles/xp_silver"

            'build menu
            osm.AddParent("systasks", "System Tasks")
            osm.AddChild("viewsysinfo", "<img src='styles/xp_silver/xp_check.gif' class='SMChildImage'>View system information")
            
            osm.AddChild("addremove", "<img src='styles/xp_silver/xp_programs.gif' class='SMChildImage'>Add or remove programs")

            osm.AddParent("other", "Other Places")
            osm.AddChild("mydocs", "<img src='styles/xp_silver/xp_documents.gif' class='SMChildImage'>My Documents")
            osm.AddChild("shareddocs", "<img src='styles/xp_silver/xp_sdocuments.gif' class='SMChildImage'>Shared Documents")
            osm.AddChild("cpanel", "<img src='styles/xp_silver/xp_setting.gif' class='SMChildImage'>Control Panel")

            osm.AddParent("filetasks", "File and Folder Tasks")
            osm.AddChild("newfolder", "<img src='styles/xp_silver/xp_newfolder.gif' class='SMChildImage'>Make a new folder")
            osm.AddChild("sharefolder", "<img src='styles/xp_silver/xp_share.gif' class='SMChildImage'>Share this folder")

		End If
	End Sub

	Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		osm = New SlideMenu()
		osm.ID = "xp_silver"
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
	        <span class="tdText"><b>ASP.NET Slide Menu - XP Silver style</b></span>
		    <br /><br />	
			<br /><br />
			
			<ASP:PlaceHolder runat="server" id="SMPlaceholder"></ASP:PlaceHolder>
			
			<br /><br /><br />
			
			 <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
			 
		</form>
	</body>
</html>