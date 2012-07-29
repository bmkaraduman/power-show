<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function selectAll() {
            for (var i = 0; i < ListBox1.options.length; i++) {
                ListBox1._dropDownList.selectItemByIndex(i, true, false, true, true, true);
            }

            return false;
        }

        function deselectAll() {
            for (var i = 0; i < ListBox1.options.length; i++) {
                ListBox1._dropDownList.unselectItemByIndex(i);
            }

            return false;
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Client-Side API - Select / Deselect All Items</b></span>	
    
    <br /><br />
    <table>
        <tr>
            <td>
                <obout:ListBox runat="server" ID="ListBox1" Width="250" SelectionMode="Multiple"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" />
            </td>
            <td valign="bottom">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Select All Items" OnClientClick="return selectAll();" />
            </td>
             <td valign="bottom">
                <obout:OboutButton ID="OboutButton2" runat="server" Text="Deselect All Items" OnClientClick="return deselectAll();" />    
            </td> 
        </tr>
   </table>
               
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides client-side properties / methods for setting / getting the selected item.<br />
        By looping through the <span class="option2">options</span> collection you can select / deselect all the items from the list.
    </span>
    
</asp:Content>