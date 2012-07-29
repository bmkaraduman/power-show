<%@ Page Language="VB" %>

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
        grid1.ClientSideEvents.OnClientEdit = "OnEdit"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate"
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert"
    
        grid1.FolderStyle = "styles/premiere_blue"
    
        ' setting the event handlers
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
    
    
        ' creating the Templates
    
        ' creating the template for the Sex column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateSex As New GridRuntimeTemplate()
        TemplateSex.ID = "TemplateSex"
        TemplateSex.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateSex.Template.CreateTemplate, AddressOf CreateSexTemplate
        '------------------------------------------------------------------------
    
        ' creating the template for the Sex column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditSex As New GridRuntimeTemplate()
        TemplateEditSex.ID = "TemplateEditSex"
        TemplateEditSex.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditSex.Template.CreateTemplate, AddressOf CreateEditSexTemplate
        TemplateEditSex.ControlID = "hidSex"
        TemplateEditSex.ControlPropertyName = "value"
        '------------------------------------------------------------------------
    
        ' creating the template for the Position column (view mode)
        '------------------------------------------------------------------------
        Dim TemplatePosition As New GridRuntimeTemplate()
        TemplatePosition.ID = "TemplatePosition"
        TemplatePosition.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplatePosition.Template.CreateTemplate, AddressOf CreatePositionTemplate
        '------------------------------------------------------------------------
    
    
    
        ' creating the template for the Position column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditPosition As New GridRuntimeTemplate()
        TemplateEditPosition.ID = "TemplateEditPosition"
        TemplateEditPosition.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditPosition.Template.CreateTemplate, AddressOf CreateEditPositionTemplate
        TemplateEditPosition.ControlID = "ddlPosition"
        TemplateEditPosition.ControlPropertyName = "value"
        TemplateEditPosition.UseQuotes = True
        '------------------------------------------------------------------------
    
        ' creating the template for the Country column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateCountry As New GridRuntimeTemplate()
        TemplateCountry.ID = "TemplateCountry"
        TemplateCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateCountry.Template.CreateTemplate, AddressOf CreateCountryTemplate
        '------------------------------------------------------------------------
    
    
    
        ' creating the template for the Country column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateEditCountry As New GridRuntimeTemplate()
        TemplateEditCountry.ID = "TemplateEditCountry"
        TemplateEditCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditCountry.Template.CreateTemplate, AddressOf CreateEditCountryTemplate
        TemplateEditCountry.ControlID = "ddlCountry"
        TemplateEditCountry.ControlPropertyName = "value"
        TemplateEditCountry.UseQuotes = True
        '------------------------------------------------------------------------
    
    
        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateSex)
        grid1.Templates.Add(TemplateEditSex)
        grid1.Templates.Add(TemplatePosition)
        grid1.Templates.Add(TemplateEditPosition)
        grid1.Templates.Add(TemplateCountry)
        grid1.Templates.Add(TemplateEditCountry)
    
    
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "EmployeeID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "45"
        oCol1.Visible = False
    
        Dim oCol2 As New Column()
        oCol2.DataField = "FirstName"
        oCol2.HeaderText = "FIRST NAME"
        oCol2.Width = "125"
    
        Dim oCol3 As New Column()
        oCol3.DataField = "LastName"
        oCol3.HeaderText = "LAST NAME"
        oCol3.Width = "130"
    
        Dim oCol4 As New Column()
        oCol4.DataField = "SexID"
        oCol4.HeaderText = "SEX"
        oCol4.Width = "130"
        oCol4.TemplateSettings.TemplateId = "TemplateSex"
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditSex"
    
        Dim oCol5 As New Column()
        oCol5.DataField = "PositionID"
        oCol5.HeaderText = "POSITION"
        oCol5.Width = "125"
        oCol5.TemplateSettings.TemplateId = "TemplatePosition"
        oCol5.TemplateSettings.EditTemplateId = "TemplateEditPosition"
    
        Dim oCol6 As New Column()
        oCol6.DataField = "CountryID"
        oCol6.HeaderText = "COUNTRY"
        oCol6.Width = "125"
        oCol6.TemplateSettings.TemplateId = "TemplateCountry"
        oCol6.TemplateSettings.EditTemplateId = "TemplateEditCountry"
    
    
        Dim oCol7 As New Column()
        oCol7.HeaderText = ""
        oCol7.Width = "125"
        oCol7.AllowEdit = True
        oCol7.AllowDelete = True
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
    
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    
        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub

    ' Create the methods that will load the data into the templates

    '------------------------------------------------------------------------
    Public Sub CreateSexTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindSexTemplate
    End Sub

    Protected Sub DataBindSexTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = TryCast(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
    
        oLiteral.Text = (IIf(oContainer.Value = "1", "Male", (IIf(oContainer.Value = "0", "Female", ""))))
    End Sub
    '------------------------------------------------------------------------


    '------------------------------------------------------------------------
    Public Sub CreateEditSexTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindEditSexTemplate
    End Sub

    Protected Sub DataBindEditSexTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = TryCast(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
    
        oLiteral.Text = "<input type=""radio"" id=""rMale"" name=""radioSex"" value=""1""/>Male<br><input type=""radio"" id=""rFemale"" name=""radioSex"" value=""0""/>Female<input type=""hidden"" id=""hidSex"" />"
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Public Sub CreatePositionTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindPositionTemplate
    End Sub
    Protected Sub DataBindPositionTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = TryCast(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
    
        oLiteral.Text = oContainer.DataItem("PositionName").ToString()
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Public Sub CreateEditPositionTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPhPosition As New PlaceHolder()
        e.Container.Controls.Add(oPhPosition)
        AddHandler oPhPosition.DataBinding, AddressOf DataBindEditPositionTemplate
    End Sub
    Protected Sub DataBindEditPositionTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPhPosition As PlaceHolder = TryCast(sender, PlaceHolder)
        oPhPosition.ID = "oPhCountry"
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oPhPosition.NamingContainer, Obout.Grid.TemplateContainer)
    
        Dim ddlPosition As New DropDownList()
        ddlPosition.ID = "ddlPosition"
        ddlPosition.CssClass = "ob_gEC"
        ddlPosition.AppendDataBoundItems = True
        ddlPosition.DataSourceID = "sds2"
        ddlPosition.DataTextField = "PositionName"
        ddlPosition.DataValueField = "PositionID"
        ddlPosition.Items.Add("Please select one...")
    
        oPhPosition.Controls.Add(ddlPosition)
    
    End Sub
    '------------------------------------------------------------------------

    '------------------------------------------------------------------------
    Public Sub CreateCountryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindCountryTemplate
    End Sub
    Protected Sub DataBindCountryTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = TryCast(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = TryCast(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
        oLiteral.Text = oContainer.DataItem("CountryName").ToString()
    End Sub
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
        ddlCountry.DataValueField = "CountryID"
    
        oPhCountry.Controls.Add(ddlCountry)
    
    End Sub
    
    '------------------------------------------------------------------------
    Private Sub CreateGrid()
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT Em.EmployeeID, Em.FirstName, Em.LastName, Em.SexID, Em.PositionID, Em.CountryID, C.CountryName, P.PositionName  " & Chr(13) & "" & Chr(10) & " FROM (Employees Em LEFT OUTER JOIN Countries C ON Em.CountryID=C.CountryID)" & Chr(13) & "" & Chr(10) & "  LEFT OUTER JOIN Positions P ON P.PositionID=Em.PositionID", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Employees WHERE EmployeeID = @EmployeeID", myConn)
    
        myComm.Parameters.Add("@EmployeeID", OleDbType.[Integer]).Value = e.Record("EmployeeID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, SexID = @SexID, PositionID=@PositionID, CountryID=@CountryID WHERE EmployeeID = @EmployeeID", myConn)
    
        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record("FirstName")
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record("LastName")
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record("SexID")
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record("PositionID")
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record("CountryID")
        myComm.Parameters.Add("@EmployeeID", OleDbType.VarChar).Value = e.Record("EmployeeID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("INSERT INTO Employees (FirstName, LastName, SexID, PositionID, CountryID) VALUES(@FirstName, @LastName, @SexID,@PositionID, @CountryID)", myConn)
    
        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record("FirstName")
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record("LastName")
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record("SexID")
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record("PositionID")
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record("CountryID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub
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
	
        function OnBeforeInsert(record) {
            SetSexID();
            return true;
        }
    		
        function OnEdit(record) {
            var sexID=grid1.Rows[grid1.RecordInEditMode].Cells["SexID"].Value;
            if(sexID=="0"){
                document.getElementById("rFemale").checked=true;
            }
            else{
               document.getElementById("rMale").checked=true;
            }
	        return true;
        }
    	
        function OnBeforeUpdate(record) {
            SetSexID();
	        return true;
        }
    	
        function SetSexID()
        {
            if(document.getElementById("rFemale").checked){
                document.getElementById("hidSex").value="0";
            }
            else if(document.getElementById("rMale").checked){
                document.getElementById("hidSex").value="1";
            }
        }
	
    </script>
</head>
<body>
    <form id="form1" runat="server">
    	
    	<br />
		<span class="tdText"><b>ASP.NET Grid - Edit with databound controls</b></span>
		<br /><br />
    
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
	        <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM Positions"
                ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
            </asp:SqlDataSource>
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>	
        <br /><br /><br />
		
		<span class="tdText">
		   The records of the Grid can be edited using databound controls by means of Templates.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>

    </form>
</body>
</html>
