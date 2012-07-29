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

public partial class HTMLEditor_cs_InitialPreview : System.Web.UI.Page
{
        protected void Page_Init(object sender, EventArgs e)
        {
            // Configure the bottom toolbar 
            editor.BottomToolbar.ShowDesignButton = false;
            editor.BottomToolbar.ShowHtmlTextButton = false;
            editor.BottomToolbar.ShowPreviewButton = false;
            editor.BottomToolbar.AddButtons.Add(new CustomToolbarButtons.DesignModeNoP_cs());
            editor.BottomToolbar.AddButtons.Add(new CustomToolbarButtons.HtmlModeNoP_cs());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            editor.EditPanel.ActiveMode = Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview;

            if(!Page.IsPostBack) {
                StreamReader input;

                input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
                editor.EditPanel.Content = input.ReadToEnd();
                input.Close();
            }
            else
            {
              ScriptManager.RegisterClientScriptBlock(this,this.GetType(), "EditorResponse", "alert('Submitted:\\n\\n"+editor.EditPanel.Content.Replace("\"","\\\"").Replace("\n","\\n").Replace("\r","")+"');", true);
            }
        }
}

namespace CustomToolbarButtons
{
    // Switch to 'Design' mode button - invisible in 'Preview' mode
    public class DesignModeNoP_cs : Obout.Ajax.UI.HTMLEditor.ToolbarButton.DesignMode
    {
        public override Collection<ActiveModeType> ActiveModes
        {
            get
            {
                return new Collection<ActiveModeType>() { ActiveModeType.Design, ActiveModeType.Html };
            }
        }
    }

    // Switch to 'HTML text' mode button - invisible in 'Preview' mode
    public class HtmlModeNoP_cs : Obout.Ajax.UI.HTMLEditor.ToolbarButton.HtmlMode
    {
        public override Collection<ActiveModeType> ActiveModes
        {
            get
            {
                return new Collection<ActiveModeType>() { ActiveModeType.Design, ActiveModeType.Html };
            }
        }
    }
}