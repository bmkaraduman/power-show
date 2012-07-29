<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Items with Icons</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">ShowSelectedImage="false"</span><br />
                <obout:ComboBox runat="server" ID="ComboBox1" SelectedIndex="2" 
                    ShowSelectedImage="false" Width="175">
                    <Items>
                        <obout:ComboBoxItem ID="ComboBoxItem1" runat="server" Text="USA" Value="1" ImageUrl="resources/Images/flags/flag_usa.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem2" runat="server" Text="UK" Value="2" ImageUrl="resources/Images/flags/flag_england.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem3" runat="server" Text="Germany" Value="3" ImageUrl="resources/Images/flags/flag_germany.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem4" runat="server" Text="France" Value="4" ImageUrl="resources/Images/flags/flag_france.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem5" runat="server" Text="Russia" Value="5" ImageUrl="resources/Images/flags/flag_russia.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem6" runat="server" Text="India" Value="6" ImageUrl="resources/Images/flags/flag_india.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem7" runat="server" Text="Japan" Value="7" ImageUrl="resources/Images/flags/flag_japan.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem8" runat="server" Text="China" Value="8" ImageUrl="resources/Images/flags/flag_china.png" />
                    </Items>
                </obout:ComboBox>
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">ShowSelectedImage="true"</span><br />
                <obout:ComboBox runat="server" ID="ComboBox2" SelectedIndex="5" 
                    ShowSelectedImage="true" Width="175">
                    <Items>
                        <obout:ComboBoxItem ID="ComboBoxItem9" runat="server" Text="USA" Value="1" ImageUrl="resources/Images/flags/flag_usa.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem10" runat="server" Text="UK" Value="2" ImageUrl="resources/Images/flags/flag_england.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem11" runat="server" Text="Germany" Value="3" ImageUrl="resources/Images/flags/flag_germany.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem12" runat="server" Text="France" Value="4" ImageUrl="resources/Images/flags/flag_france.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem13" runat="server" Text="Russia" Value="5" ImageUrl="resources/Images/flags/flag_russia.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem14" runat="server" Text="India" Value="6" ImageUrl="resources/Images/flags/flag_india.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem15" runat="server" Text="Japan" Value="7" ImageUrl="resources/Images/flags/flag_japan.png" />
                        <obout:ComboBoxItem ID="ComboBoxItem16" runat="server" Text="China" Value="8" ImageUrl="resources/Images/flags/flag_china.png" />
                    </Items>
                </obout:ComboBox>
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        The icon of the selected item can be displayed in the input field of the ComboBox, <br />
        by setting the <b>ShowSelectedImage</b> property to <span class="option2">true</span>.
        
        <br /><br />
        
        You can display icons for items even when the ComboBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
        
    </span>
    
</asp:Content>