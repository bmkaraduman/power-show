<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_columns_multiple.aspx.vb" Inherits="ComboBox_vb_columns_multiple" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .ob_iCboICBC li
        {
            float: left;
            width: 125px;
        }
        
        /* For IE6 */
        * HTML .ob_iCboICBC li
        {
            -width: 115px;
        }
        
        * HTML .ob_iCboICBC li b
        {
            width: 115px;
            overflow: hidden;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Multiple Rows and Columns</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">Two columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox1Container" />
                
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Three columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox2Container" />
               
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Four columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ComboBox3Container" />
                
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 40 * FROM Country"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be arranged on multiple columns. <br />
        This can easily be achieved using a small CSS trick:
        
        <br /><br />
        
        <span class="option2">
            .ob_iCboICBC li
            {
                float: left;
                width: 125px;
            }
        </span>
        
        <br /><br />
        
        The ComboBox will arrange its items on as many columns as possible, <br />
        taking the width of the drop down menu and the width of the individual items into account.
        
        <br /><br />
        
        When arranging the items in multiple columns, your end users will still benefit from the other features of the ComboBox:<br />
        autocomplete, load on demand, virtual scrolling, filtering, etc.
    </span>
    
</asp:Content>

