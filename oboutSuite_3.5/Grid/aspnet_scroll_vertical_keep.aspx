<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_scroll_vertical_keep.aspx.cs" Inherits="Grid_aspnet_scroll_vertical_keep" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Keep Scroll Position during PostBack</b></span>		
	
    <br /><br />
		
    <span class="tdText">Select a record from the Grid to post back the page:</span>
        	
    <br /><br />

    <asp:HiddenField runat="server" ID="Grid1ScrollTop" />
    		
	<obout:Grid id="Grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="false" PageSize="50"
		AutoGenerateColumns="false" AutoPostBackOnSelect="true" DataSourceID="SqlDataSource1">	
        <Columns>
            <obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ID" Width="45" Visible="false" runat="server"/>
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME"  Width="250" runat="server"/>
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="150" runat="server" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server"/>
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="150" runat="server"/>
        </Columns>		
        <ScrollingSettings ScrollHeight="150" />
		</obout:Grid>
		 
        <span class="tdText">
            <asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
        </span>        
		          
		<br /><br /><br />

		<span class="tdText">
		    To enable the vertical scrolling feature, use the <b>ScrollHeight</b> property.<br /><br />

            This example showcases the ability to keep the vertical scroll position of the Grid during postbacks.<br />
            The scroll position is kept in a hidden field and then used on page load to scroll the Grid back to its previous position.
		</span>
		
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC" />


    <script type="text/javascript">
        window.onload = function () {
            oboutGrid.prototype._synchronizeVerticalScrollingOld = oboutGrid.prototype._synchronizeVerticalScrolling;
            oboutGrid.prototype._synchronizeVerticalScrolling = function () {
                this._synchronizeVerticalScrollingOld();

                document.getElementById('ctl00_ContentPlaceHolder1_Grid1ScrollTop').value = Grid1.GridBodyContainer.scrollTop;
            }

            Grid1.GridBodyContainer.scrollTop = document.getElementById('ctl00_ContentPlaceHolder1_Grid1ScrollTop').value;
        }
        </script>

</asp:Content>

