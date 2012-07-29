<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script runat="server" Language="C#">
    
    double totalFreight = 0;
    int ShipCount = 0;


    ArrayList countryNames = new ArrayList();
    ArrayList countryCount = new ArrayList();
    DateTime firstShipping=DateTime.MaxValue;
    DateTime lastShipping=DateTime.MinValue;

    Grid grid1 = new Grid();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.ShowLoadingMessage = false;
        grid1.ShowColumnsFooter = true;
        grid1.DataSourceID = "sds1";

        grid1.FolderStyle = "styles/premiere_blue";

        grid1.RowDataBound += new GridRowEventHandler(RowDataBound);


        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.Visible = false;
        oCol1.HeaderText = "ORDER ID";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.Visible = true;
        oCol2.HeaderText = "SHIP NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ShippedDate";
        oCol3.DataFormatString = "{0:dd-MMM-yyyy}";
        oCol3.Visible = true;
        oCol3.HeaderText = "SHIPPED DATE";
        oCol3.Width = "200";
        
        Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.Visible = true;
        oCol4.HeaderText = "SHIP COUNTRY";
        oCol4.Width = "200";

        Column oCol5 = new Column();
        oCol5.DataField = "Freight";
        oCol5.Visible = true;
        oCol5.HeaderText = "FREIGHT";
        oCol5.Width = "150";


        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        phGrid1.Controls.Add(grid1);
    }

    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        int cnt = 0;
        int index = 0;
        double avg = 0;
        string country = string.Empty;
        
        if (e.Row.RowType == GridRowType.DataRow)
        {
            ShipCount += 1;
            totalFreight += double.Parse(e.Row.Cells[4].Text);

            if (lastShipping < Convert.ToDateTime(e.Row.Cells[2].Text.Replace("&#160;", " ")))
                lastShipping = Convert.ToDateTime(e.Row.Cells[2].Text.Replace("&#160;", " "));

            if (firstShipping > Convert.ToDateTime(e.Row.Cells[2].Text.Replace("&#160;", " ")))
                firstShipping = Convert.ToDateTime(e.Row.Cells[2].Text.Replace("&#160;", " "));

            if (!countryNames.Contains(e.Row.Cells[3].Text))
            {
                countryNames.Add(e.Row.Cells[3].Text);
                countryCount.Add(1);
            }
            else
            {
                country = e.Row.Cells[3].Text;
                index = countryNames.IndexOf(country);
                cnt = int.Parse(countryCount[index].ToString());
                countryCount.RemoveAt(index);
                countryCount.Insert(index, cnt + 1);
            }
        }
        else if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            int large = 0;
            for (int i = 0; i < countryCount.Count; i++)
            {
                if (large < int.Parse(countryCount[i].ToString()))
                {
                    large = int.Parse(countryCount[i].ToString());
                }
            }
            int indx = countryCount.IndexOf(large);

            avg = totalFreight / ShipCount;

            e.Row.Cells[1].Text = "Count: " + ShipCount;
            e.Row.Cells[2].Text = @"First Shipping: " + firstShipping.ToString("dd MMM yyyy") + "<br>" +
                "Last Shipping: " + lastShipping.ToString("dd MMM yyyy");
            e.Row.Cells[3].Text = "Most Orders: " + countryNames[indx].ToString();
            e.Row.Cells[4].Text = "Total: $" + totalFreight.ToString() + "<br /> Average: $" + avg;
        }
    }


</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		    <span class="tdText"><b>ASP.NET Grid - Aggregates</b></span>		
		    <br /><br />
		
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>
		
		    <br />
		    <span class="tdText">
		        You can easily display aggregates in the footer of the Grid using the <b>RowDataBound</b> event and the <b>ShowColumnsFooter</b> property.
		    </span>
		    
		    <br /><br /><br />
		    
		    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>