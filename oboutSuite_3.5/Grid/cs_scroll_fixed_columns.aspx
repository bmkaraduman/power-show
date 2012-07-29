<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    Grid grid2 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        CreateGrid(grid1, "grid1", GridFixedColumnsPositionType.Left, phGrid1);
        CreateGrid(grid2, "grid2", GridFixedColumnsPositionType.Right, phGrid2);
    }    
    
    void ChangeFixedColumns(object sender, EventArgs e)
    {
        grid1.ScrollingSettings.NumberOfFixedColumns = int.Parse(ddlColumns.SelectedValue);
        grid2.ScrollingSettings.NumberOfFixedColumns = int.Parse(ddlColumns.SelectedValue);

        for (int i = 0; i < grid1.Columns.Count; i++)
        {
            grid1.Columns[i].Visible = true;
            grid2.Columns[i].Visible = true;
        }
    }

    void CreateGrid(Grid gridObj, string gridId, GridFixedColumnsPositionType position, PlaceHolder phContainer)
    {
        gridObj.ID = gridId;
        gridObj.CallbackMode = true;
        gridObj.Serialize = false;
        gridObj.AutoGenerateColumns = false;
        gridObj.FolderStyle = "styles/grand_gray";
        gridObj.AllowAddingRecords = false;
        gridObj.DataSourceID = "sds1";

        gridObj.ScrollingSettings.ScrollWidth = 600;
        gridObj.ScrollingSettings.NumberOfFixedColumns = 2;
        gridObj.ScrollingSettings.FixedColumnsPosition = position;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipAddress";
        oCol5.HeaderText = "ADDRESS";
        oCol5.Width = "150";

        Column oCol6 = new Column();
        oCol6.DataField = "ShipRegion";
        oCol6.HeaderText = "REGION";
        oCol6.Width = "150";

        Column oCol7 = new Column();
        oCol7.DataField = "ShipCountry";
        oCol7.HeaderText = "COUNTRY";
        oCol7.Width = "150";

        // add the columns to the Columns collection of the grid
        gridObj.Columns.Add(oCol1);
        gridObj.Columns.Add(oCol2);
        gridObj.Columns.Add(oCol3);
        gridObj.Columns.Add(oCol4);
        gridObj.Columns.Add(oCol5);
        gridObj.Columns.Add(oCol6);
        gridObj.Columns.Add(oCol7);

        // add the grid to the controls collection of the PlaceHolder
        phContainer.Controls.Add(gridObj);
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
		<span class="tdText"><b>ASP.NET Grid - Horizontal Scrolling with Fixed (Frozen) Columns</b></span>		
		
		<br /><br />
		
		<span class="tdText">
		    Number of fixed(frozen) columns:
		    <asp:DropDownList runat="server" ID="ddlColumns" CssClass="tdText" OnSelectedIndexChanged="ChangeFixedColumns" AutoPostBack="true">
		        <asp:ListItem Value="0">0</asp:ListItem>
		        <asp:ListItem Value="1">1</asp:ListItem>
		        <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
		        <asp:ListItem Value="3">3</asp:ListItem>		        
		    </asp:DropDownList>
		</span>
		
		<br /><br />
		
		<span class="tdText"><b>FixedColumnsPosition="Left"</b></span>
		<br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">Scroll the grid horizontally: the first columns on the <b>left</b> won't change their position</span>
					
		<br /><br /><br />
		
		<span class="tdText"><b>FixedColumnsPosition="Right"</b></span>
		<br />
		
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">Scroll the grid horizontally: the first columns on the <b>right</b> won't change their position</span>
							
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>