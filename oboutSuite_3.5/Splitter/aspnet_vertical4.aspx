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
		    <span class="tdText"><b>ASP.NET Splitter - With header and footer</b></span>
    	
		    <br /><br />
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />
		    <div style="height:100px;background-color:gray">
			    ... header content here ...
		    </div>
		    <obspl:Splitter FooterHeight="50" CookieDays="0" runat="server" StyleFolder="styles/default">            
			    <LeftPanel WidthMin="100" WidthMax="400">
				    <Content>
					    ... Left Panel content here ...<
				    </Content>
			    </LeftPanel>
			    <RightPanel>
				    <Content>
					    ... Right Panel content here ...
					    <br />
					    <br />
					    With header and footer.
				    </Content>
			    </RightPanel>
		    </obspl:Splitter>
		    <div style="height:50px;background-color:gray">
			    ... footer content here ...
		    </div>
	    </form>
    </body>
</html>