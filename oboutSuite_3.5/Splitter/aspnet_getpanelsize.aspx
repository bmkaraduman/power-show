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
		<span class="tdText"><b>ASP.NET Splitter - Get Panel Size</b></span>
	
		<br /><br />
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    <br /><br />
		    <obspl:Splitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
			    <LeftPanel WidthMin="100" WidthMax="400">
				    <header height="50">
					    <div style="width:100%;height:100%;background-color:#ebe9ed" class="tdText" align="center">
					    <br />
					    </div>
				    </header>
				    <content>
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
					    <br />
					    left content
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
					    <div class="tdText" style="padding-left:10px;padding-top:10px">
						    <br />
						    Left content width: <span style="color:navy" id="divLeftContentWidth"></span><br />
						    Left content height: <span style="color:navy" id="divLeftContentHeight"></span><br /><br />
						    Right content width: <span style="color:navy" id="divRightContentWidth"></span><br />
						    Right content height: <span style="color:navy" id="divRightContentHeight"></span><br />
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
	
	addLoadEvent(function() {
		ob_spl_OnSplitterResize();
	});
	function ob_spl_OnSplitterResize()
	{
		document.getElementById("divLeftContentWidth").innerHTML = splDV.GetPanelSize("LeftContent", "width");
		document.getElementById("divLeftContentHeight").innerHTML = splDV.GetPanelSize("LeftContent", "height");
		document.getElementById("divRightContentWidth").innerHTML = splDV.GetPanelSize("RightContent", "width");
		document.getElementById("divRightContentHeight").innerHTML = splDV.GetPanelSize("RightContent", "height");
	}
</script>