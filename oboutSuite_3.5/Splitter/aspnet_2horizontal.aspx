<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<html>
    <head>
    <title>obout ASP.NET Splitter Examples</title>
    <style>
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
	        <span class="tdText"><b>ASP.NET Splitter - Nested splitters - Horizontal</b></span>
    	
	        <br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />
            <spl:HorizontalSplitter CookieDays="0" runat="server" StyleFolder="styles/default">
	            <TopPanel HeightDefault="200" HeightMin="100" HeightMax="400" >
		            <Content>
			            <div style="width:100%;height:100%;" class="textContent">
				            <br />
				            <br />
				            top content
			            </div>
		            </Content>
	            </TopPanel>
	            <BottomPanel>
		            <Content>
			            <spl:HorizontalSplitter PanelResizable="top" CookieDays="0" runat="server" StyleFolder="styles/default">
				            <TopPanel>
					            <Content>
						            <div style="width:100%;height:100%;" class="textContent">
							            <br />
							            <br />
							            <br />
							            middle content
						            </div>
					            </Content>
				            </TopPanel>
				            <BottomPanel HeightDefault="200" HeightMin="100" HeightMax="400">
					            <Content>
						            <div style="width:100%;height:100%;" class="textContent">
							            <br />
							            <br />
							            <br />
							            bottom content
						            </div>
					            </Content>
				            </BottomPanel>
			            </spl:HorizontalSplitter>
		            </Content>
	            </BottomPanel>
            </spl:HorizontalSplitter>
        </form>
    </body>
</html>
