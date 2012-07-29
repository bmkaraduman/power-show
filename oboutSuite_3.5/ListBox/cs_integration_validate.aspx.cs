using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_integration_validate : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
    private Obout.ListBox.ListBoxItem ListBoxItem1;
    private Obout.ListBox.ListBoxItem ListBoxItem2;
    private Obout.ListBox.ListBoxItem ListBoxItem3;
    private Obout.ListBox.ListBoxItem ListBoxItem4;
    private Obout.ListBox.ListBoxItem ListBoxItem5;
    private RequiredFieldValidator RequiredFieldValidator1;
    private RangeValidator RangeValidator1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(125);

        ListBoxItem1 = new ListBoxItem();
        ListBoxItem1.ID = "ListBoxItem1";
        ListBoxItem1.Text = "10";

        ListBoxItem2 = new ListBoxItem();
        ListBoxItem2.ID = "ListBoxItem2";
        ListBoxItem2.Text = "50";

        ListBoxItem3 = new ListBoxItem();
        ListBoxItem3.ID = "ListBoxItem3";
        ListBoxItem3.Text = "75";

        ListBoxItem4 = new ListBoxItem();
        ListBoxItem4.ID = "ListBoxItem4";
        ListBoxItem4.Text = "100";

        ListBoxItem5 = new ListBoxItem();
        ListBoxItem5.ID = "ListBoxItem5";
        ListBoxItem5.Text = "1000";

        ListBox1.Items.Add(ListBoxItem1);
        ListBox1.Items.Add(ListBoxItem2);
        ListBox1.Items.Add(ListBoxItem3);
        ListBox1.Items.Add(ListBoxItem4);
        ListBox1.Items.Add(ListBoxItem5);

        RequiredFieldValidator1 = new RequiredFieldValidator();
        RequiredFieldValidator1.ID = "Validator1";
        RequiredFieldValidator1.ControlToValidate = "ListBox1";
        RequiredFieldValidator1.ErrorMessage = "Please select a value.";
        RequiredFieldValidator1.CssClass = "tdText";
        RequiredFieldValidator1.Display = ValidatorDisplay.Dynamic;

        RangeValidator1 = new RangeValidator();
        RangeValidator1.ID = "RangeValidator1";
        RangeValidator1.ControlToValidate = "ListBox1";
        RangeValidator1.Display = ValidatorDisplay.Dynamic;
        RangeValidator1.ErrorMessage = "Please specify a value between 50 and 100.";
        RangeValidator1.MinimumValue = "50";
        RangeValidator1.MaximumValue = "100";
        RangeValidator1.Type = ValidationDataType.Integer;
        RangeValidator1.CssClass = "tdText";

        ListBox1Container.Controls.Add(ListBox1);
        ValidatorContainer.Controls.Add(RequiredFieldValidator1);
        ValidatorContainer.Controls.Add(RangeValidator1);
    }

}

