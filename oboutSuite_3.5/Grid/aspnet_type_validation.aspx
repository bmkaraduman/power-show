<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Products ORDER BY ProductID DESC", myConn);
		myConn.Open();
        
		OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;

        // This line is needed in order to use the MaxLength and AllowNulls properties
        da.FillSchema(ds, SchemaType.Mapped, "Products");
        da.Fill(ds, "Products");
		
		grid1.DataSource = ds;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
                
        OleDbCommand myComm = new OleDbCommand("DELETE FROM Products WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();                

        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitsInStock = @UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record["Discontinued"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();                

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products (ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued) VALUES(@ProductName, @UnitsInStock, @UnitsOnOrder, @ReorderLevel, @Discontinued)", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = e.Record["Discontinued"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
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
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Type Validation</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/premiere_blue" EnableTypeValidation="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="PRODUCT ID" Width="125" runat="server"/>
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="200" runat="server"/>				
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" runat="server" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" runat="server" />
				<obout:Column DataField="ReorderLevel" HeaderText="REORDER LEVEL" Width="150" runat="server" />
				<obout:Column DataField="Discontinued" HeaderText="DISCONTINUED" Width="150" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		    To enable the Type Validation feature, just set <b>EnableTypeValidation</b>=<span class="option2">true</span><br />
		    When you Add/Edit records, the values you enter will be validated (they need to have the same type like in the database).<br />
		    Also, the values will be checked against the MaxLength and AllowNulls properties of the columns in the database.
		    <br /><br />
		    In this example, the "UNITS IN STOCK", "UNITS ON ORDER", "REORDER LEVEL" columns must be integers.<br />
		    The "DISCONTINUED" column can have only the true/false values.<br />
		    The "PRODUCT NAME" column has a maximum length of 40 characters, if this limit is exceeded, a message will pop-up.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>