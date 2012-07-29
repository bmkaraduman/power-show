<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" Inherits="cs_thumbnails" Src="cs_thumbnails.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		<style type="text/css">
            .tdText {
                font:11px Verdana;
                color:#333333;
            }
        </style>
	</head>
    <body>
        <form id="Form1" runat="server">
            <br />
	        <span class="tdText"><b>ASP.NET Splitter - Thumbnails Resize</b></span>
    	
	        <br /><br />
            <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
            <br /><br />
		    <obspl:Splitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
			    <LeftPanel WidthDefault="400" WidthMin="100" WidthMax="600" >
				    <header height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
					    left content
					    </div>
				    </content>
				    <footer height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    optional left footer
					    </div>
				    </footer>
			    </LeftPanel>
			    <RightPanel>
			    <header height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    optional right header
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:20px;padding-top:10px">
						    <img src="images/brown_field_and_sky.jpg" width="32%" />
						    <img src="images/field_from_woods.jpg" width="32%" />
						    <img src="images/field_green_sky.jpg" width="32%" />
						    <br />
						    <img src="images/flowers_on_slope.jpg" width="32%" />
						    <img src="images/fog_river_hills.jpg" width="32%" />
						    <img src="images/grass.jpg" width="32%" />
						    <br />
						    <img src="images/green_fields.jpg" width="32%" />
						    <img src="images/green_grass.jpg" width="32%" />
						    <img src="images/ice_fragments.jpg" width="32%" />
					    </div>
				    </content>
				    <footer height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						    <br />
						    optional right footer
					    </div>
				    </footer>
			    </RightPanel>
		    </obspl:Splitter>
		 </form>
	</body>
</html>