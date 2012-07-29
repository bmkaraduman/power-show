<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aspnet_commands_excel_style_autosave.aspx.cs" Inherits="Grid_aspnet_commands_excel_style_autosave" %>
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
            PageMethods.UpdateOrder(getOrderObject(rowIndex), null, null);
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

            PageMethods.UpdateOrder(getOrderObject(rowIndex), null, null);
        }

        function getOrderObject(rowIndex) {
            var order = new Object();
            order.OrderID = grid1.Rows[rowIndex].Cells['OrderID'].Value;
            order.OrderDate = grid1.Rows[rowIndex].Cells['OrderDate'].Value;
            order.ShipName = grid1.Rows[rowIndex].Cells['ShipName'].Value;
            order.ShipCity = grid1.Rows[rowIndex].Cells['ShipCity'].Value;
            order.ShipPostalCode = grid1.Rows[rowIndex].Cells['ShipPostalCode'].Value;
            order.ShipRegion = grid1.Rows[rowIndex].Cells['ShipRegion'].Value;
            order.ShipCountry = grid1.Rows[rowIndex].Cells['ShipCountry'].Value;
            order.Sent = grid1.Rows[rowIndex].Cells['Sent'].Value;

            return order;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    
    <br />
		<span class="tdText"><b>ASP.NET Grid - Excel-Style with Autosave</b></span><br /><br />
		
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

            <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			    AllowRecordSelection="false" AllowAddingRecords="false" FolderStyle="styles/premiere_blue" >
			    <Columns>
				    <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server" />
				    <obout:Column ID="Column2" DataField="OrderDate" HeaderText="DATE" Width="100" runat="server" DataFormatString="{0:MM/dd/yyyy}">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>		
				    <obout:Column ID="Column3" DataField="ShipName" HeaderText="NAME" Width="200" runat="server">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>				
				    <obout:Column ID="Column4" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>
				    <obout:Column ID="Column5" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>
				    <obout:Column ID="Column6" DataField="ShipRegion" HeaderText="REGION" Width="150" runat="server">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>
				    <obout:Column ID="Column7" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server">
				        <TemplateSettings TemplateId="PlainEditTemplate" />
				    </obout:Column>
                    <obout:Column ID="Column8" DataField="Sent" HeaderText="SENT" Width="100" runat="server">
				        <TemplateSettings TemplateId="CheckBoxEditTemplate" />
				    </obout:Column>
			    </Columns>
			    <Templates>
                    <obout:GridTemplate runat="server" ID="PlainEditTemplate">
                        <Template>
                            <input type="text" class="excel-textbox" value="<%# Container.Value %>"
                                onfocus="markAsFocused(this)" onblur="markAsBlured(this, '<%# grid1.Columns[Container.ColumnIndex].DataField %>', <%# Container.PageRecordIndex %>)" />
                        </Template>
                    </obout:GridTemplate>
                    <obout:GridTemplate runat="server" ID="CheckBoxEditTemplate">
                        <Template><div onmousedown="editCheckBox(this, <%# Container.PageRecordIndex %>)" class="excel-checkbox"><%# Container.Value == "True" ? "yes" : "no" %></div><div style="display: none;"><input type="checkbox" onblur="saveCheckBoxChanges(this, <%# Container.PageRecordIndex %>)" /></div></Template>
                    </obout:GridTemplate>
			    </Templates>
		    </obout:Grid>
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
