using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_integration_validate : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    private Obout.ComboBox.ComboBoxItem ComboBoxItem1;
    private Obout.ComboBox.ComboBoxItem ComboBoxItem2;
    private Obout.ComboBox.ComboBoxItem ComboBoxItem3;
    private Obout.ComboBox.ComboBoxItem ComboBoxItem4;
    private Obout.ComboBox.ComboBoxItem ComboBoxItem5;
    private RequiredFieldValidator RequiredFieldValidator1;
    private RangeValidator RangeValidator1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(125);

        ComboBoxItem1 = new ComboBoxItem();
        ComboBoxItem1.ID = "ComboBoxItem1";
        ComboBoxItem1.Text = "10";

        ComboBoxItem2 = new ComboBoxItem();
        ComboBoxItem2.ID = "ComboBoxItem2";
        ComboBoxItem2.Text = "50";

        ComboBoxItem3 = new ComboBoxItem();
        ComboBoxItem3.ID = "ComboBoxItem3";
        ComboBoxItem3.Text = "75";

        ComboBoxItem4 = new ComboBoxItem();
        ComboBoxItem4.ID = "ComboBoxItem4";
        ComboBoxItem4.Text = "100";

        ComboBoxItem5 = new ComboBoxItem();
        ComboBoxItem5.ID = "ComboBoxItem5";
        ComboBoxItem5.Text = "1000";

        ComboBox1.Items.Add(ComboBoxItem1);
        ComboBox1.Items.Add(ComboBoxItem2);
        ComboBox1.Items.Add(ComboBoxItem3);
        ComboBox1.Items.Add(ComboBoxItem4);
        ComboBox1.Items.Add(ComboBoxItem5);

        RequiredFieldValidator1 = new RequiredFieldValidator();
        RequiredFieldValidator1.ID = "Validator1";
        RequiredFieldValidator1.ControlToValidate = "ComboBox1";
        RequiredFieldValidator1.ErrorMessage = "Please select a value.";
        RequiredFieldValidator1.CssClass = "tdText";
        RequiredFieldValidator1.Display = ValidatorDisplay.Dynamic;
        
        RangeValidator1 = new RangeValidator(); 
        RangeValidator1.ID = "RangeValidator1";
        RangeValidator1.ControlToValidate = "ComboBox1";
        RangeValidator1.Display = ValidatorDisplay.Dynamic;
        RangeValidator1.ErrorMessage = "Please specify a value between 50 and 100.";
        RangeValidator1.MinimumValue = "50";
        RangeValidator1.MaximumValue = "100";
        RangeValidator1.Type = ValidationDataType.Integer;
        RangeValidator1.CssClass = "tdText";

        ComboBox1Container.Controls.Add(ComboBox1);
        ValidatorContainer.Controls.Add(RequiredFieldValidator1);
        ValidatorContainer.Controls.Add(RangeValidator1);
    }
   
}
