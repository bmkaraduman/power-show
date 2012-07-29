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
		    <span class="tdText"><b>ASP.NET Splitter - CookieDays </b></span>
    	
		    <br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	
		    <b>CookieDays = 10</b>
		    <div style="width:686px;height:200px;border:1px solid #ebe9ed">
			    <obspl:Splitter CookieDays="10" StyleFolder="styles/default" id="splDV" runat="server">
				    <LeftPanel WidthDefault="140" WidthMin="100" WidthMax="400">
					    <header height="50">
						    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						    <br />
						    optional left header
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
						    <div class="tdText" style="padding-left:10px;padding-top:10px">
							    <br />
							    right content
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
		    </div>
		    <br />
		    <br />
		    <b>CookieDays = 0</b>
		    <div style="width:686px;height:200px;border:1px solid #ebe9ed">
			    <obspl:Splitter CookieDays="0" StyleFolder="styles/default" id="splDV2" runat="server">
				    <LeftPanel WidthDefault="140" WidthMin="100" WidthMax="400">
					    <header height="50">
						    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
						    <br />
						    optional left header
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
						    <div class="tdText" style="padding-left:10px;padding-top:10px">
							    <br />
							    right content
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
		    </div>
		    <br />
		    <br />
		    <br />
		    <a href="aspnet_cookiedays.aspx">Click here to reload the page</a>.<br /><br />
		    First splitter will keep its previous separator position for 10 days. <br />
		    Second splitter will take its separator position from the component default value.
		 </form>
	</body>
</html>