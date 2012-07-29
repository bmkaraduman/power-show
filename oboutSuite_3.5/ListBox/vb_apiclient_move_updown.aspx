<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_apiclient_move_updown.aspx.vb" Inherits="ListBox_vb_apiclient_move_updown" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function moveUp() {
            var selectedIndex = ListBox1.selectedIndex();

            if (selectedIndex > 0) {
                var value = ListBox1.options[selectedIndex].value;
                var text = ListBox1.options[selectedIndex].text;

                ListBox1.options.remove(selectedIndex);

                ListBox1.options.add(text, value, selectedIndex - 1);

                ListBox1.selectedIndex(selectedIndex - 1);
            }

            return false;
        }

        function moveDown() {
            var selectedIndex = ListBox1.selectedIndex();

            if (selectedIndex < ListBox1.options.length - 1) {
                var value = ListBox1.options[selectedIndex].value;
                var text = ListBox1.options[selectedIndex].text;

                ListBox1.options.remove(selectedIndex);

                ListBox1.options.add(text, value, selectedIndex + 1);

                ListBox1.selectedIndex(selectedIndex + 1);
            }

            return false;
        }

        window.onload = function () {
            Obout.Interface.OboutDropDownList.prototype.addToOptionsCollection = function (text, value, index, enabled) {
                if (index == -1 || this.length <= index) {
                    var option = new Object();
                    option.text = text;
                    option.value = value;
                    option.enabled = enabled;

                    this.options.push(option);
                } else {
                    var tempOption = new Object();
                    this.options.push(tempOption);

                    for (var i = this.options.length - 2; i >= index; i--) {
                        this.options[i + 1].text = this.options[i].text;
                        this.options[i + 1].value = this.options[i].value;
                        this.options[i + 1].enabled = this.options[i].enabled;
                    }

                    this.options[index].value = value;
                    this.options[index].text = text;
                    this.options[index].enabled = enabled;

                    if (this._selectedIndex != null && this._selectedIndex != -1 && this._selectedIndex >= index) {
                        this._selectedIndex++;
                    }
                }
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Client-Side API - Move Items</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td valign="middle">
                <asp:PlaceHolder runat="server" ID="ListBox1Container" />   
            </td>
            <td width="10">&#160;</td>
            <td valign="middle">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Move Up" OnClientClick="return moveUp();" Width="100" /><br /><br />
                <obout:OboutButton ID="OboutButton2" runat="server" Text="Move Down" OnClientClick="return moveDown();" Width="100" />
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox control provides client-side methods for adding / removing items.<br />
        These methods can be used to move items up and down.
    </span>
    
</asp:Content>