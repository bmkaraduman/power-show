<%@ Page Language="C#" %>
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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Products");*/
		grid1.DataSource = myReader;
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
        
        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitsInStock = @UnitsInStock, UnitPrice=@UnitPrice, ReorderLevel=@ReorderLevel, Discontinued=@Discontinued WHERE ProductID = @ProductID", myConn);

		bool Discontinued = true;

		if ( e.Record["Discontinued"].ToString() == "False")
		{
			Discontinued = false;
			
		}

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.Currency).Value = e.Record["UnitPrice"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = Discontinued;
        myComm.Parameters.Add("@ProductID", OleDbType.VarChar).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();        

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products (ProductName, UnitPrice, UnitsInStock, ReorderLevel, Discontinued) VALUES(@ProductName, @UnitPrice, @UnitsInStock, @ReorderLevel, @Discontinued)", myConn);
		
		bool Discontinued = true;

		if ( e.Record["Discontinued"].ToString() == "False")
		{
			Discontinued = false;
			
		}

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.Currency).Value = e.Record["UnitPrice"];
		myComm.Parameters.Add("@UnitsInStock", OleDbType.VarChar).Value = e.Record["UnitsInStock"];
        myComm.Parameters.Add("@ReorderLevel", OleDbType.VarChar).Value = e.Record["ReorderLevel"];
        myComm.Parameters.Add("@Discontinued", OleDbType.Boolean).Value = Discontinued;

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
	    		
		<form id="Form1" runat="server">			
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using radio buttons with edit template</b></span>
		<br /><br />						
		<script language="javascript">
		function OnClientEdit(record){
			// this function event uses to initial the radio buttons.
		    // alert(record.Discontinued);

			var initValue =  grid1.Rows[grid1.RecordInEditMode].Cells["Discontinued"].Value ;

			//document.getElementById("discontinued").value = initValue;

		    if ("False" == initValue){
		        document.getElementById("radDiscontinuedNo").checked = true;
		    }
		    if ("True" == initValue){
		        document.getElementById("radDiscontinuedYes").checked = true;
		    }
		}

		function OnBeforeUpdate(record) {
		    // in this sample we use a textbox to storing the Discontinued column value,
			// this code will update the value into the textbox before the update request send to server.

			if ( document.getElementById("radDiscontinuedYes").checked )
			{
				document.getElementById("discontinued").value = "True";
			}else{
				document.getElementById("discontinued").value = "False";
			}
			return true;
		}
		</script>
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="true" PageSize="5" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" OnRebind="RebindGrid">
			 <ClientSideEvents OnClientEdit="OnClientEdit" OnBeforeClientUpdate="OnBeforeUpdate" OnBeforeClientInsert="OnBeforeUpdate"/>
			<Columns>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="95" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="150" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="110" runat="server" />
                <obout:Column DataField="UnitsInStock" HeaderText="Units In Stock" Width="110" runat="server" />				
				<obout:Column DataField="ReorderLevel" HeaderText="Reorder Level" Width="110" runat="server" />
				<obout:Column DataField="Discontinued" HeaderText="Discontinued" Width="110" runat="server">
			        <TemplateSettings TemplateId="DiscontinuedTemplate" EditTemplateId="DiscontinuedEditTemplate"/>
			    </obout:Column>
			    <obout:Column AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="DiscontinuedTemplate">
					<Template><%# (Container.Value == "True" ? "Yes" : "No") %></Template>
				</obout:GridTemplate>

				<obout:GridTemplate runat="server" ID="DiscontinuedEditTemplate" ControlID="discontinued" ControlPropertyName="value">
					<Template><input type="radio" id="radDiscontinuedYes" name="radDiscontinued" value="True"/> Yes   <input type="radio" id="radDiscontinuedNo" name="radDiscontinued" value="False"/> No<input type="hidden" id="discontinued"/></Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>

		<br /><br /><br />

		<span class="tdText">
			See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>.
		</span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
