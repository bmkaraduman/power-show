<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Aligning Items</b></span>	
    
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
                <obout:ComboBox runat="server" ID="ComboBox1" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                </obout:ComboBox>
            </td>
            <td class="tdText">
                <obout:ComboBox runat="server" ID="ComboBox2" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                    <CssSettings ItemsContainer="ob_iCboIC center" />
                </obout:ComboBox>
            </td>
            <td class="tdText">
                <obout:ComboBox runat="server" ID="ComboBox3" Width="200"
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID">
                    <CssSettings ItemsContainer="ob_iCboIC right" />
                </obout:ComboBox>
            </td>
        </tr>
    </table>

    <br /><br />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

    <span class="tdText">
        The alignment of the ComboBox items can easily be changed using CSS.<br />
        This example showcases the use of three ComboBox controls with different alignment types for their items.<br />
    </span>
	
<style type="text/css">
.center .ob_iCboICBC li b {
	text-align: center !important;
}
.right .ob_iCboICBC li b {
	text-align: right !important;
}
</style>
</asp:Content>