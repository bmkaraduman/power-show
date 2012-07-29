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

public partial class HTMLEditor_cs_AutoSave : System.Web.UI.Page, System.Web.UI.ICallbackEventHandler
{
    protected string sCallbackInvocation = "";
    private string sCallbackResult = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            sCallbackInvocation = Page.ClientScript.GetCallbackEventReference(this, "args", "Callback", "", false);

            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
    }

    public string GetCallbackResult()
    {
        return sCallbackResult;
    }

    public void RaiseCallbackEvent(string editorContent)
    {
        saveContent(editorContent);
        sCallbackResult = System.DateTime.Now.ToString();
    }

    private void saveContent(string editorContent)
    {
        // here you can save Editor's content to database
    }
}