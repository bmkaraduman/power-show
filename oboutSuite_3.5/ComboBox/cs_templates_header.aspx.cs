using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_templates_header : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.HeaderTemplate = new HeaderTemplate3();

        ComboBox1Container.Controls.Add(ComboBox1);
    }

    public class HeaderTemplate3 : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            Literal header = new Literal();
            header.Text = "<div class=\"header\">CUSTOMERS</div>";
            container.Controls.Add(header);
        }
    }
}


