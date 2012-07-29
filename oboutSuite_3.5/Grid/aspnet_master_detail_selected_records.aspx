<%@ Page Language="C#" EnableEventValidation="false" %>
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
        .tdTextSmall
        {
            font: 9px Verdana;
            color: #333333;
        }
    </style>

    <script type="text/javascript">

        function OnSelect(sender, arrSelectedRecords) {
            var oDiv = document.getElementById("divSelectedRecords");
            oDiv.innerHTML = getSelectedRecord(sender);
        }

        function getSelectedRecord(sender) {
            var sMessage;

            if (sender.SelectedRecords.length >= 1) {
                sMessage = "<br />These are all the selected records in : " + sender.ID + "<br />";
            } else {
                sMessage = "<br />There are no selected records in : " + sender.ID + "<br />";
            }

            for (var i = 0; i < sender.SelectedRecords.length; i++) {

                var record = sender.SelectedRecords[i];
                sMessage += "<br />";

                for (var k in record) {
                    sMessage += record[k] + " --- ";
                }

                sMessage = sMessage.replace(' --- true --- true ---', '');
            }

            return sMessage;
        }


        function GetSelectedRecords() {

            var detailGrids = grid1.DetailGrids;
            var sMessages = "";

            if (detailGrids) {
                for (var i = 0; i < detailGrids.length; i++) {
                    sMessages += getSelectedRecord(detailGrids[i]) + "<br />";
                }
            }

            var oDiv = document.getElementById("divSelectedRecords");
            oDiv.innerHTML = sMessages;
        }
		    
		    
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - Master / Detail - Accessing Selected Records
        on the Client-Side </b></span>
    <br />
    <br />
    <table>
        <tr>
            <td style="vertical-align: top">
                <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" ShowFooter="true"
                    DataSourceID="sds1" FolderStyle="styles/grand_gray" AllowAddingRecords="false" AllowPaging="false" AllowPageSizeSelection="false">
                    <ClientSideEvents OnClientSelect="OnSelect" ExposeSender="true" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Width="50">
                        </obout:Column>
                        <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250">
                        </obout:Column>
                        <obout:Column DataField="ContactName" HeaderText="CONTACT NAME">
                        </obout:Column>
                        <obout:Column DataField="Country" HeaderText="COUNTRY">
                        </obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnCallback" State="Collapsed" />
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" AllowAddingRecords="false"
                            ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                            DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="CustomerID">
                            <ClientSideEvents OnClientSelect="OnSelect" ExposeSender="true" />
                            <Columns>
                                <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}"
                                    Width="225">
                                </obout:Column>
                                <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}">
                                </obout:Column>
                                <obout:Column DataField="Freight" HeaderText="FREIGHT">
                                </obout:Column>
                            </Columns>
                        </obout:DetailGrid>
                    </DetailGrids>
                </obout:Grid>
            </td>
            <td>
                &nbsp;
            </td>
            <td style="vertical-align: top">
                <div class="tdText" runat="server" style="border: 1px solid #000; height: 250px;
                    width: 425px; overflow: auto;" id="divSelectedRecords">
                </div>
                <span class="tdText">Click to show selected records in all details grids:</span>
                <input type="button" class="tdText" value="Get Records" onclick="GetSelectedRecords()" /><br />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <span class="tdText">You can use the client-side API of the Grid to access the selected
        records from the detail grids. </span>
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT TOP 3 * FROM [Orders] WHERE CustomerID = ?"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb">
        <SelectParameters>
            <asp:Parameter Name="CustomerID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
