<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">	
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)       
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = true
        grid1.AutoGenerateColumns = false
        grid1.AllowAddingRecords = true

        grid1.AllowMultiRecordAdding = true
        grid1.AllowMultiRecordEditing = true
        grid1.AllowMultiRecordDeleting = true

        grid1.FolderStyle = "styles/premiere_blue"
        
        grid1.ClientSideEvents.OnClientPopulateControls = "onPopulateControls"

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
        
        AddGridTemplate("CompanyNameTpl", "txtCompanyName")
        AddGridTemplate("AddressTpl", "txtAddress")
        AddGridTemplate("CityTpl", "txtCity")
        AddGridTemplate("CountryTpl", "txtCountry")
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ID"
        oCol1.Width = "75"
        oCol1.Visible = false

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"
        oCol2.TemplateSettings.EditTemplateId = "CompanyNameTpl"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "225"
        oCol3.TemplateSettings.EditTemplateId = "AddressTpl"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "City"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "225"
        oCol4.TemplateSettings.EditTemplateId = "CityTpl"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "125"
        oCol5.TemplateSettings.EditTemplateId = "CountryTpl"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = ""
        oCol6.HeaderText = ""
        oCol6.Width = "150"
        oCol6.AllowEdit = true
        oCol6.AllowDelete = true


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        If Not Page.IsPostBack Then
			CreateGrid()			
		End If
    End Sub
    
    Protected Sub AddGridTemplate(ByVal templateId As String, ByVal controlId As String)
        Dim template As Obout.Grid.GridRuntimeTemplate
        template = New GridRuntimeTemplate()
        template.ID = templateId
        template.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(template.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateGridTemplate
        template.ControlID = controlId
        template.ControlPropertyName = "value"
        template.UseQuotes = False
        
        template.Container.Value = controlId

        grid1.Templates.Add(template)
    End Sub
    
    
    
    Sub CreateGridTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindGridTemplate
    End Sub
    Sub DataBindGridTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type='text' id='" + oContainer.Value + "' class='ob_gEC' />"
    End Sub
    
    
	
    Sub CreateGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub
	
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
        
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn)
        
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord("SupplierID")
        
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
        
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn)

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord("CompanyName")
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord("Address")
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord("Country")
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord("SupplierID")
        
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        If e.RecordsCollection.Count > 0 Then
            Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
            myConn.Open()
		
            For Each oRecord As Hashtable In e.RecordsCollection
                Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn)
		
                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord("CompanyName")
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord("Address")
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord("Country")
  
                myComm.ExecuteNonQuery()
            Next
            
            myConn.Close()
        End If
    End Sub
	
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>


