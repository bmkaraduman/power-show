using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ListBox;

public partial class ListBox_cs_icons_database : System.Web.UI.Page
{
    private Obout.ListBox.ListBox ListBox1;
     
    protected void Page_Load(object sender, EventArgs e)
    { 
        ListBox1 = new Obout.ListBox.ListBox();
        ListBox1.ID = "ListBox1";
        ListBox1.Width = Unit.Pixel(200);
        ListBox1.DataSourceID = "sds1";
        ListBox1.DataTextField = "CompanyName"; 
        ListBox1.DataValueField="CustomerID"; 
        ListBox1.ItemDataBound += ListBox1_ItemDataBound; 

        ListBox1Container.Controls.Add(ListBox1);
       
    }
    protected void ListBox1_ItemDataBound(object sender, ListBoxItemEventArgs e)
    {
        e.Item.ImageUrl = GetCountryFlag(DataBinder.Eval(e.Item.DataItem, "Country").ToString());
    }

    protected string GetCountryFlag(string countryName)
    {
        switch (countryName)
        {
            case "UK":
                countryName = "England";
                break;
        }

        return "resources/Images/flags/flag_" + countryName.ToLower() + ".png";
    }
   
}
