<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Dim grid1 As Grid = New Grid()
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.ShowLoadingMessage = False

        grid1.FolderStyle = "styles/premiere_blue"

        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.Rebind, AddressOf RebindGrid

        Dim TemplateEditBirthDate As New GridRuntimeTemplate()
        TemplateEditBirthDate.ID = "TemplateEditBirthDate"
        TemplateEditBirthDate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditBirthDate.Template.CreateTemplate, AddressOf BirthDateTemplate
        TemplateEditBirthDate.ControlID = "txtBirthDate"
        TemplateEditBirthDate.ControlPropertyName = "value"

        Dim TemplateEditSalary As New GridRuntimeTemplate()
        TemplateEditSalary.ID = "TemplateEditSalary"
        TemplateEditSalary.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditSalary.Template.CreateTemplate, AddressOf SalaryTemplate
        TemplateEditSalary.ControlID = "txtSalary"
        TemplateEditSalary.ControlPropertyName = "value"

        Dim TemplateEditHomePhone As New GridRuntimeTemplate()
        TemplateEditHomePhone.ID = "TemplateEditHomePhone"
        TemplateEditHomePhone.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler TemplateEditHomePhone.Template.CreateTemplate, AddressOf HomePhoneTemplate
        TemplateEditHomePhone.ControlID = "txtHomePhone"
        TemplateEditHomePhone.ControlPropertyName = "value"

        grid1.Templates.Add(TemplateEditBirthDate)
        grid1.Templates.Add(TemplateEditSalary)
        grid1.Templates.Add(TemplateEditHomePhone)

        Dim oCol1 As New Column()
        oCol1.DataField = "EmployeeId"
        oCol1.Visible = False
        oCol1.HeaderText = "ID"

        Dim oCol2 As New Column()
        oCol2.DataField = "BirthDate"
        oCol2.DataFormatString = "{0:dddd, dd MMMM yyyy hh:mm tt}"
        oCol2.HeaderText = "BIRTH DATE"
        oCol2.Width = "270"
        oCol2.TemplateSettings.EditTemplateId = "TemplateEditBirthDate"

        Dim oCol3 As New Column()
        oCol3.DataField = "Salary"
        oCol3.DataFormatString = "{0:c}"
        oCol3.HeaderText = "SALARY"
        oCol3.Width = "175"
        oCol3.TemplateSettings.EditTemplateId = "TemplateEditSalary"

        Dim oCol4 As New Column()
        oCol4.DataField = "HomePhone"
        oCol4.HeaderText = "HOME PHONE"
        oCol4.Width = "200"
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditHomePhone"


        Dim oCol5 As New Column()
        oCol5.Width = "125"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True

        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        phGrid1.Controls.Add(grid1)

        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub
    
    Public Sub BirthDateTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim txtBirthdate As New TextBox()
        txtBirthdate.ID = "txtBirthDate"
        txtBirthdate.CssClass = "ob_gEC"
        e.Container.Controls.Add(txtBirthdate)
        
        Dim maskEditExtenderBDate As AjaxControlToolkit.MaskedEditExtender = New MaskedEditExtender()
        maskEditExtenderBDate.ID = "maskEditExtenderBDate"
        maskEditExtenderBDate.TargetControlID = "txtBirthDate"
        maskEditExtenderBDate.Mask = "99/99/9999 99:99:99"
        maskEditExtenderBDate.MaskType = AjaxControlToolkit.MaskedEditType.DateTime
        maskEditExtenderBDate.AcceptAMPM = True
        e.Container.Controls.Add(maskEditExtenderBDate)
        
    End Sub

    Public Sub SalaryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim txtSalary As New TextBox()
        txtSalary.ID = "txtSalary"
        txtSalary.CssClass = "ob_gEC"
        e.Container.Controls.Add(txtSalary)
    
        Dim maskEditExtenderSalary As AjaxControlToolkit.MaskedEditExtender = New MaskedEditExtender()
        maskEditExtenderSalary.ID = "maskEditExtenderSalary"
        maskEditExtenderSalary.TargetControlID = "txtSalary"
        maskEditExtenderSalary.Mask = "99,99,999.99"
        maskEditExtenderSalary.MaskType = AjaxControlToolkit.MaskedEditType.Number
        maskEditExtenderSalary.InputDirection = AjaxControlToolkit.MaskedEditInputDirection.RightToLeft
        maskEditExtenderSalary.DisplayMoney = AjaxControlToolkit.MaskedEditShowSymbol.Left
        e.Container.Controls.Add(maskEditExtenderSalary)
    
    End Sub

    Public Sub HomePhoneTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim txtHomePhone As New TextBox()
        txtHomePhone.ID = "txtHomePhone"
        txtHomePhone.CssClass = "ob_gEC"
        e.Container.Controls.Add(txtHomePhone)
    
        Dim maskEditExtenderHPhone As AjaxControlToolkit.MaskedEditExtender = New MaskedEditExtender()
        maskEditExtenderHPhone.ID = "maskEditExtenderHPhone"
        maskEditExtenderHPhone.TargetControlID = "txtHomePhone"
        maskEditExtenderHPhone.Mask = "(999) 999-9999"
        maskEditExtenderHPhone.MaskType = AjaxControlToolkit.MaskedEditType.Number
        maskEditExtenderHPhone.InputDirection = AjaxControlToolkit.MaskedEditInputDirection.LeftToRight
        maskEditExtenderHPhone.ClearMaskOnLostFocus = False
        e.Container.Controls.Add(maskEditExtenderHPhone)
    
    End Sub
    Private Sub CreateGrid()

        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
    
        Dim myComm As New OleDbCommand("SELECT * FROM Employees", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
    
        grid1.DataSource = myReader
        grid1.DataBind()
    
        myConn.Close()
        
    End Sub

    Private Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("DELETE FROM Employees WHERE EmployeeID = @EmployeeID", myConn)
    
        myComm.Parameters.Add("@EmployeeID", OleDbType.[Integer]).Value = e.Record("EmployeeId")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Private Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim phNumber As String = e.Record("HomePhone").ToString().Replace("_", String.Empty)
    
        Dim myConn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
    
        Dim myComm As New OleDbCommand("UPDATE Employees SET BirthDate = @BirthDate, Salary = @Salary, HomePhone=@HomePhone WHERE EmployeeID = @EmployeeID", myConn)
    
        myComm.Parameters.Add("@BirthDate", OleDbType.VarChar).Value = e.Record("BirthDate")
        myComm.Parameters.Add("@Salary", OleDbType.Currency).Value = e.Record("Salary")
        myComm.Parameters.Add("@HomePhone", OleDbType.VarChar).Value = phNumber
        myComm.Parameters.Add("@EmployeeId", OleDbType.[Integer]).Value = e.Record("EmployeeId")
    
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Private Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
    End Sub
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
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
				background-color___:#f6f9fc;
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
	</head>
    <body>
        <form id="Form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>					
		    <br />
		    <span class="tdText"><b>ASP.NET Grid - Integration with ASP.NET AJAX Control Toolkit</b> </span>		
		    <br /><br />
		
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
				
		    <br /><br />
		    <span class="tdText">
		         The controls from the ASP.NET AJAX Control Toolkit can be used inside GridTemplates to improve the user experience.
		    </span>
		    
		    <br /><br /><br />
		    
		    <a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
    </body>
</html>
