<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="C#" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
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
		    <span class="tdText"><b>ASP.NET Splitter - Default Resize</b></span>
    	
		    <br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	
		    <obspl:Splitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
			    <LeftPanel WidthDefault="140" WidthMin="50" WidthMax="400">
				    <header height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
					    left panel content				
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
			    <header height="70">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="left">
					    <br />
					    Try moving the vertical bar to resize the area. <br />
					    The resize is done after you drop the additional bar. 
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
					    right panel content
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