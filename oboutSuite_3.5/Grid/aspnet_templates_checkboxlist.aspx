<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CustomerID,CompanyName, ContactName, CountryIds  FROM Customers", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Customers WHERE CustomerID = @CustomerID", myConn);

        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
    
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Customers SET CountryIds=@CountryIds WHERE CustomerID=@CustomerID", myConn);
        myComm.Parameters.AddWithValue("@CountryIds", e.Record["CountryIds"]);
        myComm.Parameters.AddWithValue("@CustomerID", e.Record["CustomerID"]);

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
        
    }

    protected void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        e.Row.Cells[3].Text = GetCountries(e.Row.Cells[4].Text);
    }


    public string GetCountries(string ids)
    {
        string countryNames = string.Empty;

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT CountryName  FROM Countries WHERE CountryId IN (" + ids.Replace("'", "''") + ")", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        while (myReader.Read())
        {
            if (countryNames != String.Empty)
            {
                countryNames += ",";
            }
            countryNames += myReader["CountryName"].ToString();
        }

        myConn.Close();
        
        return countryNames;
    }

    public void CheckBoxList1_DataBound(object sender, EventArgs e)
    {
        string values = "";
        foreach (ListItem item in ((CheckBoxList)sender).Items)
        {
            if (values != "")
            {
                values += ",";
            }
            
            values += item.Value;
        }

        CheckBoxValues.Value = values;
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    
    <script language="javascript" type="text/javascript">
        var arrCheckBoxes = null;	

	    function OnBeforeInsert(record) {
           	
            if(SelectedCountries!=""){
                document.getElementById("hidCountries").value=SelectedCountries
            }
            else{
                document.getElementById("hidCountries").value=record.CountryIds;
            }

            return true;
        }

        function getCheckBoxes() {
            if (arrCheckBoxes == null) {
                arrCheckBoxes = new Array();
                var elements = grid1.GridMainContainer.getElementsByTagName('INPUT');
                for (var i = 0; i < elements.length; i++) {
                    if(elements[i].type == 'checkbox') {
                        arrCheckBoxes.push(elements[i]);
                    }
                }
            }

            return arrCheckBoxes;
        }
    	
	    function OnEdit(record) {
	        var countries = ',' + record.CountryIds + ',';

	        var checkboxes = getCheckBoxes();

	        var values = document.getElementById('CheckBoxValues').value.split(',');

	        for (var i = 0; i < values.length; i++) {
	            if (countries.indexOf(',' + values[i] + ',') != -1) {
	                checkboxes[i].checked = true;
	            } else {
	                checkboxes[i].checked = false;
	            }
	        }            
            
   		    return true;
	    }

	    function OnBeforeUpdate(record) {
	        var selectedCountries = new Array();
	        var checkboxes = getCheckBoxes();

	        var values = document.getElementById('CheckBoxValues').value.split(',');

	        for (var i = 0; i < values.length; i++) {
	            if (checkboxes[i].checked) {
	                selectedCountries.push(values[i]);
	            }
	        }


	        document.getElementById("hidCountries").value = selectedCountries.join(',');
  
    	    return true;
	    }

    	
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <br />
		<span class="tdText"><b>ASP.NET Grid - Edit Using CheckBoxList</b></span>
		<br /><br />

        <asp:HiddenField ID="CheckBoxValues" runat="server" />
    
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"  AllowAddingRecords="false"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" OnRowDataBound="grid1_RowDataBound">

		    <ClientSideEvents OnBeforeClientUpdate="OnBeforeUpdate" OnClientEdit="OnEdit" OnBeforeClientInsert="OnBeforeInsert" />
			    
			<Columns>
				<obout:Column ID="Column1" DataField="CustomerID" ReadOnly="true" HeaderText="ID" Width="60" runat="server" Visible="false"/>				
				<obout:Column ID="Column2" DataField="CompanyName" ReadOnly="true" HeaderText="COMPANY NAME" Width="200" runat="server" />
				<obout:Column ID="Column3" DataField="ContactName" ReadOnly="true" HeaderText="CONTACT NAME" Width="200" runat="server" />
				<obout:Column ID="Column4" HeaderText="COUNTRIES" Width="200" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditCountry" />
				</obout:Column>
                <obout:Column ID="Column6" DataField="CountryIds" HeaderText="COUNTRIES" Width="200" Visible="false" runat="server">
                    <TemplateSettings EditTemplateId="TemplateEditCountryIds" />
                </obout:Column>
				<obout:Column ID="Column5" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateEditCountry">
				    <Template>
                        <div style="height: 200px;overflow: auto; overflow-x:hidden;">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
                                OnDataBound="CheckBoxList1_DataBound" />
                        </div>
		                <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
		                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		                </asp:SqlDataSource>
                        
				    </Template>
				</obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="TemplateEditCountryIds" ControlID="hidCountries" ControlPropertyName="value">
                    <Template>
                        <input type="hidden" id="hidCountries" />
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
        
        <br /><br /><br />
		
		<span class="tdText">
		   You can add a CheckBoxList control inside a Grid template to allow end users to select multiple items from a list.<br />
           This sample showcases the use of a CheckBoxList for the "COUNTRIES" column.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
