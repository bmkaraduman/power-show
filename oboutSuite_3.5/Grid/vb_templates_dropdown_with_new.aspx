<%@ Page Language="VB" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

        ' creating the Templates

        ' creating the template for the Country column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditCountry As New GridRuntimeTemplate()
        TemplateEditCountry.ID = "TemplateEditCountry"
        TemplateEditCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditCountry.Template.CreateTemplate, AddressOf CreateEditCountryTemplate
        TemplateEditCountry.ControlID = "hidCountry"
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
        oCol2.Width = "210"

        Dim oCol3 As New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "200"

        Dim oCol4 As New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "130"
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

        Dim ddlCountry As New DropDownList()
        ddlCountry.ID = "ddlCountry"
        ddlCountry.CssClass = "ob_gEC"
        ddlCountry.AppendDataBoundItems = True
        ddlCountry.DataSourceID = "sds1"
        ddlCountry.DataTextField = "CountryName"
        ddlCountry.DataValueField = "CountryName"
        ddlCountry.Attributes.Add("onchange", "SetValue(this)")
        Dim lstSelect As New ListItem("Please select one...", "")
        lstSelect.Selected = True
        ddlCountry.Items.Insert(0, lstSelect)
        Dim lstNew As New ListItem("- Add new country -", "New")
        ddlCountry.Items.Add(lstNew)


        oPhCountry.Controls.Add(ddlCountry)

        Dim oLiteral As New Literal()
        oLiteral.Text = "<input type=""text"" class=""ob_gEC"" id=""txtCountry"" /> <input id=""hidCountry"" type=""hidden"" />"

        oPhCountry.Controls.Add(oLiteral)

    End Sub
    
    '------------------------------------------------------------------------
    Private Sub CreateGrid()

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

        myComm.Parameters.Add("@CustomerID", OleDbType.[Integer]).Value = e.Record("CustomerID")

        myComm.ExecuteNonQuery()
        myConn.Close()
        
    End Sub
    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("UPDATE Customers SET CompanyName=@CompanyName, ContactName=@ContactName, Country=@Country WHERE CustomerID = @CustomerID", myConn)

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record("ContactName")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")
        myComm.Parameters.Add("@CustomerID", OleDbType.VarChar).Value = e.Record("CustomerID")

        myComm.ExecuteNonQuery()
        myConn.Close()

    End Sub

    Private Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()

        Dim myComm As New OleDbCommand("INSERT INTO Customers (CompanyName, ContactName, Country) VALUES(@CompanyName, @ContactName, @Country)", myConn)

        myComm.Parameters.Add("@EmployeeName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@ContactName", OleDbType.VarChar).Value = e.Record("ContactName")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")


        myComm.ExecuteNonQuery()
        myConn.Close()
        
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub

    Public Function SaveCountry(ByVal CountryName As String) As String
        
        If Not IsCountryExists(CountryName) Then
            Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
            myConn.Open()

            Dim myComm As New OleDbCommand("INSERT INTO Countries (CountryName) VALUES(@CountryName)", myConn)

            myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = CountryName

            myComm.ExecuteNonQuery()
            myConn.Close()
        End If
        
        Return (CountryName)
        
    End Function

    Public Function IsCountryExists(ByVal countryName As String) As Boolean
        
        Dim flag As Boolean = False

        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))

        Dim myComm As New OleDbCommand("SELECT * FROM Countries WHERE CountryName=@CountryName", myConn)

        myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = countryName

        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        While myReader.Read()
            flag = True
        End While

        myConn.Close()

        Return flag
        
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

		a:hover {
			color:crimson;
		}
	</style>
    
    <script language="javascript" type="text/javascript">	
	
     var ddlCountry="";   
     

	function SetValue(e)
	{
       if(e.value=="New")
       {
           document.getElementById(e.id).style.visibility="hidden";
           document.getElementById(e.id).style.display="none";
           document.getElementById("txtCountry").style.visibility="visible";
           document.getElementById("txtCountry").style.display="block";
       }
	}
	
	function OnBeforeInsert(record) {
	    return true;
	}
	
	function OnEdit(record) {

        var _ddlcountry=document.getElementsByTagName("select");
        for(i=0;i<_ddlcountry.length;i++){

            if(_ddlcountry[i].id.indexOf("ddlCountry")>0){
                
                ddlCountry=_ddlcountry[i].id;
                break;
            }
        }

	    if(ddlCountry!="" && ddlCountry!=null){
           document.getElementById(ddlCountry).options[0].selected="selected";
           document.getElementById(ddlCountry).style.visibility="visible";
           document.getElementById(ddlCountry).style.display="block";
           document.getElementById("txtCountry").style.visibility="hidden";
           document.getElementById("txtCountry").style.display="none";
           
            var _ddlCountry=document.getElementById(ddlCountry);
	    
	        for(i=0;i<_ddlCountry.length;i++) {
	            if(_ddlCountry.options[i].text==record.Country)
	            {
	                _ddlCountry.options[i].selected="selected";
	            }
	        }
         }

   		return true;
	}
	
	function OnBeforeUpdate(record) {

        
	    if(ddlCountry!=""){
	    
	        var _ddlCountry=document.getElementById(ddlCountry);
	    
	        for(i=0;i<_ddlCountry.length;i++) {
	            if(_ddlCountry.options[i].selected) {
	                _ddlCountry.options[i].selected=false;
	                document.getElementById("hidCountry").value=_ddlCountry.options[i].value;
	                }
	            }
	        }
	    if(document.getElementById("hidCountry").value==""){
	    alert("Please select country");
	    return false;
	    
	    }
	    
	    if(document.getElementById("hidCountry").value=="New"){
	    AddNewCountry(document.getElementById("txtCountry").value);
	    document.getElementById("hidCountry").value=document.getElementById("txtCountry").value;
	    }
		return true;
	}
	
	function AddNewCountry(country)	{   
        ob_post.AddParam("CountryName",country);
        ob_post.post(null, "SaveCountry",AddCountryToList);
    }
    
    function AddCountryToList(country) {
        var newCountry=document.createElement("option");
        newCountry.text=country;
        newCountry.value=country;
        document.getElementById(ddlCountry).options.add(newCountry);
        
    }

	
</script>
</head>
<body>

    <form id="form1" runat="server">
        
        <br />
		<span class="tdText"><b>Edit using DropDownList with option to add new values</b></span>
		<br /><br />
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM [Countries] ORDER BY CountryName"
         ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|NorthWind.mdb;" ProviderName="System.Data.OleDb">
        </asp:SqlDataSource>
        <br /><br /><br />
		
		<span class="tdText">
		   You can select an existing item for the "Country" column, or add a new country to the list,<br />
		   by selecting the "- Add new country -" option from the DropDownList.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
    </form>
</body>
</html>
