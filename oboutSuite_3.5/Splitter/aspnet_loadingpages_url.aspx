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
		    <span class="tdText"><b>ASP.NET Splitter - Set URL on server </b></span>
    	
		    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
		    <obspl:Splitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
			    <LeftPanel WidthDefault="240" WidthMin="100" WidthMax="400" >
				    <header height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    </div>
				    </header>
				    <content Url="HTMFiles/1.html" />
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
				    <content Url="HTMFiles/2_1.html" />
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