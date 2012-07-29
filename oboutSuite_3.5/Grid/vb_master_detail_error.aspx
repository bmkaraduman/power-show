<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_master_detail_error.aspx.vb" Inherits="Grid_vb_master_detail_error" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Handling Errors</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
    
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



    
   