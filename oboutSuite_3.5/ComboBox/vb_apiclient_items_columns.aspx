<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_apiclient_items_columns.aspx.vb" Inherits="ComboBox_vb_apiclient_items_columns" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Client-Side API - Add Multi-Column Items</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td align="right">
                <obout:OboutTextBox ID="OboutTextBox1" runat="server" WatermarkText="Supplier ID" Width="85" />
                <obout:OboutTextBox ID="OboutTextBox2" runat="server" WatermarkText="Company Name" Width="115" />
                <obout:OboutTextBox ID="OboutTextBox3" runat="server" WatermarkText="City" Width="80" />
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Add Item"
                    OnClientClick="return addItem();" Width="108" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
            </td>
        </tr>        
    </table>

    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT * FROM Suppliers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides client-side methods for adding / removing items.<br /><br />
        
        <ul>
            <li>
                Use the <span class="option2">add</span> method of the <span class="option2">options</span> collection to add items to the list.
                
                <br /><br />
                
                Usage: <span class="option2">ComboBox1.options.add(text [, value] [, index]);</span>
                
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
                
                Usage: <span class="option2">ComboBox1.options.remove(index);</span>
                
                <br />
                
                - index - the index of the item to be removed;<br />
            </li>
        </ul>

        <br />

        This example uses overriden client-side methods of the control for allowing users to add multi-column items.
    </span>
    
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function addItem() {
            if(OboutTextBox1.value() == OboutTextBox1.WatermarkText) {
                alert('Please enter the ID of the supplier.');
                return;
            }

            if(OboutTextBox2.value() == OboutTextBox2.WatermarkText) {
                alert('Please enter the name of the company.');
                return;
            }

            if(OboutTextBox3.value() == OboutTextBox3.WatermarkText) {
                alert('Please enter the city.');
                return;
            }

            ComboBox1.options.add(OboutTextBox2.value(), OboutTextBox1.value(), 0);            

            OboutTextBox1.value('');
            OboutTextBox2.value('');
            OboutTextBox3.value('');
            
            return false;
        }

        window.onload = function () {
            Obout.Interface.OboutDropDownList.prototype.createItem = function (text, value, index) {
                var item = document.createElement('LI');
                var hiddenTextContainer = document.createElement('SPAN');
                var textContainer = document.createElement('B');
                var valueContainer = document.createElement('I');

                var hiddenTextInnerDivContent = document.createTextNode(text);
                var valueDivContent = document.createTextNode(value);

                hiddenTextContainer.appendChild(hiddenTextInnerDivContent);
                valueContainer.appendChild(valueDivContent);

                var idContainer = document.createElement('DIV');
                var companyNameContainer = document.createElement('DIV');
                var cityContainer = document.createElement('DIV');

                idContainer.className = 'item c1';
                companyNameContainer.className = 'item c2';
                cityContainer.className = 'item c3';

                textContainer.appendChild(idContainer);
                textContainer.appendChild(companyNameContainer);
                textContainer.appendChild(cityContainer);

                item.appendChild(hiddenTextContainer);
                item.appendChild(textContainer);
                item.appendChild(valueContainer);

                idContainer.appendChild(document.createTextNode(OboutTextBox1.value()));
                companyNameContainer.appendChild(document.createTextNode(OboutTextBox2.value()));
                cityContainer.appendChild(document.createTextNode(OboutTextBox3.value()));

                if (index == -1 || this.ItemsInnerContainer.childNodes.length <= index) {
                    this.ItemsInnerContainer.appendChild(item);
                } else {
                    this.ItemsInnerContainer.insertBefore(item, this.ItemsInnerContainer.childNodes[index]);
                }

                return item;
            }

            /*

            

            */

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
    <style type="text/css">
        .item
        {
            position: relative !important;
            display:-moz-inline-stack;
            display:inline-block;
            zoom:1;
            *display:inline;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .header
        {
            margin-left: 2px;
        }
   
        .c1
        {
            width: 25px;
        }
        
        .c2
        {
            margin-left: 10px;
            width: 180px;
        }
        
        .c3
        {
            margin-left: 10px;
            width: 90px;
        }
    </style>
</asp:Content>