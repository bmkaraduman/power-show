<%@ Page Language="C#" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
	<title>obout ASP.NET Easy Menu examples</title>

	<!--// Only needed for this page's formatting //-->
	<style type="text/css">
			body 
			{
			    font-family: Verdana; 
			    font-size: XX-Small; 
			    margin: 0px; 
			    padding: 20px
			}
			.title 
			{
			    font-size: X-Large; 
			    padding: 20px; 
			    border-bottom: 2px solid gray;
			}
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
	        .menuPrentItem {
	            border-bottom-style:solid;
	            border-bottom-color:#fff;
	            border-bottom-width:1px;
	            cursor: pointer; cursor: auto;
	            height: 25px;
	        }

	</style>
	
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - Horizontal Keep open</b></span>
		    <br /><br />	
			<br /><br />
			
	        <div style="padding-left:100px;">
	        <!--// The head of the menus //-->
        	
	        <table width="610px"><tr><td style="background-color:Gray; height:53px" valign="top">
        	
	        <oem:EasyMenu id="Easymenu4" runat="server" ShowEvent="Always" 
		        StyleFolder="styles/msdn2" Position="Horizontal" Width="100%" CSSMenu="menuPrentItem" >
		        <CSSClassesCollection>
        		
		        </CSSClassesCollection>
		        <Components>
			        <oem:MenuItem InnerHtml="Home" ID="MenuItem1" OnClientClick="selectMe('MenuItem1');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Library" ID="MenuItem2" OnClientClick="selectMe('MenuItem2');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Learn" ID="MenuItem3" OnClientClick="selectMe('MenuItem3');"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu5" runat="server" OffsetHorizontal="-1" Position="Horizontal" ShowEvent="MouseClick" ExpandStyle="Fade" 
		        AttachTo="MenuItem1" Align="Under" Width="600px" StyleFolder="styles/MSDN2" OffsetVertical="1" KeepOpen="true">
		        <Components>
			        <oem:MenuItem InnerHtml="Developer Centers" ID="MenuItem6" AutoHideMenu="false"  OnClientClick="selectMe('MenuItem6');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Getting Started" ID="MenuItem7" AutoHideMenu="false" OnClientClick="selectMe('MenuItem7');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Evaluation" ID="MenuItem8" AutoHideMenu="false" OnClientClick="selectMe('MenuItem8');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Webcasts" ID="MenuItem9" AutoHideMenu="false" OnClientClick="selectMe('MenuItem9');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="How to Buy" ID="MenuItem10" AutoHideMenu="false" OnClientClick="selectMe('MenuItem10');"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="MSDN Worldwide" ID="MenuItem17" AutoHideMenu="false" OnClientClick="selectMe('MenuItem17');"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu6" runat="server" OffsetHorizontal="-190" Position="Horizontal" ShowEvent="MouseClick" ExpandStyle="Fade" 
		        AttachTo="MenuItem2" Align="Under" Width="600px" StyleFolder="styles/MSDN2" OffsetVertical="1" KeepOpen="true">
		        <Components>
			        <oem:MenuItem InnerHtml="Development Tools and Languages" ID="menuItem18" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml=".NET Development" ID="menuItem19" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Office Development" ID="menuItem20" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="MSDN Library Archive" ID="menuItem24" AutoHideMenu="false"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
        	
	        <oem:EasyMenu id="Easymenu7" runat="server" OffsetHorizontal="-416" Position="Horizontal" ShowEvent="MouseClick" ExpandStyle="Fade"
		        AttachTo="MenuItem3" Width="600px" StyleFolder="styles/MSDN2" OffsetVertical="1" Align="Under" DropdownIncrement="20" KeepOpen="true">
		        <Components>
			        <oem:MenuItem InnerHtml="MSDN" ID="menuItem26" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Developer Centers" ID="menuItem27" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="Microsoft Developer Network" ID="menuItem28" AutoHideMenu="false"></oem:MenuItem>
			        <oem:MenuItem InnerHtml="'How do I?' videos" ID="menuItem29" AutoHideMenu="false"></oem:MenuItem>
		        </Components>
	        </oem:EasyMenu>
	
	        </td></tr></table>
        	
	        </div>
        	
	        <script type="text/javascript">


	            function selectMe(id) {
	                ob_em_SelectItem(id);
	            }

	            window.onload = function(e) {
	                 window.setTimeout('ob_em_Easymenu5.showMenu()', 100);
	                ob_em_SelectItem('MenuItem1');
	            }
        	    
	        </script>
	
	        <br /><br /><br /><br />
	        
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	    </form>
    </body>
</html>