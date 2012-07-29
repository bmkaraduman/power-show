<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content runat="server" ContentPlaceHolderID="head">

	<link href="resources/custom-styles/grand_gray/style.css" rel="Stylesheet" type="text/css" />		
	<link href="resources/custom-styles/premiere_blue/style.css" rel="Stylesheet" type="text/css" />
			
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
   
   <span class="tdText"><b>ASP.NET ComboBox - Different Styles</b></span>	
    
    <br /><br />
     <table>
	    <tr>
		   <td width="240" valign="top">
                <obout:ComboBox runat="server" ID="ComboBox1" Width="250" EmptyText="Select a customer ..."
                    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" FolderStyle="styles/black_glass"
                    />     
           </td> 
           <td width="240" valign="top">  
              <span class="grand-gray">
              <obout:ComboBox runat="server" ID="ComboBox2" Width="250" EmptyText="Select a customer ..."
                 DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" FolderStyle="_"
                 />
               </span>
            </td> 
           <td width="240" valign="top">  
              <span class="premiere_blue">
              <obout:ComboBox runat="server" ID="ComboBox3" Width="250" EmptyText="Select a customer ..."
              DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID" FolderStyle="_"
              />
              </span>
           </td>
       </tr>
   </table>
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 10 CustomerID, CompanyName FROM Customers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        You can have multiple ComboBox controls with different styles on the same page, by using the CssSettings property <br />or by using custom stylesheets.
        <br /><br />
        CssSettings should be used for minor customizations, custom stylesheets should be used when using many <br />controls with different styles on the same page (as in this example).

    </span>
    
</asp:Content>