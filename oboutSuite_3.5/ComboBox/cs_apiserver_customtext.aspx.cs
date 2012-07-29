using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.ComboBox;
using System.Data;
using System.Data.OleDb;

public partial class ComboBox_cs_apiserver_customtext : System.Web.UI.Page
{
    private ComboBox ComboBox1;
    protected void Page_Load(object sender, EventArgs e)
    {
        ComboBox1 = new ComboBox();
        ComboBox1.ID = "ComboBox1";
        ComboBox1.Width = Unit.Pixel(250);
        ComboBox1.Height = Unit.Pixel(200);
        ComboBox1.EmptyText = "Enter a new item..";
        ComboBox1.DataSourceID = "sds1";
        ComboBox1.DataTextField = "CountryName";
        ComboBox1.DataValueField = "CountryID";
        ComboBox1.AutoValidate = true;
        ComboBox1.AppendDataBoundItems = true;
        ComboBox1.AllowCustomText = true;

        ComboBox1Container.Controls.Add(ComboBox1);
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
