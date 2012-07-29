using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using Obout.ComboBox;
using System.Text;

public partial class ComboBox_cs_integration_oboutcheckboxes : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(350);
        ComboBox1.AutoClose = false;
        ComboBox1.AllowCustomText = true;
        ComboBox1.AutoValidate = true;
        ComboBox1.AllowEdit = false;
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "ControlName";
        ComboBox1.DataValueField = "ControlID";
        ComboBox1.SelectionMode = ListSelectionMode.Multiple;
       
        ComboBox1.ItemTemplate = new ItemTemplate();

        ComboBox1Container.Controls.Add(ComboBox1);
    }

    protected void Order(object sender, EventArgs e)
    {
        StringBuilder orderedItems = new StringBuilder();

        foreach (ComboBoxItem item in ComboBox1.Items)
        {
            Obout.Interface.OboutCheckBox checkbox = item.FindControl("OboutCheckBox1") as Obout.Interface.OboutCheckBox;
            checkbox.ClientSideEvents.OnClick = "handleCheckBoxClick";
            if (checkbox.Checked)
            {
                if (orderedItems.Length > 0)
                {
                    orderedItems.Append(", ");
                }
                orderedItems.Append(item.Text);
            }
        }

        if (orderedItems.Length > 0)
        {
            OrderDetails.Text = "<br /><br /><br /><b>The following controls have been ordered:</b> " + orderedItems.ToString() + "<br />";
        }
        else
        {
            OrderDetails.Text = "";
        }
    }

    public class ItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {

            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);
            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);

            Literal divContainer = new Literal();
            divContainer.Text = "<div class=\"item\"><span class=\"chk-cont\">";

            Obout.Interface.OboutCheckBox OboutCheckBox1 = new Obout.Interface.OboutCheckBox();
            OboutCheckBox1.ID = "OboutCheckBox1";
            OboutCheckBox1.ClientSideEvents.OnClick = "handleCheckBoxClick";

            Literal divContainer2 = new Literal();
            divContainer2.Text = "</span>";

            Literal innerContainer = new Literal();

            templatePlaceHolder.Controls.Add(divContainer);
            templatePlaceHolder.Controls.Add(OboutCheckBox1);
            templatePlaceHolder.Controls.Add(divContainer2);
            templatePlaceHolder.Controls.Add(innerContainer);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            ComboBoxItemTemlateContainer container = templatePlaceHolder.NamingContainer as ComboBoxItemTemlateContainer;
            ComboBoxItem item = (ComboBoxItem)container.Parent;

            Literal innerContainer = templatePlaceHolder.Controls[3] as Literal;
            innerContainer.Text = "<div class=\"label\">";
            innerContainer.Text += "<img src='resources/images/products/" + DataBinder.Eval(item.DataItem, "ImageName").ToString() + "' alt='' />";
            innerContainer.Text += DataBinder.Eval(item.DataItem, "ControlName").ToString();
            innerContainer.Text += "</div>";
            innerContainer.Text += "</div>";
        }
    }
    
}
