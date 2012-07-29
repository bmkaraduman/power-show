<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_layout_width.aspx.cs" Inherits="SuperForm_cs_layout_width" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Configuring the Width</b></span>
    
    <br /><br />

    <table>
        <tr>
            <td class="tdText">
                Form Width
            </td>
            <td width="25">&#160;</td>
            <td class="tdText">
                Item Width
            </td>
            <td width="25">&#160;</td>
            <td class="tdText">
                Control Width
            </td>
        </tr>
        <tr>
            <td>
                <obout:OboutDropDownList runat="server" ID="FormWidth" AutoPostBack="true" OnSelectedIndexChanged="Width_SelectedIndexChanged">
                    <asp:ListItem>300px</asp:ListItem>
                    <asp:ListItem Selected="True">400px</asp:ListItem>
                    <asp:ListItem>500px</asp:ListItem>
                    <asp:ListItem>50%</asp:ListItem>
                    <asp:ListItem>100%</asp:ListItem>
                </obout:OboutDropDownList>
            </td>
            <td width="25">&#160;</td>
            <td>
                <obout:OboutDropDownList runat="server" ID="ItemWidth" AutoPostBack="true" OnSelectedIndexChanged="Width_SelectedIndexChanged">
                    <asp:ListItem>25%</asp:ListItem>
                    <asp:ListItem>50%</asp:ListItem>
                    <asp:ListItem Selected="True">75%</asp:ListItem>
                </obout:OboutDropDownList>
            </td>
            <td width="25">&#160;</td>
            <td>
                <obout:OboutDropDownList runat="server" ID="ControlWidth" AutoPostBack="true" OnSelectedIndexChanged="Width_SelectedIndexChanged">
                    <asp:ListItem>25%</asp:ListItem>
                    <asp:ListItem>50%</asp:ListItem>
                    <asp:ListItem Selected="True">auto</asp:ListItem>
                </obout:OboutDropDownList>
            </td>
        </tr>
    </table>

    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry, OrderDate, AdditionalInformation
                       FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry, 
                       OrderDate=@OrderDate, AdditionalInformation=@AdditionalInformation
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry, OrderDate, AdditionalInformation)
                        VALUES(@ShipName, @ShipCity, @ShipCountry, @OrderDate, @AdditionalInformation)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form and the fields expose various properties that allow you to configure the width of the form / fields.<br /><br />

        Use the <b>Width</b> property of the <b>Super Form</b> class to specify the width of the form.<br />
        Use the following properties of the field classes to specify the width of their various elements:<br />
        
        <ul>
            <li><b>ControlStyle-Width</b> - gets or sets a value indicating the width of the control (used in add / edit mode).</li>
            <li><b>HeaderStyle-Width</b> - gets or sets a value indicating the width of the header.</li>
            <li><b>ItemStyle-Width</b> - gets or sets a value indicating the width of the item.</li>            
        </ul>
    </span>
</asp:Content>

