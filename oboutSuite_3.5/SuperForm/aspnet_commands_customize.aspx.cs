using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_commands_customize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CommandField field = SuperForm1.Fields[SuperForm1.Fields.Count - 1] as CommandField;

        if (ButtonType1.Checked)
        {
            field.ButtonType = ButtonType.Button;
        }
        else if (ButtonType2.Checked)
        {
            field.ButtonType = ButtonType.Image;
            field.EditImageUrl = "resources/icons/Edit.png";
            field.DeleteImageUrl = "resources/icons/Delete.png";
            field.NewImageUrl = "resources/icons/Add.png";
            field.InsertImageUrl = "resources/icons/Save.png";
            field.UpdateImageUrl = "resources/icons/Save.png";
            field.CancelImageUrl = "resources/icons/Delete.png";
        }
        else
        {
            field.ButtonType = ButtonType.Link;
        }

        field.ShowCancelButton = ShowCancelButton.Checked;
        field.ShowDeleteButton = ShowDeleteButton.Checked;
        field.ShowEditButton = ShowEditButton.Checked;
        field.ShowInsertButton = ShowInsertButton.Checked;
    }
}
