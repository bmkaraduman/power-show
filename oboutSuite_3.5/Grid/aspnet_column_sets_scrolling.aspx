<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_column_sets_scrolling.aspx.cs" Inherits="Grid_aspnet_column_sets_scrolling" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Scroll Column Sets Horizontally</b></span>
    
    <br />
    <br />

    <obout:Grid ID="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" DataSourceID="SqlDataSource1">
        <Columns>
            <obout:Column ID="Column1" DataField="CustomerID" ReadOnly="true" Visible="false" runat="server" />
            <obout:Column ID="Column2" DataField="OrderID" ReadOnly="true" Visible="false" runat="server" />
            <obout:Column ID="Column3" DataField="CompanyName" HeaderText="COMPANY NAME" runat="server" />
            <obout:Column ID="Column4" DataField="ContactName" HeaderText="CONTACT NAME" runat="server" />
            <obout:Column ID="Column5" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
            <obout:Column ID="Column6" DataField="ShipAddress" HeaderText="ADDRESS" Width="125" runat="server" />
            <obout:Column ID="Column7" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
            <obout:Column ID="Column8" DataField="OrderDate" HeaderText="ORDER DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
            <obout:Column ID="Column9" DataField="ShippedDate" HeaderText="SHIPPED DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
            <obout:Column ID="Column10" DataField="RequiredDate" HeaderText="REQUIRED DATE" Width="145" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
        <ScrollingSettings ScrollWidth="600" />
    </obout:Grid>

    <br />

    <div class="tdText" style="width: 600px;">
        The columns of the Grid can be grouped in column sets. The column sets will be automatically resized when the columns are resized.
        The Grid allows developers to create multiple levels of column sets.<br /><br />
        
        Currently column sets may be added only from the client-side. First, you need to load the "column-set.js" file from the 
        "oboutSuite / Grid / resources / custom_scripts / column-set" folder at the bottom of your page<br />
        <span class="option2">&lt;script type="text/javascript" src="resources/custom_scripts/column-set/column-set.js"&gt;&lt;/script&gt;</span><br /><br />
        You also need to load the custom stylesheet required by this feature (e.g. in the &lt;head&gt; section):<br />
        <span class="option2">&lt;link href="resources/custom_scripts/column-set/column-set.css" rel="stylesheet" type="text/css" /&gt;</span>
        <br /><br />
        
        Then, call the <span class="option2">addColumnSet</span> client-side method for each column set that you want to add:<br />
        <span class="option2">Grid1.addColumnSet(level, startColumnIndex, endColumnIndex, text);</span> where
        <ul>
            <li><span class="option2">level</span> - indicates the level where the column index will be added (first level is 0);</li>
            <li><span class="option2">startColumnIndex</span> - indicates the index of the first column from the column set;</li>
            <li><span class="option2">endColumnIndex</span> - indicates the index of the last column from the column set;</li>
            <li><span class="option2">text</span> - indicates the text of the column set.</li>
        </ul>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 50 C.CustomerID, C.CompanyName, C.ContactName, O.OrderID, O.ShipCity, O.ShipAddress, O.ShipCountry, O.OrderDate, O.ShippedDate, O.RequiredDate 
                        FROM [Orders] O INNER JOIN CUSTOMERS C ON O.CustomerID = C.CustomerID ORDER BY OrderID DESC">
    </asp:SqlDataSource>

    <script type="text/javascript" src="resources/custom_scripts/column-set/column-set.js"></script>

</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <link href="resources/custom_scripts/column-set/column-set.css" rel="Stylesheet" type="text/css" />

    <script type="text/javascript">
        window.onload = function () {
            //Grid1.addColumnSet(level, startColumnIndex, endColumnIndex, text);
            Grid1.addColumnSet(0, 2, 3, 'CUSTOMER');
            Grid1.addColumnSet(0, 4, 6, 'SHIP ADDRESS');
            Grid1.addColumnSet(0, 7, 9, 'SHIP DATES');
        }
    </script>
</asp:Content>