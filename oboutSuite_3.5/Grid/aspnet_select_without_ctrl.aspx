<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_select_without_ctrl.aspx.cs" Inherits="Grid_aspnet_select_without_ctrl" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<script type="text/javascript">
    window.onload = function () {
        oboutGrid.prototype.restorePreviousSelectedRecord = function () {
            return;
        }

        oboutGrid.prototype.markRecordAsSelectedOld = oboutGrid.prototype.markRecordAsSelected;
        oboutGrid.prototype.markRecordAsSelected = function (row, param2, param3, param4, param5) {
            if (row.className != this.CSSRecordSelected) {
                this.markRecordAsSelectedOld(row, param2, param3, param4, param5);
            } else {
                var index = this.getRecordSelectionIndex(row);
                if (index != -1) {
                    this.markRecordAsUnSelected(row, index);
                }
            }
        }
    }
</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Multiselect without CTRL/SHIFT</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="false" AllowAddingRecords="true" AllowColumnReordering="true">
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />            
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
            <obout:Column AllowEdit="true" AllowDelete="true" />
        </Columns>
	</obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 500 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity,ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
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

    <br />

    <span class="tdText">
        This example showcases the ability to select multiple records from the Grid without pressing the CTRL or SHIFT keys.<br />
        Simply click the records that you want to select and the previous selections will be kept. To deselect a selected row, click it again.<br />
        To achieve this functionality the <span class="option2">restorePreviousSelectedRecord</span> and <span class="option2">markRecordAsSelected</span> client-side methods have been overwritten.
    </span>
</asp:Content>

