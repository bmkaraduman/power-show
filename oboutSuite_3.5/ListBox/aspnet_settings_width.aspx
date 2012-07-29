<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Width</b></span>
    
    <br /><br />
    
    <span class="tdText">auto</span><br />
    <obout:ListBox runat="server" ID="ListBox1"
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        
        />    
    
    <br /><br />
    
    <span class="tdText">Width="250"</span><br />
    <obout:ListBox runat="server" ID="ListBox2"
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="250" Height="150"
        />
        
    <br /><br />
    
    <span class="tdText">Width="25%"</span><br />
    <obout:ListBox runat="server" ID="ListBox3"
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="25%" Height="150"
        />
        
    <br /><br />
    
    <span class="tdText">Width="50%"</span><br />
    <obout:ListBox runat="server" ID="ListBox4"
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="50%" Height="150"
        />
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The <b>Width</b> property is used to control the width of the ListBox.<br />
        If the property is not set, a default width of 150px will be used.<br />
        The drop down menu will have the same width, if <b>MenuWidth</b> is not set.
    </span>
</asp:Content>

