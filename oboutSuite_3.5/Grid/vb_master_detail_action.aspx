<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script type="text/VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.DetailGrid = New DetailGrid()
    Dim grid3 As Obout.Grid.DetailGrid = New DetailGrid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        ' Creating grid1
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = true
        grid1.DataSourceID = "sds1"
        grid1.PageSize = 5
        
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf EmptyCommand
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf EmptyCommand
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf EmptyCommand
        
        grid1.ClientSideEvents.OnClientInsert = "onEmptyCommand"
        grid1.ClientSideEvents.OnClientUpdate = "onEmptyCommand"
        grid1.ClientSideEvents.OnClientDelete = "onEmptyCommand"

        
        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback
        
        
        grid1.TemplateSettings.NewRecord_TemplateId = "addTemplate1"
        grid1.TemplateSettings.NewRecord_EditTemplateId = "saveTemplate1"
        
        Dim editBtnTemplate1 As Obout.Grid.GridRuntimeTemplate
        editBtnTemplate1 = New GridRuntimeTemplate()
        editBtnTemplate1.ID = "editBtnTemplate1"
        editBtnTemplate1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(editBtnTemplate1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditBtnTemplate
        
        Dim updateBtnTemplate1 As Obout.Grid.GridRuntimeTemplate
        updateBtnTemplate1 = New GridRuntimeTemplate()
        updateBtnTemplate1.ID = "updateBtnTemplate1"
        updateBtnTemplate1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(updateBtnTemplate1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateUpdateBtnTemplate
        
        Dim addTemplate1 As Obout.Grid.GridRuntimeTemplate
        addTemplate1 = New GridRuntimeTemplate()
        addTemplate1.ID = "addTemplate1"
        addTemplate1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(addTemplate1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAddTemplate
        
        Dim saveTemplate1 As Obout.Grid.GridRuntimeTemplate
        saveTemplate1 = New GridRuntimeTemplate()
        saveTemplate1.ID = "saveTemplate1"
        saveTemplate1.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(saveTemplate1.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateSaveTemplate
        
        grid1.Templates.Add(editBtnTemplate1)
        grid1.Templates.Add(updateBtnTemplate1)
        grid1.Templates.Add(addTemplate1)
        grid1.Templates.Add(saveTemplate1)

        
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "CustomerID"
        oCol1.HeaderText = "CUSTOMER ID"
        oCol1.Visible = false

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = ""
        oCol5.HeaderText = ""
        oCol5.AllowEdit = true
        oCol5.AllowDelete = true
        oCol5.TemplateSettings.TemplateId = "editBtnTemplate1"
        oCol5.TemplateSettings.EditTemplateId = "updateBtnTemplate1"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        
        
        ' Creating grid2
        grid2.ID = "grid2"
        grid2.CallbackMode = true
        grid2.Serialize = false
        grid2.AutoGenerateColumns = false
        grid2.FolderStyle = "styles/grand_gray"
        grid2.AllowAddingRecords = true
        grid2.PageSize = 5
        grid2.DataSourceID = "sds2"
        grid2.ForeignKeys = "CustomerID"

        AddHandler CType(grid2, Grid).InsertCommand, AddressOf EmptyCommand
        AddHandler CType(grid2, Grid).DeleteCommand, AddressOf EmptyCommand
        AddHandler CType(grid2, Grid).UpdateCommand, AddressOf EmptyCommand

        grid2.ClientSideEvents.OnClientInsert = "onEmptyCommand"
        grid2.ClientSideEvents.OnClientUpdate = "onEmptyCommand"
        grid2.ClientSideEvents.OnClientDelete = "onEmptyCommand"
        

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback


        grid2.TemplateSettings.NewRecord_TemplateId = "addTemplate2"
        grid2.TemplateSettings.NewRecord_EditTemplateId = "saveTemplate2"

        Dim editBtnTemplate2 As Obout.Grid.GridRuntimeTemplate
        editBtnTemplate2 = New GridRuntimeTemplate()
        editBtnTemplate2.ID = "editBtnTemplate2"
        editBtnTemplate2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(editBtnTemplate2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateEditBtnTemplate
        
        Dim updateBtnTemplate2 As Obout.Grid.GridRuntimeTemplate
        updateBtnTemplate2 = New GridRuntimeTemplate()
        updateBtnTemplate2.ID = "updateBtnTemplate2"
        updateBtnTemplate2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(updateBtnTemplate2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateUpdateBtnTemplate
        
        Dim addTemplate2 As Obout.Grid.GridRuntimeTemplate
        addTemplate2 = New GridRuntimeTemplate()
        addTemplate2.ID = "addTemplate2"
        addTemplate2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(addTemplate2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAddTemplate
        
        Dim saveTemplate2 As Obout.Grid.GridRuntimeTemplate
        saveTemplate2 = New GridRuntimeTemplate()
        saveTemplate2.ID = "saveTemplate2"
        saveTemplate2.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(saveTemplate2.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateSaveTemplate

        grid2.Templates.Add(editBtnTemplate2)
        grid2.Templates.Add(updateBtnTemplate2)
        grid2.Templates.Add(addTemplate2)
        grid2.Templates.Add(saveTemplate2)
        
  
        ' creating the columns
        Dim oCol2_1 As Column = New Column()
        oCol2_1.DataField = "CustomerID"        
        oCol2_1.HeaderText = "CUSTOMER ID"
        oCol2_1.Visible = false
        oCol2_1.ReadOnly = true

        Dim oCol2_2 As Column = New Column()
        oCol2_2.DataField = "OrderID"
        oCol2_2.HeaderText = "ORDER ID"
        oCol2_2.Visible = false
        oCol2_2.ReadOnly = true

        Dim oCol2_3 As Column = New Column()
        oCol2_3.DataField = "OrderDate"
        oCol2_3.HeaderText = "ORDER DATE"
        oCol2_3.Width = "225"
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_4 As Column = New Column()
        oCol2_4.DataField = "ShippedDate"
        oCol2_4.HeaderText = "SHIPPED DATE"
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}"

        Dim oCol2_5 As Column = New Column()
        oCol2_5.DataField = "Freight"
        oCol2_5.HeaderText = "FREIGHT"
        oCol2_5.DataFormatString = "{0:C2}"
        
        Dim oCol2_6 As Column = New Column()
        oCol2_6.DataField = ""
        oCol2_6.HeaderText = ""
        oCol2_6.AllowEdit = true
        oCol2_6.AllowDelete = true
        oCol2_6.Width = "170"
        oCol2_6.TemplateSettings.TemplateId = "editBtnTemplate2"
        oCol2_6.TemplateSettings.EditTemplateId = "updateBtnTemplate2"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_1)
        grid2.Columns.Add(oCol2_2)
        grid2.Columns.Add(oCol2_3)
        grid2.Columns.Add(oCol2_4)
        grid2.Columns.Add(oCol2_5)
        grid2.Columns.Add(oCol2_6)


        
        grid1.DetailGrids.Add(grid2)



        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
    
    Sub CreateEditBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindEditBtnTemplate
    End Sub
    Sub DataBindEditBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type='button' id='btnEdit' class='tdTextSmall' value='Edit' onclick='" + oContainer.GridClientID + ".edit_record(this)'/> | <input type='button' id='btnDelete' class='tdTextSmall' value='Delete' onclick='" + oContainer.GridClientID + ".delete_record(this)'/>"
    End Sub
    
    Sub CreateUpdateBtnTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindUpdateBtnTemplate
    End Sub
    Sub DataBindUpdateBtnTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type='button' id='btnUpdate' value='Update' class='tdTextSmall' onclick='" + oContainer.GridClientID + ".update_record(this)'/> | <input type='button' id='btnCancel' value='Cancel' class='tdTextSmall' onclick='" + oContainer.GridClientID + ".cancel_edit(this)'/>"
    End Sub
    
    Sub CreateAddTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindAddTemplate
    End Sub
    Sub DataBindAddTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type='button' id='btnAddNew' class='tdTextSmall' value='Add New' onclick='" + oContainer.GridClientID + ".addRecord()'/>"
    End Sub
    
    Sub CreateSaveTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindSaveTemplate
    End Sub
    Sub DataBindSaveTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type='button' id='btnSave' value='Save' class='tdTextSmall' onclick='" + oContainer.GridClientID + ".insertRecord()'/> | <input type='button' id='btnCancel' value='Cancel' class='tdTextSmall' onclick='" + oContainer.GridClientID + ".cancelNewRecord()'/>"
    End Sub
    
    
    Sub EmptyCommand(ByVal sender As Object, ByVal e As GridRecordEventArgs)
    End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>
		<script type="text/javascript">
		    function onEmptyCommand(record) {
		        alert('The operation was successful. For this example, the database has not been updated.');
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Using Templates for Action Buttons inside Detail Grids</b></span>		
		
		<br /><br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br /><br />				
		
		<span class="tdText">
		    The DetailGrids can use all the features that are available for regular grids (e.g. adding, editing, deleting, sorting, paging, etc.)
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT TOP 15 * FROM [Customers]">		    
		 </asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>