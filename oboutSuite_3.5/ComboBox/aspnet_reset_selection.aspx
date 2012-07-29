<%@ Page Title="" Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript">
   var initialSelectedIndex = -1;
   window.onload = function() {
   initialSelectedIndex = ComboBox1.selectedIndex();

   }

   function onReset() {
       ComboBox1.selectedIndex(initialSelectedIndex);
       return false;
   }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Reset Selection</b></span>
    
    <br /><br /><br />
    
    <table>
        <tr>
            <td>
                <obout:ComboBox runat="server" ID="ComboBox1"  SelectedIndex="2"
                    DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID"
                    Width="150"
                    />
            </td>
            <td width="25">&#160;</td>
            <td>
                <obout:OboutButton ID="OboutButton1" runat="server" Text="Reset" OnClientClick="return onReset()"
		        FolderStyle="../interface/styles/black_glass/OboutButton" />	     
            </td>
        </tr>
    </table>       
        
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
       This example shows how to reset the selection from the ComboBox to the initial selection. <br/>
       The initial selected index was cached in a client-side variable when the page was loaded   <br/>
       and then it is used as a parameter for the "selectedIndex" method when the "Reset" button  <br/>
       is clicked.
    </span>
</asp:Content>

