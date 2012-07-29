<%@ Page Title="" Language="VB" AutoEventWireup="true" CodeFile="vb_commands_excel_style_autosave.aspx.vb" Inherits="Grid_vb_commands_excel_style_autosave" %>
<%@  Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>obout ASP.NET Grid examples</title>
    
	<style type="text/css">
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;
			background-color___:#f6f9fc;
			padding-left:4px;
			padding-right:4px;
		}
		a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
		}
        .excel-textbox
        {
            background-color: transparent;
            border: 0px;
    	    margin: 0px;
    	    padding: 0px;
    	    outline: 0;
    	    font: inherit;
    	    width: 100%;
    	    padding-top: 4px;
    	    padding-bottom: 4px;
        }
    
        .excel-textbox-focused
        {
            background-color: #FFFFFF;
            border: 0px;
    	    margin: 0px;
    	    padding: 0px;
    	    outline: 0;
    	    font: inherit;
    	    width: 100%;
    	    padding-top: 4px;
    	    padding-bottom: 4px;
        }
    
        .excel-textbox-error
        {
            color: #FF0000;
        }
    
	    .ob_gCc2 
	    {
           padding-left: 3px !important;
	    }
	
	    .ob_gBCont
	    {
		    border-bottom: 1px solid #C3C9CE;
	    }
	    
	    .excel-checkbox
	    {
	        height: 20px;
	        line-height: 20px;
	    }
    </style>
    <script type="text/javascript">
        function markAsFocused(textbox) {
            textbox.className = 'excel-textbox-focused';
        }

        function markAsBlured(textbox, dataField, rowIndex) {
            textbox.className = 'excel-textbox';

            grid1.Rows[rowIndex].Cells[dataField].Value = textbox.value;
            
            saveChanges(rowIndex);
        }

        function editCheckBox(element, rowIndex) {
            element.style.display = 'none';
            element.nextSibling.style.display = '';
            element.nextSibling.firstChild.focus();

            element.nextSibling.firstChild.checked = grid1.Rows[rowIndex].Cells['Sent'].Value == "True";
        }

        function saveCheckBoxChanges(element, rowIndex) {
            element.parentNode.style.display = 'none';
            element.parentNode.previousSibling.style.display = '';

            element.parentNode.previousSibling.innerHTML = element.checked ? 'yes' : 'no';
            grid1.Rows[rowIndex].Cells['Sent'].Value = element.checked ? 'True' : 'False';

            saveChanges(rowIndex);
        }

        function getOrderObject(rowIndex) {
            var order = new Object();
                        
            order.OrderDate = grid1.Rows[rowIndex].Cells['OrderDate'].Value;
            order.ShipName = grid1.Rows[rowIndex].Cells['ShipName'].Value;
            order.ShipCity = grid1.Rows[rowIndex].Cells['ShipCity'].Value;
            order.ShipPostalCode = grid1.Rows[rowIndex].Cells['ShipPostalCode'].Value;
            order.ShipRegion = grid1.Rows[rowIndex].Cells['ShipRegion'].Value;
            order.ShipCountry = grid1.Rows[rowIndex].Cells['ShipCountry'].Value;
            order.Sent = grid1.Rows[rowIndex].Cells['Sent'].Value;
            order.OrderID = grid1.Rows[rowIndex].Cells['OrderID'].Value;

            return order;
        }

        function saveChanges(rowIndex) {
            var order = getOrderObject(rowIndex);
            
            ob_post.AddParam('OrderDate', order.OrderDate);
            ob_post.AddParam('ShipName', order.ShipName);
            ob_post.AddParam('ShipCity', order.ShipCity);
            ob_post.AddParam('ShipPostalCode', order.ShipPostalCode);
            ob_post.AddParam('ShipRegion', order.ShipRegion);
            ob_post.AddParam('ShipCountry', order.ShipCountry);
            ob_post.AddParam('Sent', order.Sent);
            ob_post.AddParam('OrderID', order.OrderID);

            ob_post.post(null, "UpdateOrder", function () { });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
        <br />
        
	        <span class="tdText"><b>ASP.NET Grid - Excel-Style with Autosave</b></span><br /><br />
		
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
           
        </div>
        
        <br /><br /><br />
		
		<span class="tdText">
		    This example showcases the ability to edit the cells of the Grid similar to an Excel spreadsheet.<br /><br />

            To edit a cell simply click it with the mouse. Some of the cells can be edited using text boxes and some using check boxes.<br />
            The changes are persisted into the database automatically via AJAX when the edited cell loses the focus.<br />
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		        
    </form>
</body>
</html>
