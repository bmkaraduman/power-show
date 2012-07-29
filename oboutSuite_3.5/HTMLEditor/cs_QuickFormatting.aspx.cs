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
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using System.Collections.ObjectModel;
using System.Globalization;

public partial class HTMLEditor_cs_QuickFormatting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content2.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
    }

    protected void Editable_click(object sender, EventArgs e)
    {
        editor.Enabled = !editor.Enabled;
        Editable.Text = editor.Enabled ? "Disable editor" : "Enable editor";
        Submit.Enabled = editor.Enabled;
    }

    protected void Submit_click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('" + editor.Enabled.ToString() + " Submitted:\\n\\n" + editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
    }
}
