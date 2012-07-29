<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_icons_columns.aspx.vb" Inherits="ComboBox_vb_icons_columns" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .ob_iCboICBC li
        {
            float: left;
            width: 110px;
        }
        
        /* For IE6 */
        * HTML .ob_iCboICBC li
        {
            -width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Multiple Rows and Columns with Icons</b></span>	
    
    <br /><br />
    
     <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT ControlID, ControlName, ImageName FROM Controls ORDER BY ControlName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Controls.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        The icon of the selected item can be displayed in the input field of the ComboBox, <br />
        by setting the <b>ShowSelectedImage</b> property to <span class="option2">true</span>.
        
        <br /><br />
        
        You can display icons for items even when the ComboBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
        
        <br /><br />
        
        The items can contain icons even when they are displayed on multiple rows and columns.
        
    </span>
</asp:Content>

