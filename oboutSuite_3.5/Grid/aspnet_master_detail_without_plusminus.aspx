<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_without_plusminus.aspx.cs" Inherits="Grid_aspnet_master_detail_without_plusminus" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        a.visible
        {
            display:;
        }
        a.hidden
        {
            display: none;
        }
        .ob_gDGEB
        {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function showDetails(e, link) {
            link.className = 'hidden';
            link.nextSibling.className = 'visible';
            
            toggleDetail(link);
            
            return stopPropagation(e);            
        }

        function hideDetails(e, link) {
            link.className = 'hidden';
            link.previousSibling.className = 'visible';

            toggleDetail(link);

            return stopPropagation(e);
        }

        function toggleDetail(link) {
            link.parentNode.nextSibling.firstChild.onclick();
        }

        function stopPropagation(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            return false;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">				
	<br />
	<span class="tdText"><b>ASP.NET Grid - Expand / Collapse using Hyper Links</b></span>
		
	<br /><br />
		
    <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" PageSize="5"
		AllowAddingRecords="false" DataSourceID="sds1" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column  HeaderText="" Width="110">
                    <TemplateSettings TemplateID="TemplateExpand" />
            </obout:Column>
            <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false" />
            <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="200" />
            <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" />
            <obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" /> 
        </Columns>
        <MasterDetailSettings LoadingMode="OnCallback" />
        <TemplateSettings RowEditTemplateId="tplRowEditMaster" />
        <DetailGrids>
            <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" EnableTypeValidation="false"
                AllowAddingRecords="false" ShowFooter="true" PageSize="5"
                DataSourceID="sds2" ForeignKeys="CustomerID" AllowPageSizeSelection="false">
                <ClientSideEvents  ExposeSender="true" />
                <Columns>
                    <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false" />
                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="false" Visible="false" />
                    <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="250" />
                    <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="170"/>                            
                    <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="150" /> 
                </Columns>
                <MasterDetailSettings LoadingMode="OnCallback" />    
            </obout:DetailGrid>
        </DetailGrids>  
		<Templates> 			    
			<obout:GridTemplate runat="server" ID="TemplateExpand">
                <Template>
					<a href="javascript: //" onclick="showDetails(event, this);" class="visible">View Details</a><a href="javascript: //" onclick="hideDetails(event, this);" class="hidden">Close Details</a>
				</Template>                         
            </obout:GridTemplate>                
        </Templates>
	</obout:Grid>
		
	<br /><br />				
		
	<span class="tdText">
		The <b>+/-</b> buttons used to expand / collapse detail grids may be replaced with other controls (buttons, hyperlinks) <br />
        using a template and a small piece of JavaScript code.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		SelectCommand="SELECT * FROM [Customers]"
        InsertCommand="INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)"
        UpdateCommand="UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID"
        DeleteCommand="DELETE FROM Customers WHERE CustomerID = @CustomerID">      
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
	</asp:SqlDataSource>
   
</asp:Content>

