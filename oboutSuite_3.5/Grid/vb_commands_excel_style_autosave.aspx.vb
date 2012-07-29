Imports System.Web.Services
Imports System.Data
Imports System.Web.UI.WebControls
Imports System.Web.UI
Imports System.Web
Imports System.Collections.Generic
Imports System
Imports System.Data.OleDb
Imports Obout.Grid

Partial Class Grid_vb_commands_excel_style_autosave
    Inherits OboutInc.oboutAJAXPage
    Dim grid1 As Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)

        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.AllowRecordSelection = False
        grid1.AllowAddingRecords = False
        grid1.FolderStyle = "styles/premiere_blue"

        Dim PlainEditTemplate As GridRuntimeTemplate = New GridRuntimeTemplate()
        PlainEditTemplate.ID = "PlainEditTemplate"
        PlainEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler PlainEditTemplate.Template.CreateTemplate, AddressOf CreatePlainEditTemplate
        
        Dim CheckBoxEditTemplate As GridRuntimeTemplate = New GridRuntimeTemplate()
        CheckBoxEditTemplate.ID = "CheckBoxEditTemplate"
        CheckBoxEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CheckBoxEditTemplate.Template.CreateTemplate, AddressOf CreateCheckBoxEditTemplate

        grid1.Templates.Add(PlainEditTemplate)
        grid1.Templates.Add(CheckBoxEditTemplate)

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "OrderDate"
        oCol2.HeaderText = "DATE"
        oCol2.Width = "100"
        oCol2.DataFormatString = "{0:MM/dd/yyyy}"
        oCol2.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "NAME"
        oCol3.Width = "200"
        oCol3.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "150"
        oCol5.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipRegion"
        oCol6.HeaderText = "REGION"
        oCol6.Width = "150"
        oCol6.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "150"
        oCol7.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol8 As Column = New Column()
        oCol8.DataField = "Sent"
        oCol8.HeaderText = "SENT"
        oCol8.Width = "100"
        oCol8.TemplateSettings.TemplateId = "CheckBoxEditTemplate"

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)

        phGrid1.Controls.Add(grid1)

        PopulateGrid()
    End Sub

    Sub CreatePlainEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindPlainEditTemplate
    End Sub

    Sub DataBindPlainEditTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""text"" class=""excel-textbox"" value=""" + oContainer.Value.ToString() + """ " + "onfocus=""markAsFocused(this)"" onblur=""markAsBlured(this, '" + grid1.Columns(oContainer.ColumnIndex).DataField + "', " + oContainer.PageRecordIndex.ToString() + ")"" />"

    End Sub


    Sub CreateCheckBoxEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler oLiteral.DataBinding, AddressOf DataBindCreateCheckBoxEditTemplate
    End Sub

    Sub DataBindCreateCheckBoxEditTemplate(ByVal sender As Object, ByVal e As EventArgs)

        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<div onmousedown=""editCheckBox(this, " + oContainer.PageRecordIndex.ToString() + ")"" class=""excel-checkbox""> " + (IIf(oContainer.Value.ToString() = "True", "yes", "no")) + "</div><div style=""display: none;""><input type=""checkbox"" onblur=""saveCheckBoxChanges(this, " + oContainer.PageRecordIndex.ToString() + ")"" /></div>"

    End Sub

    Sub PopulateGrid()

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb")

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        Dim ds As DataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(ds, "Orders")

        grid1.DataSource = ds
        grid1.DataBind()

        myConn.Close()
    End Sub

    Sub UpdateOrder(ByVal OrderDate As String, ByVal ShipName As String, ByVal ShipCity As String, ByVal ShipPostalCode As String, ByVal ShipRegion As String, ByVal ShipCountry As String, ByVal Sent As String, ByVal OrderID As String)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;")

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET OrderDate=@OrderDate, ShipName=@ShipName, ShipCity=@ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion=@ShipRegion, Sent=@Sent WHERE OrderID=@OrderID", myConn)
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = OrderDate
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = ShipName
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = ShipCity
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = ShipPostalCode
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = ShipRegion
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = Sent
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = OrderID

        myConn.Open()
        myComm.ExecuteNonQuery()
        myConn.Close()

    End Sub
End Class
