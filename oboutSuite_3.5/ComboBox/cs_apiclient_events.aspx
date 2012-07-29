<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_apiclient_events.aspx.cs" Inherits="ComboBox_cs_apiclient_events" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function ComboBox1_SelectedIndexChanged(sender, selectedIndex) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('SelectedIndexChanged was raised - new selected index: ' + selectedIndex + currentLogs);
        }

        function ComboBox1_ItemClick(sender, selectedIndex) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('ItemClick was raised - item with index ' + selectedIndex + ' was clicked ' + currentLogs);
        }

        function ComboBox1_Open(sender) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('Open was raised' + currentLogs);
        }

        function ComboBox1_Close(sender) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('Close was raised' + currentLogs);
        }
        function ComboBox1_Focus(sender) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('Focus was raised' + currentLogs);
        }
        function ComboBox1_Blur(sender) {
            var currentLogs = '\r\n' + OboutTextBox1.value();
            OboutTextBox1.value('Blur was raised' + currentLogs);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Client-Side API - Events</b></span>	
    
    <br /><br />
    
    <span class="tdText">Event logger:</span><br />
    
    <obout:OboutTextBox runat="server" ID="OboutTextBox1" TextMode="MultiLine" Width="400" Height="150" />
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
         
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides client-side events that allow you to detect<br />
        when the end user performs a specific action with the control. <br />
        The following client-side events are raised by the control:<br /><br />
        
        <ul>
            <li><span class="option2">SelectedIndexChanged</span> - is raised when the selection is changed;</li>
            <li><span class="option2">OnItemClick</span> - is raised when an item is clicked (selection doesn't need to change);</li>
            <li><span class="option2">OnOpen</span> - is raised when the drop down menu is opened;</li>
            <li><span class="option2">OnClose</span> - is raised when the drop down menu is closed;</li>
            <li><span class="option2">OnFocus</span> - is raised when the control receives the focus;</li>
            <li><span class="option2">OnBlur</span> - is raised when the control loses the focus;</li>
        </ul>
        
        <br /><br />
        
        To set up event handlers for these events you need to use the <b>ClientSideEvents</b> property of the ComboBox.
    </span>
    
</asp:Content>