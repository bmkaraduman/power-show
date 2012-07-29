<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
	
		grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
		grid1.AllowAddingRecords = false;

		grid1.DataSourceID = "sds1";
		grid1.EmbedFilterInSortExpression = true;
		
		grid1.FolderStyle = "styles/grand_gray";
        grid1.FolderLocalization = "localization";
        grid1.AllowFiltering = true;

		// setting the event handlers
        grid1.RowCreated += new Obout.Grid.GridRowEventHandler(OnGridRowCreated);
        grid1.RowDataBound += new Obout.Grid.GridRowEventHandler(OnGridRowDataBound);

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
		
	}

	protected void OnGridRowCreated(object sender, GridRowEventArgs args)
    {
        // modify the row structure here
    }
    protected void OnGridRowDataBound(object sender, GridRowEventArgs args)
    {
        args.Row.Cells[0].ForeColor = System.Drawing.Color.Red;
        args.Row.Cells[0].BackColor = System.Drawing.Color.LightGray;

        if (args.Row.Cells[4].Text == "USA" || args.Row.Cells[4].Text == "Denmark" || args.Row.Cells[4].Text == "Germany")
        {
            for (int i = 1; i < args.Row.Cells.Count; i++)
            {
                args.Row.Cells[i].BackColor = System.Drawing.Color.DarkGray;
            }
        }
            
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
		<span class="tdText"><b>ASP.NET Grid - Using the OnRowCreated & OnRowDataBound events</b></span>
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
			
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the OnRowCreated and OnRowDataBound events to modify the properties and values of the cells inside the Grid.<br />
		    The OnRowCreated event is triggered when the row is created, but before the data binding takes place.<br />
		    The OnRowDataBound event is triggered after the row is binded to the data.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>