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
using Obout.Ajax.UI.HTMLEditor.Popups;
using Obout.Ajax.UI.HTMLEditor.ContextMenu;
using System.Collections.ObjectModel;
using System.Globalization;
using System.ComponentModel;
using System.ComponentModel.Design;

public partial class HTMLEditor_cs_CustomSelectButton : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        // add separator to top toolbar
        editor.TopToolbar.AddButtons.Add(new HorizontalSeparator());
        // add our custom 'select' buttons to the the top toolbar
        editor.TopToolbar.AddButtons.Add(new TranslateFrom());
        editor.TopToolbar.AddButtons.Add(new TranslateTo());
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content3.txt"), System.Text.Encoding.ASCII);
            editor.Content = input.ReadToEnd();
            input.Close();
        }
    }

    // abstract class dor our custom 'select' buttons
    public abstract class SelectLanguage : DesignModeSelectButton
    {
        #region [ Properties ]

        // tooltip if not found in Localization
        public override string DefaultToolTip
        {
            get { return "Select a language"; }
        }

        // options for the select
        protected override Collection<SelectOption> PreDefinedOptions
        {
            get
            {
                Collection<SelectOption> options = new Collection<SelectOption>();
                SelectOption option;

                option = new SelectOption();
                option.Value = "en";
                option.Text = "English";
                options.Add(option);
                option = new SelectOption();
                option.Value = "es";
                option.Text = "Spanish";
                options.Add(option);
                option = new SelectOption();
                option.Value = "de";
                option.Text = "German";
                options.Add(option);
                option = new SelectOption();
                option.Value = "fr";
                option.Text = "French";
                options.Add(option);
                option = new SelectOption();
                option.Value = "ru";
                option.Text = "Russian";
                options.Add(option);
                option = new SelectOption();
                option.Value = "ro";
                option.Text = "Romanian";
                options.Add(option);
                option = new SelectOption();
                option.Value = "bg";
                option.Text = "Bulgarian";
                options.Add(option);

                return options;
            }
        }

        // override the default width of the select DOM element
        [Category("Appearance")]
        public override Unit SelectWidth
        {
            get { return Unit.Pixel(90); }
        }

        #endregion
    }

    // Custom 'TranslateTo' button
    [ParseChildren(true)]
    [PersistChildren(false)]
    public class TranslateTo : SelectLanguage
    {
        #region [ Properties ]

        // what client-side type to initiate (it is declared in the ASPX file)
        protected override string ClientControlType
        {
            get { return "CustomButton.TranslateTo"; }
        }

        // Label of the 'Select' button if not found in Localization
        public override string DefaultLabel
        {
            get { return "to"; }
        }

        // default empty option if not found in Localization
        public override string DefaultOptionText
        {
            get { return "[select]"; }
        }

        #endregion
    }

    // Custom 'TranslateFrom' button
    [ParseChildren(true)]
    [PersistChildren(false)]
    public class TranslateFrom : SelectLanguage
    {
        #region [ Properties ]

        // what client-side type to initiate (it is declared in the ASPX file)
        protected override string ClientControlType
        {
            get { return "CustomButton.TranslateFrom"; }
        }

        // Label of the 'Select' button if not found in Localization
        public override string DefaultLabel
        {
            get { return "Translate from"; }
        }

        // default empty option if not found in Localization
        public override string DefaultOptionText
        {
            get { return "auto"; }
        }

        #endregion
    }
}
