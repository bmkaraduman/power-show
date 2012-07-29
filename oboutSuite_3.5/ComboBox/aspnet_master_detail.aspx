<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_master_detail.aspx.cs" Inherits="ComboBox_aspnet_master_detail" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Master / Detail</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="MasterCombo" AutoClose="false" Width="200" Height="150"
        DataSourceID="sds1" DataValueField="ContinentID" DataTextField="ContinentName"
        EmptyText="Select a country ..."
        >
        <Details>
            <obout:ComboBox runat="server" ID="Detail" 
                EnableLoadOnDemand="true" OnLoadingItems="Detail_LoadingItems" Width="200" Height="150"
                DataSourceID="sds2" DataValueField="CountryID" DataTextField="CountryName"
                EmptyText="Select a country ...">
                <HeaderTemplate>
                    COUNTRIES
                </HeaderTemplate>
            </obout:ComboBox>
        </Details>
        <HeaderTemplate>
            CONTINENTS
        </HeaderTemplate>
    </obout:ComboBox>
    
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
        The ComboBox provides a built-in master / detail feature, which allows you to organize data <br />
        from multiple data sources in the same ComboBox. To set up a detail ComboBox, add a new ComboBox <br />
        control inside the <b>Details</b> section of the master ComboBox. <br /><br />
        
        The detail ComboBox supports all the features available in a regular ComboBox.
    </span>

</asp:Content>

