<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_autowidth.aspx.cs" Inherits="Grid_aspnet_master_detail_autowidth" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Auto-Expanding (Fluid) Width</b></span>		
	
    <br /><br />
	
    <div style="width: 350px" id="Container1">
		    <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" Width="100%" 
                AllowPageSizeSelection="false" AllowPaging="false"
		        DataSourceID="sds1" AllowAddingRecords="false">
                <Columns>
                    <obout:Column DataField="CustomerID" HeaderText="ID" Visible="true" Width="25%" />
                    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="45%" />
                    <obout:Column DataField="Country" HeaderText="COUNTRY" Width="30%" />
                </Columns>
                <MasterDetailSettings LoadingMode="OnCallback" />
                <DetailGrids>
                    <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" Width="95%"
                     AllowAddingRecords="false" AllowPageSizeSelection="false" AllowPaging="false"
                     DataSourceID="sds2" ForeignKeys="CustomerID">
                        <Columns>
                            <obout:Column DataField="CustomerID" Visible="false" Width="0%" />
                            <obout:Column DataField="OrderID" Visible="false" Width="0%" />
                            <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="35%" />
                            <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}" Width="33%" />
                            <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}" Width="32%" />
                        </Columns>
                        <MasterDetailSettings LoadingMode="OnCallback" />
                        <DetailGrids>
                            <obout:DetailGrid runat="server" ID="Grid3" AutoGenerateColumns="false" Width="95%"
                                 AllowAddingRecords="false" AllowPageSizeSelection="false" AllowPaging="false"
                                 DataSourceID="sds3" ForeignKeys="OrderID">
                                    <Columns>
                                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="0%" />                               
                                        <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="35%" />
                                        <obout:Column DataField="Quantity" HeaderText="QUANTITY"  Width="33%" />
                                        <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="32%" />
                                    </Columns>
                            </obout:DetailGrid>
                        </DetailGrids>
                    </obout:DetailGrid>
                </DetailGrids>
            </obout:Grid>
		</div>
        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT CustomerID, OrderID, OrderDate, ShippedDate, Freight FROM [Orders] WHERE CustomerID = @CustomerID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = @OrderID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
        <br /><br />

	     <div class="tdText" style="width: 600px;">
		        This example showcases the ability of having master/detail grids with an auto-expanding (fluid) width.
                The detail grid (level 2) has a larger width than its master grid (level 1). When expanding a row from level 1,
                the master grid (level 1) will become larger to accommodate its details. The same thing happens for the master/detail grids from levels 2 and 3.
                When details are collapsed, the width of their master will be reduced, to avoid filling unnecessary space on the page.
                <br /><br />
                Set the <b>MasterDetailSettings.LoadingMode</b> property to <span class="option2">OnCallback</span> to load the detail grids using AJAX callbacks.
		    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        window.onload = function () {
            oboutGrid.prototype.loadDetailGridBase = oboutGrid.prototype.loadDetailGrid;
            oboutGrid.prototype.loadDetailGrid = function (result, context) {
                this.loadDetailGridBase(result, context);

                updateContainerWidth();
            }

            oboutGrid.prototype.manageDetailGridsExpandedStateBase = oboutGrid.prototype.manageDetailGridsExpandedState;
            oboutGrid.prototype.manageDetailGridsExpandedState = function (button) {
                this.manageDetailGridsExpandedStateBase(button);

                updateContainerWidth();
            }
        }

        var level1Width = 350;
        var level2Width = 450;
        var level3Width = 600;

        function updateContainerWidth() {
            var width = level1Width;
            for (var i in Grid1.DetailGrids) {
                var detailWidth = Grid1.DetailGrids[i].GridMainContainer.offsetWidth;
                if (detailWidth > 0) {
                    width = level2Width;

                    for (var j in Grid1.DetailGrids[i].DetailGrids) {
                        var detailWidth = Grid1.DetailGrids[i].DetailGrids[j].GridMainContainer.offsetWidth;
                        if (detailWidth > 0) {
                            width = level3Width;

                            break;
                        }
                    }

                    break;
                }
            }
            document.getElementById('Container1').style.width = width + 30 + 'px';
        }
        </script>

</asp:Content>

