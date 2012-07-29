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
	        <span class="tdText"><b>ASP.NET Slide Menu - xp_mcenter style</b></span>
		    <br /><br />	
			<br /><br />
			
		    <osm:SlideMenu id = "problue"
				    runat = "server"
				    StyleFolder = "styles/xp_mcenter"
			        AutoPostBack="true"
				    SelectedId = "viewsysinfo">
			    <menuitems>
				    <osm:Parent id="systasks">System Tasks</osm:Parent>
					    <osm:Child id="viewsysinfo">
						    <img src="styles/xp_mcenter/xp_check.gif" class="SMChildImage">
						    View system information
					    </osm:Child>
					    <osm:Child id="addremove">
						    <img src="styles/xp_mcenter/xp_programs.gif" class="SMChildImage">
						    Add or remove programs
					    </osm:Child>
				    <osm:Parent id="other">Other Places</osm:Parent>
					    <osm:Child id="mydocs">
						    <img src="styles/xp_mcenter/xp_documents.gif" class="SMChildImage">
						    My Documents
					    </osm:Child>
					    <osm:Child id="shareddocs">
						    <img src="styles/xp_mcenter/xp_sdocuments.gif" class="SMChildImage">
						    Shared Documents
					    </osm:Child>
					    <osm:Child id="cpanel">
						    <img src="styles/xp_mcenter/xp_setting.gif" class="SMChildImage">
						    Control Panel
					    </osm:Child>
				    <osm:Parent id="filetasks">File and Folder Tasks</osm:Parent>
					    <osm:Child id="newfolder">
						    <img src="styles/xp_mcenter/xp_newfolder.gif" class="SMChildImage">
						    Make a new folder
					    </osm:Child>
					    <osm:Child id="sharefolder">
						    <img src="styles/xp_mcenter/xp_share.gif" class="SMChildImage">
						    Share this folder
					    </osm:Child>
			    </menuitems>
		    </osm:SlideMenu>
    			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
			
		</form>
	</body>
</html>