<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_apiserver_get_values.aspx.cs" Inherits="ListBox_cs_apiserver_get_values"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

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
        
        * HTML .c2
        {
            -margin-left: 0px;
        }
        
        .c3
        {
            margin-left: 10px;
            width: 90px;
        }
        
        * HTML .c3
        {
            -margin-left: 0px;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Get Values from Multiple Columns</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" />   
   <br /><br />
    
    <span class="tdText">
        <asp:Literal runat="server" ID="Details" />
    </span>

    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT * FROM Suppliers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        In order to be able to access the data from the template at runtime, <br />
        you need to use Literal controls to hold the data that needs to be accessed. <br />
        In the <b>ListBox1_SelectedIndexChanged</b> event handler, you'll be able <br />
        to access the data stored in the Literal controls.<br />
    </span>
    
</asp:Content>