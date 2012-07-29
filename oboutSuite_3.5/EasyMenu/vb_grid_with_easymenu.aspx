<%@ Page Language="VB" Src="vb_grid_with_easymenu.aspx.vb" Inherits="GridWithEm" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
	function sendEmail() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Sending e-mail to ' + emails.substr(0, emails.length - 2) + '.');
    }

	function orderInformation() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Order Information for ' + emails.substr(0, emails.length - 2) + '.');
	}
	
	function orderDate() {
		var emails = "";
		for(var i=0; i<grid1.SelectedRecords.length;i++) {
			var record = grid1.SelectedRecords[i];
			emails += record.ShipName + ", "
		}

		if (emails == "")
			alert('Select records first.');
		else
			alert('Order Date for ' + emails.substr(0, emails.length - 2) + '.');
	}
	
	function attachMenuToRecords() {
	
		var gridContainerID = '<%=(CType(ph1.FindControl("grid1"), Obout.Grid.Grid)).ClientID%>_ob_grid1MainContainer';
		
		// attach menu to grid container
	    ob_em_EasyMenu1.attachToControl(gridContainerID);
		
		// hide menu on clicking the grid container
		document.getElementById(gridContainerID).onclick = function()
		{
			ob_em_EasyMenu1.hideMenu();
		}
		
		gridIds = grid1.getRecordsIds().split(",");
		for (index=0;index<gridIds.length;index++)
		{
			var rowId = gridIds[index];
			
			// attach menu to each grid row
			ob_em_EasyMenu1.attachToControl(rowId);
			
			var rowCells = document.getElementById(rowId).childNodes;
			for (elIndex=0;elIndex<rowCells.length;elIndex++)
			{
				// stop the event propagation when click on grid cells to avoid rows unselection
				rowCells[elIndex].onmousedown = function(e)
				{
					var event = e || window.event; 
					
					// stop event propagation on right mouse click
					if (event.button == 2)
					{
						if (event.stopPropagation) { event.stopPropagation(); } else { event.cancelBubble = true; } 
					}
				}
			}
		}
	}
</script>
	
<html>
    <head>
	    <title>obout ASP.NET Easy Menu examples</title>
	
	    <!--// Only needed for this page's formatting //-->
	    <style type="text/css">
		    body 
		    {
		        font-family: Verdana;
		        font-size: XX-Small; 
		        margin: 20px;
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
        </style>
    </head>
    <body>
	    <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Easy Menu - With ASP.NET Grid</b></span>
		    <br /><br />	
			<br /><br />
			
		    <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
	        
	        <br /><br /><br /><br />
	    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VB">« Back to examples</a>
		
		</form>
    </body>
</html>
<oem:easymenu id="EasyMenu1" ShowEvent="ContextMenu" runat="server" StyleFolder="styles/windowsxp" 
	Width="200" UseIcons="true" IconsPosition="Left" Align="Cursor" ZIndex="100">
	<Components>	    
		<oem:MenuItem id="menuItem2" OnClientClick="sendEmail();"
            InnerHtml="Send Email"></oem:MenuItem>
		<oem:MenuItem id="menuItem3" OnClientClick="orderInformation();"
            InnerHtml="Order Information"></oem:MenuItem>
		<oem:MenuItem id="menuItem4" OnClientClick="orderDate();"
            InnerHtml="Order Date"></oem:MenuItem>
	</Components>
</oem:easymenu>

<script type="text/javascript"> 
    // attach the menu to the records of the Grid       
    attachMenuToRecords();
</script>