using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.Interface;
//using AjaxControlToolkit;

public partial class SuperForm_cs_firstlook_checkout : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.Width = Unit.Pixel(630);
        SuperForm1.Title = "Payment Information";
        SuperForm1.FolderStyle = "styles/black_glass";
       
        SuperForm1.DefaultMode = DetailsViewMode.Insert;
        SuperForm1.ItemInserting += SuperForm1_Inserting;
        SuperForm1.DataBound += SuperForm1_DataBound;
        
        Obout.SuperForm.BoundField field5 = new Obout.SuperForm.BoundField();
        field5.DataField = "CardNumber";
        field5.HeaderText = "Card Number";
        field5.FieldSetID = "FieldSet2";
        field5.Required = true;
        field5.ControlStyle.Width = Unit.Pixel(150);

        /*MaskedEditExtender extender1 = new MaskedEditExtender();
        extender1.ID = "MaskedEditExtender1";
        extender1.Mask = "9999-9999-9999-9999";
        extender1.MessageValidatorTip = true;
        extender1.MaskType = MaskedEditType.Number;
        field5.Masks.Add(extender1);*/

        Obout.SuperForm.DropDownListField field6 = new Obout.SuperForm.DropDownListField();
        field6.DataField = "ExpirationYear";
        field6.HeaderText = "Expiration Year";
        field6.FieldSetID = "FieldSet2";
        field6.ControlStyle.Width = 93;
        field6.Required = true;

        Obout.SuperForm.DropDownListField field7 = new Obout.SuperForm.DropDownListField();
        field7.DataField = "ExpirationMonth";
        field7.HeaderText = "ExpirationMonth";
        field7.FieldSetID = "FieldSet2";
        field7.ControlStyle.Width = 117;
        field7.Required = true;

        Obout.SuperForm.BoundField field8 = new Obout.SuperForm.BoundField();
        field8.DataField = "CIN";
        field8.HeaderText = "Security Code";
        field8.FieldSetID = "FieldSet2";
        field8.ControlStyle.Width = 83;
        field8.Required = true;
        field8.MaxLength = 3;

        /*FilteredTextBoxExtender numbers = new FilteredTextBoxExtender();
        numbers.FilterType = FilterTypes.Numbers;
        field8.Filters.Add(numbers);*/

        Obout.SuperForm.TemplateField dummyField = new Obout.SuperForm.TemplateField();
        dummyField.FieldSetID = "FieldSet3";
        dummyField.ItemTemplate = new DummyItemTemplate();
        dummyField.ItemStyle.Width = 150;

        Obout.SuperForm.CheckBoxField field4 = new Obout.SuperForm.CheckBoxField();
        field4.DataField = "SameAsBilling";
        field4.FieldSetID = "FieldSet4";
        field4.Text = "Same as the billing";
        field4.FieldsToDisable = "UserCompanyName";
        field4.FieldsToDisable = "UserCompanyName,UserFirstName,UserLastName,UserEmailAddress,UserAddress,UserCountryID,UserStateID,UserProvince,UserZip,UserVatID,UserPhone,UserFax";
        field4.ItemStyle.Width = 150;

        Obout.SuperForm.BoundField field9 = new Obout.SuperForm.BoundField();
        field9.DataField = "BillingCompanyName";
        field9.HeaderText = "Company Name";
        field9.FieldSetID = "FieldSet3";

        Obout.SuperForm.BoundField field10 = new Obout.SuperForm.BoundField();
        field10.DataField = "BillingFirstName";
        field10.HeaderText = "First Name";
        field10.FieldSetID = "FieldSet3";
        field10.Required = true;

        Obout.SuperForm.BoundField field11 = new Obout.SuperForm.BoundField();
        field11.DataField = "BillingLastName";
        field11.HeaderText = "Last Name";
        field11.FieldSetID = "FieldSet3";
        field11.Required = true;

        Obout.SuperForm.BoundField field12 = new Obout.SuperForm.BoundField();
        field12.DataField = "BillingEmailAddress";
        field12.HeaderText = "Email Address";
        field12.FieldSetID = "FieldSet3";
        field12.Required = true;

        Obout.SuperForm.MultiLineField field13 = new Obout.SuperForm.MultiLineField();
        field13.DataField = "BillingAddress";
        field13.HeaderText = "Address";
        field13.FieldSetID = "FieldSet3";
        field13.Required = true;

        Obout.SuperForm.DropDownListField field14 = new Obout.SuperForm.DropDownListField();
        field14.DataField = "BillingCountryID";
        field14.HeaderText = "Country";
        field14.FieldSetID = "FieldSet3";
        field14.Required = true;
        field14.DataSourceID = "CountriesDataSource";
        field14.DataValueField = "CountryID";
        field14.DataTextField = "CountryName";
        field14.Default = "219";
        field14.FieldsToEnable = "BillingStateID";
        field14.EnablingValues = "219";
        field14.FieldsToDisable = "BillingProvince";
        field14.DisablingValues = "219";

        Obout.SuperForm.DropDownListField field15 = new Obout.SuperForm.DropDownListField();
        field15.DataField = "BillingStateID";
        field15.HeaderText = "State";
        field15.FieldSetID = "FieldSet3";
        field15.Required = true;
        field15.DataSourceID = "StatesDataSource";
        field15.DataValueField = "State";
        field15.DataTextField = "State";

        Obout.SuperForm.BoundField field16 = new Obout.SuperForm.BoundField();
        field16.DataField = "BillingProvince";
        field16.FieldSetID = "FieldSet3";

        Obout.SuperForm.BoundField field17 = new Obout.SuperForm.BoundField();
        field17.DataField = "BillingZip";
        field17.HeaderText = "Zip Code / Postal Code";
        field17.FieldSetID = "FieldSet3";
        
        Obout.SuperForm.BoundField field18 = new Obout.SuperForm.BoundField();
        field18.DataField = "BillingVatID";
        field18.HeaderText = "VAT Exemption ID";
        field18.FieldSetID = "FieldSet3";

        Obout.SuperForm.BoundField field19 = new Obout.SuperForm.BoundField();
        field19.DataField = "BillingPhone";
        field19.HeaderText = "Phone";
        field19.FieldSetID = "FieldSet3";

        /*MaskedEditExtender extender2 = new MaskedEditExtender();
        extender2.ID = "MaskedEditExtender2";
        extender2.Mask = "(999)999-9999";
        extender2.MaskType = MaskedEditType.Number;
        field19.Masks.Add(extender2);*/

        Obout.SuperForm.BoundField field20 = new Obout.SuperForm.BoundField();
        field20.DataField = "BillingFax";
        field20.HeaderText = "Fax";
        field20.FieldSetID = "FieldSet3";

        /*MaskedEditExtender extender3 = new MaskedEditExtender();
        extender3.ID = "MaskedEditExtender3";
        extender3.Mask = "(999)999-9999";
        extender3.MaskType = MaskedEditType.Number;
        field20.Masks.Add(extender3);*/

        Obout.SuperForm.BoundField field21 = new Obout.SuperForm.BoundField();
        field21.DataField = "UserCompanyName";
        field21.HeaderText = "Company Name";
        field21.FieldSetID = "FieldSet4";

        Obout.SuperForm.BoundField field22 = new Obout.SuperForm.BoundField();
        field22.DataField = "UserFirstName";
        field22.HeaderText = "First Name";
        field22.FieldSetID = "FieldSet4";

        Obout.SuperForm.BoundField field23 = new Obout.SuperForm.BoundField();
        field23.DataField = "UserLastName";
        field23.HeaderText = "Last Name";
        field23.FieldSetID = "FieldSet4";

        Obout.SuperForm.BoundField field24 = new Obout.SuperForm.BoundField();
        field24.DataField = "UserEmailAddress";
        field24.HeaderText = "Email Address";
        field24.FieldSetID = "FieldSet4";

        Obout.SuperForm.MultiLineField field25 = new Obout.SuperForm.MultiLineField();
        field25.DataField = "UserAddress";
        field25.HeaderText = "Address";
        field25.FieldSetID = "FieldSet4";

        Obout.SuperForm.DropDownListField field26 = new Obout.SuperForm.DropDownListField();
        field26.DataField = "UserCountryID";
        field26.HeaderText = "Country";
        field26.FieldSetID = "FieldSet4";
        
        field26.DataSourceID = "CountriesDataSource";
        field26.DataValueField = "CountryID";
        field26.DataTextField = "CountryName";
        field26.Default = "219";
        field26.FieldsToEnable = "UserStateID";
        field26.EnablingValues = "219";
        field26.FieldsToDisable = "UserProvince";
        field26.DisablingValues = "219";

        Obout.SuperForm.DropDownListField field27 = new Obout.SuperForm.DropDownListField();
        field27.DataField = "UserStateID";
        field27.HeaderText = "State";
        field27.FieldSetID = "FieldSet4";
        
        field27.DataSourceID = "StatesDataSource";
        field27.DataValueField = "State";
        field27.DataTextField = "State";


        Obout.SuperForm.BoundField field28 = new Obout.SuperForm.BoundField();
        field28.DataField = "UserProvince";
        field28.FieldSetID = "FieldSet4";

        Obout.SuperForm.BoundField field29 = new Obout.SuperForm.BoundField();
        field29.DataField = "UserZip";
        field29.FieldSetID = "FieldSet4";
        field29.HeaderText = "Zip Code / Postal Code";

        Obout.SuperForm.BoundField field30 = new Obout.SuperForm.BoundField();
        field30.DataField = "UserVatID";
        field30.FieldSetID = "FieldSet4";
        field30.HeaderText = "VAT Exemption ID";

        Obout.SuperForm.BoundField field31 = new Obout.SuperForm.BoundField();
        field31.DataField = "UserPhone";
        field31.FieldSetID = "FieldSet4";
        field31.HeaderText = "Phone";

        /*MaskedEditExtender extender4 = new MaskedEditExtender();
        extender4.ID = "MaskedEditExtender4";
        extender4.Mask = "(999)999-9999";
        extender4.MaskType = MaskedEditType.Number;
        field31.Masks.Add(extender4);*/

        Obout.SuperForm.BoundField field32 = new Obout.SuperForm.BoundField();
        field32.DataField = "UserFax";
        field32.HeaderText = "Fax";
        field32.FieldSetID = "FieldSet4";
        
        /*MaskedEditExtender extender5 = new MaskedEditExtender();
        extender5.ID = "MaskedEditExtender5";
        extender5.Mask = "(999)999-9999";
        extender5.MaskType = MaskedEditType.Number;
        field32.Masks.Add(extender5);*/

        Obout.SuperForm.CommandField field33 = new Obout.SuperForm.CommandField();
        field33.ShowInsertButton = true;
        field33.InsertText = "Buy Now";
        field33.ShowCancelButton = false;
        field33.ButtonType = ButtonType.Button;
        field33.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        field33.FieldSetID = "CommandFields";

        Obout.SuperForm.FieldSetRow fieldSetRow2 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet2 = new Obout.SuperForm.FieldSet();
        fieldSet2.ID = "FieldSet2";
        fieldSet2.Direction = Direction.Horizontal;
        fieldSet2.ColumnSpan = 2;
        fieldSetRow2.Items.Add(fieldSet2);

        Obout.SuperForm.FieldSetRow fieldSetRow4 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet3 = new Obout.SuperForm.FieldSet();
        fieldSet3.ID = "FieldSet3";
        fieldSet3.Title = "Billing Information";
        
        Obout.SuperForm.FieldSet fieldSet4 = new Obout.SuperForm.FieldSet();
        fieldSet4.ID = "FieldSet4";
        fieldSet4.Title = "End-User Information";

        fieldSetRow4.Items.Add(fieldSet3);
        fieldSetRow4.Items.Add(fieldSet4);

        Obout.SuperForm.FieldSetRow fieldSetRow5 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet commandFields = new Obout.SuperForm.FieldSet();
        commandFields.ID = "CommandFields";
        commandFields.HorizontalAlign = HorizontalAlign.Center;
        commandFields.ColumnSpan = 2;
        fieldSetRow5.Items.Add(commandFields);

        SuperForm1.FieldSets.Add(fieldSetRow2);
        SuperForm1.FieldSets.Add(fieldSetRow4);
        SuperForm1.FieldSets.Add(fieldSetRow5);
        
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);
        SuperForm1.Fields.Add(field8);
        SuperForm1.Fields.Add(dummyField);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field9);
        SuperForm1.Fields.Add(field10);
        SuperForm1.Fields.Add(field11);
        SuperForm1.Fields.Add(field12);
        SuperForm1.Fields.Add(field13);
        SuperForm1.Fields.Add(field14);
        SuperForm1.Fields.Add(field15);
        SuperForm1.Fields.Add(field16);
        SuperForm1.Fields.Add(field17);
        SuperForm1.Fields.Add(field18);
        SuperForm1.Fields.Add(field19);
        SuperForm1.Fields.Add(field20);
        SuperForm1.Fields.Add(field21);
        SuperForm1.Fields.Add(field22);
        SuperForm1.Fields.Add(field23);
        SuperForm1.Fields.Add(field24);
        SuperForm1.Fields.Add(field25);
        SuperForm1.Fields.Add(field26);
        SuperForm1.Fields.Add(field27);
        SuperForm1.Fields.Add(field28);
        SuperForm1.Fields.Add(field29);
        SuperForm1.Fields.Add(field30);
        SuperForm1.Fields.Add(field31);
        SuperForm1.Fields.Add(field32);
        SuperForm1.Fields.Add(field33);

        SuperForm1Container.Controls.Add(SuperForm1);
        
    }
    protected void SuperForm1_Inserting(object sender, DetailsViewInsertEventArgs e)
    {
        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        OboutDropDownList yearDdl = SuperForm1.GetFieldControl(1) as OboutDropDownList;
        yearDdl.MenuWidth = Unit.Pixel(90);

        yearDdl.Items.Add(new ListItem(""));
        for (int i = 2010; i < 2025; i++)
        {
            yearDdl.Items.Add(new ListItem(i.ToString()));
        }

        OboutDropDownList monthDdl = SuperForm1.GetFieldControl(2) as OboutDropDownList;

        monthDdl.Items.Add(new ListItem(""));
        monthDdl.Items.Add(new ListItem("January"));
        monthDdl.Items.Add(new ListItem("February"));
        monthDdl.Items.Add(new ListItem("March"));
        monthDdl.Items.Add(new ListItem("April"));
        monthDdl.Items.Add(new ListItem("May"));
        monthDdl.Items.Add(new ListItem("June"));
        monthDdl.Items.Add(new ListItem("July"));
        monthDdl.Items.Add(new ListItem("August"));
        monthDdl.Items.Add(new ListItem("September"));
        monthDdl.Items.Add(new ListItem("October"));
        monthDdl.Items.Add(new ListItem("November"));
        monthDdl.Items.Add(new ListItem("December"));
    }
    public class DummyItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            Literal header = new Literal();
            header.Text = "&#160;";
            container.Controls.Add(header);
        }
    }    
}
