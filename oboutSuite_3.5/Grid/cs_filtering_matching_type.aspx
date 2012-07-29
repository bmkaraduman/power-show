<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/C#" runat="server">
    
    Grid grid1 = new Grid();

	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.FilteringSettings.InitialState = GridFilterState.Visible;
        grid1.FilteringSettings.MatchingType = GridFilterMatchingType.AllFilters;

        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;

	
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "125";
		
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
		oCol5.Width = "175";

		

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol1);


        grid1.DataSourceID = "sds1";
        
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
        
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
		<form id="Form1" runat="server">					
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
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		
		<span class="tdText">
		    Using the <b>FilteringSettings.MatchingType</b> property you can specify whether the filtered records need to match ALL or ANY of the applied filters.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>