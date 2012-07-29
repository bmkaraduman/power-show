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
        grid1.ShowHeader = false;
        grid1.ShowFooter = false;
		
		grid1.FolderStyle = "styles/grand_gray";

		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "SupplierID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ID";
		oCol1.Width = "45";

		Column oCol2 = new Column();
		oCol2.DataField = "CompanyName";
		oCol2.HeaderText = "COMPANY NAME";
		oCol2.Width = "250";

		Column oCol3 = new Column();
		oCol3.DataField = "Address";
		oCol3.HeaderText = "ADDRESS";
		oCol3.Width = "225";

		Column oCol4 = new Column();
		oCol4.DataField = "Country";
		oCol4.HeaderText = "COUNTRY";
		oCol4.Width = "100";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);




        
        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.Serialize = true;
        grid2.AutoGenerateColumns = false;
        grid2.AllowAddingRecords = false;
        grid2.ShowHeader = true;
        grid2.ShowFooter = false;

        grid1.FolderStyle = "styles/grand_gray";

        // creating the columns
        Column oCol2_1 = new Column();
        oCol2_1.DataField = "SupplierID";
        oCol2_1.ReadOnly = true;
        oCol2_1.HeaderText = "ID";
        oCol2_1.Width = "45";

        Column oCol2_2 = new Column();
        oCol2_2.DataField = "CompanyName";
        oCol2_2.HeaderText = "COMPANY NAME";
        oCol2_2.Width = "250";

        Column oCol2_3 = new Column();
        oCol2_3.DataField = "Address";
        oCol2_3.HeaderText = "ADDRESS";
        oCol2_3.Width = "225";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "Country";
        oCol2_4.HeaderText = "COUNTRY";
        oCol2_4.Width = "100";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1);
        grid2.Columns.Add(oCol2_2);
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);




        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = true;
        grid3.AutoGenerateColumns = false;
        grid3.AllowAddingRecords = false;
        grid3.ShowHeader = false;
        grid3.ShowFooter = true;

        grid3.FolderStyle = "styles/grand_gray";

        // creating the columns
        Column oCol3_1 = new Column();
        oCol3_1.DataField = "SupplierID";
        oCol3_1.ReadOnly = true;
        oCol3_1.HeaderText = "ID";
        oCol3_1.Width = "45";

        Column oCol3_2 = new Column();
        oCol3_2.DataField = "CompanyName";
        oCol3_2.HeaderText = "COMPANY NAME";
        oCol3_2.Width = "250";

        Column oCol3_3 = new Column();
        oCol3_3.DataField = "Address";
        oCol3_3.HeaderText = "ADDRESS";
        oCol3_3.Width = "225";

        Column oCol3_4 = new Column();
        oCol3_4.DataField = "Country";
        oCol3_4.HeaderText = "COUNTRY";
        oCol3_4.Width = "100";

        // add the columns to the Columns collection of the grid
        grid3.Columns.Add(oCol3_1);
        grid3.Columns.Add(oCol3_2);
        grid3.Columns.Add(oCol3_3);
        grid3.Columns.Add(oCol3_4);
        
        

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
        phGrid2.Controls.Add(grid2);
        phGrid3.Controls.Add(grid3);
		
		if (!Page.IsPostBack)
		{
            BindGrid(grid1);
            BindGrid(grid2);
            BindGrid(grid3);
		}		
	}

	void BindGrid(Grid grid)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();


        grid.DataSource = myReader;
        grid.DataBind();

		myConn.Close();	
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
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>Showing/hiding the header and the footer</b></span>
		
		<br /><br />	
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>	
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>	

		<br /><br /><br />
		<span class="tdText">
		You can use the <b>ShowHeader</b> and <b>ShowFooter</b> properties to show/hide the header/footer of the grid.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>

<style type="text/css">
    .ob_gBCont
    {
    	border: 1px solid #C3C9CE;
    }
</style>