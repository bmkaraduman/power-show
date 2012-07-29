<%@ Page Language="VB" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="VB" runat="server">   
	
	Private conStr_cities As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\City.mdb;Persist Security Info=True"
    Private grid1 As Grid
    Private drp1 As DropDownList

    Private Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1 = New Grid()
        grid1.ID = "grid1"
        grid1.AllowAddingRecords = False
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/premiere_blue"
        AddHandler grid1.Rebind, AddressOf RebindGrid
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.ClientSideEvents.OnClientPopulateControls = "onPopulate"
        
        Dim pID As New Column()
        pID.HeaderText = "ID"
        pID.[ReadOnly] = True
        pID.Width = "75"
        pID.DataField = "OrderID"
        grid1.Columns.Add(pID)
        
        Dim name As New Column()
        name.DataField = "ShipName"
        name.HeaderText = "Name"
        grid1.Columns.Add(name)
        
        Dim country As New Column()
        country.HeaderText = "Country"
        country.DataField = "ShipCountry"
        country.Width = "100"
        grid1.Columns.Add(country)
        
        Dim city As New Column()
        city.DataField = "ShipCity"
        city.HeaderText = "City"
        city.Width = "150"
        city.TemplateSettings.EditTemplateId = "tplCityEdit"
        grid1.Columns.Add(city)
        
        Dim address As New Column()
        address.DataField = "ShipAddress"
        address.HeaderText = "Address"
        grid1.Columns.Add(address)
        
        Dim edit As New Column()
        edit.AllowEdit = True
        edit.AllowDelete = True
        edit.HeaderText = "Edit/Delete"
        edit.Width = "125"
        grid1.Columns.Add(edit)
        
        Dim tplCountryEdit As New GridRuntimeTemplate()
        tplCountryEdit.ID = "tplCityEdit"
        tplCountryEdit.ControlID = "drp1"
        tplCountryEdit.ControlPropertyName = "value"
        tplCountryEdit.Template = New RuntimeTemplate()
        AddHandler tplCountryEdit.Template.CreateTemplate, AddressOf CreateCityEditTemplate
        grid1.Templates.Add(tplCountryEdit)
        
        ph1.Controls.Add(grid1)
        
        If Not IsPostBack Then
            grid1.DataSourceID = "SqlDataSource1"
        End If
    End Sub
    
    Public Sub CreateCityEditTemplate(ByVal sender As Object, ByVal e As GridRuntimeTemplateEventArgs)
        drp1 = New DropDownList()
        drp1.ID = "drp1"
        drp1.Width = 120
        drp1.DataTextField = "City"
        drp1.DataValueField = "City"
        drp1.CssClass = "tdText"
        e.Container.Controls.Add(drp1)
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        grid1.DataSourceID = "SqlDataSource1"
    End Sub

    Public Function loadCityData(ByVal country As String, ByVal city As String) As String
        Dim sResponse As String = String.Empty
        Dim oConn As New OleDbConnection(conStr_cities)
        
        Dim oCommand As New OleDbCommand("SELECT DISTINCT City FROM City WHERE Country = @Country AND City <> '' ORDER BY City ASC", oConn)
        oCommand.Parameters.Add("@Country", OleDbType.VarChar).Value = country
        oConn.Open()
        Dim oReader As OleDbDataReader = oCommand.ExecuteReader()
        
        If oReader.HasRows Then
            While oReader.Read()
                If Not String.IsNullOrEmpty(sResponse) Then
                    sResponse += ";"
                End If
                sResponse += oReader.GetString(0)
            End While
        Else
            sResponse = ""
        End If
        
        sResponse += "|" + city
        
        oReader.Close()
        oConn.Close()
        
        Return sResponse
    End Function

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
        
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
        </form>
    </body>
</html>