using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Ajax.UI.HTMLEditor;

public partial class HTMLEditor_cs_OboutForum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content4.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
    }

    protected void Preview_click(object sender, EventArgs e)
    {
        editorPanel.Visible = false;
        previewPanel.Visible = true;
        preview.Text = editor.Content.Replace("\n",""); // for correct PRE
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "PrettyPrint", "prettyPrint();", true);
    }

    protected void BackToEdit_click(object sender, EventArgs e)
    {
        editorPanel.Visible = true;
        previewPanel.Visible = false;
    }
}