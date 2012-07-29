<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_integration_grid_window.aspx.cs" Inherits="SuperForm_cs_integration_grid_window" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Grid Editor inside Window</b></span>
    
    <br /><br />

    <span id="WindowPositionHelper"></span>

     <asp:PlaceHolder runat="server" ID="Grid1Container" /> 

     <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT TOP 25 * FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode,
                       ShipCountry=@ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, 
                            OrderDate, RequiredDate, ShippedDate, ShipVia, Sent)
                        VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, 
                            @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipAddress" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipRegion" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="ShipVia" Type="Int32" />
            <asp:Parameter Name="Sent" Type="Boolean" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipAddress" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipRegion" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="RequiredDate" Type="DateTime" />
            <asp:Parameter Name="ShippedDate" Type="DateTime" />
            <asp:Parameter Name="ShipVia" Type="Int32" />
            <asp:Parameter Name="Sent" Type="Boolean" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form control can be placed inside a Window control and be used for adding/editing the records of a Grid.<br />
        This approach will increase the usability of the site, because you can display much more fields in the Super Form in Window<br />
        than you can display in a Grid row.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .super-form
        {
            margin: 12px;
        }
        
        .ob_fC table td
        {
            white-space: normal !important;
        }
        
        .command-row .ob_fRwF
        {
            padding-left: 50px !important;
        }
    </style>

    <script type="text/javascript">
        function Grid1_ClientEdit(sender, record) {

            Window1.Open();

            document.getElementById('OrderID').value = record.OrderID;
            SuperForm1_ShipName.value(record.ShipName);
            SuperForm1_ShipAddress.value(record.ShipAddress);
            SuperForm1_ShipCity.value(record.ShipCity);
            SuperForm1_ShipRegion.value(record.ShipRegion);
            SuperForm1_ShipPostalCode.value(record.ShipPostalCode);
            SuperForm1_ShipCountry.value(record.ShipCountry);
            SuperForm1_OrderDate.value(record.OrderDate);
            SuperForm1_RequiredDate.value(record.RequiredDate);
            SuperForm1_ShippedDate.value(record.ShippedDate);
            SuperForm1_ShipVia.value(record.ShipVia);
            SuperForm1_Sent.checked(record.Sent.toLowerCase() == 'true' ? true : false);
     
            return false;
        }

        function Grid1_ClientAdd(sender, record) {

            Window1.Open();

            document.getElementById('OrderID').value = 0;
            SuperForm1_ShipName.value('');
            SuperForm1_ShipAddress.value('');
            SuperForm1_ShipCity.value('');
            SuperForm1_ShipRegion.value('');
            SuperForm1_ShipPostalCode.value('');
            SuperForm1_ShipCountry.value('');
            SuperForm1_OrderDate.value('');
            SuperForm1_RequiredDate.value('');
            SuperForm1_ShippedDate.value('');
            SuperForm1_ShipVia.value('');
            SuperForm1_Sent.checked(false);

            return false;
        }

        function saveChanges() {
            Window1.Close();

            var orderId = document.getElementById('OrderID').value;

            var data = new Object();

            data.ShipName = SuperForm1_ShipName.value();
            data.ShipAddress = SuperForm1_ShipAddress.value();
            data.ShipCity = SuperForm1_ShipCity.value();
            data.ShipRegion = SuperForm1_ShipRegion.value();
            data.ShipPostalCode = SuperForm1_ShipPostalCode.value();
            data.ShipCountry = SuperForm1_ShipCountry.value();
            data.OrderDate = SuperForm1_OrderDate.value();
            data.RequiredDate = SuperForm1_RequiredDate.value();
            data.ShippedDate = SuperForm1_ShippedDate.value();
            data.ShipVia = SuperForm1_ShipVia.value();
            data.Sent = SuperForm1_Sent.checked();

            if (orderId != 0) {
                data.OrderID = orderId;

                Grid1.executeUpdate(data);
            } else {
                Grid1.executeInsert(data);
            }
        }

        function cancelChanges() {
            Window1.Close();
        }
    </script>
</asp:Content>