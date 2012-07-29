using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Obout.Ajax.UI.HTMLEditor;
using Obout.Ajax.UI.HTMLEditor.Popups;
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using Obout.Ajax.UI.HTMLEditor.ContextMenu;
using System.Collections.ObjectModel;


// Declare the customized 'Image properties' popup class
public class CuttedImageProperties : Obout.Ajax.UI.HTMLEditor.Popups.ImageProperties
{
    // Suppress 'CSS class' field in the popup
    protected override TextBox ElementCSS { get { return null; } }
    // Suppress 'ID' field in the popup
    protected override TextBox ElementID { get { return null; } }
    // Suppress 'Layout' fieldset in the popup
    protected override HtmlGenericControl Layout { get { return null; } }
    // Suppress 'Spacing' fieldset in the popup
    protected override HtmlGenericControl Spacing { get { return null; } }
}

public partial class HTMLEditor_cs_CuttedImageProperties : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Find 'Insert image' button in the top toolbar and change the associated popup
        Collection<CommonButton> buttons = editor.TopToolbar.GetButtonsByType(typeof(InsertImage));
        if (buttons.Count > 0)
        {
            InsertImage button = buttons[0] as InsertImage;
            button.RelatedPopupType = typeof(CuttedImageProperties).AssemblyQualifiedName;
        }

        // Find 'Edit image' item in the context menu and change the associated popup
        buttons = editor.EditPanel.ContextMenu.GetButtonsByType(typeof(EditImageItem));
        if (buttons.Count > 0)
        {
            EditImageItem item = buttons[0] as EditImageItem;
            item.RelatedPopupType = typeof(CuttedImageProperties).AssemblyQualifiedName;
        }
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.EditPanel.Content = input.ReadToEnd();
            input.Close();
        }
    }
}
