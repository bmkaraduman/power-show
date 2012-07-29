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

public partial class HTMLEditor_cs_HideShowButtons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
        OboutCheckBox1.Text = "<img style='background-color: gray;' align='absmiddle' src='" + Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton), "Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif") + "' /> is shown it the top toolbar";
        OboutCheckBox2.Text = "<img style='background-color: gray;' align='absmiddle' src='" + Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton), "Obout.Ajax.UI.HTMLEditor.Images.ed_preview_n.gif") + "' /> is shown it the bottom toolbar";
    }

    protected void Submit_click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n" + editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
    }
}
