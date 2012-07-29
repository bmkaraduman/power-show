<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FilterCriteria criteria = new FilterCriteria();
            criteria.Option.Type = FilterOptionType.EqualTo;
            criteria.Value = "USA";

            grid1.Columns[0].FilterCriteria = criteria;
            
            

            FilterCriteria criteria2 = new FilterCriteria();
            criteria2.Option.Type = FilterOptionType.StartsWith;
            criteria2.Value = "Albuq";

            grid1.Columns[1].FilterCriteria = criteria2;


            
            FilterCriteria criteria3 = new FilterCriteria();
            criteria3.Option.Type = FilterOptionType.EndsWith;
            criteria3.Value = "110";

            grid1.Columns[2].FilterCriteria = criteria3;
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
			.floating
			{
			    float: left;
			    padding-right: 10px;
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
			
	</head>	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Initial Filter</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true">
			<Columns>			    
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server" />
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />	
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
			</Columns>
			<FilteringSettings />
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    You can specify an initial filter for each column of the grid using the <b>FilterCriteria</b> property of the <b>Column</b> class.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>