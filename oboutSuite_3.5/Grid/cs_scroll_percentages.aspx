<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<script type="text/C#" runat="server">
     
    Grid grid1 = new Grid();

     void Page_load(object sender, EventArgs e)
     {
         grid1.ID = "grid1";
         grid1.CallbackMode = true;
         grid1.Serialize = true;
         grid1.AllowGrouping = true;
         grid1.AutoGenerateColumns = true;
         grid1.AllowAddingRecords = false;

         grid1.FolderStyle = "styles/black_glass";
         grid1.AllowFiltering = true;
         grid1.PageSize = 50;

         grid1.ScrollingSettings.ScrollWidth = Unit.Percentage(70);
         grid1.ScrollingSettings.ScrollHeight = Unit.Percentage(60);
                 
         grid1.DataSourceID = "sds1";

         // add the grid to the controls collection of the PlaceHolder
         phGrid1.Controls.Add(grid1);
     }
    
</script>

<html>
    <head>
        <title>obout ASP.NET Grid examples</title>
        <style type="text/css">
            .tdText
            {
                font: 11px Verdana;
                color: #333333;
            }
            .option2
            {
                font: 11px Verdana;
                color: #0033cc;
                padding-left: 4px;
                padding-right: 4px;
            }
            a
            {
                font: 11px Verdana;
                color: #315686;
                text-decoration: underline;
            }
            a:hover
            {
                color: crimson;
            }
            
            html, body, form
            {
                height: 100%;
            }
            
            .ob_gBody
            {
                border-bottom: 1px solid #EEEEEE;
            }
        </style>
    </head>
    <body>
        <form id="Form1" runat="server">
            <br />
            
            <span class="tdText"><b>ASP.NET Grid - Scrolling Using Percentages</b></span>
            
            <br />
            <br />
            
            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
            
            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 100 * FROM Orders"
    		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
            
            <br />
            <br />
            <br />
            
            <span class="tdText">
                The <b>ScrollHeight</b> and <b>ScrollWidth</b> properties may be specified using percentages.<br />
                <b>Resize the browser window and the grid will resize accordingly.</b>               
            </span>
            
            <br />
            <br />
            <br />
            
            <a href="Default.aspx?type=CSHARP">« Back to examples</a>
        </form>
    </body>
</html>
