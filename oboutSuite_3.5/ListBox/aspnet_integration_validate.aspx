<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Validate with ASP.NET Validators</b></span>	
    
    <br /><br />
    <table>
        <tr>
            <td>
                <obout:ListBox runat="server" ID="ListBox1" Width="125">
                    <obout:ListBoxItem ID="ListBoxItem1" runat="server" Text="10" />
                    <obout:ListBoxItem ID="ListBoxItem2" runat="server" Text="50" />
                    <obout:ListBoxItem ID="ListBoxItem5" runat="server" Text="75" />
                    <obout:ListBoxItem ID="ListBoxItem3" runat="server" Text="100" />
                    <obout:ListBoxItem ID="ListBoxItem4" runat="server" Text="1000" />
                </obout:ListBox>
            </td>
            <td valign="bottom">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Validate" />
            </td>
            <td valign="bottom">
                <asp:RequiredFieldValidator runat="server" ID="Validator1" ControlToValidate="ListBox1" 
                    ErrorMessage="Please select a value." CssClass="tdText" Display="Dynamic" />
            </td>
            <td valign="bottom">
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ListBox1" Display="Dynamic"
                    ErrorMessage="Please specify a value between 50 and 100." MinimumValue="50" MaximumValue="100" Type="Integer" CssClass="tdText" />
            </td>
        </tr>  
    </table>
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br /><br />
    
    <span class="tdText">
        The ListBox control can be validated using ASP.NET validator controls. This sample showcases the use of a <br />
        <b>RequiredFieldValidator</b> and a <b>RangeValidator</b> to validate the items selected from the ListBox.
    </span>
    
</asp:Content>