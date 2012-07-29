<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_error.aspx.cs" Inherits="Grid_aspnet_master_detail_error" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Handling Errors</b></span>		
	
    <br /><br />
	
    <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="true"
		    OnInsertCommand="InsertCustomer" OnUpdateCommand="UpdateCustomer" OnDeleteCommand="DeleteCustomer">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="285"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
            </Columns>
            <ClientSideEvents ExposeSender="true" OnClientCallbackError="onClientCallbackError" />
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="true" ShowFooter="true" PageSize="5"
                 DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID"
                 OnInsertCommand="InsertOrder" OnUpdateCommand="UpdateOrder" OnDeleteCommand="DeleteOrder">
                    <ClientSideEvents ExposeSender="true" OnClientPopulateControls="onPopulateControls" OnClientCallbackError="onClientCallbackError" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="250">
                        </obout:Column>
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY"  Width="200">                            
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="200"></obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="210" Align="center"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">		    
            The <b>OnClientCallbackError</b> client-side event can be used to catch the exceptions raised on server-side <br />
            when trying to add/edit/delete records. This gives developers a chance to display a warning message to the end users<br />
            so that they can correct the errors from the input fields of the Grid.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT * FROM [Customers]">		    
		 </asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>

   <script type="text/javascript">
       function onPopulateControls(sender, record) {
           record.CustomerID = sender.ForeignKeys.CustomerID.Value;

           return record;
       }

       var errorData = null;
       function onClientCallbackError(sender, errorMessage, commandType, recordIndex, data) {
           alert(errorMessage);
           if (commandType != "Delete") {
               errorData = data;
               window.setTimeout('restoreGridState("' + sender.ID + '", "' + commandType + '", ' + recordIndex + ');', 250);
           }

       }

       function restoreGridState(gridId, commandType, recordIndex) {
           var grid = eval(gridId);
           if (commandType == "Update") {
               grid.editRecord(recordIndex);
           } else {
               grid.addRecord();
           }

           grid.populateControls(errorData);
           errorData = null;
       }
		</script>

</asp:Content>

