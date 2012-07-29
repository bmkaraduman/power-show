<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_apiserver_customtext.aspx.cs" Inherits="ComboBox_aspnet_apiserver_customtext" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Insert Custom Items</b></span>
    
    <br /><br /> 
    
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="250"  DataSourceID="sds1" AppendDataBoundItems="true" EmptyText="Enter a new item"
         DataTextField="CountryName" DataValueField="CountryID" AllowCustomText="true" AutoValidate="true" Height="200"/>
     <obout:OboutButton runat="server" ID="OboutButton1"  Text="Submit" OnClick="Button1_Click"/> 
        
     <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryID DESC"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>	
       <br /><br />
    
    <span class="tdText">
        By default, the ComboBox only allows existing items from the list to be selected by end users.<br />
        You can configure the ComboBox to allow custom text (that doesn't exist in the items list) <br />
        to be typed into the input field. This is done by setting the <b>AllowCustomText</b> property to <span class="option2">true</span>.<br/><br/>
        This example showcases the insertion of the newly typed custom text into the database. <br/>After the button is pressed and the page is posted back to the server, the newly typed item will show up in the list with items.
    </span>
</asp:Content>

