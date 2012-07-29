using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_aspnet_templates_item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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