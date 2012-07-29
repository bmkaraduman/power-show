<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="cs_columns_states.aspx.cs" Inherits="ListBox_cs_columns_states" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .long-states .ob_iLboICBC li
        {
            float: left;
            width: 105px;
        }
        
        .short-states .ob_iLboICBC li
        {
            float: left;
            width: 35px;
        }
        
        /* For IE6 */
        * HTML .long-states .ob_iLboICBC li
        {
            -width: 95px;
        }
        
        * HTML .short-states .ob_iLboICBC li
        {
            -width: 25px;
        }
        
        * HTML .ob_iLboICBC li i
        {
            -visibility: hidden;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - State Selector</b></span>	
    
    <br /><br />
    
    <div style="width: 550px;">
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
        
    </div>
    
    <br /><br />
    
    <div style="width: 550px; text-align: center;">
    <asp:PlaceHolder runat="server" ID="ListBox2Container" /> 
        
    </div>
    
    <br /><br />
    
     <span class="tdText">
        By arranging the items of the ListBox on multiple rows and columns you can create a powerful widget that allows your end users to easily select a U.S. state.<br />

        This will allow your users to locate a state much faster, without being needed to scroll through a long list with states. 
    </span>
    
</asp:Content>
