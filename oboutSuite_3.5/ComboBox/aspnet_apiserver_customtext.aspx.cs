using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;


public partial class ComboBox_aspnet_apiserver_customtext : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
  
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (ComboBox1.SelectedIndex == -1 && ComboBox1.SelectedText != ComboBox1.EmptyText)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/continent.mdb"));
            myConn.Open();

            OleDbCommand myComm = new OleDbCommand("INSERT INTO Country (CountryName) VALUES(@CountryName)", myConn);

            myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = ComboBox1.SelectedText;
            
            myComm.ExecuteNonQuery();
            myConn.Close();

            ComboBox1.Items.Clear();
            ComboBox1.SelectedIndex = 0;

            ComboBox1.DataBind();
        }
    }
    
}
