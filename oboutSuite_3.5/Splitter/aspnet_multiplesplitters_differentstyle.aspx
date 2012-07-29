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
		    <span class="tdText"><b>ASP.NET Splitter - Multiple Splitters - different style </b></span>
    	
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
					    <obspl:HorizontalSplitter CookieDays="0" 
						    runat="server" 
						    CSSPath="styles/ExtraStyle/style.css" CSSPanel="ob_spl_panel_1" CSSDivider="ob_spl_dividerhorizontal_1"
						    CSSResizeBar="ob_spl_resizebarhorizontal_1" CSSTopPanel="ob_spl_toppanel_1" CSSTopPanelHeader="ob_spl_toppanelheader_1"
						    CSSTopPanelContent="ob_spl_toppanelcontent_1" CSSTopPanelFooter="ob_spl_toppanelfooter_1"  
						    CSSBottomPanel="ob_spl_bottompanel_1" CSSBottomPanelHeader="ob_spl_bottompanelheader_1" CSSBottomPanelContent="ob_spl_bottompanelcontent_1"
						    CSSBottomPanelFooter="ob_spl_bottompanelfooter_1" CSSCollapseTop="ob_spl_collapsetop_1"
						    CSSCollapseBottom="ob_spl_collapsebottom_1">
						    <TopPanel HeightDefault="100" HeightMin="50" HeightMax="200">
							    <Content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    top content
								    </div>
							    </Content>
						    </TopPanel>
						    <BottomPanel>
							    <content>
								    <div style="padding-left:10px;padding-top:10px;padding-right:10px;" class="tdText"> 
									    bottom content
								    </div>
							    </content>
						    </BottomPanel>
					    </obspl:HorizontalSplitter>
				    </Content>
				    <Footer Height="0"></Footer>
			    </RightPanel>
		    </obspl:Splitter>
		 </form>
	</body>
</html>