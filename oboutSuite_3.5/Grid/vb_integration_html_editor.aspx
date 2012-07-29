<%@ Page Language="VB" ValidateRequest="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="VB" runat="server">
    Private grid1 As New Grid()
    Private dummyCal As New OboutInc.Calendar2.Calendar()
    Private calendars As New ArrayList()
    Private textboxes As New ArrayList()

    Private Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
    
        grid1.ClientSideEvents.OnClientEdit = "onAddEdit"
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate"
        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeInsertUpdate"
        grid1.ClientSideEvents.OnBeforeClientCancelEdit = "onBeforeClientCancelEdit"
    
    
        grid1.FolderStyle = ""
    
        ' setting the event handlers
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid
    
    
        ' creating the template for the Country column (edit mode)
        '------------------------------------------------------------------------
        Dim TemplateAdditionalInformation As GridRuntimeTemplate = New GridRuntimeTemplate()
        TemplateAdditionalInformation.ID = "tmpEditor"
        TemplateAdditionalInformation.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateAdditionalInformation.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAdditionalInformationTemplate
        TemplateAdditionalInformation.ControlID = "EditorContent"
        TemplateAdditionalInformation.ControlPropertyName = "value"
        '------------------------------------------------------------------------
    
        
        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateAdditionalInformation)
        
        ' creating the columns
        Dim oCol1 As New Column()
        oCol1.DataField = "OrderID"
        oCol1.[ReadOnly] = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
    
        Dim oCol2 As New Column()
        oCol2.DataField = "ShipName"
        oCol2.Visible = True
        oCol2.HeaderText = "NAME"
        oCol2.Width = "150"
    
       
        Dim oCol13 As New Column()
        oCol13.DataField = "AdditionalInformationHTML"
        oCol13.HeaderText = "ADDITIONAL INFORMATION"
        oCol13.Width = "600"
        oCol13.ParseHTML = True
        oCol13.TemplateSettings.EditTemplateId = "tmpEditor"
    
        Dim oCol14 As New Column()
        oCol14.DataField = ""
        oCol14.Visible = True
        oCol14.HeaderText = "EDIT"
        oCol14.Width = "150"
        oCol14.AllowEdit = True
        oCol14.AllowDelete = True
    
    
        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol13)
        grid1.Columns.Add(oCol14)
    
        ' add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
    
        If Not Page.IsPostBack Then
            BindGrid()
        End If
        
        EditorID.Value = CType(grid1.Templates(0).Container.FindControl("Editor"), Editor).ClientID
        
    End Sub

    Sub CreateAdditionalInformationTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)

        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)
       
        Dim editor__1 As Editor = New Editor()
        editor__1.ID = "Editor"
        editor__1.Height = 300
        editor__1.Width = 550
        editor__1.TopToolbar.Appearance = EditorTopToolbar.AppearanceType.Lite

        Dim HiddenInput As Literal = New Literal()
        HiddenInput.Text = "<input type=""hidden"" id=""EditorContent"" />"
       
        ph1.Controls.Add(editor__1)
        ph1.Controls.Add(HiddenInput)
    End Sub

    Private Sub BindGrid()
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
    End Sub

    Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
    
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID = @OrderID", myConn)
    
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")
        myComm.Parameters.Add("@OrderID", OleDbType.[Integer]).Value = e.Record("OrderID")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("INSERT INTO Orders (ShipName, AdditionalInformationHTML) VALUES(@ShipName, @AdditionalInformationHTML)", myConn)
    
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record("AdditionalInformationHTML")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub
</script>

<html>
<head id="Head1" runat="server">
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            background-color: ____:#f6f9fc;padding-left:4px;padding-right:4px;}
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
    </style>

     <script type="text/JavaScript">
         function onAddEdit() {
             var editorObject = $find(document.getElementById('EditorID').value);
             editorObject.set_content(document.getElementById('EditorContent').value);
         }

         function onBeforeInsertUpdate() {
             var editorObject = $find(document.getElementById('EditorID').value);
             document.getElementById('EditorContent').value = editorObject.get_content();
         }
         function onBeforeClientCancelEdit() {
             var editorObject = $find(document.getElementById('EditorID').value);
             var editPanel = editorObject.get_editPanel();
             editPanel.ensurePopupsClosed();
         }      
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - HTML Editor Inline</b></span>
    <br />
    
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="Server" ID="popupHolder" DefaultAddPolicy="Demand" />

    <asp:HiddenField ID="EditorID" runat="server" />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
   
    <br />
    <br />
    <span class="tdText">The HTML Editor can be used inside the Grid to edit fields that
        contain data in html format. </span>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=VBNET">« Back to examples</a>
    </form>
</body>
</html>
