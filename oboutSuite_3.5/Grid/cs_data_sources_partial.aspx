<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
    SqlDataSource sds1;
    
	void Page_init(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = false;
		grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.AllowAddingRecords = false;
		
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
		
		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";		
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";
											
		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";		
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);

        sds1 = new SqlDataSource();
        sds1.ID = "sds1";
        sds1.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;";
        sds1.ProviderName = "System.Data.OleDb";
        phGrid1.Controls.Add(sds1);

        grid1.DataSourceID = "sds1";
	}

    void Page_load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Session["DataLimit"] = 50;
        }

        if (grid1.PageSize * (grid1.CurrentPageIndex + 1) >= int.Parse(Session["DataLimit"].ToString()))
        {
            Session["DataLimit"] = int.Parse(Session["DataLimit"].ToString()) + 50;
        }

        sds1.SelectCommand = "SELECT TOP " + Session["DataLimit"].ToString() + " * FROM Orders ORDER BY OrderID DESC";
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
		<span class="tdText"><b>ASP.NET Grid - Partial Load</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />		
		
		<span class="tdText">
		    Initially the grid loads 50 records. <br />
		    When navigating to the last page (page 5), the next 50 records (51-100) from the database are loaded. <br />
		    When navigating again to the last page (page 10), the next 50 records (101-150) are loaded. <br />
		    This will continune in the same way, until all the records from the database will be loaded.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>