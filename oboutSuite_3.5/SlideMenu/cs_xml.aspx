<%@ Page Language="C#" %>
<%@ Register TagPrefix="osm" Namespace="OboutInc.SlideMenu" Assembly="obout_SlideMenu3_Pro_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
	protected SlideMenu osm;
	
	void Page_Load(Object o, EventArgs e) {
		if(!Page.IsPostBack) {
			osm.AutoPostBack = true;
			osm.StyleFolder = "styles/pro_5";
            osm.XmlPath = "data.xml";
		}
	}

	void Page_Init(Object o, EventArgs e) {
		osm = new SlideMenu();
		osm.ID = "pro_5";
		SMPlaceholder.Controls.Add(osm);
	}

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
	        <span class="tdText"><b>ASP.NET Slide Menu - XML</b></span>
		    <br /><br />	
			<br /><br />
			
			<ASP:PlaceHolder runat="server" id="SMPlaceholder"></ASP:PlaceHolder>
			
			<br /><br /><br />
			
			<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
			
		</form>
	</body>
</html>