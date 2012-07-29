using System;
using System.Collections;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections.Specialized;
using System.ComponentModel;
using Obout.Ajax.UI;
using Obout.Ajax.UI.HTMLEditor;
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;


[RequiredScript(typeof(Editor))]
public partial class HTMLEditor_UserControls_EditablePanel : Obout.Ajax.UI.ScriptUserControl, IPostBackDataHandler
{
    private bool editable = false;
    private const string editablePostDataKey = "EditablePanelUniqueID";
    Editor editor = null;
    Label label = null;
    Panel panel = null;
    HtmlGenericControl editImage = null;
    HiddenField hidden = null;

    protected override bool LoadPostData(string postDataKey, NameValueCollection postCollection)
    {
        String postedValue = postCollection[editablePostDataKey];

        if (!String.IsNullOrEmpty(postedValue))
        {
            if (postedValue.Equals(panel.UniqueID))
            {
                return true;
            }
        }

        return false;
    }

    protected override string TagName
    {
        get { return "DIV"; }
    }

    protected override void RaisePostDataChangedEvent()
    {
        editable = true;
    }

    /// <summary>
    /// Gets or sets the content of the control.
    /// </summary>
    [DefaultValue(typeof(String), "")]
    [Description("Content of the control.")]
    public string Content
    {
        get { return editor.Content; }
        set { editor.Content = value; }
    }

    /// <summary>
    /// Gets or sets theID of popup holder.
    /// </summary>
    [DefaultValue(typeof(String), "")]
    [Description("ID of popup holder.")]
    public string PopupHolderID
    {
        get { return (string)(ViewState["PopupHolderID"] ?? ""); }
        set { ViewState["PopupHolderID"] = value; }
    }

    /// <summary>
    /// Gets or sets the height of the control.
    /// </summary>
    [DefaultValue(typeof(Unit), "200px")]
    [Description("Height of the control.")]
    public override Unit Height
    {
        get { return (Unit)(ViewState["Height"] ?? Unit.Pixel(200)); }
        set { ViewState["Height"] = value; }
    }

    /// <summary>
    /// Gets or sets the width of the control.
    /// </summary>
    [DefaultValue(typeof(Unit), "400px")]
    [Description("Width of the control.")]
    public override Unit Width
    {
        get { return (Unit)(ViewState["Width"] ?? Unit.Pixel(400)); }
        set { ViewState["Width"] = value; }
    }

    protected override void OnInit(EventArgs e)
    {
        //throw new Exception(Page.Request.Browser.Browser.ToUpper());
        base.OnInit(e);
        this.Style[HtmlTextWriterStyle.Position] = "relative";
        editor = createEditor();
        label = new Label();
        panel = new Panel();
        panel.Width = Width;
        panel.Height = Height;
        panel.Style[HtmlTextWriterStyle.BorderWidth] = "1px";
        panel.Style[HtmlTextWriterStyle.BorderStyle] = "solid";
        panel.Style[HtmlTextWriterStyle.BorderColor] = "#D0D0FF";
        panel.Style[HtmlTextWriterStyle.Position] = "relative";
        panel.ID = this.ID;

        editor.Visible = false;


        label.Visible = false;
        label.Width = Unit.Percentage(100);
        label.Height = Unit.Percentage(100);

        hidden = new HiddenField();
        hidden.ID = "dummy";
        panel.Controls.Add(hidden);
        panel.Controls.Add(label);
        panel.Controls.Add(editor);
        this.Controls.Add(panel);

        editImage = new HtmlGenericControl("img");
        editImage.Style[HtmlTextWriterStyle.Position] = "absolute";
        editImage.Style[HtmlTextWriterStyle.Top] = "-1px";
        editImage.Style[HtmlTextWriterStyle.Left] = "-1px";
        editImage.Style[HtmlTextWriterStyle.BackgroundColor] = "#0000FF";
        editImage.Style[HtmlTextWriterStyle.Cursor] = "Pointer";
        editImage.Style["filter"] = "alpha(opacity:80)";
        editImage.Style["Opacity"] = "0.8";
        editImage.Attributes.Add("src", Page.ClientScript.GetWebResourceUrl(typeof(Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_design_n.gif"));
        editImage.Attributes.Add("onmouseout", "this.src=\"" + Page.ClientScript.GetWebResourceUrl(typeof(Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_design_n.gif") + "\"; this.style.backgroundColor = '#0000FF';");
        editImage.Attributes.Add("onmouseover", "this.src=\"" + Page.ClientScript.GetWebResourceUrl(typeof(Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_design_a.gif") + "\"; this.style.backgroundColor = '#FF0000';");
        editImage.Attributes.Add("onclick", "window.EditablePanelTotal.EditClickHandler('" + panel.UniqueID + "', '" + hidden.UniqueID + "'); return false;");
        panel.Controls.Add(editImage);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        String scr = "if(typeof window.EditablePanelTotal == 'undefined') window.EditablePanelTotal = {};\n" +
                     "if(typeof window.EditablePanelTotal.EditClickHandler == 'undefined') window.EditablePanelTotal.EditClickHandler =" +
                     "function(uniqueID, hiddenUniqueID){" +
                     "window.document.getElementsByName('" + editablePostDataKey + "')[0].value = uniqueID;" +
                     "if(typeof window.EditablePanelTotal.ActiveEditorID != 'undefined' && window.EditablePanelTotal.ActiveEditorID != null){" +
                     "var editor = $find(window.EditablePanelTotal.ActiveEditorID);" +
                     "if(editor) { editor.get_editPanel().set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);" +
                     "editor.get_editPanel().setCancelOnPostback();" +
                     "}" +
                     "window.EditablePanelTotal.ActiveEditorID = null;}" +
                     "var el = $get(uniqueID.replace(/\\$/, '_'));" +
                     "EditablePanelTotal.WaitImage.style.top = Math.round((el.offsetHeight-EditablePanelTotal.WaitImage.height)/2)+'px';" +
                     "EditablePanelTotal.WaitImage.style.left = Math.round((el.offsetWidth-EditablePanelTotal.WaitImage.width)/2)+'px';" +
                     "el.appendChild(window.EditablePanelTotal.WaitImage);" +
                     "window.__doPostBack(hiddenUniqueID,'');" +
                     "};\n" +
                     "if(typeof window.EditablePanelTotal.WaitImage == 'undefined') {" +
                     "window.EditablePanelTotal.WaitImage = new Image();" +
                     "window.EditablePanelTotal.WaitImage.src ='"+Page.ClientScript.GetWebResourceUrl(typeof(Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")+"';"+
                     "window.EditablePanelTotal.WaitImage.style.position = 'absolute';" +
                     "};\n";
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditClickHandler", scr, true);

        scr =
        "Type.registerNamespace('CustomToolbarButton');" +
        "if(typeof CustomToolbarButton.CloseToolbarButton != 'function') {CustomToolbarButton.CloseToolbarButton = function(element) {" +
        "CustomToolbarButton.CloseToolbarButton.initializeBase(this, [element]);" +
        "};" +
        "CustomToolbarButton.CloseToolbarButton.prototype = {" +
        "_onclick: function(ev) {" +
        "if (!CustomToolbarButton.CloseToolbarButton.callBaseMethod(this, '_onclick', [ev])) {" +
        "return false;" +
        "}" +
        "if(typeof window.EditablePanelTotal.ActiveEditorID != 'undefined' && window.EditablePanelTotal.ActiveEditorID != null){" +
        "var editor = $find(window.EditablePanelTotal.ActiveEditorID);" +
        "if(editor) { editor.get_editPanel().set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);" +
        "editor.get_editPanel().setCancelOnPostback();" +
        "}" +
        "window.EditablePanelTotal.ActiveEditorID = null;}" +
        "if(typeof window.EditablePanelTotal.ActivePanelID != 'undefined' && window.EditablePanelTotal.ActivePanelID != null){" +
        "var el = $get(window.EditablePanelTotal.ActivePanelID);" +
        "EditablePanelTotal.WaitImage.style.top = Math.round((el.offsetHeight-EditablePanelTotal.WaitImage.height)/2)+'px';" +
        "EditablePanelTotal.WaitImage.style.left = Math.round((el.offsetWidth-EditablePanelTotal.WaitImage.width)/2)+'px';" +
        "el.appendChild(window.EditablePanelTotal.WaitImage);" +
        "window.EditablePanelTotal.ActivePanelID = null;}" +
        "if(typeof window.EditablePanelTotal.ActiveHiddenID != 'undefined' && window.EditablePanelTotal.ActiveHiddenID != null){" +
        "window.__doPostBack(window.EditablePanelTotal.ActiveHiddenID,'');" +
        "window.EditablePanelTotal.ActiveHiddenID = null;}" +
        "return true;" +
        "}" +
        "};" +
        "CustomToolbarButton.CloseToolbarButton.registerClass('CustomToolbarButton.CloseToolbarButton', Obout.Ajax.UI.HTMLEditor.ToolbarButton.ImageButton);}";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "CloseButton", scr, true);
    }

    protected override void OnPreRender(EventArgs e)
    {
        if (editable)
        {
            editor.EditPanel.ActiveMode = ActiveModeType.Design;
            editor.Visible = true;
            label.Visible = false;
            editImage.Style[HtmlTextWriterStyle.Display] = "none";
            String scr = "if(typeof window.EditablePanelTotal == 'undefined') window.EditablePanelTotal = {};\n" +
                         "window.EditablePanelTotal.ActiveEditorID = '" + editor.ClientID + "'\n"+
                         "window.EditablePanelTotal.ActiveHiddenID = '" + hidden.ClientID + "'\n"+
                         "window.EditablePanelTotal.ActivePanelID = '" + this.ClientID + "'";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ActiveEditor", scr, true);
        }
        else
        {
            editImage.Style[HtmlTextWriterStyle.Display] = "";
            editor.Visible = false;
            label.Visible = true;
            label.Text = Content;
        }

        ScriptManager.RegisterHiddenField(this, editablePostDataKey, string.Empty);
        Page.RegisterRequiresPostBack(this);
        base.OnPreRender(e);
    }

    private Editor createEditor()
    {
        Editor editor = new Editor();

        editor.Width = Unit.Percentage(100);
        editor.Height = Unit.Percentage(100);

        editor.TopToolbar.Appearance = EditorTopToolbar.AppearanceType.Custom;
        editor.TopToolbar.AddButtons.Add(new Undo());
        editor.TopToolbar.AddButtons.Add(new Redo());
        editor.TopToolbar.AddButtons.Add(new HorizontalSeparator());
        editor.TopToolbar.AddButtons.Add(new Bold());
        editor.TopToolbar.AddButtons.Add(new Italic());
        editor.TopToolbar.AddButtons.Add(new Underline());
        editor.TopToolbar.AddButtons.Add(new HorizontalSeparator());
        editor.TopToolbar.AddButtons.Add(new ForeColorGroup());
        editor.TopToolbar.AddButtons.Add(new HorizontalSeparator());
        editor.TopToolbar.AddButtons.Add(new SpellCheck());
        editor.TopToolbar.AddButtons.Add(new CloseToolbarButton());

        editor.BottomToolbar.ShowDesignButton = false;
        editor.BottomToolbar.ShowHtmlTextButton = false;
        editor.BottomToolbar.ShowPreviewButton = false;
        if (!String.IsNullOrEmpty(PopupHolderID))
        {
            editor.PopupHolderID = PopupHolderID;
        }

        return editor;
    }

    // declare our custom 'Close' button
    public class CloseToolbarButton : Obout.Ajax.UI.HTMLEditor.ToolbarButton.MethodButton
    {
        #region [ Properties ]

        // what client-side type to initiate (it is declared in the ASPX file)
        protected override string ClientControlType
        {
            get { return "CustomToolbarButton.CloseToolbarButton"; }
        }

        // use an existing images ("DeleteButton_n.gif"and "DeleteButton_a.gif") from the DLL
        protected override string BaseImageName
        {
            get { return "DeleteButton"; }
        }

        // tooltip if not found in Localization
        public override string DefaultToolTip
        {
            get { return "Cancel changes"; }
        }

        #endregion

        #region [ Methods ]

        // we need to change the default style of the button
        protected override Style CreateControlStyle()
        {
            CloseToolbarButtonStyle style = new CloseToolbarButtonStyle(ViewState);
            return style;
        }

        #endregion

        #region [ CloseToolbarButtonStyle ]

        // our button will have some additional CSSstyles
        private sealed class CloseToolbarButtonStyle : Style
        {
            public CloseToolbarButtonStyle(StateBag state)
                : base(state)
            {
            }

            protected override void FillStyleAttributes(CssStyleCollection attributes, IUrlResolutionService urlResolver)
            {
                base.FillStyleAttributes(attributes, urlResolver);
                // here are the additional CSS styles
                attributes.Add("float", "right"); // move it to the right in the toolbar
                attributes.Add("margin-left", "2px"); // ensure some left padding
            }
        }

        #endregion
    }

}
