<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
    
    protected void MatchAll(object sender, EventArgs e)
    {
        grid1.FilteringSettings.MatchingType = GridFilterMatchingType.AllFilters;
    }

    protected void MatchAny(object sender, EventArgs e)
    {
        grid1.FilteringSettings.MatchingType = GridFilterMatchingType.AnyFilter;
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
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - ALL Filters vs. ANY Filter </b></span>		
		
		<br /><br />
		
		<div class="tdText">
		    <div class="floating">
		        Matching Type:
		    </div>		    
		    <div class="floating">
		        <obout:OboutRadioButton ID="MatchingTypeAll" runat="server" Text="ALL Filters" GroupName="MatchingType" AutoPostBack="true" Checked="true" OnCheckedChanged="MatchAll" /> <br />
		        <obout:OboutRadioButton ID="MatchingTypeAny" runat="server" Text="ANY Filter" GroupName="MatchingType" AutoPostBack="true" OnCheckedChanged="MatchAny" />
		    </div>		    
		</div>
		
		<br /><br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true">
			<Columns>
			    <obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server" />
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />	
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
			</Columns>
			<FilteringSettings MatchingType="AllFilters" InitialState="Visible" />
		</obout:Grid>
		
		<br />
		
		<span class="tdText">
		    Using the <b>FilteringSettings.MatchingType</b> property you can specify whether the filtered records need to match ALL or ANY of the applied filters.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>