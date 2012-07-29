<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
	    <title>obout ASP.NET Splitter examples</title>
    	   
        <style type="text/css">
            body
            {
	            font-family:Verdana;
            }
            .text
            {
	            background-color:#ebe9ed;
	            font-size:11px;
	            text-align:center;
            }
            .textContent
            {
	            font-size:11px;
	            text-align:center;
            }
            .tdText {
                font:11px Verdana;
                color:#333333;
            }
        </style>
 
    </head>
    <body>
	    <form id="Form1" runat="server">
	        <br />
		    <span class="tdText"><b>ASP.NET Splitter - Nested splitters </b></span>
    	
		    <br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	  
            <spl:Splitter CookieDays="0" runat="server" StyleFolder="styles/default">
	            <LeftPanel WidthDefault="200" WidthMin="100" WidthMax="400" >
		            <Content>
			            <div style="width:100%;height:100%;" class="textContent">
				            <br />
				            <br />
				            Left content.
			            </div>
		            </Content>
	            </LeftPanel>
	            <RightPanel>
		            <Content>
			            <spl:Splitter PanelResizable="left" CookieDays="0" runat="server" StyleFolder="styles/default">
				            <LeftPanel>
					            <Content>
						            <spl:HorizontalSplitter CookieDays="0" runat="server" StyleFolder="styles/default">
							            <TopPanel HeightDefault="200" HeightMin="100" HeightMax="400">
								            <Content>
									            <div style="width:100%;height:100%;" class="textContent">
										            <br />
										            <br />
										            <br />
										            Top middle content.
									            </div>
								            </Content>
							            </TopPanel>
							            <BottomPanel>
								            <Content>
									            <div style="width:100%;height:100%;" class="textContent">
										            <br />
										            <br />
										            <br />
										            Bottom middle content.
									            </div>
								            </Content>
							            </BottomPanel>
						            </spl:HorizontalSplitter>
					            </Content>
				            </LeftPanel>
				            <RightPanel WidthDefault="200" WidthMin="100" WidthMax="400">
					            <Content>
						            <div style="width:100%;height:100%;" class="textContent">
							            <br />
							            <br />
							            <br />
							            Right content.
						            </div>
					            </Content>
				            </RightPanel>
			            </spl:Splitter>
		            </Content>
	            </RightPanel>
            </spl:Splitter>
        </form>
    </body>
</html>
