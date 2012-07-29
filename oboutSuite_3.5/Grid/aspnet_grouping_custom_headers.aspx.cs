using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.Grid;
using System.Data.OleDb;
using System.Data;

public partial class Grid_aspnet_grouping_custom_headers : System.Web.UI.Page
{
    GridRow lastGroupHeader;

    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    
    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow)
        {
            if (lastGroupHeader != null)
            {
                Literal textContainer = lastGroupHeader.Cells[0].Controls[0].Controls[lastGroupHeader.Cells[0].Controls[0].Controls.Count - 1].Controls[0] as Literal;
                textContainer.Text = ((GridDataControlFieldCell)e.Row.Cells[2]).Text;

                textContainer.Text += "&#160;&#187;&#160;";

                HyperLink link = new HyperLink();
                link.CssClass = "header-link";
                link.Attributes["onclick"] = "alert('In a real application the category form should open.')";
                link.NavigateUrl = "aspnet_grouping_custom_headers.aspx?CategoryID=" + ((GridDataControlFieldCell)e.Row.Cells[1]).Text;
                link.Text = "Edit Category";

                textContainer.Parent.Controls.Add(link);

                lastGroupHeader = null;
            }            
            
        }
        else if (e.Row.RowType == GridRowType.GroupHeader)
        {
            if (e.Row.GroupLevel == 0)
            {
                lastGroupHeader = e.Row;
            }
        }
        
    }
}