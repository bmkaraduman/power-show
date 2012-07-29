<%@ Page Language="VB" %>

<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    Private grid1 As New Grid()


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.ClientSideEvents.OnClientEdit = "OnEdit"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate"
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert"
    
        grid1.FolderStyle = "styles/grand_gray"
    
        ' setting the event handlers
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
        AddHandler grid1.RowDataBound, AddressOf RowDataBound
    
    
        ' creating the Templates
    
        ' creating the template for the Country column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditCountry As New GridRuntimeTemplate()
        TemplateEditCountry.ID = "TemplateEditCountry"
        TemplateEditCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditCountry.Template.CreateTemplate, AddressOf CreateEditCountryTemplate
        TemplateEditCountry.ControlID = "hidCountries"
        TemplateEditCountry.ControlPropertyName = "value"
        TemplateEditCountry.UseQuotes = True
        '------------------------------------------------------------------------
    
    
        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateEditCountry)
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "CustomerID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "45"
        oCol1.Visible = False
    
    
        Dim oCol2 As New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "200"
        oCol2.[ReadOnly] = True
    
        Dim oCol3 As New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "200"
        oCol3.[ReadOnly] = True
    
        Dim oCol4 As New Column()
        oCol4.DataField = "CountryIds"
        oCol4.HeaderText = "COUNTRIES"
        oCol4.Width = "150"
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditCountry"
    
    
        Dim oCol5 As New Column()
        oCol5.HeaderText = ""
        oCol5.Width = "125"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
    
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
    
        Dim ListBox1 As New ListBox()
        ListBox1.ID = "ListBox1"
        ListBox1.CssClass = "ob_gEC"
        ListBox1.DataSourceID = "sds1"
        ListBox1.DataTextField = "CountryName"
        ListBox1.DataValueField = "CountryID"
        ListBox1.SelectionMode = ListSelectionMode.Multiple
    
        oPhCountry.Controls.Add(ListBox1)
    
        Dim oLiteral As New Literal()
        oLiteral.Text = "<input id=""hidCountries"" type=""hidden"">"
    
        oPhCountry.Controls.Add(oLiteral)
    
    End Sub
    Private Sub CreateGrid()
        '------------------------------------------------------------------------
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT * FROM Customers", myConn)
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
        '
        '        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        '        myConn.Open();
        '
        '        OleDbCommand myComm = new OleDbCommand("INSERT INTO Customers (CustomerID, CompanyName, ContactName, CountryIds) VALUES(@CustomerID, @CompanyName, @ContactName, @CountryIds)", myConn);
        '
        '        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record["CustomerID"];
        '        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record["CompanyName"];
        '        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record["ContactName"];
        '        myComm.Parameters.Add("@CountryIds", OleDbType.VarChar).Value = e.Record["CountryIds"];
        '        
        '
        '        myComm.ExecuteNonQuery();
        '        myConn.Close();
        '        
    
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    
    End Sub

    Protected Sub RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
        e.Row.Cells(3).Text = GetCountries(e.Row.Cells(3).Text)
    End Sub


    Public Function GetCountries(ByVal ids As String) As String
        Dim countries As New StringBuilder()
        Dim spliter As Char() = {","c}
        Dim countryIds As String() = ids.Split(spliter)
        For Each countryId As String In countryIds
            countries.Append(GetCountry(countryId))
            countries.Append(",")
        Next
    
    
        Return countries.ToString().Substring(0, countries.Length - 1)
    End Function

    Public Function GetCountry(ByVal id As String) As String
        Dim countryName As String = String.Empty
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT CountryName  FROM Countries WHERE CountryId=@CountryId", myConn)
        myComm.Parameters.AddWithValue("@CountryId", id)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        While myReader.Read()
            countryName = myReader("CountryName").ToString()
        End While
    
        myConn.Close()
        Return countryName
    End Function

     
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
	</style>
    
    <script language="javascript" type="text/javascript">	
	

	    function OnBeforeInsert(record) {
           	
           if(SelectedCountries!=""){
	        document.getElementById("hidCountries").value=SelectedCountries
	       }
	       else{
	       document.getElementById("hidCountries").value=record.CountryIds;
	       }
	        return true;
	    }
    	
	    function OnEdit(record) {

		    var lstBoxCountries;
            var lBox=document.getElementsByTagName("select");
            
            for(i=0;i<lBox.length;i++){
                if(lBox[i].id.indexOf("ListBox1")>0){
                    lstBoxCountry=lBox[i].id
                    break;
                }
            }

            var countries=record.CountryIds.split(',');
            
            var listCountries=document.getElementById(lstBoxCountry);
            
        	    for(i=0;i<listCountries .length; i++){
        	        listCountries.options[i].selected=false;
        	        for(j=0;j<countries.length;j++){
        	            if(listCountries.options[i].text==countries[j]){
        	   	            listCountries.options[i].selected="selected";
        	            }
        	        }
        	    }
            
   		    return true;
	    }
    	
	    function OnBeforeUpdate(record) {
	    
            var SelectedCountries="";
            var lstBoxCountries;
            var lBox=document.getElementsByTagName("select");
            
            for(i=0;i<lBox.length;i++){
                if(lBox[i].id.indexOf("ListBox1")>0){
                    lstBoxCountry=lBox[i].id
                    break;
                }
            }
                var listCountries=document.getElementById(lstBoxCountry);
            
        	    for(i=0;i<listCountries .length; i++){
        	        if(listCountries.options[i].selected)
        	        {
        	        	        SelectedCountries+=listCountries.options[i].value+",";
        	        }
        	     }
                 document.getElementById("hidCountries").value=SelectedCountries.substr(0,SelectedCountries.length-1);
  
    	    return true;
	    }

    	
    </script>
</head>
<body>

    <form id="form1" runat="server">
            	
    	<br />
		<span class="tdText"><b>ASP.NET Grid - Edit Using Multiselect Listbox</b></span>
		<br /><br />
    
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

	    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
	        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    </asp:SqlDataSource>	
	    
        <br /><br /><br />
		
		<span class="tdText">
		   You can use the multiselect Listbox to select multiple countries for each record.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>

    </form>
</body>
</html>

