<%@ Register Tagprefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

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
	
		<span class="tdText"><b>ASP.NET Splitter - Default style with Flyout</b></span>
	
		<br />
		<br /><br />
		<div style="width:630px;height:440px;border:1px solid #ebe9ed">			
				<obspl:Splitter runat="server" StyleFolder="styles/default" 
					CookieDays="0" id="mySpl" CollapsePanel="left"
					CollapseLeftTooltip="" CollapseRightTooltip=""
					ExpandLeftTooltip="" ExpandRightTooltip="">
					<LeftPanel WidthMin="100" WidthMax="400">
						<header height="50">
							<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
							<br />
							optional left header
							</div>
						</header>
						<content>
							<div class="tdText" style="padding-top:100px" align="center">
								left panel content
							</div>
						</content>
						<footer height="50">
							<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
							<br />
							optional left footer
							</div>
						</footer>
					</LeftPanel>
				
					<RightPanel>
						<header height="50">
							<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
							<br />
							optional right header
							</div>
						</header>
						<content>
						<div class="tdText" style="width:390px;height:90%;padding-left:10px;padding-top:10px">
							<b>Move the mouse over the collpasing image.</b>
							<br />
							<br />
							<br />
						</div>
						</content>
						<footer height="50">
							<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
							<br />
							optional right footer
							</div>
						</footer>
					</RightPanel>
				</obspl:Splitter>
			</div>
			
			 <obout:Flyout runat="server" FadingEffect="true" SlidingEffect="RIGHT" ID="Flyout2" AttachTo="dividerImg_mySpl" RelativeLeft="7" Position="ABSOLUTE" DelayTime="300" >
				<img src="images/clickhere.gif" />
			</obout:Flyout>
            <br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
	