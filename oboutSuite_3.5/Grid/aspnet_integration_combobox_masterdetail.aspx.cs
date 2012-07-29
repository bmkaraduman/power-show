using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;
using Obout.ComboBox;

public partial class Grid_aspnet_integration_combobox_ondemand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void Detail_LoadingItems(object sender, ComboBoxLoadingItemsEventArgs e)
    {
        if (!string.IsNullOrEmpty(e.Text))
        {
            int tryout = 0;
            if (int.TryParse(e.Text, out tryout))
            {
                sds2.SelectParameters[0].DefaultValue = e.Text;
            }
        }
    }
}