<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_columns_states.aspx.cs" Inherits="ComboBox_aspnet_columns_states" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .long-states .ob_iCboICBC li
        {
            float: left;
            width: 105px;
        }
        
        .short-states .ob_iCboICBC li
        {
            float: left;
            width: 35px;
        }
        
        /* For IE6 */
        * HTML .long-states .ob_iCboICBC li
        {
            -width: 95px;
        }
        
        * HTML .short-states .ob_iCboICBC li
        {
            -width: 25px;
        }
        
        * HTML .ob_iCboICBC li i
        {
            -visibility: hidden;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - State Selector</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" 
        Width="150" MenuWidth="550" EmptyText="Select a state ...">
        <CssSettings ItemsContainer="ob_iCboIC long-states" />
    </obout:ComboBox>
    
    &#160;&#160;&#160;
    
    <obout:ComboBox runat="server" ID="ComboBox2" 
        Width="150" MenuWidth="335" EmptyText="Select a state ...">
        <CssSettings ItemsContainer="ob_iCboIC short-states" />
    </obout:ComboBox>
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides the autocomplete feature, which assists the end users in finding items faster.<br />
        As soon as the user types something, the ComboBox will locate the first matching item (in alphabetical order) and it will autocomplete it.<br /><br />
        The autocomplete operation is performed on the client-side and thus it is extremly fast.
    </span>
    
</asp:Content>
