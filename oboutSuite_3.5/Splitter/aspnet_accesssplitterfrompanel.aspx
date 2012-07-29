<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Splitter2_Net" Namespace="OboutInc.Splitter2" TagPrefix="obspl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
        void Page_Load(object sender, EventArgs e) {
				
        }       
</script>

<html>
	<head id="Head1" runat="server">
	    <title>obout ASP.NET Splitter examples</title>
    	   
        <style type="text/css">
            .tdText 
		    {
	            font:11px Verdana;
	            color:#333333;
            }
        </style>
	</head>
	<body>
	    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Access Splitter client object from panel</b></span>
	    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
				<obspl:Splitter StyleFolder="styles/default" id="Splitter1" runat="server" CookieDays="0">
						<LeftPanel WidthMin="100">
								<header height="40">
										<div style="width:100%;height:100%;background-color:#e0e6ed" class="tdText" align="center">
										<br />
										optional left header
										</div>
								</header>
								<content>
										<div style="margin:5px;" class="tdText"> 
												Left panel content
										</div>
								</content>
								<footer height="40">
										<div style="width:100%; height: 100%;background-color:#e0e6ed;" class="tdText" align="center">
										<br />
										optional left footer
										</div>
								</footer>
						</LeftPanel>
						<RightPanel WidthMin="100" WidthDefault="350">
						<header height="50">
										<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
										<br />
										optional right header
										</div>
								</header>
								<content url="aspnet_accesssplitterfrompanel_page.aspx">

								</content>
								<footer height="50">
										<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
										<br />
										optional right footer
										</div>
								</footer>
						</RightPanel>
				</obspl:Splitter>
		    </form>
	</body>
</html>