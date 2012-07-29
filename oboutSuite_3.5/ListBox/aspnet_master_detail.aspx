<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail.aspx.cs" Inherits="ListBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Master / Detail</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="MasterListBox" Width="175" Height="150"
        DataSourceID="sds1" DataValueField="ContinentID" DataTextField="ContinentName"
        >
        <Details>
            <obout:ListBox runat="server" ID="Detail" 
                EnableLoadOnDemand="true" OnLoadingItems="Detail_LoadingItems" Width="200" Height="150"
                DataSourceID="sds2" DataValueField="CountryID" DataTextField="CountryName"
                EmptyText="Select a country ...">
                <HeaderTemplate>
                    COUNTRIES
                </HeaderTemplate>
            </obout:ListBox>
        </Details>
        <HeaderTemplate>
            CONTINENTS
        </HeaderTemplate>
    </obout:ListBox>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT ContinentID, ContinentName FROM Continent ORDER BY ContinentName"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		    
    <asp:SqlDataSource ID="sds2" runat="server" SelectCommand="SELECT CountryID, CountryName FROM Country WHERE ContinentID = @ContinentID ORDER BY CountryName"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="ContinentID" Type="Int32" />
	    </SelectParameters>	    
    </asp:SqlDataSource>		    
	
    <br /><br />
    
    <span class="tdText">
        The ListBox provides a built-in master / detail feature, which allows you to organize data <br />
        from multiple data sources in the same ListBox. To set up a detail ListBox, add a new ListBox <br />
        control inside the <b>Details</b> section of the master ListBox. <br /><br />
        
        The detail ListBox supports all the features available in a regular ListBox.
    </span>

</asp:Content>

