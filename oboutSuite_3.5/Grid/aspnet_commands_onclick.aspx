<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
        <script type="text/javascript">
            function grid1_Select(sender, records) {
                for (var i = 0; i < grid1.Rows.length; i++) {
                    if (grid1.Rows[i] && grid1.Rows[i].Cells) {
                        if (grid1.Rows[i].Cells['OrderID'].Value == records[0].OrderID) {
                            grid1.editRecord(i);
                            return;
                        }
                    }
                }
            }    
        </script>
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Edit on Click</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowFiltering="true" DataSourceID="SqlDataSource1" AllowMultiRecordSelection="false">
            <ClientSideEvents OnClientSelect="grid1_Select" ExposeSender="true" />
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
				<obout:Column ID="Column4" DataField="ShipRegion" HeaderText="REGION" Width="125" runat="server" />
				<obout:Column ID="Column5" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" runat="server" />
				<obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
                <obout:Column AllowEdit="true" AllowDelete="true" />
			</Columns>					
		</obout:Grid>
		
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 50 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
            InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
            <InsertParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />                
            </DeleteParameters>
        </asp:SqlDataSource>
					
		<br /><br />
		
		<span class="tdText">
		    By attaching an event handler to the <b>OnClientSelect</b> event you can use the record selection feature of the Grid<br />
            to put the selected record in edit mode. This approach makes it easier for end users to edit records, without being needed<br />
            to locate and click the "Edit" links.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>