<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    
	void Page_load(object sender, EventArgs e)		
	{
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        
        grid1.FolderStyle = "styles/grand_gray";
        grid1.TemplateSettings.NewRecord_TemplateId = "addTemplate";
        grid1.TemplateSettings.NewRecord_EditTemplateId = "saveTemplate";
        grid1.TemplateSettings.MultiRecordSaveCancel_TemplateId = "multirecord_save_cancel_tpl";
        grid1.AllowMultiRecordAdding = true;
        grid1.AllowMultiRecordEditing = true;
        grid1.AllowMultiRecordDeleting = true;

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);


        // creating the Templates
        
        //------------------------------------------------------------------------
        GridRuntimeTemplate editBtnTemplate = new GridRuntimeTemplate();
        editBtnTemplate.ID = "editBtnTemplate";
        editBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        editBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateEditBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate updateBtnTemplate = new GridRuntimeTemplate();
        updateBtnTemplate.ID = "updateBtnTemplate";
        updateBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        updateBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateUpdateBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate addTemplate = new GridRuntimeTemplate();
        addTemplate.ID = "addTemplate";
        addTemplate.Template = new Obout.Grid.RuntimeTemplate();
        addTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateAddTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate saveTemplate = new GridRuntimeTemplate();
        saveTemplate.ID = "saveTemplate";
        saveTemplate.Template = new Obout.Grid.RuntimeTemplate();
        saveTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateSaveTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate multiRecordSaveCancelTemplate = new GridRuntimeTemplate();
        multiRecordSaveCancelTemplate.ID = "multirecord_save_cancel_tpl";
        multiRecordSaveCancelTemplate.Template = new Obout.Grid.RuntimeTemplate();
        multiRecordSaveCancelTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateMultiRecordSaveCancelTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate modifyTempEditedRecordBtnTemplate = new GridRuntimeTemplate();
        modifyTempEditedRecordBtnTemplate.ID = "modifyTempEditedRecordBtnTemplate";
        modifyTempEditedRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        modifyTempEditedRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateModifyTempEditedRecordBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate cancelTempEditedRecordBtnTemplate = new GridRuntimeTemplate();
        cancelTempEditedRecordBtnTemplate.ID = "cancelTempEditedRecordBtnTemplate";
        cancelTempEditedRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        cancelTempEditedRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCancelTempEditedRecordBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate modifyTempAddedRecordBtnTemplate = new GridRuntimeTemplate();
        modifyTempAddedRecordBtnTemplate.ID = "modifyTempAddedRecordBtnTemplate";
        modifyTempAddedRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        modifyTempAddedRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateModifyTempAddedRecordBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate cancelTempAddedRecordBtnTemplate = new GridRuntimeTemplate();
        cancelTempAddedRecordBtnTemplate.ID = "cancelTempAddedRecordBtnTemplate";
        cancelTempAddedRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        cancelTempAddedRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCancelTempAddedRecordBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate removeTempAddedRecordBtnTemplate = new GridRuntimeTemplate();
        removeTempAddedRecordBtnTemplate.ID = "removeTempAddedRecordBtnTemplate";
        removeTempAddedRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        removeTempAddedRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateRemoveTempAddedRecordBtnTemplate);
        //------------------------------------------------------------------------

        //------------------------------------------------------------------------
        GridRuntimeTemplate undeleteTempRecordBtnTemplate = new GridRuntimeTemplate();
        undeleteTempRecordBtnTemplate.ID = "undeleteTempRecordBtnTemplate";
        undeleteTempRecordBtnTemplate.Template = new Obout.Grid.RuntimeTemplate();
        undeleteTempRecordBtnTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateUndeleteTempRecordBtnTemplate);
        //------------------------------------------------------------------------
        


        // adding the templates to the Templates collection
        grid1.Templates.Add(editBtnTemplate);
        grid1.Templates.Add(updateBtnTemplate);
        grid1.Templates.Add(addTemplate);
        grid1.Templates.Add(saveTemplate);
        grid1.Templates.Add(multiRecordSaveCancelTemplate);
        grid1.Templates.Add(modifyTempEditedRecordBtnTemplate);
        grid1.Templates.Add(cancelTempEditedRecordBtnTemplate);
        grid1.Templates.Add(modifyTempAddedRecordBtnTemplate);
        grid1.Templates.Add(cancelTempAddedRecordBtnTemplate);
        grid1.Templates.Add(removeTempAddedRecordBtnTemplate);
        grid1.Templates.Add(undeleteTempRecordBtnTemplate);
        

        																			
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "60";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";        

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "COMPANY ADDRESS";
        oCol3.Width = "200";        

        Column oCol4 = new Column();
        oCol4.DataField = "City";
        oCol4.HeaderText = "CITY";
        oCol4.Width = "250";        

        Column oCol5 = new Column();
        oCol5.DataField = "Country";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "115";       

        Column oCol6 = new Column();
        oCol6.HeaderText = "EDIT";
        oCol6.Width = "200";
        oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;
        oCol6.TemplateSettings.TemplateId = "editBtnTemplate";
        oCol6.TemplateSettings.EditTemplateId = "updateBtnTemplate";
        oCol6.TemplateSettings.ModifyTemporaryEditedRecord_TemplateId = "modifyTempEditedRecordBtnTemplate";
        oCol6.TemplateSettings.CancelTemporaryEditedRecord_TemplateId = "cancelTempEditedRecordBtnTemplate";
        oCol6.TemplateSettings.ModifyTemporaryAddedRecord_TemplateId = "modifyTempAddedRecordBtnTemplate";
        oCol6.TemplateSettings.CancelTemporaryAddedRecord_TemplateId = "cancelTempAddedRecordBtnTemplate";
        oCol6.TemplateSettings.RemoveTemporaryAddedRecord_TemplateId = "removeTempAddedRecordBtnTemplate";
        oCol6.TemplateSettings.UndeleteTemporaryDeletedRecord_TemplateId = "undeleteTempRecordBtnTemplate";		

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);        
        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
    
    
    // Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
    public void CreateEditBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();	
		e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindEditBtnTemplate);
	}
    protected void DataBindEditBtnTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" class=\"tdTextSmall\" value=\"Edit\" onclick=\"grid1.edit_record(this)\"/> | <input type=\"button\" class=\"tdTextSmall\" value=\"Delete\" onclick=\"grid1.delete_record(this)\"/>";
	}
	//------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateUpdateBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindUpdateBtnTemplate);
    }
    protected void DataBindUpdateBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" value=\"Update\" class=\"tdTextSmall\" onclick=\"grid1.update_record(this)\"/> | <input type=\"button\" value=\"Cancel\" class=\"tdTextSmall\" onclick=\"grid1.cancel_edit(this)\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateAddTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindAddTemplate);
    }
    protected void DataBindAddTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" class=\"tdTextSmall\" value=\"Add New\" onclick=\"grid1.addRecord()\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateSaveTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindSaveTemplate);
    }
    protected void DataBindSaveTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" value=\"Save\" class=\"tdTextSmall\" onclick=\"grid1.insertRecord()\"/> | <input type=\"button\" value=\"Cancel\" class=\"tdTextSmall\" onclick=\"grid1.cancelNewRecord()\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateMultiRecordSaveCancelTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindMultiRecordSaveCancelTemplate);
    }
    protected void DataBindMultiRecordSaveCancelTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" value=\"Save All\" class=\"tdTextSmall\" onclick=\"grid1.saveAll()\"/> | <input type=\"button\" value=\"Cancel All\" class=\"tdTextSmall\" onclick=\"grid1.cancelAll()\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateModifyTempEditedRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindModifyTempEditedRecordBtnTemplate);
    }
    protected void DataBindModifyTempEditedRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" value=\"Modify\" class=\"tdTextSmall\" onclick=\"grid1.modifyTemporaryRecord(this)\"/> | <input type=\"button\" value=\"Delete\" class=\"tdTextSmall\" onclick=\"grid1.delete_record(this)\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateCancelTempEditedRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCancelTempEditedRecordBtnTemplate);
    }
    protected void DataBindCancelTempEditedRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
       
        oLiteral.Text = "<input type=\"button\" value=\"Cancel\" class=\"tdTextSmall\" onclick=\"grid1.cancel_edit(this, true)\"/> | <input type=\"button\" value=\"Delete\" class=\"tdTextSmall\" onclick=\"grid1.delete_record(this)\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateModifyTempAddedRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindModifyTempAddedRecordBtnTemplate);
    }
    protected void DataBindModifyTempAddedRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<input type=\"button\" value=\"Modify\" class=\"tdTextSmall\" onclick=\"grid1.modifyTemporaryRecord(this)\"/> | <input type=\"button\" value=\"Remove\" class=\"tdTextSmall\" onclick=\"grid1.removeTemporaryRecord(this, 'EDIT')\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateCancelTempAddedRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCancelTempAddedRecordBtnTemplate);
    }
    protected void DataBindCancelTempAddedRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<input type=\"button\" value=\"Cancel\" class=\"tdTextSmall\" onclick=\"grid1.cancel_edit(this, true)\"/> | <input type=\"button\" value=\"Remove\" class=\"tdTextSmall\" onclick=\"grid1.removeTemporaryRecord(this, 'EDIT')\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateRemoveTempAddedRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindRemoveTempAddedRecordBtnTemplate);
    }
    protected void DataBindRemoveTempAddedRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"button\" value=\"Remove\" class=\"tdTextSmall\" onclick=\"grid1.removeTemporaryRecord(this, 'ADD')\"/>";
    }
    //------------------------------------------------------------------------

    //------------------------------------------------------------------------
    public void CreateUndeleteTempRecordBtnTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindUndeleteTempRecordBtnTemplate);
    }
    protected void DataBindUndeleteTempRecordBtnTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<input type=\"button\" value=\"Undelete\" class=\"tdTextSmall\" onclick=\"grid1.undeleteTemporaryRecord(this)\"/>";
    }
    //------------------------------------------------------------------------
    
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }
    }
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
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
		<span class="tdText"><b>ASP.NET Grid - Templates for the Add New/Save All/Cancel All/Edit/Modify/Cancel/Delete/Undelete/Remove</b></span>
		<br /><br />			
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				

		<br /><br /><br />
		
		<span class="tdText">
		     Use the <b>TemplateSettings</b> property of the <b>Column</b> class to specify the Templates for the Edit/Modify/Cancel/Delete/Undelete/Remove buttons.
		    <br /><br />
		    Use the <b>NewRecord_TemplateId</b> and <b>MultiRecordSaveCancel_TemplateId</b> properties of the <b>Grid</b> class to specify the Templates for the Add New/Save All/Cancel All buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>