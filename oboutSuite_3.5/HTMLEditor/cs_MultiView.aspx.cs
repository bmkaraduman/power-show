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

public partial class HTMLEditor_cs_MultiView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void previewClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        editor_content.Text = editor.Content;
    }
    protected void backToEditClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void finishClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        htmlLength.Text = editor.Content.Length.ToString();
        plainLength.Text = editor.PlainText.Length.ToString();
    }
    protected void backToPreviewClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        editor_content.Text = editor.Content;
    }
}