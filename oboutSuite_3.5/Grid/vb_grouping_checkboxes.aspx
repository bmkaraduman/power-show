<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_grouping_checkboxes.aspx.vb" Inherits="Grid_vb_grouping_checkboxes" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Group using CheckBoxes</b></span>		
	
    <br /><br />
    
    <table class="tdText">
        <tr>
            <td valign="top">Group by: </td>
            <td width="5">&#160;</td>
            <td>
                <obout:OboutCheckBox ID="ChkGroupByCountry" runat="server" AutoPostBack="true" Text="SHIP COUNTRY" Checked="true" />
                &#160;&#160;&#160;
                <obout:OboutCheckBox ID="ChkGroupByCity" runat="server" AutoPostBack="true" Text="SHIP CITY" />
            </td>
        </tr>
    </table>    
               
    <br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders]" />

    <br />

    <span class="tdText">
        This example showcases the ability to group the records of the Grid using external check boxes.<br />
        The <b>GroupBy</b> property of the Grid is set at runtime (in the <b>Page_Load</b> method) based on<br />
        the state of the check boxes. The <b>GroupingSettings.AllowChanges</b> property is set to <span class="option2">false</span><br />
        to prevent end users from modifying the grouping using drag and drop.
    </span>
</asp:Content>
