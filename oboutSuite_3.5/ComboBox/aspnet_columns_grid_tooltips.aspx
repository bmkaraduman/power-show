<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Grid-Like Multi-Columns with Tooltips</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox3" Width="200" MenuWidth="400" Height="150" EmptyText="Select a company ..."
	    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="SupplierID"
	    >
	    <HeaderTemplate>
	        <div class="header c1">ID</div>
	        <div class="header c2">COMPANY NAME</div>
	        <div class="header c3">CITY</div>
	    </HeaderTemplate>
	    <ItemTemplate>
            <div title="<%# Eval("CompanyName").ToString() + " from " + Eval("City").ToString() %>">
	            <div class="item c1"><%# Eval("SupplierID") %></div>
	            <div class="item c2"><%# Eval("CompanyName") %></div>
	            <div class="item c3"><%# Eval("City") %></div>
            </div>
	    </ItemTemplate>
	    <FooterTemplate>
	        Displaying <%# Container.ItemsCount %> items.
	    </FooterTemplate>
	</obout:ComboBox>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT * FROM Suppliers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be displayed in a grid-like structure. By using item templates, <br />
        you can display as many columns of data as you wish. A header and a footer can also be displayed, <br />
        to make the list with items look even more like a grid view.<br /><br />
        
        You can display any data field in the item template, by using the <b>Eval</b> method.<br /><br />                

        When using this approach to display items, your end users will still benefit from the other features of the ComboBox:<br />
        autocomplete, load on demand, virtual scrolling, filtering, etc.<br /><br />

        To make the control even more user friendly you can add tooltips to the items, which may contain any text. <br />        
        In this sample we created the tooltips by combining data from the "CompanyName" and "City" columns.
    </span>
    
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .item
        {
            position: relative !important;
            display:-moz-inline-stack;
            display:inline-block;
            zoom:1;
            *display:inline;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .header
        {
            margin-left: 2px;
        }
   
        .c1
        {
            width: 25px;
        }
        
        .c2
        {
            margin-left: 10px;
            width: 180px;
        }
        
        .c3
        {
            margin-left: 10px;
            width: 90px;
        }
    </style>
</asp:Content>