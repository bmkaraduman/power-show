<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_live_styles.aspx.cs" Inherits="SuperForm_cs_live_styles" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Live Styles</b></span>
    
    <br /><br />

    <obout:ListBox runat="server" ID="ListBox1" AutoPostBack="true" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged">
        <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="black_glass" Selected="true" />
        <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="grand_gray" />
        <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="premiere_blue" />
        <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="plain" />
    </obout:ListBox>

    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate
                       FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry, 
                       ShipPostalCode=@ShipPostalCode, OrderDate=@OrderDate
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate)
                        VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipCountry, @ShipPostalCode, @OrderDate)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The Super Form comes with predefined styles which are suited for most page layouts.<br /><br />

        The styles can be switched easily using the <b>FolderStyle</b> property, which needs to contain<br />
        the relative path to the folder containing the style to be used.<br /><br />
        Use the <b>InterfaceFolderStyle</b> property to specify the path to the folder containing the styles for the Interface Controls.
    </span>
</asp:Content>

