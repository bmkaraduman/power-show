using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_master_detail_error : System.Web.UI.Page
{
    public void DeleteCustomer(object sender, GridRecordEventArgs e)
    {
        // try to delete the customer
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to delete the customer.");
    }
    public void DeleteOrder(object sender, GridRecordEventArgs e)
    {
        // try to delete the order
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to delete the order.");
    }

    public void UpdateCustomer(object sender, GridRecordEventArgs e)
    {
        // try to update the customer
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to update the customer.");
    }
    public void UpdateOrder(object sender, GridRecordEventArgs e)
    {
        // try to update the order
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to update the order.");
    }

    public void InsertCustomer(object sender, GridRecordEventArgs e)
    {
        // try to insert the customer
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to insert the customer.");
    }
    public void InsertOrder(object sender, GridRecordEventArgs e)
    {
        // try to insert the order
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to insert the order.");
    }
}