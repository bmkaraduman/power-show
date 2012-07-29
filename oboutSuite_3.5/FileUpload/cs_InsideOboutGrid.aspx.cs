using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using Obout.Grid;

public partial class FileUpload_cs_InsideOboutGrid : System.Web.UI.Page
{
    protected void Page_load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
        else
        {
            ServerResponse.Value = "";
        }

        CreateGrid();
    }

    protected void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Products ORDER BY ProductID ASC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();


        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    protected void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Products SET ProductName = @ProductName, UnitPrice = @UnitPrice WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.VarChar).Value = e.Record["UnitPrice"];
        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    protected void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Products (ProductName, UnitPrice) VALUES(@ProductName, @UnitPrice)", myConn);

        myComm.Parameters.Add("@ProductName", OleDbType.VarChar).Value = e.Record["ProductName"];
        myComm.Parameters.Add("@UnitPrice", OleDbType.VarChar).Value = e.Record["UnitPrice"];

        myComm.ExecuteNonQuery();
        myConn.Close();
        // trick here to go to the last page of the Grid
        grid1.CurrentPageIndex = 1000000;
    }

    protected void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Products WHERE ProductID = @ProductID", myConn);

        myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = e.Record["ProductID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    protected void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
    protected void getImages(object sender, EventArgs e)
    {
        for (int i = 0; i < grid1.Templates[0].Controls.Count; i++)
        {
            Obout.Ajax.UI.FileUpload.FileUpload fileUpload = grid1.Templates[0].Controls[i].FindControl("fuIcone") as Obout.Ajax.UI.FileUpload.FileUpload;
            if (fileUpload != null)
            {
                if (fileUpload.PostedFiles.Count > 0)
                {
                    if (fileUpload.PostedFiles[0].ContentLength > 0)
                    {
                        string imagesPath = "../Grid/resources/images/products/";
                        string photoPath = "";
                        string photoName = "";
                        Regex reg = new Regex(@"((?:[^\\]*\\)*)(\S+)", RegexOptions.Compiled);
                        photoName = DateTime.Now.Ticks.ToString() + "_" + reg.Replace(fileUpload.PostedFiles[0].FileName, "$2");
                        photoPath = imagesPath + photoName;

                        fileUpload.PostedFiles[0].SaveAs(Page.MapPath(photoPath));

                        string ProductID = Page.Request["ServerResponse"];

                        if (ProductID != null)
                        {
                            if (ProductID.Length > 0 && !string.IsNullOrEmpty(photoName))
                            {
                                OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
                                myConn.Open();

                                OleDbCommand myComm = new OleDbCommand("UPDATE Products SET [Image] = @Image WHERE ProductID = @ProductID", myConn);

                                myComm.Parameters.Add("@Image", OleDbType.VarChar).Value = photoName;
                                myComm.Parameters.Add("@ProductID", OleDbType.Integer).Value = ProductID;

                                myComm.ExecuteNonQuery();
                                myConn.Close();
                                CreateGrid();
                            }
                        }
                    }
                }
                break;
            }
        }
    }
}