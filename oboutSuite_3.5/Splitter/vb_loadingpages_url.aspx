<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Page Language="vb" Inherits="loadingpages_url" Src="vb_loadingpages_url.aspx.vb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
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
		<span class="tdText"><b>ASP.NET Splitter - Set URL on server</b></span>
	
		<br /><br />
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	    <br /><br />
		<obspl:Splitter id="splDV" runat="server">
			<LeftPanel>
				<header>
					<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					<br />
					</div>
				</header>
				<content />
				<footer>
					<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					<br />
					optional left footer
					</div>
				</footer>
			</LeftPanel>
			<RightPanel>
				<header>
					<div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					<br />
					optional right header
					</div>
				</header>
				<content />
				<footer>
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