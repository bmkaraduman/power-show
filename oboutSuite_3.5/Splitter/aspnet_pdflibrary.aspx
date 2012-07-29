<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
	    <title>obout ASP.NET Splitter examples</title>

		<style type="text/css">
            .tdText {
		        font:11px Verdana;
		        color:#333333;
            }
			body
			{
				font-family:Verdana;
			}
			.text
			{
				font-size:11px;
				text-align:center;
			}
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <br />
		    <span class="tdText"><b>ASP.NET Splitter - PDF Library</b></span>
    	
		    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
			<obspl:Splitter CollapsePanel="left" runat="server" StyleFolder="styles/default2" LiveResize="true" CookieDays="0" id="mySpl">
				<LeftPanel WidthMin="100" WidthMax="400">
					<Header Height="50">
						<div style="width:100%;height:100%;" class="text">
							<br />
						</div>
					</Header>
					<content>
					<div style="margin:5px;">
						<ul>
							<li>
								<a href="javascript:mySpl.loadPage('RightContent', 'aspnet_ViewPDF.aspx?bookId=1')">ASP.NET Development</a>
							</li>
							<li>
								<a href="javascript:mySpl.loadPage('RightContent', 'aspnet_ViewPDF.aspx?bookId=5')">Developing Applications Using VB.NET and ASP.NET</a>
							</li>
							<li>
								<a href="javascript:mySpl.loadPage('RightContent', 'aspnet_ViewPDF.aspx?bookId=2')">Advanced ASP.NET 2.0 and ASP.NET AJAX</a>
							</li>
							<li>
								<a href="javascript:mySpl.loadPage('RightContent', 'aspnet_ViewPDF.aspx?bookId=3')">ASP.NET State Management</a>
							</li>
							<li>
								<a href="javascript:mySpl.loadPage('RightContent', 'aspnet_ViewPDF.aspx?bookId=4')">ASP.NET with Visual Basic .NET Training</a>
							</li>
						</ul>
					</div>
					</content>
				</LeftPanel>
			
				<RightPanel>
					<content>
					<div class="tdText" style="width:400px;height:80%;padding-left:30px;padding-top:30px">
						<h2>PDF Library</h2>
						Choose a book from the left menu...
					</div>
					</content>
				</RightPanel>
			</obspl:Splitter>
		</form>
	</body>
</html>
