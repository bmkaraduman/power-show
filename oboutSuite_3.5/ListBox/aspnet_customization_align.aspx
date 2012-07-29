<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Aligning Items</b></span>	
    
    <br /><br />

    <table>
        <tr>
            <td class="tdText">
                Left
            </td>
            <td class="tdText">
                Center
            </td>
            <td class="tdText">
                Right
            </td>
        </tr>
        <tr>
            <td class="tdText">
                <obout:ListBox runat="server" ID="ListBox1" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                </obout:ListBox>
            </td>
            <td class="tdText">
                <obout:ListBox runat="server" ID="ListBox2" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                    <CssSettings ItemsContainer="ob_iCboIC center" />
                </obout:ListBox>
            </td>
            <td class="tdText">
                <obout:ListBox runat="server" ID="ListBox3" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                    <CssSettings ItemsContainer="ob_iCboIC right" />
                </obout:ListBox>
            </td>
        </tr>
    </table>

    <br /><br />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <span class="tdText">
        The alignment of the ListBox items can easily be changed using CSS.<br />
        This example showcases the use of three ListBox controls with different alignment types for their items.<br />
    </span>
	
<style type="text/css">
.center .ob_iLboICBC li b {
	text-align: center !important;
}
.right .ob_iLboICBC li b {
	text-align: right !important;
}
</style>
</asp:Content>