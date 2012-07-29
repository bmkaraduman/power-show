<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">	
    Grid grid1 = new Grid();
    
	void Page_load(object sender, EventArgs e)		
	{       
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = true;

        grid1.AllowMultiRecordAdding = true;
        grid1.AllowMultiRecordEditing = true;
        grid1.AllowMultiRecordDeleting = true;

        grid1.FolderStyle = "styles/premiere_blue";
        
        grid1.ClientSideEvents.OnClientPopulateControls = "onPopulateControls";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        AddGridTemplate("CompanyNameTpl", "txtCompanyName");
        AddGridTemplate("AddressTpl", "txtAddress");
        AddGridTemplate("CityTpl", "txtCity");
        AddGridTemplate("CountryTpl", "txtCountry");
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "75";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";
        oCol2.TemplateSettings.EditTemplateId = "CompanyNameTpl";

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "225";
        oCol3.TemplateSettings.EditTemplateId = "AddressTpl";

        Column oCol4 = new Column();
        oCol4.DataField = "City";
        oCol4.HeaderText = "CITY";
        oCol4.Width = "225";
        oCol4.TemplateSettings.EditTemplateId = "CityTpl";
        
        Column oCol5 = new Column();
        oCol5.DataField = "Country";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "125";
        oCol5.TemplateSettings.EditTemplateId = "CountryTpl";

        Column oCol6 = new Column();
        oCol6.DataField = "";
        oCol6.HeaderText = "";
        oCol6.Width = "150";
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
        
        if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}

    protected void AddGridTemplate(string templateId, string controlId)
    {
        GridRuntimeTemplate template = new GridRuntimeTemplate();
        template.ID = templateId;
        template.Template = new Obout.Grid.RuntimeTemplate();
        template.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateGridTemplate);
        template.ControlID = controlId;
        template.ControlPropertyName = "value";
        template.UseQuotes = true;
        
        template.Container.Value = controlId;

        grid1.Templates.Add(template);
    }

    public void CreateGridTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindGridTemplate);
    }
    protected void DataBindGridTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type='text' id='" + oContainer.Value + "' class='ob_gEC' />";
    }
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }
            
            myConn.Close();
        }
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }
                
            myConn.Close();
        }
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];

                myComm.ExecuteNonQuery();
            }
            
            myConn.Close();
        }	
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}			
	</script>		

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		<script type="text/javascript">
		var performingSearchAndReplace = false;
		var arrCellsToSearch;
		var performCaseInsensitiveSearch;
		
		function findAndReplace() {
		    performingSearchAndReplace = true;
		    performCaseInsensitiveSearch = false;
		    
		    var searchValue = document.getElementById('searchItem').value;
		    
		    if(document.getElementById('chkCaseSensitive').checked == false) {
		        performCaseInsensitiveSearch = true;
		        searchValue = searchValue.toLowerCase();
		    }
		    
		    arrCellsToSearch = new Array();
		    
		    if(document.getElementById('chkCompanyName').checked) {
		        arrCellsToSearch.push({'ColumnName': 'CompanyName', 'Index' : 1});
		    }
		    if(document.getElementById('chkAddress').checked) {
		        arrCellsToSearch.push({'ColumnName': 'Address', 'Index' : 2});
		    }
		    if(document.getElementById('chkCity').checked) {
		        arrCellsToSearch.push({'ColumnName': 'City', 'Index' : 3});
		    }
		    if(document.getElementById('chkCountry').checked) {
		        arrCellsToSearch.push({'ColumnName': 'Country', 'Index' : 4});
		    }
		    
		    if(searchValue != '') {
		        var lastEditedIndex = -1;
		        for(var i=0; i<grid1.Rows.length; i++) {
                    var performEdit = false;
                    for(var j=0; j<arrCellsToSearch.length; j++) {
                        var cellValue = grid1.Rows[i].Cells[arrCellsToSearch[j].Index].Value;
                        
                        if(performCaseInsensitiveSearch) {
                            cellValue = cellValue.toLowerCase();
                        }
                        
		                if(cellValue.indexOf(searchValue) != -1) {
		                    performEdit = true;
		                    break;
		                }
		            }
		            
		            if(performEdit) {
		                grid1.editRecord(i);
		                lastEditedIndex = i;
		            }
		        }
    		    
		        if(lastEditedIndex != -1) {
		            grid1.cancelEdit(lastEditedIndex);
		        }
		    }
		    
		    performingSearchAndReplace = false;
		    arrCellsToSearch = null;
		    performCaseInsensitiveSearch = false;
		}
		
		function onPopulateControls(record) {
		    if(performingSearchAndReplace) {
		        var searchValue = document.getElementById('searchItem').value;
		        var replaceValue = document.getElementById('replaceItem').value;
		        
		        var regularExpressionType = 'g';		        
		        if(performCaseInsensitiveSearch) {
		            regularExpressionType = 'ig';
		        }
    		    
    		    for(var j=0; j<arrCellsToSearch.length; j++) {
		            record[arrCellsToSearch[j].ColumnName] = eval('record.' + arrCellsToSearch[j].ColumnName + '.replace(/' + searchValue + '/' + regularExpressionType + ', replaceValue)');
		        }
		    }
		    
		    return record;
		}
		</script>
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		<span class="tdText"><b>ASP.NET Grid - Find and Replace</b></span>
		
		<br /><br />

        <fieldset style="width: 300px;" class="tdText" style="padding: 10px;">
            <legend>Find/Replace</legend>
            <table>
                <tr>
                    <td class="tdText">Find: <input type="text" id="searchItem" class="tdText" value="Ltd" /></td>
                    <td class="tdText">Replace with: <input type="text" id="replaceItem" class="tdText" value="Inc" /></td>
                </tr>                
                <tr>
                    <td class="tdText" valign="top">Search in columns:</td>
                    <td class="tdText" valign="top">
                        <input type="checkbox" id="chkCompanyName" checked="checked" /> Company Name <br />
                        <input type="checkbox" id="chkAddress" checked="checked" /> Address <br />
                        <input type="checkbox" id="chkCity" checked="checked" /> City <br />
                        <input type="checkbox" id="chkCountry" checked="checked" /> Country <br />
                    </td>
                </tr>
                <tr>  
                    <td class="tdText" valign="top">Case Sensitive Search:</td>
                    <td class="tdText" valign="top">
                       <input type="checkbox" id="chkCaseSensitive" checked="checked" />
                    </td>
                </tr>
                <tr>
                    <td class="tdText">&#160;</td>
                    <td class="tdText">
                        <br />
                        <input type="button" value="Find/Replace" onclick="findAndReplace()" class="tdText" />
                    </td>
                </tr>
            </table>
        </fieldset>
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />
		
		<span class="tdText">
		    You can perform find and replace operations with the Grid. The find and replace procedure is customizable: you can<br />
            search only some of the columns or perform case sensitive/insensitive searches.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>


