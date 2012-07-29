<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_commands_confirmation.aspx.vb" Inherits="SuperForm_vb_commands_confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function SuperForm1_Deleting(sender) {
            return confirm('Are you sure you want to delete this record?');
        }

        function SuperForm1_Inserting(sender) {
            return confirm('Are you sure you want to insert this record?');
        }

        function SuperForm1_Updating(sender) {
            return confirm('Are you sure you want to update this record?');
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Request User Confirmation</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID AS [Order ID], ShipName AS [Ship Name], ShipCity AS [Ship City], ShipCountry AS [Ship Country], 
                        OrderDate AS [Order Date], Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The Super Form exposes various client-side events that are raised when the command buttons are clicked.<br />
        By handling these events you can display confirmation messages to the end users forcing them to confirm the actions.<br />
        This is useful especially for confirming the delete operation.<br /><br />        

        The Super Form offers these client-side events:<br />
        
        <ul>
            <li><b>OnAdding</b> - raised when the "New" button is clicked.</li>
            <li><b>OnEditing</b> - raised when the "Edit" button is clicked.</li>
            <li><b>OnDeleting</b> - raised when the "Delete" button is clicked.</li>
            <li><b>OnInserting</b> - raised when the "Insert" button is clicked.</li>
            <li><b>OnUpdating</b> - raised when the "Update" button is clicked.</li>
        </ul>

        <br />

        This sample showcases the use of the <b>OnDeleting</b>, <b>OnInserting</b> and <b>OnUpdating</b> events to request <br />
        the end users' confirmation before deleting, inserting and updating records.
    </span>
</asp:Content>

