<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Validate with ASP.NET Validators</b></span>	
    
    <br /><br />
    <table>
        <tr>
            <td>    
                <obout:ComboBox runat="server" ID="ComboBox1" Width="125">
                    <obout:ComboBoxItem ID="ComboBoxItem1" runat="server" Text="10" />
                    <obout:ComboBoxItem ID="ComboBoxItem2" runat="server" Text="50" />
                    <obout:ComboBoxItem ID="ComboBoxItem5" runat="server" Text="75" />
                    <obout:ComboBoxItem ID="ComboBoxItem3" runat="server" Text="100" />
                    <obout:ComboBoxItem ID="ComboBoxItem4" runat="server" Text="1000" />
                </obout:ComboBox>
            </td >
            <td valign="bottom">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Validate" />
            </td>
            <td valign="bottom">
                <asp:RequiredFieldValidator runat="server" ID="Validator1" ControlToValidate="ComboBox1" 
                    ErrorMessage="Please select a value." CssClass="tdText" Display="Dynamic" />
            </td>
            <td valign="bottom">
                <asp:RangeValidator runat="server" ControlToValidate="ComboBox1" Display="Dynamic"
                    ErrorMessage="Please specify a value between 50 and 100." MinimumValue="50" MaximumValue="100" Type="Integer" CssClass="tdText" />
            </td>
        </tr>    
    </table>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <br /><br />
    
    <span class="tdText">
        The ComboBox control can be validated using ASP.NET validator controls. This sample showcases the use of a <br />
        <b>RequiredFieldValidator</b> and a <b>RangeValidator</b> to validate the items selected from the ComboBox.
    </span>
    
</asp:Content>