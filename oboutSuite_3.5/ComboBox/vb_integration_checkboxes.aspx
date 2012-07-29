<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_checkboxes.aspx.vb" Inherits="ComboBox_vb_integration_checkboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        var preventCheckBoxesSelection = false;

        window.onload = function () {
            Obout.Interface.OboutDropDownList.prototype.setValueOld = Obout.Interface.OboutDropDownList.prototype.setValue;
            Obout.Interface.OboutDropDownList.prototype.setValue = function (param1, param2, param3) {
                this.setValueOld(param1, param2, param3);

                if (!preventCheckBoxesSelection) {
                    updateCheckBoxesSelection();
                }
            }

            window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
            window.setTimeout(updateCheckBoxesSelection, 250);
        }

        function updateCheckBoxesSelection() {
            var currentValue = document.getElementById('ctl00_ContentPlaceHolder1_ComboBox1_ctl00_ContentPlaceHolder1_ComboBox1').value;

            for (var i = 0; i < ComboBox1.options.length; i++) {
                var item = ComboBox1.getItemByIndex(i);
                var checkbox = item.getElementsByTagName('INPUT')[0];
                checkbox.checked = (',' + currentValue + ',').indexOf(',' + ComboBox1.options[i].value + ',') != -1;
            }
        }

        function updateItemsSelection() {
            preventCheckBoxesSelection = true;

            var arrSelectedValues = new Array();
            for (var i = 0; i < ComboBox1.options.length; i++) {
                var item = ComboBox1.getItemByIndex(i);
                var checkbox = item.getElementsByTagName('INPUT')[0];
                if (checkbox.checked) {
                    arrSelectedValues.push(ComboBox1.options[i].value);
                }

                ComboBox1._dropDownList.unselectItemByIndex(i);
            }


            ComboBox1.value(arrSelectedValues.join(','));
            preventCheckBoxesSelection = false;
        }

        function handleCheckBoxClick(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            updateItemsSelection();

            return true;
        }

        function attachCheckBoxesOnClickHandlers() {
            if (typeof (ComboBox1) == 'undefined' || typeof (ComboBox1.ItemsContainer) == 'undefined') {
                window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
                return;
            }

            var checkboxes = ComboBox1.ItemsContainer.getElementsByTagName('INPUT');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].onclick = function (e) { return handleCheckBoxClick(e); }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Items with ASP.NET CheckBox controls</b></span>	
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />       
    
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Order" OnClick="Order" />
    
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
        its <b>Checked</b> property to see whether the item was selected or not.
    </span>
</asp:Content>

