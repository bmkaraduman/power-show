<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;
        grid1.FolderStyle = "styles/black_glass";
        grid1.ShowLoadingMessage = false;


        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";



        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol5);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        	
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM Orders", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
	
	void SelectAll(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM Orders", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.SelectedRecords = new ArrayList();

        while (myReader.Read())
        {
            Hashtable row = new Hashtable();
            row["OrderID"] = myReader.GetInt32(0);
            row["ShipName"] = !myReader.IsDBNull(1) ? myReader.GetString(1) : "";
            row["ShipCity"] = !myReader.IsDBNull(2) ? myReader.GetString(2) : "";
            row["ShipCountry"] = !myReader.IsDBNull(3) ? myReader.GetString(3) : "";
            grid1.SelectedRecords.Add(row);
        }
        
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
				background-color___:#f6f9fc;
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>	
        <script type="text/javascript">
            function deselectAll() {
                for (i = 0; i < grid1.Rows.length; i++) {
                    grid1.deselectRecord(i);
                }

                grid1.SelectedRecordsContainer.value = "";
                grid1.SelectedRecords = new Array();
            }
        </script>	
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select All Records</b></span>
		
		<br /><br />	
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />
		
		<obout:OboutButton ID="Button1" runat="server" Text="Select All" OnClick="SelectAll" OnClientClick="deselectAll(); return true;" Width="75" />		
		
	
		<br /><br /><br />
		
		<span class="tdText">
		    By populating the <b>SelectedRecords</b> collection on the server-side, you can select all the records from the grid (from all the pages).
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>
