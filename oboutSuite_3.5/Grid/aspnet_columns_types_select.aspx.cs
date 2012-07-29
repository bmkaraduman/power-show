using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_columns_types_select : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ((CheckBoxSelectColumn)Grid1.Columns[1]).ControlType = RbtnStandard.Checked ? GridControlType.Standard : GridControlType.Obout;
    }
}