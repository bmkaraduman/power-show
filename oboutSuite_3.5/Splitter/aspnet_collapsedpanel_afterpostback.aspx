<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Register Assembly="obout_Splitter2_Net" Namespace="OboutInc.Splitter2" TagPrefix="obspl" %>
<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	protected void btnPostback_Click(object sender, EventArgs e)
	{
		if (hiddenSplitterCollapsedState.Value == "collapse")
			ClientScript.RegisterStartupScript(this.GetType(), "splittercollapse", "CollapseLeftPanel()", true);
	}
</script>
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

		        function CollapseLeftPanel() {
		            addLoadEvent(function() {
		                Splitter1.CollapsePanel('left');
		            });
		        }

		        function SplitterCollapseExpand(mode, type) {
		            document.getElementById('<%= hiddenSplitterCollapsedState.ClientID %>').value = mode;
		        }
		    </script>	
	</head>
	<body>
	    <form id="Form1" runat="server">
		<span class="tdText"><b>ASP.NET Splitter - Collapsed panel after postback</b></span>
	
		<br /><br />
		<br /><br />
		<input type="hidden" id="hiddenSplitterCollapsedState" runat="server" />
		<asp:Button id="btnPostback" runat="server" onclick="btnPostback_Click" Text="Postback" /><br /><br />
		<div style="width:580px;height:300px;border:1px solid gray;">
			<obspl:Splitter OnSplitterCollapseExpand="SplitterCollapseExpand" CollapsePanel="left" StyleFolder="styles/default" id="Splitter1" runat="server" CookieDays="0">
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
        <br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
	