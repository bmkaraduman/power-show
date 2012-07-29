<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_scroll_fixed_rows.aspx.cs" Inherits="Grid_aspnet_scroll_fixed_rows" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />

	<span class="tdText"><b>ASP.NET Grid - Vertical Scrolling with Fixed (Frozen) Rows</b></span>
    
    <br /><br />
		
	<span class="tdText">
        <table>
            <tr>
                <td>
                    Number of fixed(frozen) rows:
                </td>
                <td>
                    <obout:OboutDropDownList ID="OboutDropDownList1" runat="server" AutoPostBack="true" Width="50">
		                <asp:ListItem Value="1">1</asp:ListItem>
		                <asp:ListItem Value="2" Selected="True">2</asp:ListItem>
		                <asp:ListItem Value="3">3</asp:ListItem>
                        <asp:ListItem Value="4">4</asp:ListItem>
                    </obout:OboutDropDownList>
                </td>
            </tr>
        </table>				
	</span>
		
	<br />

    <obout:Grid ID="Grid1" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false" 
        DataSourceID="SqlDataSource1" PageSize="50" AllowPageSizeSelection="false">
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server" />
            <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" runat="server" />
            <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
            <obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
            <obout:Column ID="Column4" DataField="OrderDate" HeaderText="ORDER DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
            <obout:Column ID="Column5" DataField="ShippedDate" HeaderText="SHIPPED DATE" Width="135" runat="server" DataFormatString="{0:MM/dd/yyyy}" />
        </Columns>
        <ScrollingSettings ScrollHeight="250" />
    </obout:Grid>

    <br />

    <div class="tdText" style="width: 600px;">
        The Grid allows developers to specify a number of fixed rows, which won't be scrolled when the end users scroll the Grid vertically.
        
        Currently this feature may be enabled only from the client-side. First, you need to load the "fixed-rows.js" file from the 
        "oboutSuite / Grid / resources / custom_scripts / fixed-rows" folder at the bottom of your page<br />
        <span class="option2">&lt;script type="text/javascript" src="resources/custom_scripts/fixed-rows/fixed-rows.js"&gt;&lt;/script&gt;</span><br /><br />
        You also need to load the custom stylesheet required by this feature (e.g. in the &lt;head&gt; section):<br />
        <span class="option2">&lt;link href="resources/custom_scripts/fixed-rows/fixed-rows.css" rel="stylesheet" type="text/css" /&gt;</span>
        <br /><br />
        
        Then, use the <span class="option2">NumberOfFixedRows</span> client-side property to specify the number of fixed rows:<br />
        <span class="option2">Grid1.NumberOfFixedRows = 2;</span>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 250 * FROM [Orders] ORDER BY OrderID DESC">
    </asp:SqlDataSource>
    
    <script type="text/javascript" src="resources/custom_scripts/fixed-rows/fixed-rows.js"></script>

</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">    
    <link href="resources/custom_scripts/fixed-rows/fixed-rows.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">
        window.onload = function () {
            Grid1.NumberOfFixedRows = parseInt(OboutDropDownList1.value());
        }
    </script>
</asp:Content>

