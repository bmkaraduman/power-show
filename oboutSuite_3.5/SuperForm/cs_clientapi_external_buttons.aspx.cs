using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_cs_clientapi_external_buttons : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.Title = "Order Details";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.AllowDataKeysInsert = false;
        SuperForm1.EnableModelValidation = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        SuperForm1.ModeChanged += SuperForm1_ModeChanged;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;
        field1.FieldSetID = "FieldSet1";

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";
        field2.FieldSetID = "FieldSet1";

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCity";
        field3.HeaderText = "Ship City";
        field3.FieldSetID = "FieldSet1";

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipCountry";
        field4.HeaderText = "Ship Country";
        field4.FieldSetID = "FieldSet1";

        Obout.SuperForm.CommandField field5 = new Obout.SuperForm.CommandField();
        field5.ButtonType = ButtonType.Button;
        field5.ShowEditButton = true;
        field5.ShowDeleteButton = true;
        field5.ShowInsertButton = true;
        field5.FieldSetID = "FieldSet2";

        Obout.SuperForm.FieldSetRow fieldSetRow1 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet1 = new Obout.SuperForm.FieldSet();
        fieldSet1.ID = "FieldSet1";
        fieldSetRow1.Items.Add(fieldSet1);

        Obout.SuperForm.FieldSetRow fieldSetRow2 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet2 = new Obout.SuperForm.FieldSet();
        fieldSet2.ID = "FieldSet2";
        fieldSet2.HorizontalAlign = HorizontalAlign.NotSet;
        fieldSet2.CssClass = "hidden-buttons";
        fieldSetRow2.Items.Add(fieldSet2);

        SuperForm1.FieldSets.Add(fieldSetRow1);
        SuperForm1.FieldSets.Add(fieldSetRow2);

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);


        SuperForm1Container.Controls.Add(SuperForm1);
        
        if (!IsPostBack)
        {
            UpdateButtonsState();
        }
    }

    protected void SuperForm1_ModeChanged(object sender, EventArgs e)
    {
        UpdateButtonsState();
    }

    protected void UpdateButtonsState()
    {
        bool showEdit = false;
        bool showDelete = false;
        bool showNew = false;
        bool showUpdate = false;
        bool showInsert = false;
        bool showCancel = false;

        if (SuperForm1.CurrentMode == DetailsViewMode.ReadOnly)
        {
            showEdit = true;
            showDelete = true;
            showNew = true;
        }
        else if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            showUpdate = true;
            showCancel = true;
        }
        else
        {
            showInsert = true;
            showCancel = true;
        }

        ExternalEdit.Visible = showEdit;
        ExternalDelete.Visible = showDelete;
        ExternalNew.Visible = showNew;
        ExternalUpdate.Visible = showUpdate;
        ExternalInsert.Visible = showInsert;
        ExternalCancel.Visible = showCancel;
    }
}
