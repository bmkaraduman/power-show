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
		    <span class="tdText"><b>ASP.NET Splitter - Multiple Splitters - same style </b></span>
    	
		    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
		    <obspl:Splitter CookieDays="0" runat="server" StyleFolder="styles/default">
			    <LeftPanel WidthMin="100" WidthMax="400" WidthDefault="180">
				    <Content>
					    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
						    left content
					    </div>
				    </Content>
			    </LeftPanel>
			    <RightPanel>
				    <Content>
					    <obspl:Splitter CookieDays="0" 
						    runat="server" 
						    StyleFolder="styles/default">
						    <LeftPanel>
							    <Content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    left content
								    </div>
							    </Content>
						    </LeftPanel>
						    <RightPanel WidthMin="100" WidthMax="400" WidthDefault="180">
							    <content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    right content
								    </div>
							    </content>
						    </RightPanel>
					    </obspl:Splitter>
				    </Content>
				    <Footer Height="0"></Footer>
			    </RightPanel>
		    </obspl:Splitter>
		</form>
	</body>
</html>