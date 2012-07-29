<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
	    <title>obout ASP.NET Splitter examples</title>
    	   
        <style type="text/css">
            .tdText 
		    {
	            font:11px Verdana;
	            color:#333333;
            }
		</style>
	</head>
	<body>
	    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Right panel min and max</b></span>
	    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
		    <obspl:Splitter CookieDays="0" runat="server" StyleFolder="styles/default">            
			    <LeftPanel>
				    <Content>
					    ... Left Panel content here ...
					    <br />
					    <br />
					    Right panel min and max.
				    </Content>
			    </LeftPanel>
			    <RightPanel WidthMin="100" WidthMax="400" WidthDefault="200">
				    <Content>
					    ... Right Panel content here ...			
				    </Content>
			    </RightPanel>
		    </obspl:Splitter>
		 </form>
	</body>
</html>