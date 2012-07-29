<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_different_styles.aspx.vb" Inherits="ListBox_vb_apiclient_events" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
	<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Different Styles</b></span>	
    
    <br /><br />
     <table>
	    <tr>
		   <td width="240" valign="top">
                <asp:PlaceHolder runat="server" ID="ListBoxContainer1" /> 
           </td> 
           <td width="240" valign="top">  
              <span class="grand-gray">
              <asp:PlaceHolder runat="server" ID="ListBoxContainer2" /> 
               </span>
            </td> 
           <td width="240" valign="top">  
              <span class="premiere_blue">
             <asp:PlaceHolder runat="server" ID="ListBoxContainer3" /> 
              </span>
           </td>
       </tr>
   </table>
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        You can have multiple ListBox controls with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

    </span>
    
</asp:Content>