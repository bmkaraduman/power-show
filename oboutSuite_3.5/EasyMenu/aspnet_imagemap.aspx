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
			.div 
		    {
		        border: black 1px solid; 
		        width: 25px; 
		        height: 25px; 
		        align: middle; 
		        background-color: silver; 
		        cursor: default;
		        }
	</style>
</head>
<body>
	<form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - World Map with Easy Menu</b></span>
		    <br /><br />	
			<br /><br />
	
	    <span class="tdText">Hover the major world capitals.</span><br /><br />
    	
	    <img src="images/world_map_capitals.JPG" border="0" class="imagemap" width="650" usemap="#planetmap" />

	    <map id="planetmap" name="planetmap">
		    <area shape="circle" coords="163,164,4" id="Ottawa" href="#">
		    <area shape="circle" coords="159,191,4" id="Washington D.C." href="#">
		    <area shape="circle" coords="171,302,4" id="Lima" href="#">
		    <area shape="circle" coords="216,315,4" id="Brasilia" href="#">
		    <area shape="circle" coords="197,360,4" id="Buenos Aires" href="#">
		    <area shape="circle" coords="613,363,4" id="Wellington" href="#">
		    <area shape="circle" coords="555,350,4" id="Canberra" href="#">
		    <area shape="circle" coords="536,180,4" id="Tokyo" href="#">
		    <area shape="circle" coords="507,184,4" id="Seoul" href="#">
		    <area shape="circle" coords="485,181,4" id="Beijing" href="#">
		    <area shape="circle" coords="467,232,4" id="Bangkok" href="#">
		    <area shape="circle" coords="431,206,4" id="New Delhi" href="#">
		    <area shape="circle" coords="363,134,4" id="Moscow" href="#">
		    <area shape="circle" coords="349,182,4" id="Ankara" href="#">
		    <area shape="circle" coords="334,170,4" id="Bucharest" href="#">
		    <area shape="circle" coords="317,179,4" id="Roma" href="#">
		    <area shape="circle" coords="313,152,4" id="Berlin" href="#">
		    <area shape="circle" coords="302,152,4" id="Brussels" href="#">
		    <area shape="circle" coords="297,160,4" id="Paris" href="#">
		    <area shape="circle" coords="291,148,4" id="London" href="#">
		    <area shape="circle" coords="318,119,4" id="Stockholm" href="#">
		    <area shape="circle" coords="279,187,4" id="Lisbon" href="#">
		    <area shape="circle" coords="290,184,4" id="Madrid" href="#">
		    <area shape="circle" coords="348,345,4" id="Pretoria" href="#">
	    </map>

	    <oem:easymenu id="EasyMenu1" runat="server" 
		    StyleFolder="styles/windowsxp" Width="140" UseIcons="true" 
		    IconsPosition="Left" AttachTo="Ottawa, Washington D.C., Lima, Brasilia, Buenos Aires, Wellington, Canberra, Tokyo, Seoul, Beijing, Bangkok, New Delhi, Moscow, Ankara, Bucharest, Roma, Berlin, Brussels, Paris, London, Stockholm, Lisbon, Madrid, Pretoria" 
		    ShowEvent="MouseOver" Align="Cursor" EventList="OnAfterMenuOpen">
		    <Components>
			    <oem:MenuItem ID="menuItem"></oem:MenuItem>
		    </Components>
	    </oem:easymenu>
	    
	    <br /><br /><br /><br />
	    
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	
	    </form>
    </body>
</html>

<script type="text/javascript">
	// this event is fired after the menu has been shown on the page
	// menu - the menu that was opened
	function ob_em_OnAfterMenuOpen(menu)	{
		ob_em_EasyMenu1.RemoveItem('menuItem');
		ob_em_EasyMenu1.AddItem('menuItem', "MenuItem", "<b>" + ob_em_EasyMenu1.el.id + "</b>");
	}
</script>