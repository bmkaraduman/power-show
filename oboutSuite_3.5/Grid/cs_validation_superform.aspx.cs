using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.Interface;
using Obout.Grid;

public partial class Grid_cs_validation_superform : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    private Grid grid1;
    protected void Page_Load(object sender, EventArgs e)
    {
        grid1 = new Grid();
        grid1.ID = "Grid1";
        grid1.Serialize = false;
        grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "SqlDataSource1";

        grid1.ClientSideEvents.OnBeforeClientUpdate = "Grid1_BeforeUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "Grid1_BeforeInsert";
        grid1.ClientSideEvents.OnClientEdit = "validate";

        // creating the Templates
       
        //------------------------------------------------------------------------
        GridRuntimeTemplate tplRowEdit = new GridRuntimeTemplate();
        tplRowEdit.ID = "tplRowEdit";
        tplRowEdit.Template = new Obout.Grid.RuntimeTemplate();
        tplRowEdit.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreatetplRowEdit);
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(tplRowEdit);

         
        // creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
        oCol1.Visible = false;
		oCol1.HeaderText = "ID";
		oCol1.Width = "150";
        oCol1.TemplateSettings.RowEditTemplateControlId = "OrderID";
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "value";

		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";
		oCol2.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipName";
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value";

	
		Column oCol3 = new Column();
		oCol3.DataField = "ShipAddress";
		oCol3.HeaderText = "ADDRESS";
        oCol3.Visible = false;
		oCol3.Width = "125";
        oCol3.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipAddress";
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol4 = new Column();
		oCol4.DataField = "ShipCity";
		oCol4.HeaderText = "CITY";
		oCol4.Width = "150";
        oCol4.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCity";
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value";

        Column oCol5 = new Column();
		oCol5.DataField = "ShipRegion";
		oCol5.HeaderText = "REGION";
        oCol5.Visible = false;
		oCol5.Width = "150";
        oCol5.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipRegion";
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value";
  
        Column oCol6 = new Column();
		oCol6.DataField = "ShipPostalCode";
		oCol6.HeaderText = "POSTAL CODE";
		oCol6.Width = "150";
        oCol6.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipPostalCode";
        oCol6.TemplateSettings.RowEditTemplateControlPropertyName = "value";
  
        Column oCol7 = new Column();
		oCol7.DataField = "ShipCountry";
		oCol7.HeaderText = "COUNTRY";
		oCol7.Width = "125";
        oCol7.Wrap = false;
        oCol7.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCountry";
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value";
  
        Column oCol8 = new Column();
		oCol8.DataField = "OrderDate";
		oCol8.HeaderText = "ORDER DATE";
		oCol8.Width = "125";
        oCol8.DataFormatString = "{0:MM/dd/yyyy}";
        oCol8.ApplyFormatInEditMode = true;
        oCol8.TemplateSettings.RowEditTemplateControlId = "SuperForm1_OrderDate";
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value";
  
        Column oCol9 = new Column();
		oCol9.DataField = "RequiredDate";
		oCol9.HeaderText = "REQUIRED DATE";
		oCol9.Width = "200";
        oCol9.Visible = false;
        oCol9.DataFormatString = "{0:MM/dd/yyyy}";
        oCol9.ApplyFormatInEditMode = true;
        oCol9.TemplateSettings.RowEditTemplateControlId = "SuperForm1_RequiredDate";
        oCol9.TemplateSettings.RowEditTemplateControlPropertyName = "value";
  
        Column oCol10 = new Column();
		oCol10.DataField = "ShippedDate";
		oCol10.HeaderText = "SHIPPED DATE";
		oCol10.Width = "200";
        oCol10.Visible = false;
        oCol10.DataFormatString = "{0:MM/dd/yyyy}";
        oCol10.ApplyFormatInEditMode = true;
        oCol10.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShippedDate";
        oCol10.TemplateSettings.RowEditTemplateControlPropertyName = "value";
                         
        Column oCol11 = new Column();
		oCol11.DataField = "ShipVia";
		oCol11.HeaderText = "SHIP VIA";
		oCol11.Width = "200";
        oCol11.Visible = false;
        oCol11.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipVia";
        oCol11.TemplateSettings.RowEditTemplateControlPropertyName = "value";
                    
        Column oCol12 = new Column();
		oCol12.DataField = "Sent";
		oCol12.HeaderText = "SENT";
		oCol12.Width = "175";
        oCol12.Visible = false;
        oCol12.TemplateSettings.RowEditTemplateControlId = "SuperForm1_Sent";
        oCol12.TemplateSettings.RowEditTemplateControlPropertyName = "checked";
                    
        Column oCol13 = new Column();
		oCol13.DataField = "AdditionalInformation";
		oCol13.HeaderText = "ADDITIONAL INFORMATION";
		oCol13.Width = "200";
        oCol13.Visible = false;
        oCol13.TemplateSettings.RowEditTemplateControlId = "SuperForm1_AdditionalInformation";
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value";
                                  
        Column oCol14 = new Column();
		oCol14.HeaderText = "EDIT";
		oCol14.Width = "150";
        oCol14.AllowEdit = true;
        oCol14.AllowDelete = true;

        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
        grid1.Columns.Add(oCol8);
        grid1.Columns.Add(oCol9);
        grid1.Columns.Add(oCol10);
        grid1.Columns.Add(oCol11);
        grid1.Columns.Add(oCol12);
        grid1.Columns.Add(oCol13);
        grid1.Columns.Add(oCol14);

        // add the grid to the controls collection of the PlaceHolder
        Grid1Container.Controls.Add(grid1);
    }

    public void CreatetplRowEdit(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);
	
        Literal inputText = new Literal();
        inputText.Text = "<input type=\"hidden\" id=\"OrderID\" />";
       
        ValidationSummary validateGroup1 = new ValidationSummary();
        validateGroup1.ID = "ValidationSummary1";
        validateGroup1.ValidationGroup = "Group1";

        ph1.Controls.Add(inputText);
        ph1.Controls.Add(validateGroup1);

        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = false;
        SuperForm1.AutoGenerateEditButton = false;
        SuperForm1.AutoGenerateDeleteButton = false;
        SuperForm1.ValidationGroup = "Group1";
        SuperForm1.Width = Unit.Percentage(99);
        SuperForm1.DataKeyNames = new string[] { "Order ID" };
        SuperForm1.DefaultMode = DetailsViewMode.Insert;

        RequiredFieldValidator requiredFieldValidator1 = new RequiredFieldValidator();
        requiredFieldValidator1.ID = "RequiredFieldValidator1";
        requiredFieldValidator1.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator1.ErrorMessage = "Ship Name is mandatory";
        requiredFieldValidator1.Text = "*";
        requiredFieldValidator1.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator2 = new RequiredFieldValidator();
        requiredFieldValidator2.ID = "RequiredFieldValidator2";
        requiredFieldValidator2.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator2.ErrorMessage = "Ship Address is mandatory";
        requiredFieldValidator2.Text = "*";
        requiredFieldValidator2.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator3 = new RequiredFieldValidator();
        requiredFieldValidator3.ID = "RequiredFieldValidator3";
        requiredFieldValidator3.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator3.ErrorMessage = "Ship City is mandatory";
        requiredFieldValidator3.Text = "*";
        requiredFieldValidator3.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator4 = new RequiredFieldValidator();
        requiredFieldValidator4.ID = "RequiredFieldValidator4";
        requiredFieldValidator4.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator4.ErrorMessage = "Ship Country is mandatory";
        requiredFieldValidator4.Text = "*";
        requiredFieldValidator4.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator5 = new RequiredFieldValidator();
        requiredFieldValidator5.ID = "RequiredFieldValidator5";
        requiredFieldValidator5.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator5.ErrorMessage = "Order Date is mandatory";
        requiredFieldValidator5.Text = "*";
        requiredFieldValidator5.ValidationGroup = "Group1";

        RangeValidator rangeValidator1 = new RangeValidator();
        rangeValidator1.ID="RangeValidator1";
        rangeValidator1.Display = ValidatorDisplay.Dynamic; 
        rangeValidator1.MinimumValue = "1900/1/1";
        rangeValidator1.MaximumValue = "2039/12/31";
        rangeValidator1.Type = ValidationDataType.Date;
        rangeValidator1.ErrorMessage = "Order Date needs to be in this format: mm/dd/yyyy";
        rangeValidator1.Text = "*";
        rangeValidator1.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator6 = new RequiredFieldValidator();
        requiredFieldValidator6.ID = "RequiredFieldValidator6";
        requiredFieldValidator6.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator6.ErrorMessage = "Required Date is mandatory";
        requiredFieldValidator6.Text = "*";
        requiredFieldValidator6.ValidationGroup = "Group1";

        RangeValidator rangeValidator2 = new RangeValidator();
        rangeValidator2.ID="RangeValidator2";
        rangeValidator2.Display = ValidatorDisplay.Dynamic; 
        rangeValidator2.MinimumValue = "1900/1/1";
        rangeValidator2.MaximumValue = "2039/12/31";
        rangeValidator2.Type = ValidationDataType.Date;
        rangeValidator2.ErrorMessage = "Required Date needs to be in this format: mm/dd/yyyy";
        rangeValidator2.Text = "*";
        rangeValidator2.ValidationGroup = "Group1";

        RequiredFieldValidator requiredFieldValidator7 = new RequiredFieldValidator();
        requiredFieldValidator7.ID = "RequiredFieldValidator7";
        requiredFieldValidator7.Display = ValidatorDisplay.Dynamic;
        requiredFieldValidator7.ErrorMessage = "Shipped Date is mandatory";
        requiredFieldValidator7.Text = "*";
        requiredFieldValidator7.ValidationGroup = "Group1";

        RangeValidator rangeValidator3 = new RangeValidator();
        rangeValidator3.ID = "RangeValidator3";
        rangeValidator3.Display = ValidatorDisplay.Dynamic;
        rangeValidator3.MinimumValue = "1900/1/1";
        rangeValidator3.MaximumValue = "2039/12/31";
        rangeValidator3.Type = ValidationDataType.Date;
        rangeValidator3.ErrorMessage = "Shipped Date needs to be in this format: mm/dd/yyyy";
        rangeValidator3.Text = "*";
        rangeValidator3.ValidationGroup = "Group1";
        
        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "ShipName";
        field1.HeaderText = "Ship Name";
        field1.FieldSetID = "FieldSet1";
        field1.Validators.Add(requiredFieldValidator1);

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipAddress";
        field2.HeaderText = "Ship Address";
        field2.FieldSetID = "FieldSet1";
        field2.Validators.Add(requiredFieldValidator2);

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCity";
        field3.HeaderText = "Ship City";
        field3.FieldSetID = "FieldSet1";
        field3.Validators.Add(requiredFieldValidator3);
      
        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipRegion";
        field4.HeaderText = "Ship Region";
        field4.FieldSetID = "FieldSet1";

        Obout.SuperForm.BoundField field5 = new Obout.SuperForm.BoundField();
        field5.DataField = "ShipPostalCode";
        field5.HeaderText = "Zip Cod";
        field5.FieldSetID = "FieldSet1";

        Obout.SuperForm.DropDownListField field6 = new Obout.SuperForm.DropDownListField();
        field6.DataField = "ShipCountry";
        field6.HeaderText = "Ship Country";
        field6.FieldSetID = "FieldSet1";
        field6.DataSourceID = "SqlDataSource3";
        field6.Validators.Add(requiredFieldValidator4);

        Obout.SuperForm.DateField field7 = new Obout.SuperForm.DateField();
        field7.DataField = "OrderDate";
        field7.HeaderText = "Order Date";
        field7.FieldSetID = "FieldSet2";
        field7.DataFormatString = "{0:MM/dd/yyyy}";
        field7.ApplyFormatInEditMode = true;
        field7.Validators.Add(requiredFieldValidator5);
        field7.Validators.Add(rangeValidator1);

        Obout.SuperForm.DateField field8 = new Obout.SuperForm.DateField();
        field8.DataField = "RequiredDate";
        field8.HeaderText = "Required Date";
        field8.FieldSetID = "FieldSet2";
        field8.DataFormatString = "{0:MM/dd/yyyy}";
        field8.ApplyFormatInEditMode = true;
        field8.Validators.Add(requiredFieldValidator6);
        field8.Validators.Add(rangeValidator2);

        Obout.SuperForm.DateField field9 = new Obout.SuperForm.DateField();
        field9.DataField = "ShippedDate";
        field9.HeaderText = "Shipped Date";
        field9.FieldSetID = "FieldSet2";
        field9.DataFormatString = "{0:MM/dd/yyyy}";
        field9.ApplyFormatInEditMode = true;
        field9.Validators.Add(requiredFieldValidator7);
        field9.Validators.Add(rangeValidator3);

        Obout.SuperForm.BoundField field10 = new Obout.SuperForm.BoundField();
        field10.DataField = "ShipVia";
        field10.HeaderText = "Ship Via";
        field10.FieldSetID = "FieldSet2";

        Obout.SuperForm.CheckBoxField field11 = new Obout.SuperForm.CheckBoxField();
        field11.DataField = "Sent";
        field11.HeaderText = "Sent";
        field11.FieldSetID = "FieldSet2";

        Obout.SuperForm.MultiLineField field12 = new Obout.SuperForm.MultiLineField();
        field12.DataField = "AdditionalInformation";
        field12.HeaderText = "";
        field12.FieldSetID = "FieldSet3";
        field12.HeaderStyle.Width = 1;

        Obout.SuperForm.TemplateField field13 = new Obout.SuperForm.TemplateField();
        field13.FieldSetID = "FieldSet4";
        field13.EditItemTemplate = new btnUpdateEditItemTemplate();
        
        Obout.SuperForm.FieldSetRow fieldSetRow1 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet1 = new Obout.SuperForm.FieldSet();
        fieldSet1.ID = "FieldSet1";
        fieldSet1.Title = "Ship Information";
        fieldSetRow1.Items.Add(fieldSet1);

        Obout.SuperForm.FieldSet fieldSet2 = new Obout.SuperForm.FieldSet();
        fieldSet2.ID = "FieldSet2";
        fieldSet2.Title = "Order Information";
        fieldSetRow1.Items.Add(fieldSet2);

        Obout.SuperForm.FieldSet fieldSet3 = new Obout.SuperForm.FieldSet();
        fieldSet3.ID = "FieldSet3";
        fieldSet3.Title = "Additional Information";
        fieldSetRow1.Items.Add(fieldSet3);

        Obout.SuperForm.FieldSetRow fieldSetRow2 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet4 = new Obout.SuperForm.FieldSet();
        fieldSet4.ID = "FieldSet4";
        fieldSet4.ColumnSpan = 3;
        fieldSet4.CssClass = "command-row";
        fieldSetRow2.Items.Add(fieldSet4);
       
        SuperForm1.FieldSets.Add(fieldSetRow1);
        SuperForm1.FieldSets.Add(fieldSetRow2);
       
        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);
        SuperForm1.Fields.Add(field8);
        SuperForm1.Fields.Add(field9);
        SuperForm1.Fields.Add(field10);
        SuperForm1.Fields.Add(field11);
        SuperForm1.Fields.Add(field12);
        SuperForm1.Fields.Add(field13);

        
        ph1.Controls.Add(SuperForm1);

    }

    public class btnUpdateEditItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Obout.Interface.OboutButton btnUpdate = new Obout.Interface.OboutButton();
            btnUpdate.ID = "BtnUpdate";
            btnUpdate.Text = "Save";
            btnUpdate.OnClientClick = "if(Page_ClientValidate() == true){Grid1.save();} return false;";
            btnUpdate.Width = 75;

            Obout.Interface.OboutButton btnCancele = new Obout.Interface.OboutButton();
            btnCancele.ID = "BtnCancel";
            btnCancele.Text="Cancel";
            btnCancele.OnClientClick = "Grid1.cancel(); return false;";
            btnCancele.Width = 75;

            templatePlaceHolder.Controls.Add(btnUpdate);
            templatePlaceHolder.Controls.Add(btnCancele);
        }
    }

}
