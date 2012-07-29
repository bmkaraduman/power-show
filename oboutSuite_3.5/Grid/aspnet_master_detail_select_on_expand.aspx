<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void EmptyCommand(object sender, GridRecordEventArgs e)
    {

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
    </style>

    <script type="text/javascript">
        function onEmptyCommand(record) {
            alert('The operation was successful. For this example, the database has not been updated.');
        }

        window.onload = function() {
            oboutGrid.prototype.manageDetailGridsExpandedState_old = oboutGrid.prototype.manageDetailGridsExpandedState;
            oboutGrid.prototype.manageDetailGridsExpandedState = function(obj) {
                this.manageDetailGridsExpandedState_old(obj);
                var row = obj.parentNode.parentNode.parentNode.parentNode;
                var index = 0;
                while (row.previousSibling) {
                    row = row.previousSibling;
                    index++;
                }

                if (this.SelectedRecords.length > 0) {
                    deselectAllRecords(this);
                }

                this.selectRecord(index);

                this.PreviouslySelectedIndex = index;
            }
        }


        function deselectAllRecords(e) {
            var recordCount = e.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes.length;
            for (var i = 0; i < recordCount; i++) {
                e.deselectRecord(i);
            }
        }

    </script>

</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - Master / Detail - Select on Expand / Collapse</b></span>
    <br />
    <br />
    
    <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5" DataSourceID="sds1"
        FolderStyle="styles/premiere_blue" AllowAddingRecords="true" AllowFiltering="true"
        OnInsertCommand="EmptyCommand" OnUpdateCommand="EmptyCommand" OnDeleteCommand="EmptyCommand">
        <ClientSideEvents OnClientInsert="onEmptyCommand" OnClientUpdate="onEmptyCommand"
            OnClientDelete="onEmptyCommand" />
        <Columns>
            <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false">
            </obout:Column>
            <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250">
            </obout:Column>
            <obout:Column DataField="ContactName" HeaderText="CONTACT NAME">
            </obout:Column>
            <obout:Column DataField="Country" HeaderText="COUNTRY">
            </obout:Column>
            <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true">
            </obout:Column>
        </Columns>
        <MasterDetailSettings LoadingMode="OnCallback" />
        <DetailGrids>
            <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" AllowAddingRecords="true"
                ShowFooter="true" PageSize="5" DataSourceID="sds2" FolderStyle="styles/premiere_blue"
                ForeignKeys="CustomerID" OnInsertCommand="EmptyCommand" OnUpdateCommand="EmptyCommand"
                OnDeleteCommand="EmptyCommand">
                <ClientSideEvents OnClientInsert="onEmptyCommand" OnClientUpdate="onEmptyCommand"
                    OnClientDelete="onEmptyCommand" />
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
                    <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="170">
                    </obout:Column>
                </Columns>
                <MasterDetailSettings LoadingMode="OnCallback" />
                <DetailGrids>
                    <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" AllowAddingRecords="true"
                        ShowFooter="true" PageSize="5" DataSourceID="sds3" FolderStyle="styles/premiere_blue"
                        ForeignKeys="OrderID" OnInsertCommand="EmptyCommand" OnUpdateCommand="EmptyCommand"
                        OnDeleteCommand="EmptyCommand">
                        <ClientSideEvents OnClientInsert="onEmptyCommand" OnClientUpdate="onEmptyCommand"
                            OnClientDelete="onEmptyCommand" />
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
                            <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="160">
                            </obout:Column>
                        </Columns>
                    </obout:DetailGrid>
                </DetailGrids>
            </obout:DetailGrid>
        </DetailGrids>
    </obout:Grid>
    
    <br />
    <br />
    <span class="tdText">The master row will be selected when clicking the + / - buttons
        to expand / collapse the details. </span>
        
    <asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        SelectCommand="SELECT TOP 15 * FROM [Customers]"></asp:SqlDataSource>
        
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
