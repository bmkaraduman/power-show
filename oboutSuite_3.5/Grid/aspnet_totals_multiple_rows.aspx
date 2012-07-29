<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Collections.Generic" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    Dictionary<string, int> ordersPerCountries = new Dictionary<string, int>();
    Dictionary<string, int> ordersPerCustomers = new Dictionary<string, int>();
    Dictionary<string, int> ordersPerDates = new Dictionary<string, int>();
    Dictionary<string, int> ordersPerMonths = new Dictionary<string, int>();
    Dictionary<string, int> ordersPerYears = new Dictionary<string, int>();

    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow)
        {
            AddToCollection(ordersPerCustomers, e.Row.Cells[1].Text);
            AddToCollection(ordersPerDates, e.Row.Cells[2].Text);
            AddToCollection(ordersPerMonths, Convert.ToDateTime(e.Row.Cells[2].Text).ToString("MMMM"));
            AddToCollection(ordersPerYears, Convert.ToDateTime(e.Row.Cells[2].Text).ToString("yyyy"));
            AddToCollection(ordersPerCountries, e.Row.Cells[3].Text);
        }
        else if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            KeyValuePair<string, int> customerWithMostOrders = GetCollectionMaxItem(ordersPerCustomers);
            KeyValuePair<string, int> customerWithFewestOrders = GetCollectionMinItem(ordersPerCustomers);

            KeyValuePair<string, int> dateWithMostOrders = GetCollectionMaxItem(ordersPerDates);
            KeyValuePair<string, int> dateWithFewestOrders = GetCollectionMinItem(ordersPerDates);

            KeyValuePair<string, int> monthWithMostOrders = GetCollectionMaxItem(ordersPerMonths);
            KeyValuePair<string, int> monthWithFewestOrders = GetCollectionMinItem(ordersPerMonths);

            KeyValuePair<string, int> yearWithMostOrders = GetCollectionMaxItem(ordersPerYears);
            KeyValuePair<string, int> yearWithFewestOrders = GetCollectionMinItem(ordersPerYears);
            
            KeyValuePair<string, int> countryWithMostOrders = GetCollectionMaxItem(ordersPerCountries);
            KeyValuePair<string, int> countryWithFewestOrders = GetCollectionMinItem(ordersPerCountries);

            string customersAggregate = "";
            customersAggregate += "Most Orders: " + customerWithMostOrders.Key;
            customersAggregate += "<br />";
            customersAggregate += "Fewest Orders: " + customerWithFewestOrders.Key;

            string datesAggregate = "";
            datesAggregate += "Day with Most Orders: " + Convert.ToDateTime(dateWithMostOrders.Key).ToString("MM/dd/yyyy");
            datesAggregate += "<br />";
            datesAggregate += "Day with Fewest Orders: " + Convert.ToDateTime(dateWithFewestOrders.Key).ToString("MM/dd/yyyy");
            datesAggregate += "<br />";
            datesAggregate += "Month with Most Orders: " + monthWithMostOrders.Key;
            datesAggregate += "<br />";
            datesAggregate += "Month with Fewest Orders: " + monthWithFewestOrders.Key;
            datesAggregate += "<br />";
            datesAggregate += "Year with Most Orders: " + yearWithMostOrders.Key;
            datesAggregate += "<br />";
            datesAggregate += "Year with Fewest Orders: " + yearWithFewestOrders.Key;
            
            string countriesAggregate = "";
            countriesAggregate += "Most Orders: " + countryWithMostOrders.Key;
            countriesAggregate += "<br />";
            countriesAggregate += "Fewest Orders: " + countryWithFewestOrders.Key;

            e.Row.Cells[1].Text = customersAggregate;
            e.Row.Cells[2].Text = datesAggregate;
            e.Row.Cells[3].Text = countriesAggregate;            
        }
    }

    // Get the item containing the maximum value in a collection
    public KeyValuePair<string, int> GetCollectionMaxItem(Dictionary<string, int> collection)
    {
        int maxValue = 0;
        KeyValuePair<string, int> maxItem = new KeyValuePair<string, int>();

        foreach (KeyValuePair<string, int> item in collection)
        {
            if (item.Value > maxValue)
            {
                maxValue = item.Value;
                maxItem = item;
            }
        }

        return maxItem;
    }

    // Get the item containing the minimum value in a collection
    public KeyValuePair<string, int> GetCollectionMinItem(Dictionary<string, int> collection)
    {
        int minValue = -1;
        KeyValuePair<string, int> minItem = new KeyValuePair<string, int>();

        foreach (KeyValuePair<string, int> item in collection)
        {
            if (minValue == -1)
            {
                // Initially, load the value of the first item in the minValue variable
                minValue = item.Value;
                minItem = item;
            }

            if (item.Value < minValue)
            {
                minValue = item.Value;
                minItem = item;
            }
        }

        return minItem;
    }

    // Increments the value of the specified key in the current collection
    protected void AddToCollection(Dictionary<string, int> collection, string key)
    {
        if (!collection.ContainsKey(key))
        {
            collection.Add(key, 0);
        }
        collection[key]++;
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
			
			.ob_gCFR .ob_gC, .ob_gCFR .ob_gCW
			{
			    height: 80px !important;
			    background-image: none !important;
			    background-color: #FACDB8;
			}
		</style>
			
	</head>
	<body>	
		<form id="Form1" runat="server">					
		    <br />
		    <span class="tdText"><b>ASP.NET Grid - Summary Row</b></span>		
		    <br /><br />
		
		    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowPaging="false"
			    FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" PageSize="-1" AllowPageSizeSelection="false"
			    ShowColumnsFooter="true" OnRowDataBound="RowDataBound">
			    <Columns>
			        <obout:Column DataField="OrderID" HeaderText="ORDER ID" Width="150" Visible="false" />
				    <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="250" />	
                    <obout:Column DataField="ShippedDate" DataFormatString="{0:MM/dd/yyyy}" HeaderText="SHIPPED DATE" Width="250" />
				    <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="250" />				    
			    </Columns>
			    <ScrollingSettings ScrollHeight="150" />
		    </obout:Grid>
		
		    <br />
		    <span class="tdText">
		        You can easily display a summary row in the footer of the Grid using the <b>RowDataBound</b> event and the <b>ShowColumnsFooter</b> 
		        property. <br />You can have as much data in the footer row as you wish. As you can see in this example, you can make it look as if the Grid has multiple footer rows.
		    </span>
				
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 150 * FROM Orders"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>
		
		    <br /><br /><br />
		
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>