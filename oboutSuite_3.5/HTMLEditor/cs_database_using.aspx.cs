using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

public partial class HTMLEditor_cs_database_using : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OleDbConnection Connection = new OleDbConnection();
        Connection.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Page.Server.MapPath("../App_Data/db.mdb") + ";";
        Connection.Open();

        if (Page.IsPostBack)
        {
            //
            //   Here one can save postbacked HTML content (editor.Content)
            //
            OleDbCommand myCommand;
            string sqlString = "Update tbTest Set fldContent=? Where id=?";
            myCommand = new OleDbCommand(sqlString, Connection);

            myCommand.Parameters.Add(new OleDbParameter("@fldContent", OleDbType.VarChar));
            myCommand.Parameters["@fldContent"].Value = editor.Content;

            myCommand.Parameters.Add(new OleDbParameter("@id", OleDbType.Integer));
            myCommand.Parameters["@id"].Value = 1;

            myCommand.ExecuteNonQuery();
        }
        else
        {
            //
            //   Here one can set initial HTML content of Editor
            //
            string sqlString = "Select fldContent from tbTest Where id=1";
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, Connection);
            DataTable eTable = new DataTable();
            OleDbCommandBuilder CommandBuilder = new OleDbCommandBuilder(eAdapter);

            eAdapter.Fill(eTable);
            editor.Content = (string)eTable.Rows[0][0];

            eAdapter.Dispose();
            eTable.Dispose();
        }

        Connection.Close();
        Connection.Dispose();
    }

    protected void Submit_click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n" + editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
    }
}
