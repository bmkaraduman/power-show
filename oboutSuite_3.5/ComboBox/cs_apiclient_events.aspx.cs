using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_apiclient_events : System.Web.UI.Page
{
    private ComboBox ComboBox1;

    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.EmptyText = "Select a customer ...";
        ComboBox1.DataSourceID = "sds1"; 
        ComboBox1.DataTextField = "CompanyName";
        ComboBox1.DataValueField = "CustomerID";

        ComboBox1.ClientSideEvents.OnSelectedIndexChanged = "ComboBox1_SelectedIndexChanged";
        ComboBox1.ClientSideEvents.OnItemClick = "ComboBox1_ItemClick";
        ComboBox1.ClientSideEvents.OnOpen = "ComboBox1_Open";
        ComboBox1.ClientSideEvents.OnClose = "ComboBox1_Close";
        ComboBox1.ClientSideEvents.OnFocus = "ComboBox1_Focus";
        ComboBox1.ClientSideEvents.OnBlur = "ComboBox1_Blur";

        ComboBox1Container.Controls.Add(ComboBox1);
       
    }

}
