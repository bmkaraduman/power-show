<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_live_styles_datefield.aspx.cs" Inherits="SuperForm_cs_live_styles_datefield" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Live Styles for DateFields</b></span>
    
    <br /><br />

    <table class="tdText">
        <tr>
            <td valign="top">
                Date picker style:<br />
                <obout:ListBox runat="server" ID="ListBox1" AutoPostBack="true" Height="100" OnSelectedIndexChanged="CalendarType_Changed">
                    <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="blocky_revert" />
                    <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="blue" />
                    <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="dark" />
                    <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="default" Selected="true" />
                    <obout:ListBoxItem ID="ListBoxItem5" runat="server" Text="desert" />
                    <obout:ListBoxItem ID="ListBoxItem6" runat="server" Text="expedia" />
                    <obout:ListBoxItem ID="ListBoxItem7" runat="server" Text="graphite" />
                    <obout:ListBoxItem ID="ListBoxItem8" runat="server" Text="lite" />
                    <obout:ListBoxItem ID="ListBoxItem9" runat="server" Text="orbitz" />
                    <obout:ListBoxItem ID="ListBoxItem10" runat="server" Text="simple" />
                    <obout:ListBoxItem ID="ListBoxItem11" runat="server" Text="style10" />
                </obout:ListBox>
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                Calendar icon:
                <table cellspacing="10">
                    <tr>
                        <td align="center">
                            <img src="../Calendar/styles/date_picker1.gif" alt="" />
                        </td>
                        <td>
                            <obout:OboutRadioButton runat="server" OnCheckedChanged="CalendarType_Changed" ID="DatePicker1" Text="date_picker1.gif" Checked="true" GroupName="DatePickerIcon" AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <img src="../Calendar/styles/date_picker2.gif" alt="" />
                        </td>
                        <td>
                            <obout:OboutRadioButton runat="server" OnCheckedChanged="CalendarType_Changed" ID="DatePicker2" Text="date_picker2.gif" GroupName="DatePickerIcon" AutoPostBack="true" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <img src="../Calendar/styles/icon2.gif" alt="" />
                        </td>
                        <td>
                            <obout:OboutRadioButton runat="server" OnCheckedChanged="CalendarType_Changed" ID="DatePicker3" Text="icon2.gif" GroupName="DatePickerIcon" AutoPostBack="true" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry, OrderDate, ShippedDate, RequiredDate FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, ShippedDate, RequiredDate)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @ShippedDate, @RequiredDate)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        Add <b>DateField</b> objects to the <b>Fields</b> collection to manually specify the Date / DateTime fields of a Super Form.<br />
        This type of field will render an OboutTextBox control and an Obout Calendar control in add / edit mode, which will allow end users to modify the underlying data.<br />
        The Calendar control is configured to work in date picker mode and it is linked to the OboutTextBox control.<br /><br />

        In this sample we accessed the fields of the form in the Page_Load method to gain access to the Calendar controls added to the rows.<br />
        Thus we were able to set their <b>StyleFolder</b> and <b>DatePickerImagePath</b> properties.
    </span>
</asp:Content>

