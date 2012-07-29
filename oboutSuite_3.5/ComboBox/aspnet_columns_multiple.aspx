<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
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

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Multiple Rows and Columns</b></span>	
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <span class="tdText">Two columns:</span><br />
                <obout:ComboBox runat="server" MenuWidth="325" ID="ComboBox1"
                    DataSourceID="sds1" DataValueField="CountryID" DataTextField="CountryName" />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Three columns:</span><br />
                <obout:ComboBox runat="server" MenuWidth="475" ID="ComboBox2"
                    DataSourceID="sds1" DataValueField="CountryID" DataTextField="CountryName" />
            </td>
            <td width="25">&#160;</td>
            <td>
                <span class="tdText">Four columns:</span><br />
                <obout:ComboBox runat="server" MenuWidth="650" ID="ComboBox3"
                    DataSourceID="sds1" DataValueField="CountryID" DataTextField="CountryName" />
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