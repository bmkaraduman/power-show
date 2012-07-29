<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.Sql" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head>
        <title>OBOUT - ASP.NET Grid - Scrolling Using Percentages</title>
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
        <form runat="server">
            <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="true"
                FolderStyle="../grid/styles/black_glass" PageSize="50" AllowGrouping="true" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true">
                <ScrollingSettings ScrollHeight="60%" ScrollWidth="70%" />
            </obout:Grid>
            
            <br /><br />
            
            <span class="tdText">
                The <b>ScrollHeight</b> and <b>ScrollWidth</b> properties may be specified using percentages.<br /><br />
                <b>Resize the browser window and the grid will resize accordingly.</b>
            </span>
            
            <br /><br />
            
            <a href="aspnet_scroll_percentages.aspx">« Back</a>
    		
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 100 * FROM Orders ORDER BY OrderID DESC"
		     ConnectionString="<%$ ConnectionStrings:northwind%>" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
		 </form>
    </body>
</html>
