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

public partial class HTMLEditor_cs_BaseSample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.UICulture = "en";
        //Page.UICulture = "auto";
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
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
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n" + editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
    }

    //    protected void Page_PreRender(object sender, EventArgs e)
    //    {
    //        Collection<Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton> buttons =
    //            editor.TopToolbar.GetButtonsByType(typeof(Obout.Ajax.UI.HTMLEditor.ToolbarButton.FontSize));
    //        if (buttons.Count > 0)
    //        {
    //            Obout.Ajax.UI.HTMLEditor.ToolbarButton.FontSize fontSize = buttons[0] as Obout.Ajax.UI.HTMLEditor.ToolbarButton.FontSize;
    //            fontSize.SelectWidth = Unit.Empty;
    //        }
    //    }
}
