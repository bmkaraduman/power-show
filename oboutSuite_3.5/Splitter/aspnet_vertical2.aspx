<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	    <title>obout ASP.NET Splitter examples</title>
    	   
	    <!--// Only needed for this page's formatting //-->
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
		    <span class="tdText"><b>ASP.NET Splitter - WidthDefault property of the left panel</b></span>
    	
		    <br /><br />
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />
		    <obspl:Splitter CookieDays="0" runat="server" StyleFolder="styles/default">            
			    <LeftPanel WidthDefault="300" WidthMin="100" WidthMax="400">
				    <Content>
					    ... Left Panel content here ...
					    <br /><br />
					    Default size of this panel is 300.
				    </Content>
			    </LeftPanel>
			    <RightPanel>
				    <Content>
					    ... Right Panel content here ...
				    </Content>
			    </RightPanel>
		    </obspl:Splitter>
        </form>
    </body>
</html>