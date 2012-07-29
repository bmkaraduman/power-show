<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_apiserver_get_values.aspx.cs" Inherits="ComboBox_aspnet_apiserver_get_values" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
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

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Get Values from Multiple Columns</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox3" Width="400" Height="150" AutoPostBack="true"
	    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="SupplierID" EmptyText="Please select an item ..."
	     OnSelectedIndexChanged="ComboBox1_SelectedIndexChanged" >
	    <HeaderTemplate>
	        <div class="header c1">ID</div>
	        <div class="header c2">COMPANY NAME</div>
	        <div class="header c3">CITY</div>
	    </HeaderTemplate>
	    <ItemTemplate>
	        <div class="item c1"><asp:Literal runat="server" ID="Container1" Text='<%# Eval("SupplierID") %>' /></div>
	        <div class="item c2"><asp:Literal runat="server" ID="Container2" Text='<%# Eval("CompanyName") %>' /></div>
	        <div class="item c3"><asp:Literal runat="server" ID="Container3" Text='<%# Eval("City") %>' /></div>
	    </ItemTemplate>
	    <FooterTemplate>
	        Displaying <%# Container.ItemsCount %> items.
	    </FooterTemplate>
	</obout:ComboBox>
    
    <span class="tdText">
        <asp:Literal runat="server" ID="Details" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT * FROM Suppliers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        In order to be able to access the data from the template at runtime, <br />
        you need to use Literal controls to hold the data that needs to be accessed. <br />
        In the <b>ComboBox1_SelectedIndexChanged</b> event handler, you'll be able <br />
        to access the data stored in the Literal controls.<br />
    </span>
    
</asp:Content>