<%@ Page Language="C#" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    DetailGrid grid2 = new DetailGrid();

    void Page_load(object sender, EventArgs e)
    {
        // Creating grid1
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = false;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;
        grid1.ShowFooter = true;
        grid1.AllowPageSizeSelection = false;
        grid1.AllowPaging = false;
        grid1.DataSourceID = "sds1";

        grid1.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid1.ClientSideEvents.ExposeSender = true;
        grid1.ClientSideEvents.OnClientSelect = "OnSelect";

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "CustomerID";
        oCol1.HeaderText = "CUSTOMER ID";
        oCol1.Width = "50";
        oCol1.Visible = true;

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "ContactName";
        oCol3.HeaderText = "CONTACT NAME";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);



        // Creating grid2
        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.Serialize = false;
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "styles/grand_gray";
        grid2.AllowAddingRecords = false;
        grid2.ShowFooter = true;
        grid2.AllowPageSizeSelection = false;
        grid2.AllowPaging = false;
        grid2.DataSourceID = "sds2";
        grid2.ForeignKeys = "CustomerID";

        grid2.MasterDetailSettings.LoadingMode = DetailGridLoadingMode.OnCallback;
        grid2.ClientSideEvents.ExposeSender = true;
        grid2.ClientSideEvents.OnClientSelect = "OnSelect";


        Column oCol2_3 = new Column();
        oCol2_3.DataField = "OrderDate";
        oCol2_3.HeaderText = "ORDER DATE";
        oCol2_3.Width = "225";
        oCol2_3.DataFormatString = "{0:MM/dd/yyyy}";

        Column oCol2_4 = new Column();
        oCol2_4.DataField = "ShippedDate";
        oCol2_4.HeaderText = "SHIPPED DATE";
        oCol2_4.DataFormatString = "{0:MM/dd/yyyy}";

        Column oCol2_5 = new Column();
        oCol2_5.DataField = "Freight";
        oCol2_5.HeaderText = "FREIGHT";
        oCol2_5.DataFormatString = "{0:C2}";

        // add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol2_3);
        grid2.Columns.Add(oCol2_4);
        grid2.Columns.Add(oCol2_5);


        grid1.DetailGrids.Add(grid2);



        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>obout ASP.NET Grid examples</title>

    <script type="text/javascript" language="javascript">

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
                <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
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
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    </form>
</body>
</html>
