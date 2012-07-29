<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="cs_columns_states.aspx.cs" Inherits="ComboBox_cs_columns_states" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
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
     <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    &#160;&#160;&#160;
     <asp:PlaceHolder runat="server" ID="ComboBox2Container" />
    
    <br /><br />
    
    <span class="tdText">
        The ComboBox control provides the autocomplete feature, which assists the end users in finding items faster.<br />
        As soon as the user types something, the ComboBox will locate the first matching item (in alphabetical order) and it will autocomplete it.<br /><br />
        The autocomplete operation is performed on the client-side and thus it is extremly fast.
    </span>
    
</asp:Content>
