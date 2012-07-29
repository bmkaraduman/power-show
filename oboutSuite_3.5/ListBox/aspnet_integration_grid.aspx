<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function Grid1_BeforeDelete(sender, record) {
            return confirm("Are you sure you want to delete this record?");
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - ListBox Inside Grid</b></span>	
    
    <br /><br />
    
    <obout:Grid runat="server" ID="Grid1" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">
        <ClientSideEvents OnBeforeClientDelete="Grid1_BeforeDelete" ExposeSender="true" />
        <Columns>
            <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="NAME" />
            <obout:Column DataField="ShipCity" HeaderText="CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipCountry" HeaderText="COUNTRY">
                <TemplateSettings EditTemplateId="Template1" />
            </obout:Column>
            <obout:Column AllowEdit="true" AllowDelete="true" />
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="Template1" ControlID="ListBox1">
                <Template><obout:ListBox runat="server" ID="ListBox1"
                        Width="100%" Height="100" AppendDataBoundItems="false" 
                        DataSourceID="SqlDataSource2" DataTextField="CountryName" DataValueField="CountryName" /></Template>
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
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="SELECT CountryID, CountryName FROM Country"
	    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
	<br /><br />
    
    <span class="tdText">
        The ListBox control can easily be used inside GridTemplates as a input field.<br />
        Even in this scenario, all the features of the ListBox control are available (e.g. on-demand loading, multi-columns, etc).
        
        <br /><br />
        
        To make the Grid automatically select the correct items from the ListBox when editing records, <br />
        simply set the <b>ControlID</b> property of the GridTemplate to the ID of the ListBox control.
    </span>
	
</asp:Content>