<%@ Page Title="" Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript">
   var initialSelectedIndex = -1;
   window.onload = function() {
       initialSelectedIndex = ListBox1.selectedIndex();

   }

   function onReset() {
       ListBox1.selectedIndex(initialSelectedIndex);
       return false;
   }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Reset Selection</b></span>
    
    <br /><br />
    
    <table>
        <tr>
            <td>
               <obout:ListBox runat="server" ID="ListBox1" Width="150" SelectedIndex="3"
                    DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID" />           
            </td>
            <td width="25">&#160;</td>
            <td valign="top">
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Reset" OnClientClick="return onReset()"
		        FolderStyle="../interface/styles/black_glass/OboutButton" />	                      
            </td>
        </tr>
    </table>       
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
       This example shows how to reset the selection from the ListBox to the initial selection. <br/>
       The initial selected index was cached in a client-side variable when the page was loaded   <br/>
       and then it is used as a parameter for the "selectedIndex" method when the "Reset" button  <br/>
       is clicked.
    </span>
    
</asp:Content>

