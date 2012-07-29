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
		    <span class="tdText"><b>ASP.NET Splitter - Inside a div with fixed size</b></span>
    	
		    <br /><br />
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	
		    <div style="width:600px;height:500px;border:1px solid gray">
			    <obspl:HorizontalSplitter CookieDays="0" runat="server" StyleFolder="styles/default">            
				    <TopPanel HeightMin="100" HeightMax="400">
					    <Content>
						    ... Top Panel content here ...
					    </Content>
				    </TopPanel>
				    <BottomPanel>
					    <Content>
						    ... Bottom Panel content here ...
						    <br />
						    <br />
						    Inside a div with fixed size.
					    </Content>
				    </BottomPanel>
			    </obspl:HorizontalSplitter>
		    </div>
	    </form>
    </body>
</html>