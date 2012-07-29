<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_customization_extra_heading.aspx.cs" Inherits="Grid_aspnet_customization_extra_heading" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Heading</b></span>		
	
    <br /><br />

    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" FolderStyle="styles/black_glass"        
        AutoGenerateColumns="false" AllowAddingRecords="false" >
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />            
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
        </Columns>        
        <TemplateSettings HeadingTemplateId="HeadingTemplate1" />
        <Templates>
            <obout:GridTemplate runat="server" ID="HeadingTemplate1">
                <Template>Orders List</Template>
            </obout:GridTemplate>
        </Templates>
        
	</obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC">        
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        The Grid allows developers to add an extra heading above the column headers. The content of this heading is custmizable using templates.<br />
        Use the <b>TemplateSettings.HeadingTemplateId</b> property to specify the ID of the template that will be rendered in the heading.
    </span>
</asp:Content>

