<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script runat="server" Language="C#">
    Grid grid1 = new Grid();
    
    void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;		
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;
        grid1.AllowPageSizeSelection = false;
        grid1.AllowGrouping = true;        
        grid1.HideColumnsWhenGrouping = true;
        grid1.DataSourceID = "sds1";
		
		// creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.HeaderText = "ORDER ID";
        oCol1.ReadOnly = true;
        oCol1.Width = "150";
        
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
		
        grid1.HideColumnsWhenGrouping = chkSwitchGroupingMode.Checked;

        if (!chkSwitchGroupingMode.Checked)
        {
            for (int i = 0; i < grid1.Columns.Count; i++)
            {
                grid1.Columns[i].Visible = true;
            }
        }
        
        // add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
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
		<span class="tdText"><b>ASP.NET Grid - Hide columns when grouping</b></span>		
		
		<br /><br />
		
		<asp:CheckBox runat="server" ID="chkSwitchGroupingMode" CssClass="tdText" AutoPostBack="true" Checked="true" Text="Hide Columns When Grouping" />
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    If <b>HideColumnsWhenGrouping</b> is set to <span class="option2">true</span>, the columns that are used for grouping will be hidden in the grid.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>