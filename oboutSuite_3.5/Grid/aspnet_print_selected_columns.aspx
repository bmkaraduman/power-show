<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_print_selected_columns.aspx.cs" Inherits="Grid_aspnet_print_selected_columns" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function printGrid() {
            for (var i = 0; i < 6; i++) {
                var checkBox = eval('OboutCheckBox' + i);
                if (!checkBox.checked()) {
                    Grid1.hideColumn(i);
                }
            }

           
            Grid1.print();

            window.setTimeout(restoreGridColumn, 250);

            return false;
        }

        function restoreGridColumn() {
            for (var i = 0; i < 6; i++) {
                Grid1.showColumn(i);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Printing Selected Columns</b></span>		
	
    <br /><br />

    <span class="tdText">
        Select the columns that you want to print:<br /><br />

        <obout:OboutCheckBox ID="OboutCheckBox0" runat="server" Text="ORDER ID" Checked="true" />
        <obout:OboutCheckBox ID="OboutCheckBox1" runat="server" Text="NAME" Checked="true" />
        <obout:OboutCheckBox ID="OboutCheckBox2" runat="server" Text="CITY" Checked="true" />
        <obout:OboutCheckBox ID="OboutCheckBox3" runat="server" Text="REGION" Checked="true" />
        <obout:OboutCheckBox ID="OboutCheckBox4" runat="server" Text="POSTAL CODE" Checked="true" />
        <obout:OboutCheckBox ID="OboutCheckBox5" runat="server" Text="COUNTRY" Checked="true" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	
	    <obout:OboutButton ID="OboutButton2" runat="server" Text="Print Records" OnClientClick="return printGrid();" />
		
    </span>

    <br /><br />

    <obout:Grid id="Grid1" runat="server" AutoGenerateColumns="false" AllowPageSizeSelection="false"
		AllowAddingRecords="false" DataSourceID="sds1">
		<Columns>				
			<obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" Width="150" runat="server"/>
			<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
			<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
            <obout:Column ID="Column4" DataField="ShipRegion" HeaderText="REGION" Width="150" runat="server" />
			<obout:Column ID="Column5" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />								
			<obout:Column ID="Column6" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
		</Columns>
	</obout:Grid>
		
	<br /><br />
		
	<span class="tdText">
		Use the <b>print</b> client-side method to print the records of the grid.<br />
		In this sample we use a small JavaScript trick to print only some of the columns of the Grid.<br />
        The users can select which columns to print, by checking their corresponding check boxes.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
</asp:Content>

