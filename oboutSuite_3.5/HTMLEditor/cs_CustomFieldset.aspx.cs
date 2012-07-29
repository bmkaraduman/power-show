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


public partial class HTMLEditor_cs_CustomFieldset : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        // add separator to top toolbar
        editor.TopToolbar.AddButtons.Add(new HorizontalSeparator());
        // add our custom 'Insert Fieldset' button to the the top toolbar
        editor.TopToolbar.AddButtons.Add(new InsertFieldset());

        // Add custom item to the context menu - edit Fieldset properties
        editor.EditPanel.ContextMenu.AddItems.Add(new EditFieldsetItem());
        // Add custom item to the context menu - remove Fieldset element
        editor.EditPanel.ContextMenu.AddItems.Add(new RemoveFieldsetItem());
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            StreamReader input;

            input = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII);
            editor.Content = input.ReadToEnd();
            input.Close();
        }
    }

    // Custom 'Insert Fieldset' button
    [ParseChildren(true)]
    [PersistChildren(false)]
    public class InsertFieldset : OpenPopupButton
    {
        #region [ Properties ]

        // tooltip if not found in Localization
        public override string DefaultToolTip
        {
            get { return "Insert Fieldset"; }
        }

        // associated popup (custom popup declared below)
        public override Popup RelatedPopup
        {
            get
            {
                if (base.RelatedPopup == null)
                {
                    base.RelatedPopup = new FieldsetProperties();
                }
                return base.RelatedPopup;
            }
        }

        // custom buttons images folder
        protected override string ButtonImagesFolder
        {
            get { return "~/App_Obout/HTMLEditor/customButtons/"; }
        }

        // base name of this button image,
        protected override string BaseImageName
        {
            get { return "ed_insertFieldset"; }
        }

        #endregion
    }

    // custom 'Fieldset properties' popup
    [ParseChildren(true)]
    public class FieldsetProperties : OkCancelPopup
    {
        #region [ Fields ]

        private TextBox _Width = null;
        private PopupUnitToggle WidthUnitToggle = null;
        private TextBox _Height = null;
        private PopupUnitToggle HeightUnitToggle = null;
        private TextBox _Padding = null;
        private TextBox _Margin = null;

        #endregion

        #region [ Properties ]

        // what client-side type to initiate (it is declared in the ASPX file)
        protected override string ClientControlType
        {
            get { return "CustomPopup.FieldsetProperties"; }
        }

        protected virtual TextBox Padding // Field in the popup
        {
            get
            {
                if (_Padding == null)
                {
                    _Padding = new TextBox();
                    _Padding.Style["width"] = "30px";
                    _Padding.Style["height"] = "15px";
                    _Padding.MaxLength = 4;
                }
                return _Padding;
            }
        }

        protected virtual TextBox Margin // Field in the popup
        {
            get
            {
                if (_Margin == null)
                {
                    _Margin = new TextBox();
                    _Margin.Style["width"] = "30px";
                    _Margin.Style["height"] = "15px";
                    _Margin.MaxLength = 4;
                }
                return _Margin;
            }
        }

        protected virtual TextBox FieldsetWidth // Field in the popup
        {
            get
            {
                if (_Width == null)
                {
                    _Width = new TextBox();
                    _Width.Style["width"] = "30px";
                    _Width.Style["height"] = "15px";
                    _Width.MaxLength = 4;
                }
                return _Width;
            }
        }

        protected virtual TextBox FieldsetHeight // Field in the popup
        {
            get
            {
                if (_Height == null)
                {
                    _Height = new TextBox();
                    _Height.Style["width"] = "30px";
                    _Height.Style["height"] = "15px";
                    _Height.MaxLength = 4;
                }
                return _Height;
            }
        }

        // Title of the popup if not found in Localization
        protected override string DefaultTitle
        {
            get { return "Fieldset properties"; }
        }

        // this popup is not attached to the button
        protected override bool AttachedToButton
        {
            get { return false; }
        }

        #endregion

        #region [ Methods ]

        // fill the content of the popup
        protected override void OkCancelFillContent()
        {
            Table table = new Table();
            HtmlGenericControl holder;
            table.Attributes.Add("border", "0");
            table.Attributes.Add("cellspacing", "0");
            table.Attributes.Add("cellpadding", "2");

            TableRow row;
            TableCell cell;

            Table tableInner;
            TableRow rowInner;
            TableCell cellInner;

            Table tableInner2;
            TableRow rowInner2;
            TableCell cellInner2;

            row = new TableRow();
            table.Rows.Add(row);

            cell = new TableCell();
            row.Cells.Add(cell);
            cell.HorizontalAlign = HorizontalAlign.Left;
            cell.VerticalAlign = VerticalAlign.Top;

            tableInner = new Table();
            tableInner.Attributes.Add("border", "0");
            tableInner.Attributes.Add("cellspacing", "0");
            tableInner.Attributes.Add("cellpadding", "2");
            cell.Controls.Add(tableInner);

            if (FieldsetWidth != null) // the property is not overridden to 'null'
            {
                rowInner = new TableRow();
                tableInner.Rows.Add(rowInner);

                cellInner = new TableCell();
                rowInner.Cells.Add(cellInner);
                holder = new HtmlGenericControl("span");
                cellInner.Controls.Add(holder);
                holder.Controls.Add(new LiteralControl(GetField("Width", "Width"))); // check for localization
                cellInner.Controls.Add(new LiteralControl(": "));
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;

                cellInner = new TableCell();
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner.Cells.Add(cellInner);

                tableInner2 = new Table();
                tableInner2.Attributes.Add("border", "0");
                tableInner2.Attributes.Add("cellspacing", "0");
                tableInner2.Attributes.Add("cellpadding", "0");
                cellInner.Controls.Add(tableInner2);
                rowInner2 = new TableRow();
                tableInner2.Rows.Add(rowInner2);

                cellInner2 = new TableCell();
                cellInner2.HorizontalAlign = HorizontalAlign.Left;
                cellInner2.VerticalAlign = VerticalAlign.Middle;
                cellInner2.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner2.Cells.Add(cellInner2);
                FieldsetWidth.Style[HtmlTextWriterStyle.VerticalAlign] = "middle";
                cellInner2.Controls.Add(FieldsetWidth);

                cellInner2 = new TableCell();
                cellInner2.HorizontalAlign = HorizontalAlign.Left;
                cellInner2.VerticalAlign = VerticalAlign.Middle;
                cellInner2.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner2.Cells.Add(cellInner2);
                WidthUnitToggle = new PopupUnitToggle(); // "px/%" toggle button
                WidthUnitToggle.Name = "widthUnitToggle";
                cellInner2.Controls.Add(WidthUnitToggle);
            }
            if (Margin != null) // the property is not overridden to 'null'
            {
                rowInner = new TableRow();
                tableInner.Rows.Add(rowInner);

                cellInner = new TableCell();
                rowInner.Cells.Add(cellInner);
                holder = new HtmlGenericControl("span");
                cellInner.Controls.Add(holder);
                holder.Controls.Add(new LiteralControl(GetField("Margin", "Margin"))); // check for localization
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Controls.Add(new LiteralControl(": "));

                cellInner = new TableCell();
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner.Cells.Add(cellInner);
                Margin.Style[HtmlTextWriterStyle.VerticalAlign] = "middle";
                cellInner.Controls.Add(Margin);
                cellInner.Controls.Add(new LiteralControl("&nbsp;px"));
            }

            cell = new TableCell();
            row.Cells.Add(cell);
            cell.HorizontalAlign = HorizontalAlign.Left;
            cell.VerticalAlign = VerticalAlign.Top;

            tableInner = new Table();
            tableInner.Attributes.Add("border", "0");
            tableInner.Attributes.Add("cellspacing", "0");
            tableInner.Attributes.Add("cellpadding", "2");
            cell.Controls.Add(tableInner);

            if (FieldsetHeight != null) // the property is not overridden to 'null'
            {
                rowInner = new TableRow();
                tableInner.Rows.Add(rowInner);

                cellInner = new TableCell();
                rowInner.Cells.Add(cellInner);
                holder = new HtmlGenericControl("span");
                cellInner.Controls.Add(holder);
                holder.Controls.Add(new LiteralControl(GetField("Height", "Height"))); // check for localization
                cellInner.Controls.Add(new LiteralControl(": "));
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;

                cellInner = new TableCell();
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner.Cells.Add(cellInner);

                tableInner2 = new Table();
                tableInner2.Attributes.Add("border", "0");
                tableInner2.Attributes.Add("cellspacing", "0");
                tableInner2.Attributes.Add("cellpadding", "0");
                cellInner.Controls.Add(tableInner2);
                rowInner2 = new TableRow();
                tableInner2.Rows.Add(rowInner2);

                cellInner2 = new TableCell();
                cellInner2.HorizontalAlign = HorizontalAlign.Left;
                cellInner2.VerticalAlign = VerticalAlign.Middle;
                cellInner2.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner2.Cells.Add(cellInner2);
                FieldsetHeight.Style[HtmlTextWriterStyle.VerticalAlign] = "middle";
                cellInner2.Controls.Add(FieldsetHeight);

                cellInner2 = new TableCell();
                cellInner2.HorizontalAlign = HorizontalAlign.Left;
                cellInner2.VerticalAlign = VerticalAlign.Middle;
                cellInner2.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner2.Cells.Add(cellInner2);
                HeightUnitToggle = new PopupUnitToggle(); // "px/%" toggle button
                HeightUnitToggle.Name = "heightUnitToggle";
                cellInner2.Controls.Add(HeightUnitToggle);
            }
            if (Padding != null) // the property is not overridden to 'null'
            {
                rowInner = new TableRow();
                tableInner.Rows.Add(rowInner);

                cellInner = new TableCell();
                rowInner.Cells.Add(cellInner);
                holder = new HtmlGenericControl("span");
                cellInner.Controls.Add(holder);
                holder.Controls.Add(new LiteralControl(GetField("Padding", "Padding"))); // check for localization
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Controls.Add(new LiteralControl(": "));

                cellInner = new TableCell();
                cellInner.HorizontalAlign = HorizontalAlign.Left;
                cellInner.VerticalAlign = VerticalAlign.Middle;
                cellInner.Style[HtmlTextWriterStyle.WhiteSpace] = "nowrap";
                rowInner.Cells.Add(cellInner);
                Padding.Style[HtmlTextWriterStyle.VerticalAlign] = "middle";
                cellInner.Controls.Add(Padding);
                cellInner.Controls.Add(new LiteralControl("&nbsp;px"));
            }

            Content.Add(table);
        }

        // override the base method
        protected override void OnPreRender(EventArgs e)
        {
            // Ensure that fields in popup have 'ID' attribute

            if (FieldsetWidth != null) if (FieldsetWidth.ClientID.Length > 0) FieldsetWidth.Attributes.Add("id", FieldsetWidth.ClientID);
            if (FieldsetHeight != null) if (FieldsetHeight.ClientID.Length > 0) FieldsetHeight.Attributes.Add("id", FieldsetHeight.ClientID);
            if (Padding != null) if (Padding.ClientID.Length > 0) Padding.Attributes.Add("id", Padding.ClientID);
            if (Margin != null) if (Margin.ClientID.Length > 0) Margin.Attributes.Add("id", Margin.ClientID);

            base.OnPreRender(e);
        }

        // override the base method
        protected override void DescribeComponent(ScriptComponentDescriptor descriptor)
        {
            // Register fields and handlers for use in client-side

            if (FieldsetWidth != null) if (FieldsetWidth.ClientID.Length > 0) RegisteredFields.Add(new RegisteredField("width", FieldsetWidth));
            if (FieldsetHeight != null) if (FieldsetHeight.ClientID.Length > 0) RegisteredFields.Add(new RegisteredField("height", FieldsetHeight));
            if (WidthUnitToggle != null) RegisteredHandlers.Add(new RegisteredField("widthUnitToggle", WidthUnitToggle));
            if (HeightUnitToggle != null) RegisteredHandlers.Add(new RegisteredField("heightUnitToggle", HeightUnitToggle));
            if (Padding != null) if (Padding.ClientID.Length > 0) RegisteredFields.Add(new RegisteredField("padding", Padding));
            if (Margin != null) if (Margin.ClientID.Length > 0) RegisteredFields.Add(new RegisteredField("margin", Margin));

            base.DescribeComponent(descriptor);
        }

        #endregion
    }

    // custom 'Edit Fieldset properties' item for context menu
    [ParseChildren(false)]
    public class EditFieldsetItem : DesignModePopupItem
    {
        #region [ Properties ]

        // element tag name
        public sealed override string ElementTagName
        {
            get { return "fieldset"; }
        }

        // image for the item
        protected override string ImageSrc
        {
            get { return this.LocalResolveUrl("~/App_Obout/HTMLEditor/customButtons/ed_insertFieldset_n.gif"); }
        }

        // associated popup (custom popup declared above)
        public override Popup RelatedPopup
        {
            get
            {
                if (base.RelatedPopup == null)
                {
                    base.RelatedPopup = new FieldsetProperties();
                }
                return base.RelatedPopup;
            }
        }

        // item text if not found in Localization
        public override string DefaultToolTip
        {
            get { return "Edit Fieldset"; }
        }

        #endregion
    }

    // custom 'Remove Fieldset' item for context menu
    [ParseChildren(false)]
    public class RemoveFieldsetItem : DesignModeItem
    {
        #region [ Properties ]

        // what client-side type to initiate (it is declared in the ASPX file)
        protected override string ClientControlType
        {
            get { return "CustomContextMenu.RemoveFieldsetItem"; }
        }

        // element tag name
        public sealed override string ElementTagName
        {
            get { return "fieldset"; }
        }

        // image for the item
        protected override string ImageSrc
        {
            get { return this.LocalResolveUrl("~/App_Obout/HTMLEditor/customButtons/ed_removeFieldset.gif"); }
        }

        // item text if not found in Localization
        public override string DefaultToolTip
        {
            get { return "Remove Fieldset"; }
        }

        #endregion
    }
}
