<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Initial filter criteria for the ShipName column
            FilterCriteria criteria0 = new FilterCriteria();
            // use "Between" filter option (with index 0 in FilterOptions collection)
            CustomFilterOption option0 = grid1.Columns[1].FilterOptions[0] as CustomFilterOption;

            criteria0.Option = option0;
            criteria0.Values = new Hashtable();
            criteria0.Values["ShipNameStartsWith1"] = "Save";
            criteria0.Values["ShipNameStartsWith2"] = "Split";

            grid1.Columns[1].FilterCriteria = criteria0;
            
            
            
            // Initial filter criteria for the OrderDate column
            FilterCriteria criteria1 = new FilterCriteria();
            // use "Between" filter option (with index 0 in FilterOptions collection)
            CustomFilterOption option1 = grid1.Columns[4].FilterOptions[0] as CustomFilterOption;

            criteria1.Option = option1;
            criteria1.Values = new Hashtable();
            criteria1.Values["StartDate_OrderDate"] = "1/1/1995";
            criteria1.Values["EndDate_OrderDate"] = "10/1/1995";

            grid1.Columns[4].FilterCriteria = criteria1;



            // Initial filter criteria for the ShipCountry column
            FilterCriteria criteria2 = new FilterCriteria();
            CustomFilterOption option2 = grid1.Columns[2].FilterOptions[0] as CustomFilterOption;

            criteria2.Option = option2;
            criteria2.Values = new Hashtable();
            criteria2.Values["SelectedCountries"] = "USA,Germany";

            grid1.Columns[2].FilterCriteria = criteria2;



            // Initial filter criteria for the ShipCity column
            FilterCriteria criteria4 = new FilterCriteria();
            CustomFilterOption option4 = grid1.Columns[3].FilterOptions[0] as CustomFilterOption;

            criteria4.Option = option4;
            criteria4.Values = new Hashtable();
            criteria4.Values["TxtCities"] = "Boise,Lander";

            grid1.Columns[3].FilterCriteria = criteria4;



            // Initial filter criteria for the Freight column
            FilterCriteria criteria3 = new FilterCriteria();
            CustomFilterOption option3 = grid1.Columns[5].FilterOptions[0] as CustomFilterOption;

            criteria3.Option = option3;
            criteria3.Values = new Hashtable();
            criteria3.Values["FreightInterval1"] = "true";
            criteria3.Values["FreightInterval2"] = "false";
            criteria3.Values["FreightInterval3"] = "false";
            criteria3.Values["FreightInterval4"] = "true";

            grid1.Columns[5].FilterCriteria = criteria3;
        }
    }
    
    protected void grid1_Filtering(object sender, EventArgs e)
    {
        // filter for ShipName
        Column shipNameColumn = grid1.Columns.GetColumnByDataField("ShipName");

        if (shipNameColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = shipNameColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "ShipNameStartsWith":
                    string shipNameStartsWith1 = shipNameColumn.FilterCriteria.Values["ShipNameStartsWith1"].ToString();
                    string shipNameStartsWith2 = shipNameColumn.FilterCriteria.Values["ShipNameStartsWith2"].ToString();
                    string filterExpression = "";
                    if (!string.IsNullOrEmpty(shipNameStartsWith1))
                    {
                        filterExpression = shipNameColumn.DataField + " LIKE '" + shipNameStartsWith1 + "%'";
                    }
                    
                    if (!string.IsNullOrEmpty(shipNameStartsWith2))
                    {
                        if(filterExpression != "")
                        {
                            filterExpression += " OR ";
                        }
                        filterExpression += shipNameColumn.DataField + " LIKE '" + shipNameStartsWith2 + "%'";
                    }

                    shipNameColumn.FilterCriteria.FilterExpression = filterExpression;

                    break;
            }
        }
                
        // filter for OrderDate
        Column orderDateColumn = grid1.Columns.GetColumnByDataField("OrderDate");

        if (orderDateColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = orderDateColumn.FilterCriteria.Option as CustomFilterOption;
            
            switch (filterOption.ID)
            {
                case "Between_OrderDate":
                    string startDate = orderDateColumn.FilterCriteria.Values["StartDate_OrderDate"].ToString();
                    string endDate = orderDateColumn.FilterCriteria.Values["EndDate_OrderDate"].ToString();

                    if (!string.IsNullOrEmpty(startDate) && !string.IsNullOrEmpty(endDate))
                    {
                        // we filter between start date at 12:00AM and end date at 11:59PM
                        orderDateColumn.FilterCriteria.FilterExpression = "(" + orderDateColumn.DataField + " >= #" + startDate + " 12:00:00 AM# AND " + orderDateColumn.DataField + " <= #" + endDate + " 11:59:59 PM#)";
                    }
                    break;

                case "ByYear_OrderDate":
                    string year = orderDateColumn.FilterCriteria.Values["Year_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year + " %'";
                    
                    break;

                case "ByMonth_OrderDate":
                    string month = orderDateColumn.FilterCriteria.Values["Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month + "/%'";

                    break;

                case "ByYearAndMonth_OrderDate":
                    string year2 = orderDateColumn.FilterCriteria.Values["YearMonth_Year_OrderDate"].ToString();
                    string month2 = orderDateColumn.FilterCriteria.Values["YearMonth_Month_OrderDate"].ToString();
                    orderDateColumn.FilterCriteria.FilterExpression = "(CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '" + month2 + "/%') AND (CONVERT(" + orderDateColumn.DataField + ", 'System.String') LIKE '%/" + year2 + " %')";
                    break;
            }
        }

        
        // filter for ShipCountry
        Column shipCountryColumn = grid1.Columns.GetColumnByDataField("ShipCountry");

        if (shipCountryColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = shipCountryColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "CountriesIn":
                    string countries = shipCountryColumn.FilterCriteria.Values["SelectedCountries"].ToString();
                    shipCountryColumn.FilterCriteria.FilterExpression = shipCountryColumn.DataField + " IN ('" + countries.Replace(",", "','") + "')";

                    break;
            }
        }



        // filter for ShipCity
        Column shipCityColumn = grid1.Columns.GetColumnByDataField("ShipCity");

        if (shipCityColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = shipCityColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "CitiesIn":
                    string cities = shipCityColumn.FilterCriteria.Values["TxtCities"].ToString();
                    shipCityColumn.FilterCriteria.FilterExpression = shipCityColumn.DataField + " IN ('" + cities.Replace(",", "','") + "')";

                    break;
            }
        }

        
        
        // filter for Freight
        Column freightColumn = grid1.Columns.GetColumnByDataField("Freight");

        if (freightColumn.FilterCriteria.Option is CustomFilterOption)
        {
            CustomFilterOption filterOption = freightColumn.FilterCriteria.Option as CustomFilterOption;

            switch (filterOption.ID)
            {
                case "FreightIsInInteral":
                    bool freightInterval1 = bool.Parse(freightColumn.FilterCriteria.Values["FreightInterval1"].ToString());
                    bool freightInterval2 = bool.Parse(freightColumn.FilterCriteria.Values["FreightInterval2"].ToString());
                    bool freightInterval3 = bool.Parse(freightColumn.FilterCriteria.Values["FreightInterval3"].ToString());
                    bool freightInterval4 = bool.Parse(freightColumn.FilterCriteria.Values["FreightInterval4"].ToString());

                    string convertedColumn = "CONVERT(" + freightColumn.DataField + ", 'System.Double')";
                    string freightFilterExpression = "";
                    
                    if (freightInterval1)
                    {
                        freightFilterExpression += "(" + convertedColumn + " >= 0.00 AND " + convertedColumn + " <= 49.99)";
                    }

                    if (freightInterval2)
                    {
                        if (freightFilterExpression != "")
                        {
                            freightFilterExpression += " OR ";
                        }
                        
                        freightFilterExpression += "(" + convertedColumn + " >= 50.00 AND " + convertedColumn + " <= 99.99)";
                    }

                    if (freightInterval3)
                    {
                        if (freightFilterExpression != "")
                        {
                            freightFilterExpression += " OR ";
                        }

                        freightFilterExpression += "(" + convertedColumn + " >= 100.00 AND " + convertedColumn + " <= 150.00)";
                    }

                    if (freightInterval4)
                    {
                        if (freightFilterExpression != "")
                        {
                            freightFilterExpression += " OR ";
                        }

                        freightFilterExpression += "(" + convertedColumn + " > 150.00)";
                    }

                    if (freightFilterExpression != "")
                    {
                        freightColumn.FilterCriteria.FilterExpression = freightFilterExpression;
                    }

                    break;
            }
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
			
			.separator
			{
			    width: 8%;
			    color: #000;
			    display:-moz-inline-stack;
                display:inline-block;
                zoom:1;
                *display:inline;
                text-align:center;
                top: -7px;
                position: relative;
                font-size: 10px;
                height: 5px;
			}
		</style>
		
		<script type="text/javascript">
		    function getDdlCountries() {
		        var controls = document.getElementsByTagName('SELECT');
		        for (var i = 0; i < controls.length; i++) {
		            if (controls[i].id.indexOf('DdlCountries') != -1) {
		                return controls[i];
		            }
		        }

		        return null;
		    }
		
		    function grid1_OnPopulatingFilterFields(sender, filterCriterias) {
		        var countriesDdl = getDdlCountries()
		        var countriesDdlValue = ',' + filterCriterias['ShipCountry'].Values[0] + ',';
		        
		        for (var i = 0; i < countriesDdl.options.length; i++) {
		            if (countriesDdlValue.indexOf(',' + countriesDdl.options[i].value + ',') != -1) {
		                countriesDdl.options[i].selected = true;
		            }
		        }
		    }

		    function grid1_OnFiltering(sender, filterCriterias, isApplyingFilter) {
		        if (!isApplyingFilter) {
		            var countriesDdl = getDdlCountries();

		            // deselecting all the options
		            for (var i = 0; i < countriesDdl.options.length; i++) {
		                countriesDdl.options[i].selected = false;
		            }
		        } else {
		            var countriesDdl = getDdlCountries();
		            var selectedCountries = new Array();
		            // deselecting all the options
		            for (var i = 0; i < countriesDdl.options.length; i++) {
		                if (countriesDdl.options[i].selected) {
		                    selectedCountries.push(countriesDdl.options[i].value);
		                }
		            }

		            document.getElementById('SelectedCountries').value = selectedCountries.join(',');
		        }
		    }
		</script>
			
	</head>	
	
    <body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Custom Filter Options with Templates</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowPageSizeSelection="false"
			AllowFiltering="true" OnFiltering="grid1_Filtering">
			
			<ClientSideEvents OnFiltering="grid1_OnFiltering" OnPopulatingFilterFields="grid1_OnPopulatingFilterFields" ExposeSender="true" />
			<FilteringSettings InitialState="Visible" />
			
			<Columns>
			    <obout:Column ID="Column1" DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
			    <obout:Column ID="Column5" DataField="ShipName" HeaderText="NAME" runat="server">
			        <FilterOptions>
			            <obout:CustomFilterOption IsDefault="true" ID="ShipNameStartsWith" Text="Starts With">
			                <TemplateSettings FilterTemplateId="ShipNameStartsWithTemplate"
			                    FilterControlsIds="ShipNameStartsWith1,ShipNameStartsWith2" 
			                    FilterControlsPropertyNames="value,value" />
			            </obout:CustomFilterOption>
			        </FilterOptions>
			    </obout:Column>
			    
			    <obout:Column ID="Column3" DataField="ShipCountry" HeaderText="COUNTRY" runat="server" ShowFilterCriterias="false">
			        <FilterOptions>
			            <obout:CustomFilterOption IsDefault="true" ID="CountriesIn" Text="">
			                <TemplateSettings FilterTemplateId="CountriesFilter"
			                    FilterControlsIds="SelectedCountries" FilterControlsPropertyNames="value" />
			            </obout:CustomFilterOption>
			        </FilterOptions>
			    </obout:Column>
			    
			    <obout:Column ID="Column4" DataField="ShipCity" HeaderText="CITY" runat="server" ShowFilterCriterias="false">
			        <FilterOptions>
			            <obout:CustomFilterOption IsDefault="true" ID="CitiesIn" Text="">
			                <TemplateSettings FilterTemplateId="CitiesFilter"
			                    FilterControlsIds="TxtCities" FilterControlsPropertyNames="value" />
			            </obout:CustomFilterOption>
			        </FilterOptions>
			    </obout:Column>
				
				<obout:Column ID="Column2" DataFormatString="{0:M/d/yyyy}" DataField="OrderDate" HeaderText="ORDER DATE" Width="200" runat="server">
				    <FilterOptions>
				        <obout:CustomFilterOption IsDefault="true" ID="Between_OrderDate" Text="Between">
				            <TemplateSettings FilterTemplateId="OrderDateBetweenFilter" 
				                FilterControlsIds="StartDate_OrderDate,EndDate_OrderDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYear_OrderDate" Text="Filter By Year">
				            <TemplateSettings FilterTemplateId="OrderDateByYearFilter" 
				                FilterControlsIds="Year_OrderDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByMonth_OrderDate" Text="Filter By Month">
				            <TemplateSettings FilterTemplateId="OrderDateByMonthFilter" 
				                FilterControlsIds="Month_OrderDate"
				                FilterControlsPropertyNames="value" />
				        </obout:CustomFilterOption>
				        <obout:CustomFilterOption ID="ByYearAndMonth_OrderDate" Text="Filter By Year And Month">
				            <TemplateSettings FilterTemplateId="OrderDateByYearAndMonthFilter" 
				                FilterControlsIds="YearMonth_Year_OrderDate,YearMonth_Month_OrderDate"
				                FilterControlsPropertyNames="value,value" />
				        </obout:CustomFilterOption>
				    </FilterOptions>
				</obout:Column>
				
				<obout:Column ID="Column6" DataField="Freight" HeaderText="FREIGHT" runat="server" Width="200" ShowFilterCriterias="false">
				    <FilterOptions>
				        <obout:CustomFilterOption IsDefault="true" ID="FreightIsInInteral" Text="">
			                <TemplateSettings FilterTemplateId="FreightFilter"
			                    FilterControlsIds="FreightInterval1,FreightInterval2,FreightInterval3,FreightInterval4"
			                    FilterControlsPropertyNames="checked,checked,checked,checked" />
			            </obout:CustomFilterOption>
				    </FilterOptions>
			    </obout:Column>
			</Columns>
						
			<Templates>
			    <obout:GridTemplate runat="server" ID="OrderDateBetweenFilter">
			        <Template>
			            <div style="width: 99%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutTextBox runat="server" ID="StartDate_OrderDate" Width="45%" />
			                <div class="separator">-</div>
			                <obout:OboutTextBox runat="server" ID="EndDate_OrderDate" Width="45%" />
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="OrderDateByYearFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Year_OrderDate" Width="100%" Height="150">
			                <asp:ListItem>1994</asp:ListItem>
			                <asp:ListItem>1995</asp:ListItem>
			                <asp:ListItem>1996</asp:ListItem>
			                <asp:ListItem>1997</asp:ListItem>
			                <asp:ListItem>1998</asp:ListItem>
			                <asp:ListItem>1999</asp:ListItem>
			                <asp:ListItem>2000</asp:ListItem>
			                <asp:ListItem>2001</asp:ListItem>
			                <asp:ListItem>2002</asp:ListItem>
			                <asp:ListItem>2003</asp:ListItem>
			                <asp:ListItem>2004</asp:ListItem>
			                <asp:ListItem>2005</asp:ListItem>
			                <asp:ListItem>2006</asp:ListItem>
			                <asp:ListItem>2007</asp:ListItem>
			                <asp:ListItem>2008</asp:ListItem>
			                <asp:ListItem>2009</asp:ListItem>
			                <asp:ListItem>2010</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			   
			    <obout:GridTemplate runat="server" ID="OrderDateByMonthFilter">
			        <Template>
			            <obout:OboutDropDownList runat="server" ID="Month_OrderDate" Width="100%" Height="150">
			                <asp:ListItem Value="1">January</asp:ListItem>
			                <asp:ListItem Value="2">February</asp:ListItem>
			                <asp:ListItem Value="3">March</asp:ListItem>
			                <asp:ListItem Value="4">April</asp:ListItem>
			                <asp:ListItem Value="5">May</asp:ListItem>
			                <asp:ListItem Value="6">June</asp:ListItem>
			                <asp:ListItem Value="7">July</asp:ListItem>
			                <asp:ListItem Value="8">August</asp:ListItem>
			                <asp:ListItem Value="9">September</asp:ListItem>
			                <asp:ListItem Value="10">October</asp:ListItem>
			                <asp:ListItem Value="11">November</asp:ListItem>
			                <asp:ListItem Value="12">December</asp:ListItem>
			            </obout:OboutDropDownList>
			        </Template>
			    </obout:GridTemplate>
			   
			    <obout:GridTemplate runat="server" ID="OrderDateByYearAndMonthFilter">
			        <Template>
			            <div style="width: 100%;padding: 0px;margin: 0px; font-size: 5px;">
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Year_OrderDate" Width="49%" Height="150">
			                    <asp:ListItem>1994</asp:ListItem>
			                    <asp:ListItem>1995</asp:ListItem>
			                    <asp:ListItem>1996</asp:ListItem>
			                    <asp:ListItem>1997</asp:ListItem>
			                    <asp:ListItem>1998</asp:ListItem>
			                    <asp:ListItem>1999</asp:ListItem>
			                    <asp:ListItem>2000</asp:ListItem>
			                    <asp:ListItem>2001</asp:ListItem>
			                    <asp:ListItem>2002</asp:ListItem>
			                    <asp:ListItem>2003</asp:ListItem>
			                    <asp:ListItem>2004</asp:ListItem>
			                    <asp:ListItem>2005</asp:ListItem>
			                    <asp:ListItem>2006</asp:ListItem>
			                    <asp:ListItem>2007</asp:ListItem>
			                    <asp:ListItem>2008</asp:ListItem>
			                    <asp:ListItem>2009</asp:ListItem>
			                    <asp:ListItem>2010</asp:ListItem>
			                </obout:OboutDropDownList>
			                <obout:OboutDropDownList runat="server" ID="YearMonth_Month_OrderDate" Width="49%" Height="150" MenuWidth="125">
			                    <asp:ListItem Value="1">January</asp:ListItem>
			                    <asp:ListItem Value="2">February</asp:ListItem>
			                    <asp:ListItem Value="3">March</asp:ListItem>
			                    <asp:ListItem Value="4">April</asp:ListItem>
			                    <asp:ListItem Value="5">May</asp:ListItem>
			                    <asp:ListItem Value="6">June</asp:ListItem>
			                    <asp:ListItem Value="7">July</asp:ListItem>
			                    <asp:ListItem Value="8">August</asp:ListItem>
			                    <asp:ListItem Value="9">September</asp:ListItem>
			                    <asp:ListItem Value="10">October</asp:ListItem>
			                    <asp:ListItem Value="11">November</asp:ListItem>
			                    <asp:ListItem Value="12">December</asp:ListItem>
			                </obout:OboutDropDownList>
			            </div>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="CountriesFilter">
			        <Template>
			            <asp:ListBox runat="server" ID="DdlCountries" CssClass="tdText" Width="100%" Rows="3" SelectionMode="Multiple">
			                <asp:ListItem>USA</asp:ListItem>
			                <asp:ListItem>UK</asp:ListItem>
			                <asp:ListItem>Germany</asp:ListItem>
			                <asp:ListItem>France</asp:ListItem>
			                <asp:ListItem>Brazil</asp:ListItem>
			            </asp:ListBox>
			            <input type="hidden" id="SelectedCountries" />
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="CitiesFilter">
			        <Template>
			            <obout:OboutTextBox runat="server" ID="TxtCities" Height="44" Width="100%" TextMode="MultiLine"></obout:OboutTextBox>
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="FreightFilter">
			        <Template>
			            <div class="tdText">
			                <obout:OboutCheckBox runat="server" ID="FreightInterval1" Text="$0-$49" Width="50%" />
			                <obout:OboutCheckBox runat="server" ID="FreightInterval2" Text="$50-$99" Width="50%" /> <br />
			                <obout:OboutCheckBox runat="server" ID="FreightInterval3" Text="$100-$150" Width="50%" />
			                <obout:OboutCheckBox runat="server" ID="FreightInterval4" Text="> $150" Width="50%" />
			            </div>			            
			        </Template>
			    </obout:GridTemplate>
			    
			    <obout:GridTemplate runat="server" ID="ShipNameStartsWithTemplate">
			        <Template>
			            <div class="tdText">
			                <obout:OboutTextBox runat="server" ID="ShipNameStartsWith1" Width="42%" />
			                <div class="separator">or</div>
			                <obout:OboutTextBox runat="server" ID="ShipNameStartsWith2" Width="42%" />
			            </div>			            
			        </Template>
			    </obout:GridTemplate>
			    
			</Templates>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    The <b>CustomFilterOption</b> class allows you to create new filter options that are more advanced than the standard ones offered by the Grid.<br />
		    Each custom option may have a template applied to it and you can have a different template for each custom filter option. <br /><br />
		    You can use the <b>OnFiltering</b> server-side event to generate the appropriate filter expressions for each column, <br />
		    based on the values of the fields from the filter options templates.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>