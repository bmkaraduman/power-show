<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net"%>
<%@ Page Language="vb" Inherits="vb_panelrefresh" Src="vb_panelrefresh.aspx.vb"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head id="Head1" runat="server">
		<title>obout ASP.NET Splitter examples</title>
		
		<style type="text/css">
		   .tdText {
		        font:11px Verdana;
		        color:#333333;
            }
		.Text
		{
			background-color:white;
			font-size:12px;
		}
		.inputButton
		{
			border:1px solid #6B89AF;
			width:250px;
		}
		body
		{
			font-family:Tahoma;
			font-size:8pt;
		}
		.pointer
		{
			cursor:pointer;
		}
		 </style>
	</head>
	<body>
    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Panel Refresh</b></span>
	
		<br /><br />
	     <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
	    <br /><br />
		<obspl:Splitter CookieDays="0" id="sp1" runat="server" StyleFolder="styles/default">
			<LeftPanel WidthMin="100" WidthMax="400" WidthDefault="180">
				<header height="100">
					<div style="width:100%;height:40px;text-align:center;">
						<br />
						
					</div>
					<div style="width:100%;height:60px;text-align:center;vertical-align:middle">
						<br />
						<a href="javascript:sp1.Refresh('LeftContent', true)"><b>Send/Receive</b></a>
					</div>
				</header>
				<Content Url="vb_emailfolders.aspx" />
			</LeftPanel>
			<RightPanel>
				<Content>
					<obspl:HorizontalSplitter CookieDays="0" id="sp2" runat="server" StyleFolder="styles/default">
						<TopPanel HeightMin="100" HeightMax="300" HeightDefault="150">
							<Content></Content>
						</TopPanel>
						<BottomPanel>
							<Content></Content>
						</BottomPanel>
					</obspl:HorizontalSplitter>
				</Content>
				<Footer Height="0"></Footer>
			</RightPanel>
		</obspl:Splitter>
	    </form>
	</body>
</html>

<script type="text/javascript">

// load, specified by param, an email category
function EmailclientLoad(CategoryID)
{
	CategoryID = CategoryID.replace("a0_", "");
	CategoryID = CategoryID.replace("a1_", "");
	
	if (isNaN(CategoryID))
		CategoryID = 0;
	
	sp2.loadPage("TopContent", "vb_emailclient_list.aspx?CategoryID="+CategoryID);
}

</script>