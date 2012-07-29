<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
    void Page_load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
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
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
        .tdTextSmall
        {
            font: 9px Verdana;
            color: #333333;
        }
    </style>
</head>
<body>
    <form runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Customize for Mobile Devices</b></span>
    
    <br />
    <br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AllowPageSizeSelection="false"
        AllowRecordSelection="false" AutoGenerateColumns="false" FolderStyle="styles/grand_gray"
        PageSize="5" AllowSorting="false" AllowAddingRecords="false" OnRebind="RebindGrid"
        OnUpdateCommand="UpdateRecord">
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" Visible="true" ReadOnly="true" HeaderText="SHIP INFORMATION"
                Width="250" runat="server">
                <TemplateSettings TemplateId="tplFormView" EditTemplateId="tplRowEdit" RowEditTemplateControlId="txtOrderID"
                    RowEditTemplateControlPropertyName="innerHTML" />
            </obout:Column>
            <obout:Column ID="Column2" DataField="ShipName" Width="125" HeaderText="NAME" runat="server"
                Visible="false">
                <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column3" DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS"
                runat="server">
                <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
        </Columns>
        <TemplateSettings RowEditTemplateId="tplRowEdit" />
        <Templates>
            <obout:GridTemplate runat="server" ID="tplRowEdit">
                <Template>
                    <table class="rowEditTable">
                        <tr>
                            <td valign="top">
                                <fieldset>
                                    <legend>Ship Information</legend>
                                    <table>
                                        <tr>
                                            <td>
                                                ID:
                                            </td>
                                            <td>
                                                <span id="txtOrderID"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Name:
                                            </td>
                                            <td>
                                                <input type="text" id="txtShipName" class="ob_gEC" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Address:
                                            </td>
                                            <td>
                                                <input type="text" id="txtShipAddress" class="ob_gEC" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input id="btnSave" type="button" value="Save" onclick="grid1.save()" class="tdTextSmall" />
                                <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdTextSmall" />
                            </td>
                        </tr>
                    </table>
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate ID="tplFormView" runat="server">
                <Template>
                    <table class="rowEditTable">
                        <tr>
                            <td valign="top">
                                <table>
                                    <tr>
                                        <td>
                                            ID:
                                        </td>
                                        <td>
                                            <%#Container.DataItem["OrderID"]%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Name:
                                        </td>
                                        <td>
                                            <%#Container.DataItem["ShipName"]%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Address:
                                        </td>
                                        <td>
                                            <%#Container.DataItem["ShipAddress"]%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <input type="button" id="btnEdit" class="tdTextSmall" value="Edit" onclick="grid1.editRecord(<%# Container.PageRecordIndex %>)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>
    
    <br />
    <br />
    
    <span class="tdText">
        The Grid can be customized to display all the data in a single column, for both view and edit mode.
        <br />
        This is very useful for displaying data on mobile devices.
    </span>
    
    <br />
    <br />
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    <br />
    
    </form>
    <style type="text/css">
        .ob_gFRP
        {
            display: none;
        }
        .ob_gRETpl /*.ob_gridRowEditTemplate*/
        {
            padding: 5px;
        }
        .ob_gRC /*.ob_gridResizableContent*/
        {
            padding-left: 4px;
        }
        .ob_gFContent table td /* .ob_gridFooterContent table td */
        {
            text-align: left;
        }
    </style>
</body>
</html>
