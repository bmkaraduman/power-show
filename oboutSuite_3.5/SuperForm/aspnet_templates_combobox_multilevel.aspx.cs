using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Interface;
using Obout.ComboBox;
using System.Data.OleDb;

public partial class SuperForm_aspnet_templates_combobox_multilevel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCountry")).SelectedText;
        string test = e.NewValues["ShipCountry"].ToString();
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry")).SelectedValue;
    }

    protected void CountriesCombo_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            int tryout = 0;
            if (int.TryParse(e.Text, out tryout))
            {
                CountriesDataSource.SelectParameters[0].DefaultValue = e.Text;
            }
        }
    }

    protected void SuperForm1_DataBound(object sender, EventArgs e)
    {
        if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            string shipCountry = DataBinder.Eval(SuperForm1.DataItem, "ShipCountry").ToString();
            string continentId = "0";
            
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
            myConn.Open();

            OleDbCommand myComm = new OleDbCommand("SELECT ContinentID FROM Country WHERE CountryName = @CountryName", myConn);
            myComm.Parameters.Add("@CountryName", OleDbType.VarChar).Value = shipCountry;

            OleDbDataReader myReader = myComm.ExecuteReader();
            if (myReader.Read())
            {
                continentId = myReader[0].ToString();
            }

            myConn.Close();
            
            
            Obout.ComboBox.ComboBox shipCountryCombo = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[2]).FindControl("ShipCountry"));
            shipCountryCombo.Details[0].SelectedValue = shipCountry;
            shipCountryCombo.SelectedValue = continentId;
        }
    }
}
