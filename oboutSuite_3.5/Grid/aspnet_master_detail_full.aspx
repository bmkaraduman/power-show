<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
   

    void DeleteCustomer(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Customers WHERE CustomerID = @CustomerID", myConn);

        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void DeleteOrder(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void UpdateCustomer(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Customers SET CompanyName = @CompanyName, ContactName = @ContactName, Country=@Country WHERE CustomerID = @CustomerID", myConn);

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateOrder(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry=@ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void InsertCustomer(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Customers (CustomerID, CompanyName, ContactName, Country) VALUES(@CustomerID, @CompanyName, @ContactName, @Country)", myConn);

        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];
        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record["Country"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertOrder(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (CustomerID, OrderDate, ShippedDate, Freight, ShipName, ShipCity, ShipCountry) VALUES(@CustomerID, @OrderDate, @ShippedDate, @Freight, @ShipName, @ShipCity, @ShipCountry)", myConn);
        
        string CustomerID = e.Record["CustomerID"].ToString();
        
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = DateTime.Now;
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = DateTime.Now; 
        myComm.Parameters.Add("@Freight", OleDbType.VarChar).Value = 99;
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
   		
</script>

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

		    
		    function onPopulateControls(sender, record) {
		        record.CustomerID = sender.ForeignKeys.CustomerID.Value;

		        return record;
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Add / edit / delete at runtime</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="true"
		    OnInsertCommand="InsertCustomer" OnUpdateCommand="UpdateCustomer" OnDeleteCommand="DeleteCustomer">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="285"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="140"></obout:Column>
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="true" ShowFooter="true" PageSize="5"
                 DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID"
                 OnInsertCommand="InsertOrder" OnUpdateCommand="UpdateOrder" OnDeleteCommand="DeleteOrder">
                    <ClientSideEvents  ExposeSender="true" OnClientPopulateControls="onPopulateControls" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="false" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="ShipName" HeaderText="SHIP NAME" DataFormatString="{0:MM/dd/yyyy}" Width="250">
                        </obout:Column>
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" DataFormatString="{0:MM/dd/yyyy}" Width="200">                            
                        </obout:Column>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" DataFormatString="{0:C2}" Width="200"></obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="210" Align="center"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" />
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    The DetailGrids can use all the features that are available for regular grids (e.g. adding, editing, deleting, sorting, paging, etc.)
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

		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>