<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_print_selected_columns.aspx.vb" Inherits="Grid_vb_print_selected_columns" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
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

    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	

    <br /><br />
		
	<span class="tdText">
		Use the <b>print</b> client-side method to print the records of the grid.<br />
		In this sample we use a small JavaScript trick to print only some of the columns of the Grid.<br />
        The users can select which columns to print, by checking their corresponding check boxes.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
</asp:Content>

