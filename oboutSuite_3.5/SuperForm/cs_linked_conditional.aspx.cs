using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;

public partial class SuperForm_cs_linked_conditional : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1"; 
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.DefaultMode = DetailsViewMode.Insert;
        SuperForm1.ItemInserting += SuperForm1_Inserting;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "FirstName";
        field1.HeaderText = "First Name";

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "LastName";
        field2.HeaderText = "Last Name";

        Obout.SuperForm.DropDownListField field3 = new Obout.SuperForm.DropDownListField();
        field3.DataField = "CountryID";
        field3.HeaderText = "Country";
        field3.Required = true;
        field3.DataSourceID = "CountriesDataSource";
        field3.DataValueField = "CountryID";
        field3.DataTextField = "CountryName";
        field3.Default = "219";
        field3.FieldsToEnable = "StateID";
        field3.EnablingValues = "219";
        field3.FieldsToDisable = "Province";
        field3.DisablingValues = "219";

        Obout.SuperForm.DropDownListField field4 = new Obout.SuperForm.DropDownListField();
        field4.DataField = "StateID";
        field4.HeaderText = "State / Province";
        field4.Required = true;
        field4.DataSourceID = "StatesDataSource";
        field4.DataValueField = "State";
        field4.DataTextField = "State";

        Obout.SuperForm.BoundField field5 = new Obout.SuperForm.BoundField();
        field5.DataField = "Province";

        Obout.SuperForm.CommandField field6 = new Obout.SuperForm.CommandField();
        field6.ShowInsertButton = true;
        field6.ShowCancelButton = false;
        field6.ButtonType = ButtonType.Button;
        field6.ItemStyle.HorizontalAlign = HorizontalAlign.Center;

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);

        SuperForm1Container.Controls.Add(SuperForm1);
    }
    protected void SuperForm1_Inserting(object sender, DetailsViewInsertEventArgs e)
    {
        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }
}
