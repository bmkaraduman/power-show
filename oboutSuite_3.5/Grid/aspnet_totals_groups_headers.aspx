<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_totals_groups_headers.aspx.cs" Inherits="Grid_aspnet_totals_groups_headers" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
		.ob_gRGF
		{
			display: none !important;
		}
		
		.group-total
		{
		    float: right;
		    width:150px;
		    position: absolute;
		    top: 0px;
		    overflow: hidden;
		    white-space: nowrap;
		}
		
	</style>
    <script type="text/javascript">
        window.onload = function () {
            oboutGrid.prototype.resizeColumnOld = oboutGrid.prototype.resizeColumn;
            oboutGrid.prototype.resizeColumn = function (param1, param2, param3) {
                this.resizeColumnOld(param1, param2, param3);

                updateGroupTotalsWidths();                
            }
        }

        function updateGroupTotalsWidths() {
            var elements = document.getElementsByTagName('DIV');
            for (var i = 0; i < elements.length; i++) {
                if (elements[i].className == 'ob_gRGHC') {

                    var marginIndent = 0;
                    var tempElement = elements[i];
                    while (tempElement && tempElement.previousSibling) {
                        marginIndent -= tempElement.previousSibling.offsetWidth;
                        tempElement = tempElement.previousSibling;
                    }

                    var indent = -3;

                    for (var j = 0; j < 4; j++) {
                        elements[i].childNodes[j].style.marginLeft = (j > 0 ? indent : 0) + 'px';
                        elements[i].childNodes[j].style.width = (grid1.ColumnsCollection[j + 2].Width + (j == 0 ? marginIndent : -20)) + 'px';
                        indent += grid1.ColumnsCollection[j + 2].Width + (j == 0 ? marginIndent + 20 : 0);
                    }
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Sub-Totals in Group Headers</b></span>		
		
	<br /><br />
		
	<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" PageSize="10"
		FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" ShowMultiPageGroupsInfo="false" AllowColumnResizing="true"
		ShowColumnsFooter="false" ShowGroupFooter="true" OnRowDataBound="RowDataBound" AllowGrouping="true" GroupBy="ProductName">
        <ClientSideEvents OnClientCallback="updateGroupTotalsWidths" />
		<Columns>
			<obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
			<obout:Column DataField="CategoryID" HeaderText="CATEGORY ID" Visible="false" ReadOnly="true" Width="150" />
			<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" />				
			<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" />
			<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
			<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
		</Columns>
	</obout:Grid>
		
	<br />
	<span class="tdText">
		The Grid allows developers to customize the sub totals and display them inside the group headers <br />
        instead of displaying them in the group footers.
	</span>
				
	<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
</asp:Content>

