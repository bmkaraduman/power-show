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

public partial class HTMLEditor_cs_EditablePanels : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            panel1.Content = "<br />Test<br /><br /><span style='font-weight:bold'>Content</span> panel 1";
            panel2.Content = "<br />Test<br /><br /><span style='font-weight:bold'>Content</span> panel 2";
            panel3.Content = "<br />Test<br /><br /><span style='font-weight:bold'>Content</span> panel 3";
            panel4.Content = "<br />Test<br /><br /><span style='font-weight:bold'>Content</span> panel 4";
        }
    }

    protected void Submit_click(object sender, EventArgs e)
    {
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n" + editor.EditPanel.Content.Replace("\"", "\\\"").Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'") + "');", true);
    }
}
