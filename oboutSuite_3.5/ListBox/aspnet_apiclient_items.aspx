<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function addItem() {
            if (OboutTextBox1.value() != '') {
                ListBox1.options.add(OboutTextBox1.value());
                OboutTextBox1.value('');
            } else {
                alert('Please type the text.');
            }

            return false;
        }

        function removeItem() {
            var selectedIndex = ListBox1.selectedIndex();
            clearSelection();

            if (selectedIndex != -1) {
                ListBox1.options.remove(selectedIndex);
            } else {
                alert('Please select an item.');

            }

            return false;
        }

        function clearSelection() {
            ListBox1.selectedIndex(-1);
            ListBox1.value('');
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Client-Side API - Add/Delete Items</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td valign="top">
                <obout:ListBox runat="server" ID="ListBox1" Width="250"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" />
            </td>
            <td width="20">&#160;</td>
            <td valign="top" align="right">
                <obout:OboutTextBox ID="OboutTextBox1" runat="server" />
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Add Item" 
                    OnClientClick="return addItem();" Width="150" />
                <br />
                <obout:OboutButton ID="OboutButton2" runat="server" Text="Remove Item" 
                    OnClientClick="return removeItem();" Width="150" />
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides client-side methods for adding / removing items.<br /><br />
        
        <ul>
            <li>
                Use the <span class="option2">add</span> method of the <span class="option2">options</span> collection to add items to the list.
                
                <br /><br />
                
                Usage: <span class="option2">ListBox1.options.add(text [, value] [, index]);</span>
                
                <br />
                
                - text - the text of the new item;<br />
                - value - the value of the new item (same as text if not specified);<br />
                - index - the position in the list where the new item should be added <br />
                &#160;&#160;&#160;&#160;&#160;&#160;(if not specified, the item will be added at the end of the list);
                
                <br /><br />
            </li>
            <li>
                Use the <span class="option2">remove</span> method of the <span class="option2">options</span> collection to remove items to the list.
                                
                <br /><br />
                
                Usage: <span class="option2">ListBox1.options.remove(index);</span>
                
                <br />
                
                - index - the index of the item to be removed;<br />
            </li>
        </ul>
    </span>
    
</asp:Content>