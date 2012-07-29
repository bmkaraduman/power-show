using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_autocomplete : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        /*
         <obout:ComboBox runat="server" ID="ComboBox1" Width="300" Height="200"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        />
         */
         
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(300);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1Container.Controls.Add(ComboBox1);
    }
}
