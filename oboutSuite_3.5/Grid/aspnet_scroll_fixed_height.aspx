<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            .ob_gBody
            {
                border-bottom: 1px solid #C3C9CE;
            }
        </style>
    </head>
    <body>
        <form runat="server">
        
            <br />
            
            <span class="tdText"><b>ASP.NET Grid - Fixed Height</b></span>
            
            <br />
            <br />
            
            <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
                FolderStyle="styles/black_glass" PageSize="50" AllowGrouping="true" AllowAddingRecords="false"
                AllowFiltering="true" Height="350" DataSourceID="sds1">
                <Columns>
                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Width="125"
                        runat="server" />
                    <obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server" />
                    <obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
                    <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
                    <obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
                </Columns>
                <ScrollingSettings />
            </obout:Grid>
            
            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 100 * FROM Orders"
    		         ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
            
            <br />
            <br />
            <br />
            
            <span class="tdText">
                Use the <b>Height</b> property to specify a fixed height for the Grid (either in pixels or percentages).<br />
                The height will stay the same when paging, changing the page size, filtering, grouping, etc.
            </span>
            
            <br />
            <br />
            <br />
            
            <a href="Default.aspx?type=ASPNET">« Back to examples</a>
        
        </form>
    </body>
</html>
