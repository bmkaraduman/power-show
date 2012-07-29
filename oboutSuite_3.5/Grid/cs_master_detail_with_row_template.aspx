<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_master_detail_with_row_template.aspx.cs" Inherits="Grid_cs_master_detail_with_row_template" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Row Edit Templates inside Master / Detail Grids</b></span>
		
		<br /><br />
        
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
    
        <br /><br />
    
        <span class="tdText">
		    Using row edit templates developers can place large forms inside the Grid for allowing end users to add/edit delete data.<br />
            Use the <b>TemplateSettings.RowEditTemplateId</b> property to specify the ID of the template containing the row template.<br /><br />
            
            This sample showcases the ability to have row edit templates inside detail grids. The <b>RowCreated</b> and <b>RowDataBound</b><br />
            events are used to gain access to the controls inside the detail grid template, in order to change their IDs and make them <br />
            unique to each individual detail grid.
		</span>
				
	    <asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT * FROM [Customers]"
            InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
            UpdateCommand="UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID"
            DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CompanyName" Type="String" />
                <asp:Parameter Name="ContactName" Type="String" />
                <asp:Parameter Name="Country" Type="String" />
                <asp:Parameter Name="CustomerID" Type="String" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </DeleteParameters>
		 </asp:SqlDataSource>

		 
		<asp:SqlDataSource runat="server" ID="sds2" ProviderName="System.Data.OleDb"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
            InsertCommand="INSERT INTO Orders (CustomerID, ShipName, ShipCity, ShipCountry) VALUES(@CustomerID, @ShipName, @ShipCity, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
		</asp:SqlDataSource>
        	
        <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
</asp:Content>
    	
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">	
    <style type="text/css">			
		.rowEditTable
		{
			position: relative;
			left: 184px;
		}
			
		.rowEditTable td {
			font-family: Verdana;
		    font-size: 10px;
		    color: #4B555E;
		}
	</style>
    <script type="text/javascript">
        function onPopulateControls(sender, record) {
            record.CustomerID = sender.ForeignKeys.CustomerID.Value;

            return record;
        }
    </script>
</asp:Content>

