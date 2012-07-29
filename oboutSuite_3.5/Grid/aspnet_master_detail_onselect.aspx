<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

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
    </style>

    <script type="text/javascript">
        function loadDetails(sender, arrSelectedRecords, primaryKeyColumn) {
            var record = arrSelectedRecords[0];

            var rowIndex = 0;
            var primaryKeyValue = arrSelectedRecords[0][primaryKeyColumn];
            for (var i = 0; i < sender.Rows.length; i++) {
                if (sender.Rows[i] && primaryKeyValue == sender.Rows[i].Cells[primaryKeyColumn].Value) {
                    rowIndex = i;
                    break;
                }
            }

            var row = sender.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes[rowIndex];
            var images = row.getElementsByTagName('IMG');
            for (var i = 0; i < images.length; i++) {
                if (images[i].parentNode.className == 'ob_gDGEB') {
                    images[i].onclick();
                    break;
                }
            }
        }
    </script>

</head>
<body>
    <form runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - Master / Detail - Expand/Collapse details on
        select </b></span>
    <br />
    <br />
    <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" DataSourceID="sds1"
        FolderStyle="styles/grand_gray" AllowAddingRecords="false">
        <ClientSideEvents ExposeSender="true" OnClientSelect="function(sender, records) {loadDetails(sender, records, 'CustomerID');}" />
        <Columns>
            <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false">
            </obout:Column>
            <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250">
            </obout:Column>
            <obout:Column DataField="ContactName" HeaderText="CONTACT NAME">
            </obout:Column>
            <obout:Column DataField="Country" HeaderText="COUNTRY">
            </obout:Column>
        </Columns>
        <MasterDetailSettings LoadingMode="OnCallback" />
        <DetailGrids>
            <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" AllowAddingRecords="false"
                ShowFooter="true" DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="CustomerID" AllowPaging="false" AllowPageSizeSelection="false">
                <ClientSideEvents ExposeSender="true" OnClientSelect="function(sender, records) {loadDetails(sender, records, 'OrderID');}" />
                <Columns>
                    <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false">
                    </obout:Column>
                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false">
                    </obout:Column>
                    <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}"
                        Width="225">
                    </obout:Column>
                    <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}">
                    </obout:Column>
                    <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}">
                    </obout:Column>
                </Columns>
                <MasterDetailSettings LoadingMode="OnCallback" />
                <DetailGrids>
                    <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" AllowAddingRecords="false"
                        ShowFooter="true" DataSourceID="sds3" FolderStyle="styles/grand_gray" ForeignKeys="OrderID"
                        AllowPaging="false" AllowPageSizeSelection="false">
                        <Columns>
                            <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false">
                            </obout:Column>
                            <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}"
                                Width="185">
                            </obout:Column>
                            <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="185">
                            </obout:Column>
                            <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%"
                                Width="185">
                            </obout:Column>
                        </Columns>
                    </obout:DetailGrid>
                </DetailGrids>
            </obout:DetailGrid>
        </DetailGrids>
    </obout:Grid>
    <br />
    <br />
    
    <span class="tdText">The detail grids can be expanded / collapsed when selecting a row in the master grid.</span>
    
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb">
        <SelectParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb">
        <SelectParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
<style type="text/css">
    .ob_gDGEB img
    {
        visibility: hidden;
    }
</style>
