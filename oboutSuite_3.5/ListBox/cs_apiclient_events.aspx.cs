using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_apiclient_events : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(250);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName";
        ListBox1.DataValueField = "CustomerID";

        ListBox1.ClientSideEvents.OnSelectedIndexChanged = "ListBox1_SelectedIndexChanged";
        ListBox1.ClientSideEvents.OnItemClick = "ListBox1_ItemClick";
        ListBox1.ClientSideEvents.OnFocus = "ListBox1_Focus";
        ListBox1.ClientSideEvents.OnBlur = "ListBox1_Blur";

        ListBox1Container.Controls.Add(ListBox1);
    }
}
