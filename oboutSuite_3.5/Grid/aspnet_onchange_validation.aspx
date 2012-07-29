<%@ Page Language="C#" Debug="true"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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

        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitsInStock = @UnitsInStock, UnitsOnOrder=@UnitsOnOrder, ReorderLevel=@ReorderLevel WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();                

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products (ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel) VALUES(@ProductName, @UnitsInStock, @UnitsOnOrder, @ReorderLevel)", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitsOnOrder", OleDbType.VarChar).Value = e.Record["UnitsOnOrder"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];        
        
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
		<script>
			function updateCols()
			{   
				try{
					txt1 = document.getElementById("txtUnitsInStock");
					txt2 = document.getElementById("txtUnitsOnOrder");
					txt3 = document.getElementById("txtReorderLevel");

					var inStock = parseInt(txt1.value);
					var onOrder = parseInt(txt2.value);
					var reOrder = (( inStock + onOrder) < 50 ? 15 : 0);

					txt3.value = reOrder + "" ;
				}catch(ex){ alert(ex);}
			}
		</script>
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Multi Columns Validation</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/premiere_blue" EnableTypeValidation="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="ProductID" Visible="false" ReadOnly="true" HeaderText="PRODUCT ID" Width="125" runat="server"/>
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" runat="server"/>
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="120" runat="server">
					<TemplateSettings EditTemplateID="TemplateUnitsInStock" /> 
				</obout:Column>
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="120" runat="server" >
					<TemplateSettings EditTemplateID="TemplateUnitsOnOrder" /> 
				</obout:Column>
				<obout:Column DataField="ReorderLevel" HeaderText="REORDER LEVEL" Width="120" runat="server">
					<TemplateSettings EditTemplateID="TemplateReorderLevel" /> 
				</obout:Column>
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateUnitsInStock" ControlID="txtUnitsInStock" ControlPropertyName="value">
					<Template>
						<input type="text" class="ob_gEC" ID="txtUnitsInStock" onchange="updateCols()" />
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateUnitsOnOrder" ControlID="txtUnitsOnOrder" ControlPropertyName="value">
					<Template>
						<input type="text" class="ob_gEC" ID="txtUnitsOnOrder" onchange="updateCols()"/>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="TemplateReorderLevel" ControlID="txtReorderLevel" ControlPropertyName="value">
					<Template>
						<input type="text" class="ob_gEC" ID="txtReorderLevel"/>
					</Template>
				</obout:GridTemplate>
			</Templates>				
		</obout:Grid>
					
		<br /><br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>