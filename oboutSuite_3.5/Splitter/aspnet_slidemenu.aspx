<%@ Register Tagprefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

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
	
		    <span class="tdText"><b>ASP.NET Splitter - Default style with Slide Menu</b></span>
    	
		    <br />
		    <br /><br />
		    <div style="width:686px;height:350px;border:1px solid #ebe9ed">			
			    <obspl:Splitter id="mySpl" runat="server" StyleFolder="styles/default_light" CookieDays="0">
				    <LeftPanel WidthDefault="170" WidthMin="100" WidthMax="350">
					    <content Url="aspnet_slidemenu_left.aspx" />
				    </LeftPanel>
				    <RightPanel>
					    <content Url="aspnet_slidemenu_main.aspx?cId=a_a" />					
				    </RightPanel>
			    </obspl:Splitter>
		    </div>
	        <br /><br />
    		
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
        </form>
    </body>
</html>