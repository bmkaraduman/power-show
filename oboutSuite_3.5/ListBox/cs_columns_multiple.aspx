<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_columns_multiple.aspx.cs" Inherits="ListBox_cs_columns_multiple"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .ob_iLboICBC li
        {
            float: left;
            width: 125px;
        }
        
        /* For IE6 */
        * HTML .ob_iLboICBC li
        {
            -width: 115px;
        }
        
        * HTML .ob_iLboICBC li b
        {
            width: 115px;
            overflow: hidden;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Multiple Rows and Columns</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td valign="top">
                <span class="tdText">Two columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox1Container" />      
                
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <span class="tdText">Three columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox2Container" />      
                
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <br /><br />
                <span class="tdText">Four columns:</span><br />
                <asp:PlaceHolder runat="server" ID="ListBox3Container" />      
               
            </td>
        </tr>
    </table>    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 40 * FROM Country"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can be arranged on multiple columns. <br />
        This can easily be achieved using a small CSS trick:
        
        <br /><br />
        
        <span class="option2">
            .ob_iLboICBC li
            {
                float: left;
                width: 125px;
            }
        </span>
        
        <br /><br />
        
        The ListBox will arrange its items on as many columns as possible, <br />
        taking the width of the drop down menu and the width of the individual items into account.
        
        <br /><br />
        
        When arranging the items in multiple columns, your end users will still benefit from the other features of the ListBox:<br />
        autocomplete, load on demand, virtual scrolling, filtering, etc.
    </span>
    
</asp:Content>