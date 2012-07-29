<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_columns_reordering.aspx.cs" Inherits="Grid_aspnet_columns_reordering" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Reordering Columns</b></span>		
	
    <br /><br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1"
        AllowColumnReordering="true" 
        AutoGenerateColumns="false" AllowAddingRecords="true">
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
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
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
        The column reordering feature allows end users to change the position of the columns in the Grid using drag and drop.<br />
        To enable this feature, simply set the <b>AllowColumnReordering</b> property to <span class="option2">true</span>.<br />
        The order of the columns is kept between postbacks.
    </span>
</asp:Content>

