<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_integration_combobox_ondemand.aspx.cs" Inherits="Grid_aspnet_integration_combobox_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Integration with On-Demand ComboBox</b></span>
	
    <br /><br />
    
    <obout:Grid runat="server" ID="Grid1" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">        
        <Columns>
            <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="NAME" />
            <obout:Column DataField="ShipCity" HeaderText="CITY" />
            <obout:Column DataField="ShipCountry" HeaderText="COUNTRY">
                <TemplateSettings EditTemplateId="Template1" />
            </obout:Column>
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column AllowEdit="true" AllowDelete="true" />
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="Template1" ControlID="ComboBox1">
                <Template><obout:ComboBox runat="server" ID="ComboBox1" Width="100%" Height="200"
                    DataTextField="CountryName" DataValueField="CountryName" EmptyText="Select a country ..."
                    EnableLoadOnDemand="true" OnLoadingItems="ComboBox1_LoadingItems"
                    /></Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>        

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        SelectCommand="SELECT TOP 100 OrderID, ShipName, ShipPostalCode, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders (ShipName, ShipPostalCode, ShipCity, ShipCountry) VALUES (@ShipName, @ShipPostalCode, @ShipCity, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipPostalCode=@ShipPostalCode, ShipCity=@ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" 
		ProviderName="System.Data.OleDb">
		<InsertParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipPostalCode" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
		</InsertParameters>
		<UpdateParameters>
		    <asp:Parameter Name="ShipName" Type="String" />
		    <asp:Parameter Name="ShipPostalCode" Type="String" />
		    <asp:Parameter Name="ShipCity" Type="String" />
		    <asp:Parameter Name="ShipCountry" Type="String" />
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</UpdateParameters>
		<DeleteParameters>
		    <asp:Parameter Name="OrderID" Type="Int32" />
		</DeleteParameters>
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        The Grid allows developers to customize the controls used in add/edit mode by means of templates.<br />
        You can place any ASP.NET / HTML controls inside the Grid templates.<br /><br />
        This example showcases the use of a ComboBox control that has the on-demand loading feature enabled.
    </span>
</asp:Content>

