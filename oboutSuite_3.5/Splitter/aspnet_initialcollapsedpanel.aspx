<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register Assembly="obout_Splitter2_Net" Namespace="OboutInc.Splitter2" TagPrefix="obspl" %>

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
		<span class="tdText"><b>ASP.NET Splitter - Initial Collapsed Panel</b></span>
	
		<br /><br />
		<br /><br />
		<div class="tdText">
		<span class="tdText">Click on the arrow of the splitter separator. <br />
		The left panel of the splitter will expand. <br />
		Click again to collapse the left panel back.</span>
		</div>
		    <br />
				    <div style="width:580px;height:300px;border:1px solid gray;">
			        <obspl:Splitter CollapsePanel="left" StyleFolder="styles/default" id="Splitter1" runat="server" CookieDays="0">
				        <LeftPanel WidthMin="100" WidthMax="400">
					        <content>
						        <div class="tdText" style="padding-left:10px;padding-top:10px">
						        <br />
							        left panel content
						        </div>
					        </content>
				        </LeftPanel>
				        <RightPanel>
					        <content>
						        <div class="tdText" style="padding-left:10px;padding-top:10px">
						        <br />
							        right panel content
						        </div>
					        </content>
				        </RightPanel>
			        </obspl:Splitter>
		        </div>
				<br /><span class="tdText">The feature also works in horizontal splitter.</span>
		
				<!-- Create Flyout with basic styles dividerImg_splDV-->
				<obout:Flyout runat="server" ID="Flyout2" AttachTo="__Splitter1Mid" Position="ABSOLUTE" RelativeLeft="5" RelativeTop="138" DelayTime="500" >
					<img src="images/clickhere.gif" alt=""/>
				</obout:Flyout>
				<br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
<script type="text/javascript">
    // add load event
    function addLoadEvent(func) {
        var oldonload = window.onload;
        if (typeof window.onload != 'function') {
            window.onload = func;
        } else {
            window.onload = function() {
                if (oldonload) {
                    oldonload();
                }
                func();
            }
        }
    }
    // first time loading - left panel collapsed
    addLoadEvent(function() {
        Splitter1.CollapsePanel('left');
    });
</script>