<%@ Register TagPrefix="obspl" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		<script type="text/javascript">
			function AddNode()
			{
				var nodeName = document.getElementById('txtNodeName').value;
				var parentID = splDV.GetWindow('LeftContent').tree_selected_id;
				var nodeID =  + parseInt(splDV.GetWindow('LeftContent').ob_getChildCount(splDV.GetDocument('LeftContent').getElementById(parentID)) + 1);
				splDV.GetWindow('LeftContent').ob_t2_Add(parentID, parentID + "_" + nodeID, "<span style='cursor:pointer'>" + nodeName + "</span>", null, "ball_blueS.gif", null);
			}
		</script>
	</head>
	<body>
	    <form id="Form1" runat="server">
	    <br />
		<span class="tdText"><b>ASP.NET Splitter - Control left panel from right panel2</b></span>
	    <br /><br />
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	        <br /><br />
		    <obspl:Splitter StyleFolder="styles/default" id="splDV" runat="server" CookieDays="0">
				    <LeftPanel WidthMin="100" WidthMax="400">
						    <header height="40">
								    <div style="width:100%;height:100%;background-color:#e0e6ed" class="tdText" align="center">
								    <br />
								    optional left header
								    </div>
						    </header>
						    <content Url="aspnet_adding_nodes3_treeview.aspx" />
						    <footer height="40">
								    <div style="width:100%; height: 100%;background-color:#e0e6ed;" class="tdText" align="center">
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
							    <div style="font:11px verdana; color: #333333; padding-left:20px; padding-top:20px;">
								    <br /><br />
								    Add node to the treeview from the page loaded in the left panel<br /> using button from the right panel.
								    <br />
								    <br />
								    Node text: <input type='text' id='txtNodeName' value='New Node'  style="font:11px verdana;" />
								    &nbsp;<input type='button' value='Add' onclick='AddNode()' style="font:11px verdana;" />
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