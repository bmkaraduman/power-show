<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">   
    string conStr_cities = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\\City.mdb;Persist Security Info=True";
    string drp1ID = string.Empty;
    
    void Page_Load(object sender, EventArgs e)
	{
        DropDownList drp1 = (DropDownList)Grid1.Templates[0].Container.FindControl("drp1");
        drp1ID = drp1.ClientID;
        
        if (!IsPostBack)
        {
            CreateGrid();
        }
	}

    private void CreateGrid()
    {
        Grid1.DataSourceID = "SqlDataSource1";
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
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

        sResponse += "|" + city + "|" + drp1ID;
        
        oReader.Close();
        oConn.Close();
        
        return sResponse;
    }
</script>

<html>
	<head runat="server">
		<title>obout Grid examples</title>
		<link type="text/css" rel="stylesheet" href="/combobox/combobox/styles/default/style.css" />
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
				
				var drp1 = document.getElementById(respContent[2]);
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
	</head>
	<body>
        <form id="Form1" runat="server">
        
        <br />

        <span class="tdText"><b>ASP.NET Grid - DropDownList with Dynamic Data</b></span>
        
        <br /><br />
        
        <obout:Grid ID="Grid1" runat="server" AllowAddingRecords="false" AutoGenerateColumns="false" 
            FolderStyle="styles/premiere_blue" OnRebind="RebindGrid" CallbackMode="true" Serialize="true" >
            <Columns>
                <obout:Column HeaderText="ID" ReadOnly="true" width="75" DataField="OrderID"></obout:Column>
                <obout:Column HeaderText="Name" DataField="ShipName"></obout:Column>
                <obout:Column HeaderText="Country" ReadOnly="true" DataField="ShipCountry" Width="100"></obout:Column>
                <obout:Column HeaderText="City" DataField="ShipCity" Width="150">
                    <TemplateSettings EditTemplateID="tplCityEdit" />
                </obout:Column>
                <obout:Column HeaderText="Address" DataField="ShipAddress"></obout:Column>
                <obout:Column HeaderText="Edit/Delete" AllowEdit="true" AllowDelete="true" Width="125"></obout:Column>
            </Columns>
            <Templates>
                <obout:GridTemplate ID="tplCityEdit" runat="server" ControlID="drp1" ControlPropertyName="value">
                    <Template>
                        <asp:DropDownList runat="server" ID="drp1" DataValueField="City" DataTextField="City" Width="120" CssClass="tdText"></asp:DropDownList>
                    </Template>
                </obout:GridTemplate>
            </Templates>
            <ClientSideEvents OnClientPopulateControls="onPopulate" />
        </obout:Grid>
        
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
       
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
        
        </form>
    </body>
</html>