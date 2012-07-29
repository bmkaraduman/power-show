using System;
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

public partial class HTMLEditor_cs_Tabs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            editor1.EditPanel.Content = "Some text for <span style=\"font-weight: bold\">Tab</span> panel #1";
            editor2.EditPanel.Content = "Some text for <span style=\"font-weight: bold\">Tab</span> panel #2";
        }
    }
}
