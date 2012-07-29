using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperForm_aspnet_api_client_external_buttons : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UpdateButtonsState();
        }
    }

    protected void SuperForm1_ModeChanged(object sender, EventArgs e)
    {
        UpdateButtonsState();
    }

    protected void UpdateButtonsState()
    {
        bool showEdit = false;
        bool showDelete = false;
        bool showNew = false;
        bool showUpdate = false;
        bool showInsert = false;
        bool showCancel = false;

        if (SuperForm1.CurrentMode == DetailsViewMode.ReadOnly)
        {
            showEdit = true;
            showDelete = true;
            showNew = true;
        }
        else if (SuperForm1.CurrentMode == DetailsViewMode.Edit)
        {
            showUpdate = true;
            showCancel = true;
        }
        else
        {
            showInsert = true;
            showCancel = true;
        }

        ExternalEdit.Visible = showEdit;
        ExternalDelete.Visible = showDelete;
        ExternalNew.Visible = showNew;
        ExternalUpdate.Visible = showUpdate;
        ExternalInsert.Visible = showInsert;
        ExternalCancel.Visible = showCancel;
    }
}
