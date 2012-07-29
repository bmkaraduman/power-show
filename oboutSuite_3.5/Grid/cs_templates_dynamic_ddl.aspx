<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="C#" runat="server">   
	
    string conStr_cities = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\\City.mdb;Persist Security Info=True";
    Grid grid1;
    DropDownList drp1;
    
    void Page_Load(object sender, EventArgs e)
	{
        grid1 = new Grid();
        grid1.ID = "grid1";
        grid1.AllowAddingRecords = false;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.Rebind += new Grid.DefaultEventHandler(RebindGrid);
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.ClientSideEvents.OnClientPopulateControls = "onPopulate";

        Column pID = new Column();
        pID.HeaderText = "ID";
        pID.ReadOnly = true;
        pID.Width = "75";
        pID.DataField = "OrderID";
        grid1.Columns.Add(pID);

        Column name = new Column();
        name.DataField = "ShipName";
        name.HeaderText = "Name";
        grid1.Columns.Add(name);

        Column country = new Column();
        country.HeaderText = "Country";
        country.DataField = "ShipCountry";
        country.Width = "100";
        grid1.Columns.Add(country);

        Column city = new Column();
        city.DataField = "ShipCity";
        city.HeaderText = "City";
        city.Width = "150";
        city.TemplateSettings.EditTemplateId = "tplCityEdit";
        grid1.Columns.Add(city);

        Column address = new Column();
        address.DataField = "ShipAddress";
        address.HeaderText = "Address";
        grid1.Columns.Add(address);

        Column edit = new Column();
        edit.AllowEdit = true;
        edit.AllowDelete = true;
        edit.HeaderText = "Edit/Delete";
        edit.Width = "125";
        grid1.Columns.Add(edit);

        GridRuntimeTemplate tplCountryEdit = new GridRuntimeTemplate();
        tplCountryEdit.ID = "tplCityEdit";
        tplCountryEdit.ControlID = "drp1";
        tplCountryEdit.ControlPropertyName = "value";
        tplCountryEdit.Template = new RuntimeTemplate();
        tplCountryEdit.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(CreateCityEditTemplate);
        grid1.Templates.Add(tplCountryEdit);

        ph1.Controls.Add(grid1);
        
        if (!IsPostBack)
        {
            grid1.DataSourceID = "SqlDataSource1";
        }
	}
    public void CreateCityEditTemplate(Object sender, GridRuntimeTemplateEventArgs e)
    {
        drp1 = new DropDownList();
        drp1.ID = "drp1";
        drp1.Width = 120;
        drp1.DataTextField = "City";
        drp1.DataValueField = "City";
        drp1.CssClass = "tdText";
        e.Container.Controls.Add(drp1);
    }

    void RebindGrid(object sender, EventArgs e)
    {
        grid1.DataSourceID = "SqlDataSource1";
    }

    public string loadCityData(string country, string city)
    {
        string sResponse = string.Empty;
        OleDbConnection oConn = new OleDbConnection(conStr_cities);

        OleDbCommand oCommand = new OleDbCommand("SELECT DISTINCT City FROM City WHERE Country = @Country AND City <> '' ORDER BY City ASC", oConn);
        oCommand.Parameters.Add("@Country", OleDbType.VarChar).Value = country;
        oConn.Open();
        OleDbDataReader oReader = oCommand.ExecuteReader();

        if (oReader.HasRows)
        {
            while (oReader.Read())
            {
                if (!string.IsNullOrEmpty(sResponse)) sResponse += ";";
                sResponse += oReader.GetString(0);
            }
        }
        else
        {
            sResponse = "";
        }

        sResponse += "|" + city;

        oReader.Close();
        oConn.Close();

        return sResponse;
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
	<head runat="server">
		<title>obout Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;
				background-color:#f6f9fc;
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
		     .ob_cbTextbox {
		         font-size: 9pt;
		     }
		     .ob_gC .ob_gRC {white-space:normal;}
		</style>
		<script type="text/javascript">
		
		    function processAjaxResult( sData ) {
				
				if (sData == null || sData == "") return;
				
				var respContent = sData.split('|');
				var cityList = respContent[0].split(';')
				
				var drp1 = document.getElementById("grid1_tplCityEdit_ctl00_drp1");
				drp1.innerHTML = '';
				for(var p=0; p<cityList.length; p++)
				{
				    var opt = document.createElement('option');
				    opt.value = cityList[p];
				    opt.innerHTML = cityList[p];
				        
				    drp1.appendChild(opt);
				}
				drp1.value = respContent[1];
			}
			
		    function onPopulate(record) 
		    {
		        ob_post.AddParam("country", record.ShipCountry);
		        ob_post.AddParam("city", record.ShipCity);      // city is passed to have the city selected
				ob_post.post(null, "loadCityData", processAjaxResult);
            }
		</script>
		<link type="text/css" rel="stylesheet" href="../Combobox/styles/default/style.css" />
	</head>
	<body>
        <form id="Form1" runat="server">

        <br />

        <span class="tdText"><b>ASP.NET Grid - DropDownList with Dynamic Data</b></span>
        
        <br /><br />
        
        <asp:PlaceHolder ID="ph1" runat="server"></asp:PlaceHolder>
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\Northwind.mdb;Persist Security Info=True"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 25 * FROM Orders WHERE ShipCountry='USA' OR ShipCountry='UK' ORDER BY OrderID DESC"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipAddress" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        
        <br /><br />
        
        <span class="tdText">
            The DropDownList used for editing the "City" column is dynamically populated from the database using AJAX,<br />
            for each row, based on value from the "Country" column.
        </span>
        
        <br /><br />
       
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
        </form>
    </body>
</html>