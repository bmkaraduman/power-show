<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
  
    double totalFreight = 0;
    int ShipCount = 0;
    ArrayList countryNames = new ArrayList();
    ArrayList countryCount = new ArrayList();
    DateTime firstShipping=DateTime.MaxValue;
    DateTime lastShipping=DateTime.MinValue;


    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        int cnt = 0;
        int index = 0;
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
            double avg = 0;
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
		    <span class="tdText"><b>ASP.NET Grid - Aggregates</b></span>		
		    <br /><br />
		
		    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			    FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" 
			    ShowColumnsFooter="true" OnRowDataBound="RowDataBound">
			    <Columns>
			        <obout:Column DataField="OrderID" HeaderText="ORDER ID" Width="150" Visible="false" />
				    <obout:Column DataField="ShipName" HeaderText="SHIP NAME" Width="200" />	
                    <obout:Column DataField="ShippedDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="SHIPPED DATE" Width="200" />
				    <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="200" />
				    <obout:Column DataField="Freight" HeaderText="FREIGHT" Width="150" />
			    </Columns>
		    </obout:Grid>
		
		    <br />
		    <span class="tdText">
		        You can easily display aggregates in the footer of the Grid using the <b>RowDataBound</b> event and the <b>ShowColumnsFooter</b> property.
		    </span>
				
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>
		
		    <br /><br /><br />
		
		    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>