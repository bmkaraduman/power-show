<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_columns_states.aspx.vb" Inherits="ComboBox_vb_columns_states" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

