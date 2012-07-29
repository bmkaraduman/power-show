using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Obout.Ajax.UI.HTMLEditor;
using System.Collections.ObjectModel;
using System.Globalization;
using System.Data.OleDb;

public partial class HTMLEditor_cs_WeddingFill : System.Web.UI.Page
{
    private string m_connString;

    void Page_Load(object o, EventArgs e)
    {
        m_connString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE={0};";
        m_connString = String.Format(m_connString, Server.MapPath("../App_Data/db.mdb"));
        BindGrid();
        forWedding.Text = GetContent();
    }

    void BindGrid()
    {
        // Command  and connection string
        String strCmd = "SELECT * FROM tbWeddings";

        OleDbDataAdapter da = new OleDbDataAdapter(strCmd, m_connString);
        DataSet ds = new DataSet();
        da.Fill(ds, "tbWeddings");

        ds.Tables["tbWeddings"].Columns.Add("checked", System.Type.GetType("System.Boolean"));
        foreach (DataRow row in ds.Tables["tbWeddings"].Rows)
            row["checked"] = false;

        if (Page.IsPostBack)
        {
            if (Request.Form["grpSelect"] != null)
            {
                string selectedId = Request.Form["grpSelect"].ToString();
                DataRow[] rows = ds.Tables["tbWeddings"].Select("id=" + selectedId);

                rows[0]["checked"] = true;

                string content = GetContent();

                content = content.Replace("[[parents]]", (string)rows[0]["fldParents"]);
                content = content.Replace("[[child's sex]]", (string)rows[0]["fldChildSex"]);
                content = content.Replace("[[child's name]]", (string)rows[0]["fldChildName"]);
                content = content.Replace("[[fiance(e)]]", (string)rows[0]["fldFiance"]);
                content = content.Replace("[[date]]", ((DateTime)rows[0]["fldDate"]).ToLongDateString());
                content = content.Replace("[[church]]", (string)rows[0]["fldChurch"]);
                content = content.Replace("[[city]]", (string)rows[0]["fldCity"]);
                content = content.Replace("[[state]]", (string)rows[0]["fldState"]);

                editor.Content = content;
            }
        }

        MyDataGrid.DataSource = ds;
        MyDataGrid.DataBind();
    }

    protected void SubmitClicked(object sender, EventArgs e)
    {
        Preview.Visible = false;
        Edit.Visible = true;
    }

    protected void CancelClicked(object sender, EventArgs e)
    {
        Preview.Visible = true;
        Edit.Visible = false;
    }

    private string GetContent()
    {
        String strCmd = "SELECT * FROM tbTemplates";

        OleDbDataAdapter da = new OleDbDataAdapter(strCmd, m_connString);
        DataSet ds = new DataSet();
        da.Fill(ds, "tbTemplates");

        DataRow[] rows = ds.Tables["tbTemplates"].Select("fldTitle='Wedding Announcement'");

        if (rows.Length > 0)
            return (string)rows[0]["fldContent"];
        else
            return "";
    }

    protected string GetChecked(bool p)
    {
        if (p)
            return " checked=true";
        else
            return "";
    }
}