<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_integration_select_checkboxes.aspx.cs" Inherits="ComboBox_aspnet_integration_select_checkboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .item
        {
            position: relative;
            width: 100%;
        }
        
        .label
        {
            position: absolute;
            top: 0px;
            left: 25px;
        }
    </style>
    
    <script type="text/javascript">
        function ComboBox1_ItemClick(sender, index) {
            var item = ComboBox1.getItemByIndex(index);
            var checkbox = item.getElementsByTagName('INPUT')[0];
            checkbox.checked = !checkbox.checked;

            updateComboBoxSelection();
        }

        function updateComboBoxSelection() {
            var selectedItems = new Array();
            var checkboxes = ComboBox1.ItemsContainer.getElementsByTagName('INPUT');
            for (var i = 0; i < checkboxes.length; i++) {
                if (checkboxes[i].checked) {
                    selectedItems.push(ComboBox1.options[i].text);
                }
            }

            ComboBox1.setText(selectedItems.join(', '));
        }

        function handleCheckBoxClick(e) {        
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            updateComboBoxSelection();
        }

        window.onload = function() {
            window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
        }

        function attachCheckBoxesOnClickHandlers() {
            if (typeof (ComboBox1) == 'undefined' || typeof (ComboBox1.ItemsContainer) == 'undefined') {
                window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
                return;
            }

            var checkboxes = ComboBox1.ItemsContainer.getElementsByTagName('INPUT');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].onclick = handleCheckBoxClick;
            }
        }

        function performSelection(selectionType) {
            var itemsIndexesToSelect = new Array();
            for (var i = 0; i < ComboBox1.options.length; i++) {
                var item = ComboBox1.getItemByIndex(i);
                var checkbox = item.getElementsByTagName('INPUT')[0];
                if (checkbox.checked != selectionType) {
                    ComboBox1_ItemClick(ComboBox1, i);
                }
            }
        }

        function selectAllItems() {
            performSelection(true);
        }

        function deselectAllItems() {
            performSelection(false);
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Select/Deselect All ASP.NET CheckBoxes</b></span>	
    
    <br /><br />
    
    
    <table>
        <tr>
            <td valign="top">
                <obout:ComboBox runat="server" ID="ComboBox1" Width="200" SelectionMode="Single"
                    DataSourceID="sds1" DataTextField="ControlName" DataValueField="ControlID">
                    <ItemTemplate>
                        <div class="item">
                            <asp:CheckBox runat="server" ID="CheckBox1" />
                            <div class="label">
                                <img src='resources/images/products/<%# Eval("ImageName") %>' alt='' />
                                <%# Eval("ControlName") %>
                            </div>
                        </div>
                    </ItemTemplate>
                    <ClientSideEvents OnItemClick="ComboBox1_ItemClick" />
                </obout:ComboBox>    
            </td>
            <td valign="top">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Select all items" OnClientClick="selectAllItems(); return false;" />
                <obout:OboutButton ID="OboutButton3" runat="server" Text="Deselect all items" OnClientClick="deselectAllItems(); return false;" />

                <obout:OboutButton ID="OboutButton2" runat="server" Text="Order" OnClick="Order" />
            </td>
        </tr>
    </table>    
    
    <span class="tdText">
        <asp:Literal runat="server" ID="OrderDetails" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 ControlID, ControlName, ImageName FROM Controls ORDER BY ControlName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Controls.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ComboBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data. <br /><br />
        
        This example showcases the use of <b>ASP.NET CheckBox</b> controls inside the items.<br />
        The end user is able to select any number of items by clicking on them or by checking the checkboxes.<br />
        You can easily detect at the server-side which items were selected, by looping through the items, <br />
        extracting the CheckBox control for each item (using the <b>FindControl</b> method) and analyzing <br />
        its <b>Checked</b> property to see whether the item was selected or not.<br /><br />

        This example also shows how to select multiple items containing checkboxes at once from the client-side.
    </span>
    
</asp:Content>