<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Width</b></span>
    
    <br /><br />
    

    <span class="tdText">auto</span><br />
    <obout:ComboBox runat="server" ID="ComboBox1" EmptyText="Select a country ..."
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        />    
    
    <br /><br />
    
    <span class="tdText">Width="250"</span><br />
    <obout:ComboBox runat="server" ID="ComboBox2" EmptyText="Select a country ..."
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="250"
        />
        
    <br /><br />
    
    <span class="tdText">Width="25%"</span><br />
    <obout:ComboBox runat="server" ID="ComboBox3" EmptyText="Select a country ..."
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="25%"
        />
        
    <br /><br />
    
    <span class="tdText">Width="50%"</span><br />
    <obout:ComboBox runat="server" ID="ComboBox4" EmptyText="Select a country ..."
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
        Width="50%"
        />
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The <b>Width</b> property is used to control the width of the ComboBox.<br />
        If the property is not set, a default width of 150px will be used.<br />
        The drop down menu will have the same width, if <b>MenuWidth</b> is not set.
    </span>
</asp:Content>

