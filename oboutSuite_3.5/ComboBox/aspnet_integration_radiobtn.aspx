<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_integration_radiobtn.aspx.cs" Inherits="ComboBox_aspnet_integration_checkboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">    
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

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - RadioButtons inside the ComboBox</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" Width="150" MenuWidth="500"
        AutoClose="false" AllowCustomText="true" AutoValidate="true" AllowEdit="false">
        <ItemTemplate>            
            
            <div class="column">
                <h4>ASP.NET Controls</h4>
                <hr />
                
                <obout:OboutRadioButton ID="OboutRadioButton1" runat="server" Text="TreeView" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton2" runat="server" Text="Grid" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton10" runat="server" Text="HTML Editor" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton11" runat="server" Text="ComboBox" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton12" runat="server" Text="Scheduler" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton13" runat="server" Text="Window" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
            </div>
            
            <div class="column">
                <h4>ASP.NET MVC Controls</h4>
                <hr />
                <obout:OboutRadioButton ID="OboutRadioButton3" runat="server" Text="Button" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton8" runat="server" Text="Checkbox" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton4" runat="server" Text="Dropdown List" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton7" runat="server" Text="Image Button" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton9" runat="server" Text="Radio Button" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton5" runat="server" Text="Textbox" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton6" runat="server" Text="Multiline Textbox" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>

            </div>
            
            <div class="column">
                <h4>Miscellaneous</h4>
                <hr />
                <obout:OboutRadioButton ID="OboutRadioButton14" runat="server" Text="TreeView for Classic ASP" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
                <br />
                
                <obout:OboutRadioButton ID="OboutRadioButton15" runat="server" Text="Site Monitoring" GroupName="Items">
                    <ClientSideEvents OnCheckedChanged="onCheckedChanged" />
                </obout:OboutRadioButton>
                
            </div>
            
        </ItemTemplate>
        <Items>
            <obout:ComboBoxItem runat="server" />
        </Items>
    </obout:ComboBox>
    
    <obout:OboutButton runat="server" Text="Order" OnClick="Order" />
    
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