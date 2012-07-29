<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	Grid grid1 = new Grid();
	Grid grid2 = new Grid();
    Grid grid3 = new Grid();

	void Page_load(object sender, EventArgs e)
	{	
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		grid1.AllowAddingRecords = false;
		grid1.PageSize = 7;
        grid1.Width = Unit.Percentage(100);
		grid1.FolderStyle = "styles/premiere_blue";	
		
	
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
        oCol1.Width = "10%";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "45%";

		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "25%";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "20%";
			
		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
																	
		
		// creating the second grid
		grid2.ID = "grid2";
		grid2.CallbackMode = true;
		grid2.Serialize = true;
		grid2.AutoGenerateColumns = false;
		grid2.AllowAddingRecords = false;
		grid2.PageSize = 7;
        grid2.Width = Unit.Percentage(75);
        grid2.FolderStyle = "styles/premiere_blue";		

		// creating the columns
		oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
        oCol1.Width = "10%";

		oCol2 = new Column();
		oCol2.DataField = "ShipName";
		oCol2.HeaderText = "NAME";
        oCol2.Width = "30%";

		oCol3 = new Column();
		oCol3.DataField = "ShipCity";
		oCol3.HeaderText = "CITY";
        oCol3.Width = "15%";

		oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";
		oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "20%";

		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";
		oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "25%";		

		// add the columns to the Columns collection of the grid
		grid2.Columns.Add(oCol1);
		grid2.Columns.Add(oCol2);
		grid2.Columns.Add(oCol3);
		grid2.Columns.Add(oCol4);
		grid2.Columns.Add(oCol5);


        // creating the third grid
        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = true;
        grid3.AutoGenerateColumns = false;
        grid3.AllowAddingRecords = false;
        grid3.PageSize = 7;
        grid3.Width = Unit.Percentage(50);
        grid3.FolderStyle = "styles/premiere_blue";

        // creating the columns
        oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "10%";

        oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "30%";

        oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "15%";

        oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "20%";

        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "25%";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol1);
        grid3.Columns.Add(oCol2);
        grid3.Columns.Add(oCol3);
        grid3.Columns.Add(oCol4);
        grid3.Columns.Add(oCol5);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		phGrid2.Controls.Add(grid2);
        phGrid3.Controls.Add(grid3);

		if (!Page.IsPostBack)
		{
			BindGrid();
		}
	}

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();
        
        // ----------

		OleDbConnection myConn2 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm2 = new OleDbCommand("SELECT TOP 15 * FROM Orders", myConn2);
		myConn2.Open();
		OleDbDataReader myReader2 = myComm2.ExecuteReader();

		grid2.DataSource = myReader2;
		grid2.DataBind();

		myConn2.Close();

        // ----------

        OleDbConnection myConn3 = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm3 = new OleDbCommand("SELECT TOP 15 * FROM Orders", myConn3);
        myConn3.Open();
        OleDbDataReader myReader3 = myComm3.ExecuteReader();

        grid3.DataSource = myReader3;
        grid3.DataBind();

        myConn3.Close();
	}
	</script>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		<span class="tdText"><b>Using Relative Widths for the Columns/Grid</b></span>
		<br /><br /><br />	
		
		<span class="tdText"><b>Width="100%"</b></span>
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		
		<br /><br />
		
		<span class="tdText"><b>Width="75%"</b></span>
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>		
				
		<br /><br />	
		
		<span class="tdText"><b>Width="50%"</b></span>
		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>	

	    <br /><br />
	    
		<span class="tdText">
		    The widths for the Columns/Grid may be specified as a <b>percentage</b> (relative widths).<br />
		    The Grids are automatically resized when the browser window is resized.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
