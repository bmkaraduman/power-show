<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_columns_grid_ondemand.aspx.cs" Inherits="ComboBox_aspnet_columns_grid_ondemand" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Grid-Like Multi-Columns with On-Demand Loading</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="200" MenuWidth="400" Height="150"
	    DataTextField="CompanyName" DataValueField="SupplierID" EnableVirtualScrolling="true"
	    EnableLoadOnDemand="true" OnLoadingItems="ComboBox1_LoadingItems"
	    >
	    <HeaderTemplate>
	        <div class="header c1">ID</div>
	        <div class="header c2">COMPANY NAME</div>
	        <div class="header c3">CITY</div>
	    </HeaderTemplate>
	    <ItemTemplate>
	        <div class="item c1"><%# Eval("SupplierID") %></div>
	        <div class="item c2"><%# Eval("CompanyName") %></div>
	        <div class="item c3"><%# Eval("City") %></div>
	    </ItemTemplate>
	    <FooterTemplate>
            Displaying items <%# Container.ItemsCount > 0 ? "1" : "0" %>-<%# Container.ItemsLoadedCount %> out of <%# Container.ItemsCount %>.
        </FooterTemplate>
	</obout:ComboBox>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be displayed in a grid-like structure. By using item templates, <br />
        you can display as many columns of data as you wish. A header and a footer can also be displayed, <br />
        to make the list with items look even more like a grid view.<br /><br />
        
        You can display any data field in the item template, by using the <b>Eval</b> method.<br /><br />
        
        When using this approach to display items, your end users will still benefit from the other features of the ComboBox:<br />
        autocomplete, load on demand, virtual scrolling, filtering, etc.<br /><br />
        
        As you can see from the source code of this example, when using the grid-like structure along with <br />
        on demand loading, you need to populate the ComboBox using its "DataSource" property in the "LoadingItems"<br />
        event handler on the server-side.
    </span>
    
</asp:Content>
