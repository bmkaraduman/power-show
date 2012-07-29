<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_integration_combobox_masterdetail.aspx.vb" Inherits="Grid_vb_integration_combobox_masterdetail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Grid1_Edit(sender, record) {
            EmployeesCombo._valueToSelectOnDemand = record.EmployeeID;
            PositionsCombo.value(record.PositionID);
            PositionsCombo._preventDetailLoading = false;
            PositionsCombo._populateDetail();

            return true;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Integration with Master/Detail ComboBoxes</b></span>
	
    <br /><br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        SelectCommand="SELECT TOP 100 OrderID, ShipName, ShipCity, ShipCountry, O.EmployeeID, (E.FirstName + ' ' + E.LastName) AS EmployeeName, E.PositionID FROM Orders O INNER JOIN Employees E ON O.EmployeeID = E.EmployeeID ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, EmployeeID) VALUES (@ShipName, @ShipCity, @ShipCountry, @EmployeeID)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, EmployeeID=@EmployeeID WHERE OrderID = @OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" 
		ProviderName="System.Data.OleDb">
		<InsertParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
		</InsertParameters>
		<UpdateParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</UpdateParameters>
		<DeleteParameters>
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</DeleteParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT PositionID, PositionName FROM Positions ORDER BY PositionName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		

    <asp:SqlDataSource ID="sds2" runat="server" SelectCommand="SELECT EmployeeID, (FirstName + ' ' + LastName) AS EmployeeName FROM Employees WHERE PositionID = @PositionID ORDER BY FirstName ASC, LastName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="PositionID" Type="Int32" />
	    </SelectParameters>	    
    </asp:SqlDataSource>		

    <br />

    <span class="tdText">
        The Grid allows developers to customize the controls used in add/edit mode by means of templates.<br />
        You can place any ASP.NET / HTML controls inside the Grid templates.<br /><br />
        This example showcases the use of a master/detail ComboBox control. <br />
        The master ComboBox is populated with "Positions" and the detail ComboBox with "Employees".
    </span>
</asp:Content>
	

    