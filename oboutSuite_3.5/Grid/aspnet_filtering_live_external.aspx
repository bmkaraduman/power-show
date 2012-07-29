<%@ Page Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_filtering_live_external.aspx.cs" Inherits="Grid_aspnet_filtering_live_external" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        var searchTimeout = null;
        function FilterTextBox_KeyUp() {
            if (LiveSearchCheckBox.checked()) {
                if (searchTimeout != null) {
                    window.clearTimeout(searchTimeout);
                }
                searchTimeout = window.setTimeout(performSearch, 500);
            }
        }

        function performSearch() {
            var searchValue = FilterTextBox.value();
            if (searchValue == FilterTextBox.WatermarkText) {
                searchValue = '';
            }

            Grid1.addFilterCriteria('ShipName', OboutGridFilterCriteria.Contains, searchValue);
            Grid1.addFilterCriteria('ShipCity', OboutGridFilterCriteria.Contains, searchValue);
            Grid1.addFilterCriteria('ShipPostalCode', OboutGridFilterCriteria.Contains, searchValue);
            Grid1.addFilterCriteria('ShipCountry', OboutGridFilterCriteria.Contains, searchValue);

            Grid1.executeFilter();

            searchTimeout = null;

            return false;
        }
    </script>
    <style type="text/css">		
        .search-container {position: relative; margin-bottom: 6px;}
        
        .search-text {position: absolute; top:0px; left:5px;line-height: 21px;}
        .search-field {position: absolute; top: 0px; left: 81px;}
        .search-check {position: absolute; top: 0px; left: 530px;line-height: 21px;}
        .search-button {position: absolute; left: 635px;}
       
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br />

	<span class="tdText"><b>ASP.NET Grid - Filter All Columns with Live Search</b></span>		
	
    <br /><br />
    <div class="search-container tdText">
        <div class="search-text">Search grid</div>
        <div class="search-field">
             <obout:OboutTextBox runat="server" ID="FilterTextBox" WatermarkText="Enter text to search the whole grid" Width="450">
                <ClientSideEvents OnKeyUp="FilterTextBox_KeyUp" />
            </obout:OboutTextBox> 
        </div>  
        <div class="search-check">&#160;&#160;<obout:OboutCheckBox runat="server" ID="LiveSearchCheckBox" Text="Use live search" Checked="true" /></div> 
        <div class="search-button">&#160;&#160; <obout:OboutButton ID="OboutButton2" runat="server" Text="Search" OnClientClick="return performSearch();" /></div>
                
    </div>  

    <br />
	
    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" AllowAddingRecords="false"
		AllowFiltering="true" FilterType="ProgrammaticOnly">
		<Columns>
			<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" Visible="false" HeaderText="ORDER ID" Width="100" runat="server"/>
			<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="230" runat="server"/>				
			<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="160" runat="server" />
			<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="160" runat="server" />
			<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="160" runat="server" />
		</Columns>
        <FilteringSettings MatchingType="AnyFilter" />
	</obout:Grid>
        
	<asp:SqlDataSource runat="server" ID="SqlDataSource1" SelectCommand="SELECT * FROM Orders ORDER BY ShipName ASC"
		ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
    <br /><br />
		
	<span class="tdText">
    	This example shows how to search the whole grid, instead of a specific column.
    	    <br />
    	    <br />
    	    This is extremely useful for fast searches, when you don't want to open filters, define the filtering condition and filter words.<br />
            For example, try searching for '05021' and you'll get all rows with that Postal Code.  Very simple and fast!
    	  		
	</span>

</asp:Content>
