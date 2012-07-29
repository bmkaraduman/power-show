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

public partial class HTMLEditor_cs_ShowHideToolbar : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        // add our custom 'Close toolbar' button
        TopToolbar.AddButtons.Add(new CloseToolbarButton());
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            EditPanel1.Content = input.ReadToEnd();
            input.Close();
        }
    }

    // declare our custom button
    public class CloseToolbarButton : Obout.Ajax.UI.HTMLEditor.ToolbarButton.ImageButton
    {
        #region [ Properties ]

        // this button should be visible in all edit modes
        public sealed override Collection<ActiveModeType> ActiveModes
        {
            get
            {
                return new Collection<ActiveModeType>() { ActiveModeType.Design, ActiveModeType.Html, ActiveModeType.Preview };
            }
        }

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
            get { return "Close the toolbar"; }
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
