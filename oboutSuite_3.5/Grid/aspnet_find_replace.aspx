<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
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
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AllowAddingRecords="true" AllowColumnResizing="true" AutoGenerateColumns="false" FolderStyle="styles/premiere_blue"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"
			AllowMultiRecordAdding="true" AllowMultiRecordEditing="true" AllowMultiRecordDeleting="true">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="75" Visible="false" runat="server" />
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server">
				    <TemplateSettings EditTemplateId="CompanyNameTpl" />
				</obout:Column>
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="225" runat="server">
				    <TemplateSettings EditTemplateId="AddressTpl" />
				</obout:Column>
				<obout:Column DataField="City" HeaderText="CITY" Width="225" runat="server">
				    <TemplateSettings EditTemplateId="CityTpl" />
				</obout:Column>
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" runat="server">
				    <TemplateSettings EditTemplateId="CountryTpl" />
				</obout:Column>
				<obout:Column DataField="" AllowEdit="true" AllowDelete="true" HeaderText="" Width="150" runat="server" />
			</Columns>
			<ClientSideEvents OnClientPopulateControls="onPopulateControls" />
			<Templates>
			    <obout:GridTemplate ID="CompanyNameTpl" runat="server" ControlID="txtCompanyName" ControlPropertyName="value">
			        <Template>
			            <input type="text" id="txtCompanyName" class="ob_gEC" />
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate ID="AddressTpl" runat="server" ControlID="txtAddress" ControlPropertyName="value">
			        <Template>
			            <input type="text" id="txtAddress" class="ob_gEC" />
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate ID="CityTpl" runat="server" ControlID="txtCity" ControlPropertyName="value">
			        <Template>
			            <input type="text" id="txtCity" class="ob_gEC" />
			        </Template>
			    </obout:GridTemplate>
			    <obout:GridTemplate ID="CountryTpl" runat="server" ControlID="txtCountry" ControlPropertyName="value">
			        <Template>
			            <input type="text" id="txtCountry" class="ob_gEC" />
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>				
		
		<br /><br />
		
		<span class="tdText">
		    You can perform find and replace operations with the Grid. The find and replace procedure is customizable: you can<br />
            search only some of the columns or perform case sensitive/insensitive searches.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


