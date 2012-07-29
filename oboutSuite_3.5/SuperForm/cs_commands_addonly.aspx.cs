using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using Obout.SuperForm;

public partial class SuperForm_cs_commands_addonly : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.Title = "Add a new order";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.DefaultMode = DetailsViewMode.Insert;

        SuperForm1.ItemInserting += SuperForm1_Inserting;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "ShipName";
        field1.HeaderText = "Ship Name";
        field1.Required = true;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipCity";
        field2.HeaderText = "Ship City";
        field2.Required = true;

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipRegion";
        field3.HeaderText = "Ship Region";

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipCountry";
        field4.HeaderText = "Ship Country";
        field4.Required = true;

        Obout.SuperForm.BoundField field5 = new Obout.SuperForm.BoundField();
        field5.DataField = "ShipPostalCode";
        field5.HeaderText = "Ship Postal Code";

        Obout.SuperForm.DateField field6 = new Obout.SuperForm.DateField();
        field6.DataField = "OrderDate";
        field6.HeaderText = "Order Date";
        field6.Required = true;

        Obout.SuperForm.CheckBoxField field7 = new Obout.SuperForm.CheckBoxField();
        field7.DataField = "Sent";
        field7.HeaderText = "Sent";

        Obout.SuperForm.CommandField field8 = new Obout.SuperForm.CommandField();
        field8.ShowInsertButton = true;
        field8.ShowCancelButton = false;
        field8.ButtonType = ButtonType.Button;
        field8.ItemStyle.HorizontalAlign = HorizontalAlign.Center;

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);
        SuperForm1.Fields.Add(field7);
        SuperForm1.Fields.Add(field8);

         SuperForm1Container.Controls.Add(SuperForm1);
     
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
