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

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
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
            background-color: ____:#f6f9fc;padding-left:4px;padding-right:4px;}
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


        var filterCriteria;
        function getCookie(c_name) {
            if (document.cookie.length > 0) {
                c_start = document.cookie.indexOf(c_name + "=");
                if (c_start != -1) {
                    c_start = c_start + c_name.length + 1;
                    c_end = document.cookie.indexOf(";", c_start);
                    if (c_end == -1) c_end = document.cookie.length;
                    return unescape(document.cookie.substring(c_start, c_end));
                }
            }
            return "";
        }

        function setCookie(c_name, value, expiredays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + expiredays);
            document.cookie = c_name + "=" + escape(value) +
                ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
        }


        function storeFilter() {
            var colsCount = grid1.GridBodyContainer.firstChild.firstChild.firstChild.firstChild.childNodes.length;

            for (var i = 0; i < colsCount; i++) {
                var filterDdl = eval('ob_ob_grid1FilterContainerFCTb' + i);
                var filterTxt = eval('ob_grid1FilterControl' + i);

                if (filterDdl && filterTxt) {
                    setCookie(filterDdl.ID, filterDdl.value(), 365);
                    setCookie(filterTxt.ID, filterTxt.value(), 365);
                }
            }
        }

        function addLoadEvent(func) {

            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function() {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                }
            }
        }

        function initialFilter() {
            grid1.showFilter();

            var colsCount = grid1.GridBodyContainer.firstChild.firstChild.firstChild.firstChild.childNodes.length;

            for (var i = 0; i < colsCount; i++) {
                var filterDdl = eval('ob_ob_grid1FilterContainerFCTb' + i);
                var filterTxt = eval('ob_grid1FilterControl' + i);

                if (filterDdl && filterTxt) {
                    filterDdl.value(getCookie(filterDdl.ID));
                    filterTxt.value(getCookie(filterTxt.ID));
                }
            }

            window.setTimeout("grid1.filter();", 300);

        }
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Filtering - Keeping State</b></span>
    
    <br /><br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="false"
        AllowFiltering="true" FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
        AllowPageSizeSelection="false">
    
        <Columns>
            <obout:Column ID="Column1" DataField="SupplierID" ReadOnly="true" HeaderText="ID"
                Width="120" Visible="true" runat="server" />
            <obout:Column ID="Column2" DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"
                runat="server" />
            <obout:Column ID="Column3" DataField="Address" HeaderText="COMPANY ADDRESS" Width="250"
                runat="server" />
            <obout:Column ID="Column5" DataField="Country" HeaderText="COUNTRY" Width="150" runat="server" />
        </Columns>
        
    </obout:Grid>
    
    <br /><br /><br />
    
    <span class="tdText">
        The applied filters can be stored in cookies. This allows users to keep their filter when they navigate back to the page. 
    </span>
        
    <br /><br /><br />
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    </form>
    
</body>

<script type="text/javascript">

    addLoadEvent(function() {
        oboutGrid.prototype.filterOld = oboutGrid.prototype.filter;
        oboutGrid.prototype.filter = function() {
            storeFilter();
            this.filterOld();
        }

        window.setTimeout('initialFilter()', 500);
    });
    
</script>

</html>
