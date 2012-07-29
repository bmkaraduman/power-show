<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/VB" runat="server">

    Private grid1 As New Grid()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = True
        grid1.AllowGrouping = False
        grid1.AllowRecordSelection = False
        grid1.AllowPageSizeSelection = False
    
        grid1.FolderStyle = "styles/black_glass"
    
        grid1.ClientSideEvents.OnClientCallback = "attachEvents"
        grid1.ClientSideEvents.OnClientAdd = "grid1_ClientAdd"
        grid1.ClientSideEvents.OnClientCancelAdd = "grid1_ClientCancelAdd"
        grid1.ClientSideEvents.OnBeforeClientInsert = "grid1_BeforeClientInsert"
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"
        oCol1.Visible = False
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "140"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"
    
        Dim oCol5 As New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "140"
    
    
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol1)
    
    
        grid1.DataSourceID = "sds1"
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
</script>
<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.floating
			{
			    float: left;
			    padding-right: 10px;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			
			.sliding-editor
		    {
		        position: absolute;
		        z-index: 50;
		        height: 26px !important;
		        background-image: url(resources/img-sliding-editor/edit-row-grad.gif);
		        text-align: center;
		        white-space: nowrap;
		    }
    		
		    .sliding-editor-cell
		    {
                float: left;
                margin-top: 3px;
		    }
    		
		    .sliding-editor-cell-inner
		    {
		        padding-left: 20px;
		    }
    		
		    .sliding-editor-buttons-container-down
		    {
		        width: 270px;
		        position: absolute;
		        height: 27px;		    
		        left: 180px;
		        top: 25px;
		        margin-top: 0px;
		    }
    		
		    .sliding-editor-buttons-container-up
		    {
		        width: 270px;
		        position: absolute;
		        height: 27px;		    
		        left: 180px;
		        top: 25px;
		        margin-top: -50px;
		    }
    		
		    .sliding-editor-buttons-container-left
		    {
		        width: 8px;
		        height: 26px;			    
		        position: absolute;
		        left: 0px;
		        top: 0px;
		    }
    		
		    .sliding-editor-buttons-container-down .sliding-editor-buttons-container-left
		    {
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-down-l.gif);
		    }
    		
		    .sliding-editor-buttons-container-up .sliding-editor-buttons-container-left
		    {
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-up-l.gif);
		    }
    		
		    .sliding-editor-buttons-container-middle
		    {
		        margin-left: 8px;
		        margin-right: 8px;
		        height: 26px;
		    }
    		
		    .sliding-editor-buttons-container-down .sliding-editor-buttons-container-middle
		    {			    
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-down-grad.gif);
		    }
    		
		    .sliding-editor-buttons-container-up .sliding-editor-buttons-container-middle
		    {
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-up-grad.gif);
		    }
    		
		    .sliding-editor-buttons
		    {
		        padding-left: 10px;
		        padding-right: 10px;
		        padding-top: 2px;
		    }
    		
		    .sliding-editor-buttons-container-right
		    {
		        width: 8px;
		        height: 26px;			    
		        position: absolute;
		        right: 0px;
		        top: 0px;
		    }
    		
		    .sliding-editor-buttons-container-down .sliding-editor-buttons-container-right
		    {
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-down-r.gif);    
		    }
    		
		    .sliding-editor-buttons-container-up .sliding-editor-buttons-container-right
		    {
		        background-image: url(resources/img-sliding-editor/edit-row-button-holder-up-r.gif);    
		    }
    		
		    .ob_gC, .ob_gCc1
		    {
		        -moz-user-select:none;
		        cursor: pointer !important;
		    }
    		
		    .ob_gCS
		    {
		        cursor: default;
		    }
		</style>
		<script type="text/javascript">
		    window.onload = function () {
		        attachEvents();

		        oboutGrid.prototype.initiateCallback_old = oboutGrid.prototype.initiateCallback;
		        oboutGrid.prototype.initiateCallback = function (param1, param2, param3, param4) {
		            this.initiateCallback_old(param1, param2, param3, param4);

		            hideEditor();
		        }
		    }

		    function attachEvents() {
		        if (rowEditorIsVisible) {
		            hideEditor();
		        }

		        preventSelection();
		        var bodyTable = grid1.GridBodyContainer.firstChild.firstChild.childNodes[1];

		        var lastItem = bodyTable.childNodes.length - 1;
		        for (var i = 0; i < bodyTable.childNodes.length; i++) {
		            bodyTable.childNodes[i].onclick = function () { grid1_RowClick(this); };
		            bodyTable.childNodes[i].ondblclick = function () { grid1_RowDblClick(this); };
		        }
		    }

		    function grid1_RowClick(row) {
		        if (BtnEditOnClick.checked()) {
		            addEditRow(row);
		        }
		    }

		    function grid1_RowDblClick(row) {
		        if (BtnEditOnDblClick.checked()) {
		            addEditRow(row);
		        }
		    }

		    var rowEditorContainer;
		    var rowEditorIsVisible = false;
		    var isAddingRecord = false;
		    var slidingTimeout = null;

		    function addEditRow(row, isAdd) {
		        if (!isAdd && isAddingRecord) {
		            grid1.cancelNewRecord();
		        }

		        if (rowEditorContainer == null) {
		            rowEditorContainer = document.getElementById('rowEditor');
		            grid1.GridBodyContainer.firstChild.appendChild(rowEditorContainer);
		        }

		        rowEditorContainer.className = 'sliding-editor';

		        var element = row;

		        var index = 0;
		        while (row.previousSibling != null) {
		            row = row.previousSibling;
		            index++;
		        }

		        rowEditorContainer.childNodes[0].style.width = grid1.ColumnsCollection[0].Width - 5 + 'px';
		        rowEditorContainer.childNodes[1].style.width = grid1.ColumnsCollection[1].Width + 'px';
		        rowEditorContainer.childNodes[2].style.width = grid1.ColumnsCollection[2].Width + 'px';
		        rowEditorContainer.childNodes[3].style.width = grid1.ColumnsCollection[3].Width - 5 + 'px';

		        if (grid1.Rows[index] && !isAdd) {
		            TxtShipCountry.value(grid1.Rows[index].Cells[0].Value);
		            TxtShipCity.value(grid1.Rows[index].Cells[1].Value);
		            TxtShipPostalCode.value(grid1.Rows[index].Cells[2].Value);
		            TxtShipName.value(grid1.Rows[index].Cells[3].Value);

		            document.getElementById('HiddenOrderID').value = grid1.Rows[index].Cells[4].Value;
		        } else {
		            TxtShipCountry.value('');
		            TxtShipCity.value('');
		            TxtShipPostalCode.value('');
		            TxtShipName.value('');

		            document.getElementById('HiddenOrderID').value = '';
		        }

		        if (element != grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].lastChild) {
		            rowEditorContainer.lastChild.className = 'sliding-editor-buttons-container-down';
		        } else {
		            rowEditorContainer.lastChild.className = 'sliding-editor-buttons-container-up';
		        }

		        if (!rowEditorIsVisible) {
		            rowEditorContainer.style.top = element.offsetTop + 'px';
		            rowEditorContainer.style.display = '';
		            rowEditorIsVisible = true;
		        } else {
		            moveEditorToDestination(element.offsetTop);
		        }

		        rowEditorContainer.className = 'sliding-editor';
		    }

		    function moveEditorToDestination(offsetTop) {
		        if (rowEditorContainer.offsetTop != offsetTop) {
		            if (Math.abs(rowEditorContainer.offsetTop - offsetTop) > 1) {
		                var newOffset = rowEditorContainer.offsetTop + Math.ceil((offsetTop - rowEditorContainer.offsetTop) / 2);
		            } else {
		                var newOffset = offsetTop;
		            }
		            rowEditorContainer.style.top = newOffset + 'px';

		            if (rowEditorContainer.className != 'sliding-editor') {
		                rowEditorContainer.className = 'sliding-editor';
		            }

		            if (slidingTimeout != null) {
		                clearTimeout(slidingTimeout);
		                slidingTimeout = null;
		            }

		            slidingTimeout = window.setTimeout("moveEditorToDestination(" + offsetTop + ")", 20);
		        }
		    }

		    function preventSelection() {
		        grid1.GridBodyContainer.firstChild.onselectstart = function () { return false; };
		    }

		    function hideEditor() {
		        if (rowEditorContainer && rowEditorContainer.style) {
		            rowEditorContainer.style.display = 'none';
		            rowEditorIsVisible = false;
		        }

		        if (isAddingRecord) {
		            grid1.cancelNewRecord();
		        }

		        return false;
		    }

		    function saveChanges() {
		        var record = new Object();

		        record.OrderID = document.getElementById('HiddenOrderID').value;
		        record.ShipCountry = TxtShipCountry.value();
		        record.ShipCity = TxtShipCity.value();
		        record.ShipPostalCode = TxtShipPostalCode.value();
		        record.ShipName = TxtShipName.value();

		        if (!isAddingRecord) {
		            grid1.executeUpdate(record);
		        } else {
		            grid1.executeInsert(record);
		        }

		        return hideEditor();
		    }

		    function deleteRow() {
		        if (confirm('Are you sure you want to delete this record?') == true) {
		            var record = new Object();

		            record.OrderID = document.getElementById('HiddenOrderID').value;

		            grid1.executeDelete(record);

		            return false;
		        }

		        return false;
		    }

		    function grid1_ClientAdd() {
		        isAddingRecord = true;
		        BtnDelete.disable();
		        addEditRow(grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].lastChild, true);
		    }

		    function grid1_ClientCancelAdd() {
		        isAddingRecord = false;
		        hideEditor();
		        BtnDelete.enable();
		    }

		    function grid1_BeforeClientInsert() {
		        saveChanges();
		        return false;
		    }
		</script>
			
	</head>
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Add/Edit using Sliding Row Editor</b></span>		
		
		<br /><br />
		
		<obout:OboutRadioButton runat="server" ID="BtnEditOnClick" Text="Edit On Click" Checked="true" GroupName="EditType" />
		<br />
		<obout:OboutRadioButton runat="server" ID="BtnEditOnDblClick" Text="Edit On Double Click" GroupName="EditType" />
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<div style="display: none;" id="rowEditor" class="sliding-editor"><div class="sliding-editor-cell">
		        <div class="sliding-editor-cell-inner"><obout:OboutTextBox runat="server" ID="TxtShipCountry" Width="100%" /></div>
		    </div><div class="sliding-editor-cell">
		        <div class="sliding-editor-cell-inner"><obout:OboutTextBox runat="server" ID="TxtShipCity" Width="100%" /></div>
		    </div><div class="sliding-editor-cell">
		        <div class="sliding-editor-cell-inner"><obout:OboutTextBox runat="server" ID="TxtShipPostalCode" Width="100%" /></div>
		    </div><div class="sliding-editor-cell">
		        <div class="sliding-editor-cell-inner"><obout:OboutTextBox runat="server" ID="TxtShipName" Width="100%" /></div>
            </div><input type="hidden" id="HiddenOrderID" /><div class="sliding-editor-buttons-container-down">
		        <div class="sliding-editor-buttons-container-left"></div>
		        <div class="sliding-editor-buttons-container-middle">
		            <div class="sliding-editor-buttons">
		                <obout:OboutButton ID="BtnSave" runat="server" Text="Save" Width="75" OnClientClick="return saveChanges()" /> 
		                <obout:OboutButton ID="BtnCancel" runat="server" Text="Cancel" Width="75" OnClientClick="return hideEditor()" />
		                <obout:OboutButton ID="BtnDelete" runat="server" Text="Delete" Width="75" OnClientClick="return deleteRow()" />
		            </div>
		        </div>
		        <div class="sliding-editor-buttons-container-right"></div>
		    </div></div>
		
		<br />
		<span class="tdText">
		    This example showcases the use of a custom row editor that slides above the grid rows.<br />
		    You can either click on a record to put it in edit mode or double click it.
		</span>
				
		<asp:SqlDataSource ID="sds1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 50 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
            InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
            <InsertParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />                
            </DeleteParameters>
        </asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>