<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="aspnet_integration_oboutcheckboxes.aspx.cs" Inherits="ListBox_aspnet_integration_checkboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
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
            var currentValue = document.getElementById('ctl00_ContentPlaceHolder1_ListBox1_ctl00_ContentPlaceHolder1_ListBox1').value;

            for (var i = 0; i < ListBox1.options.length; i++) {
                var item = ListBox1.getItemByIndex(i);
                var checkbox = getOboutCheckBoxById(item.getElementsByTagName('INPUT')[0].id);

                checkbox.checked((',' + currentValue + ',').indexOf(',' + ListBox1.options[i].value + ',') != -1);
            }
        }

        function updateItemsSelection() {
            preventCheckBoxesSelection = true;

            var arrSelectedValues = new Array();
            for (var i = 0; i < ListBox1.options.length; i++) {
                var item = ListBox1.getItemByIndex(i);
                var checkbox = getOboutCheckBoxById(item.getElementsByTagName('INPUT')[0].id);
                if (checkbox.checked()) {
                    arrSelectedValues.push(ListBox1.options[i].value);
                }

                ListBox1._dropDownList.unselectItemByIndex(i);
            }

            ListBox1.value(arrSelectedValues.join(','));
            preventCheckBoxesSelection = false;
        }

        function handleCheckBoxClick(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            window.setTimeout(updateItemsSelection, 50);

            return false;
        }

        function getOboutCheckBoxById(id) {
            var checkbox = null;

            try {
                checkbox = window[id];
            } catch (ex) { };

            if (checkbox) {
                if (typeof (checkbox.type) == 'undefined') {
                    return checkbox;
                }

                return OboutCheckBox1;
            } else {
                return OboutCheckBox1;
            }
        }

        function attachCheckBoxesOnClickHandlers() {
            if (typeof (ListBox1) == 'undefined' || typeof (ListBox1.ItemsContainer) == 'undefined') {
                window.setTimeout(attachCheckBoxesOnClickHandlers, 250);
                return;
            }

            var elements = ListBox1.ItemsContainer.getElementsByTagName('SPAN');
            for (var i = 0; i < elements.length; i++) {
                if (elements[i].className == 'chk-cont') {
                    elements[i].onclick = function (e) { return handleCheckBoxClick(e); }
                }
            }
        }
    </script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Items with OboutCheckBox controls</b></span>	
    
    <br /><br />
    
    
    <obout:ListBox runat="server" ID="ListBox1" Width="200" SelectionMode="Multiple"
        DataSourceID="sds1" DataTextField="ControlName" DataValueField="ControlID">
        <ItemTemplate>
            <div class="item">
                <span class="chk-cont">
                    <obout:OboutCheckBox runat="server" ID="OboutCheckBox1">
                         <ClientSideEvents OnClick = "handleCheckBoxClick" />
                    </obout:OboutCheckBox>
                </span>
                <div class="label">
                    <img src='resources/images/products/<%# Eval("ImageName") %>' alt='' />
                    <%# Eval("ControlName") %>
                </div>
            </div>
        </ItemTemplate>
    </obout:ListBox>
    
    <obout:OboutButton runat="server" Text="Order" OnClick="Order" />
    
    <span class="tdText">
        <asp:Literal runat="server" ID="OrderDetails" />
    </span>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 ControlID, ControlName, ImageName FROM Controls ORDER BY ControlName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Controls.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ListBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data. <br /><br />
        
        This example showcases the use of <b>OboutCheckBox</b> controls inside the items.<br />
        The end user is able to select any number of items by clicking on them or by checking the checkboxes.<br />
        You can easily detect at the server-side which items were selected, by looping through the items, <br />
        extracting the OboutCheckBox control for each item (using the <b>FindControl</b> method) and analyzing <br />
        its <b>Checked</b> property to see whether the item was selected or not.
    </span>
    
</asp:Content>