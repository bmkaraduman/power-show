using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class SuperForm_aspnet_commands_addonly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SuperForm1.DataBind();
        }
    }

    protected void SuperForm1_Inserting(object sender, DetailsViewInsertEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate, Sent) VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipCountry, @ShipPostalCode, @OrderDate, @Sent)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Values["ShipName"].ToString();
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Values["ShipCity"].ToString();
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Values["ShipRegion"].ToString();
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Values["ShipCountry"].ToString();
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Values["ShipPostalCode"].ToString();
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Values["OrderDate"].ToString();
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Values["Sent"].ToString();

        myComm.ExecuteNonQuery();
        myConn.Close();

        SuperForm1.Visible = false;
        MessagePanel.Visible = true;
    }
}
