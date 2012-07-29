using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;

public partial class ComboBox_cs_icons_database : System.Web.UI.Page
{
    private ComboBox ComboBox1;
     
    protected void Page_Load(object sender, EventArgs e)
    { 
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(200);
        ComboBox1.MenuWidth = Unit.Pixel(300);
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CompanyName"; 
        ComboBox1.DataValueField="CustomerID"; 
        ComboBox1.EmptyText="Select a customer ..."; 
        ComboBox1.ShowSelectedImage = true; 
        ComboBox1.ItemDataBound += ComboBox1_ItemDataBound; 

        ComboBox1Container.Controls.Add(ComboBox1);
       
    }
    protected void ComboBox1_ItemDataBound(object sender, ComboBoxItemEventArgs e)
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
