<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_radiobtn.aspx.vb" Inherits="ComboBox_vb_integration_radiobtn" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .ob_iCboICBC li, .ob_iCboICBC li b
        {
            height: 200px !important;
            color: #2b4c61;
        }  
        
        .ob_iCboICBC li.ih, .ob_iCboICBC li.ih b, .ob_iCboICBC li.ih i
        {
            background-image: none !important;
        }      
        
        .column
        {
            float: left;
            width: 130px;
            margin-right: 15px;
        }
        
        .column h4
        {
            font-size: 10px;
        }
    </style>
    
    <script type="text/javascript">
        function onCheckedChanged(sender, state) {
            if (sender.checked() == true) {
                window.setTimeout(function() { setComboBoxText(sender.getText()); }, 150);
            }
        }

        function setComboBoxText(text) {
            ComboBox1.selectedIndex(-1);
            ComboBox1.setText(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ComboBox - RadioButtons inside the ComboBox</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />        
    
    
    <obout:OboutButton ID="OboutButton1" runat="server" Text="Order" OnClick="Order" />
    
    <span class="tdText">
        <asp:Literal runat="server" ID="OrderDetails" />
    </span>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ComboBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data. <br /><br />
        
        This example showcases the use of <b>OboutRadioButton</b> controls inside the ComboBox.<br />
        The end user is able to select only one item from the ComboBox.<br />
        To accomplish this layout, we used a single item in the ComboBox, with no value/text, <br />
        which is customized using an ItemTemplate to contain all the radio buttons.
    </span>
    
</asp:Content>

