<%@ Register TagPrefix="spl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register Src="aspnet_accessfromusercontrol.ascx" TagName="WebUserControl" TagPrefix="uc1" %>

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
		    <span class="tdText"><b>ASP.NET Splitter - Access from User Control</b></span>
    	
		    <br /><br />
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		    <br /><br />	
            <spl:Splitter CookieDays="0" id="spl1" runat="server" StyleFolder="styles/default" PanelResizable="left">
	            <LeftPanel>
		            <Header Height="50">
			            <div style="width:100%;height:100%;" class="text">
				            <br />				            
			            </div>
		            </Header>
		            <Content>
			            <div style="width:100%;height:100%;" class="textContent">
				            <br />
				            <br />
				            <br />
				            left content
			            </div>
		            </Content>
		            <Footer Height="50">
			            <div style="width:100%;height:100%;" class="text">
				            <br />
				            optional left footer
			            </div>
		            </Footer>
	            </LeftPanel>
	            <RightPanel WidthDefault="500">
		            <Header Height="50">
			            <div style="width:100%;height:100%;" class="text">
				            <br />
				            optional right header
			            </div>
		            </Header>
		            <Content>
			            <div style="width:100%;height:100%;" class="textContent">
				            <br />
				            <br />
				            <br />
				            right content contains an User Control:
				            <br />
				            <br />
				            <div style="border:1px solid black;padding:50px;">
					            <uc1:WebUserControl ID="WebUserControl1" runat="server" />
				            </div>
			            </div>
		            </Content>
		            <Footer Height="50">
			            <div style="width:100%;height:100%;" class="text">
				            <br />
				            optional right footer
			            </div>
		            </Footer>
	            </RightPanel>
            </spl:Splitter>
        </form>
    </body>
</html>
