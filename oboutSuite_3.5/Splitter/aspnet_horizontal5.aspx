<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

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
		    <span class="tdText"><b>ASP.NET Splitter - Inside a div with dynamic size</b></span>
    	
		    <br /><br />
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	
		    <div style="width:70%;height:80%;border:1px solid gray">
			    <obspl:HorizontalSplitter id="Splitter1" CookieDays="0" runat="server" StyleFolder="styles/default">            
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
						    Inside a div with dynamic size.<
					    </Content>
				    </BottomPanel>
			    </obspl:HorizontalSplitter>
		    </div>
	    </form>
    </body>
</html>