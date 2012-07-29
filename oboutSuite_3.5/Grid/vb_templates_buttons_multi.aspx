<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)		
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        
        grid1.FolderStyle = "styles/grand_gray"
        grid1.TemplateSettings.NewRecord_TemplateId = "addTemplate"
        grid1.TemplateSettings.NewRecord_EditTemplateId = "saveTemplate"
        grid1.TemplateSettings.MultiRecordSaveCancel_TemplateId = "multirecord_save_cancel_tpl"
        grid1.AllowMultiRecordAdding = true
        grid1.AllowMultiRecordEditing = true
        grid1.AllowMultiRecordDeleting = true

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
				
		
        ' creating the Templates
        '------------------------------------------------------------------------
        Dim editBtnTemplate As Obout.Grid.GridRuntimeTemplate
        editBtnTemplate = New GridRuntimeTemplate()
        editBtnTemplate.ID = "editBtnTemplate"
        editBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(editBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditBtnTemplate
        '------------------------------------------------------------------------

        '------------------------------------------------------------------------		
        Dim updateBtnTemplate As Obout.Grid.GridRuntimeTemplate
        updateBtnTemplate = New GridRuntimeTemplate()
        updateBtnTemplate.ID = "updateBtnTemplate"
        updateBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(updateBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateUpdateBtnTemplate
        '------------------------------------------------------------------------

        '------------------------------------------------------------------------
        Dim addTemplate As Obout.Grid.GridRuntimeTemplate
        addTemplate = New GridRuntimeTemplate()
        addTemplate.ID = "addTemplate"
        addTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(addTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAddTemplate
        '------------------------------------------------------------------------

        '------------------------------------------------------------------------
        Dim saveTemplate As Obout.Grid.GridRuntimeTemplate
        saveTemplate = New GridRuntimeTemplate()
        saveTemplate.ID = "saveTemplate"
        saveTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(saveTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateSaveTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim multiRecordSaveCancelTemplate As Obout.Grid.GridRuntimeTemplate
        multiRecordSaveCancelTemplate = New GridRuntimeTemplate()
        multiRecordSaveCancelTemplate.ID = "multirecord_save_cancel_tpl"
        multiRecordSaveCancelTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(multiRecordSaveCancelTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateMultiRecordSaveCancelTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim modifyTempEditedRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        modifyTempEditedRecordBtnTemplate = New GridRuntimeTemplate()
        modifyTempEditedRecordBtnTemplate.ID = "modifyTempEditedRecordBtnTemplate"
        modifyTempEditedRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(modifyTempEditedRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateModifyTempEditedRecordBtnTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim cancelTempEditedRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        cancelTempEditedRecordBtnTemplate = New GridRuntimeTemplate()
        cancelTempEditedRecordBtnTemplate.ID = "cancelTempEditedRecordBtnTemplate"
        cancelTempEditedRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(cancelTempEditedRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCancelTempEditedRecordBtnTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim modifyTempAddedRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        modifyTempAddedRecordBtnTemplate = New GridRuntimeTemplate()
        modifyTempAddedRecordBtnTemplate.ID = "modifyTempAddedRecordBtnTemplate"
        modifyTempAddedRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(modifyTempAddedRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateModifyTempAddedRecordBtnTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim cancelTempAddedRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        cancelTempAddedRecordBtnTemplate = New GridRuntimeTemplate()
        cancelTempAddedRecordBtnTemplate.ID = "cancelTempAddedRecordBtnTemplate"
        cancelTempAddedRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(cancelTempAddedRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCancelTempAddedRecordBtnTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim removeTempAddedRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        removeTempAddedRecordBtnTemplate = New GridRuntimeTemplate()
        removeTempAddedRecordBtnTemplate.ID = "removeTempAddedRecordBtnTemplate"
        removeTempAddedRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(removeTempAddedRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRemoveTempAddedRecordBtnTemplate
        '------------------------------------------------------------------------
        
        '------------------------------------------------------------------------
        Dim undeleteTempRecordBtnTemplate As Obout.Grid.GridRuntimeTemplate
        undeleteTempRecordBtnTemplate = New GridRuntimeTemplate()
        undeleteTempRecordBtnTemplate.ID = "undeleteTempRecordBtnTemplate"
        undeleteTempRecordBtnTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(undeleteTempRecordBtnTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateUndeleteTempRecordBtnTemplate
        '------------------------------------------------------------------------
        						
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(editBtnTemplate)
        grid1.Templates.Add(updateBtnTemplate)
        grid1.Templates.Add(addTemplate)
        grid1.Templates.Add(saveTemplate)
        grid1.Templates.Add(multiRecordSaveCancelTemplate)
        grid1.Templates.Add(modifyTempEditedRecordBtnTemplate)
        grid1.Templates.Add(cancelTempEditedRecordBtnTemplate)
        grid1.Templates.Add(modifyTempAddedRecordBtnTemplate)
        grid1.Templates.Add(cancelTempAddedRecordBtnTemplate)
        grid1.Templates.Add(removeTempAddedRecordBtnTemplate)
        grid1.Templates.Add(undeleteTempRecordBtnTemplate)
		
																						
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ID"
        oCol1.Width = "45"
        oCol1.Width = "60"
        oCol1.Visible = False

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"
	
        Dim oCol3 As Column = new Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "COMPANY ADDRESS"
        oCol3.Width = "200"        

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "City"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "250"        
	
        Dim oCol5 As Column = new Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "115"

        Dim oCol6 As Column = new Column()
        oCol6.HeaderText = "EDIT"
        oCol6.Width = "200"
        oCol6.AllowEdit = True
        oCol6.AllowDelete = True
        oCol6.TemplateSettings.TemplateId = "editBtnTemplate"
        oCol6.TemplateSettings.EditTemplateId = "updateBtnTemplate"
        oCol6.TemplateSettings.ModifyTemporaryEditedRecord_TemplateId = "modifyTempEditedRecordBtnTemplate"
        oCol6.TemplateSettings.CancelTemporaryEditedRecord_TemplateId = "cancelTempEditedRecordBtnTemplate"
        oCol6.TemplateSettings.ModifyTemporaryAddedRecord_TemplateId = "modifyTempAddedRecordBtnTemplate"
        oCol6.TemplateSettings.CancelTemporaryAddedRecord_TemplateId = "cancelTempAddedRecordBtnTemplate"
        oCol6.TemplateSettings.RemoveTemporaryAddedRecord_TemplateId = "removeTempAddedRecordBtnTemplate"
        oCol6.TemplateSettings.UndeleteTemporaryDeletedRecord_TemplateId = "undeleteTempRecordBtnTemplate"

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
            BindGrid()
        End If
    End Sub
    
    
    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreateEditBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindEditBtnTemplate
    End Sub
    Sub DataBindEditBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" class=""tdTextSmall"" value=""Edit"" onclick=""grid1.edit_record(this)""/> | <input type=""button""  class=""tdTextSmall"" value=""Delete"" onclick=""grid1.delete_record(this)""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateUpdateBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindUpdateBtnTemplate
    End Sub
    Sub DataBindUpdateBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Update"" class=""tdTextSmall"" onclick=""grid1.update_record(this)""/> | <input type=""button"" value=""Cancel"" class=""tdTextSmall"" onclick=""grid1.cancel_edit(this)""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateAddTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindSaveTemplate
    End Sub
    Sub DataBindSaveTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" class=""tdTextSmall"" value=""Add New"" onclick=""grid1.addRecord()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateSaveTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindAddTemplate
    End Sub
    Sub DataBindAddTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Save"" class=""tdTextSmall"" onclick=""grid1.insertRecord()""/> | <input type=""button"" value=""Cancel"" class=""tdTextSmall"" onclick=""grid1.cancelNewRecord()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateMultiRecordSaveCancelTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindMultiRecordSaveCancelTemplate
    End Sub
    Sub DataBindMultiRecordSaveCancelTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Save All"" class=""tdTextSmall"" onclick=""grid1.saveAll()""/> | <input type=""button"" value=""Cancel All"" class=""tdTextSmall"" onclick=""grid1.cancelAll()""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateModifyTempEditedRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindModifyTempEditedRecordBtnTemplate
    End Sub
    Sub DataBindModifyTempEditedRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Modify"" class=""tdTextSmall"" onclick=""grid1.modifyTemporaryRecord(this)""/> | <input type=""button"" value=""Delete"" class=""tdTextSmall"" onclick=""grid1.delete_record(this)""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateCancelTempEditedRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCancelTempEditedRecordBtnTemplate
    End Sub
    Sub DataBindCancelTempEditedRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Cancel"" class=""tdTextSmall"" onclick=""grid1.cancel_edit(this, true)""/> | <input type=""button"" value=""Delete"" class=""tdTextSmall"" onclick=""grid1.delete_record(this)""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateModifyTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindModifyTempAddedRecordBtnTemplate
    End Sub
    Sub DataBindModifyTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Modify"" class=""tdTextSmall"" onclick=""grid1.modifyTemporaryRecord(this)""/> | <input type=""button"" value=""Remove"" class=""tdTextSmall"" onclick=""grid1.removeTemporaryRecord(this, 'EDIT')""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateCancelTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCancelTempAddedRecordBtnTemplate
    End Sub
    Sub DataBindCancelTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Cancel"" class=""tdTextSmall"" onclick=""grid1.cancel_edit(this, true)""/> | <input type=""button"" value=""Remove"" class=""tdTextSmall"" onclick=""grid1.removeTemporaryRecord(this, 'EDIT')""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateRemoveTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindRemoveTempAddedRecordBtnTemplate
    End Sub
    Sub DataBindRemoveTempAddedRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Remove"" class=""tdTextSmall"" onclick=""grid1.removeTemporaryRecord(this, 'ADD')""/>"
    End Sub
    '------------------------------------------------------------------------
    
    '------------------------------------------------------------------------
    Sub CreateUndeleteTempRecordBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindUndeleteTempRecordBtnTemplate
    End Sub
    Sub DataBindUndeleteTempRecordBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""button"" value=""Undelete"" class=""tdTextSmall"" onclick=""grid1.undeleteTemporaryRecord(this)""/>"
    End Sub
    '------------------------------------------------------------------------
    
	
	Sub BindGrid()	
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
		BindGrid()
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for the Add New/Save/Cancel/Edit/Update/Delete buttons</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>TemplateId</b> and <b>EditTemplateId</b> properties of the <b>Column</b> class to specify the Templates for the Edit/Delete/Update/Cancel buttons.
		    <br /><br />
		    Use the <b>NewRecord_TemplateId</b> and <b>NewRecord_EditTemplateId</b> properties of the <b>Grid</b> class to specify the Templates for the Add New/Save/Cancel buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>