<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="VB" runat="server">
    Private grid1 As New Grid()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AllowAddingRecords = False
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AutoGenerateColumns = False

        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate"
        grid1.ClientSideEvents.OnClientEdit = "OnEdit"
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert"
    
        ' setting the event handlers
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
        AddHandler grid1.RowDataBound, AddressOf grid1_RowDataBound
    
    
        ' creating the Templates
    
        ' creating the template for the Country column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditCountry As New GridRuntimeTemplate()
        TemplateEditCountry.ID = "TemplateEditCountry"
        TemplateEditCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditCountry.Template.CreateTemplate, AddressOf CreateEditCountryTemplate
        TemplateEditCountry.UseQuotes = True
        '------------------------------------------------------------------------
    
        Dim TemplateEditCountryIds As GridRuntimeTemplate = New GridRuntimeTemplate()
        TemplateEditCountryIds.ID = "TemplateEditCountryIds"
        TemplateEditCountryIds.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditCountryIds.Template.CreateTemplate, AddressOf CreateEditCountryIdsTemplate
        TemplateEditCountryIds.ControlID = "hidCountries"
        TemplateEditCountryIds.ControlPropertyName = "value"
        TemplateEditCountryIds.UseQuotes = True
        
        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateEditCountry)
        grid1.Templates.Add(TemplateEditCountryIds)
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "CustomerID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "60"
        oCol1.Visible = False
    
    
        Dim oCol2 As New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "150"
       
        Dim oCol3 As New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "150"
           
        Dim oCol4 As New Column()
        oCol4.HeaderText = "COUNTRIES"
        oCol4.Width = "200"
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditCountry"
    
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "CountryIds"
        oCol5.HeaderText = "COUNTRIES"
        oCol5.Width = "200"
        oCol5.Visible = False
        oCol5.TemplateSettings.EditTemplateId = "TemplateEditCountryIds"

        Dim oCol6 As Column = New Column()
        oCol6.HeaderText = ""
        oCol6.Width = "125"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True
    
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

    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Public Sub CreateEditCountryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhCountry As New PlaceHolder()
        e.Container.Controls.Add(oPhCountry)
        AddHandler oPhCountry.DataBinding, AddressOf DataBindEditCountryTemplate
    End Sub
    Protected Sub DataBindEditCountryTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPhCountry As PlaceHolder = TryCast(sender, PlaceHolder)
        oPhCountry.ID = "oPhCountry"
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oPhCountry.NamingContainer, Obout.Grid.TemplateContainer)
    
        Dim divContainer As Literal = New Literal()
        divContainer.Text = "<div style=""height: 200px;overflow: auto; overflow-x:hidden;"">"

        oPhCountry.Controls.Add(divContainer)

        Dim CheckBoxList1 As CheckBoxList = New CheckBoxList()
        CheckBoxList1.ID = "CheckBoxList1"
        CheckBoxList1.DataSourceID = "sds1"
        CheckBoxList1.DataTextField = "CountryName"
        CheckBoxList1.DataValueField = "CountryID"
        AddHandler CheckBoxList1.DataBound, AddressOf CheckBoxList1_DataBound

        oPhCountry.Controls.Add(CheckBoxList1)

        Dim oLiteral As Literal = New Literal()
        oLiteral.Text = "</div>"

        oPhCountry.Controls.Add(oLiteral)
    
    End Sub
    
    Public Sub CreateEditCountryIdsTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhCountry As New PlaceHolder()
        e.Container.Controls.Add(oPhCountry)
        AddHandler oPhCountry.DataBinding, AddressOf DataBindCountryIdsTemplate
    End Sub
    Protected Sub DataBindCountryIdsTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPhCountry As PlaceHolder = TryCast(sender, PlaceHolder)
        oPhCountry.ID = "oPhCountry"
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oPhCountry.NamingContainer, Obout.Grid.TemplateContainer)
    
        Dim oLiteral As Literal = New Literal()
        oLiteral.Text = "<input id=""hidCountries"" type=""hidden"">"

        oPhCountry.Controls.Add(oLiteral)
    
    End Sub
    Private Sub CreateGrid()
        '------------------------------------------------------------------------
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT CustomerID,CompanyName, ContactName, CountryIds  FROM Customers", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Customers WHERE CustomerID = @CustomerID", myConn)
    
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record("CustomerID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Customers SET CountryIds=@CountryIds WHERE CustomerID=@CustomerID", myConn)
        myComm.Parameters.AddWithValue("@CountryIds", e.Record("CountryIds"))
        myComm.Parameters.AddWithValue("@CustomerID", e.Record("CustomerID"))
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        
    
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        
        CreateGrid()
    
    End Sub

    Protected Sub grid1_RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
        e.Row.Cells(3).Text = GetCountries(e.Row.Cells(4).Text)
    End Sub

    Public Function GetCountries(ByVal ids As String) As String
        Dim countryNames As String = String.Empty
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT CountryName  FROM Countries WHERE CountryId IN (" + ids.Replace("'", "''") + ")", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        While myReader.Read()
           
            If countryNames <> String.Empty Then
           
                countryNames += ","
            End If
            
            countryNames += myReader("CountryName").ToString()
        End While
    
        myConn.Close()
        Return countryNames
    End Function

    Sub CheckBoxList1_DataBound(ByVal sender As Object, ByVal e As EventArgs)
    
        Dim values As String = ""
        Dim item As ListItem
        For Each item In CType(sender, CheckBoxList).Items
        
            If values <> "" Then
          
                values += ","
            End If
                    
            values += item.Value
        Next

        CheckBoxValues.Value = values
    End Sub
	</script>		

	<head id="Head1" runat="server" >
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
		
	</style>
    
    <script language="javascript" type="text/javascript">
        var arrCheckBoxes = null;

        function OnBeforeInsert(record) {

            if (SelectedCountries != "") {
                document.getElementById("hidCountries").value = SelectedCountries
            }
            else {
                document.getElementById("hidCountries").value = record.CountryIds;
            }

            return true;
        }

        function getCheckBoxes() {
            if (arrCheckBoxes == null) {
                arrCheckBoxes = new Array();
                var elements = grid1.GridMainContainer.getElementsByTagName('INPUT');
                for (var i = 0; i < elements.length; i++) {
                    if (elements[i].type == 'checkbox') {
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
	    
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				
         <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
        </asp:SqlDataSource>
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
