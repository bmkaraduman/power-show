<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" CodeFile="cs_selection_single.aspx.cs" Inherits="ListBox_cs_selection_single"%>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Single Item Selection</b></span>	
    
    <br /><br />
     <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
       
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ListBox provides two selection modes:
        
        <ul>
            <li>single item selection - when using this mode, only an item from the list can be selected at a time;</li>
            <li>multi item selection - when using this mode, the end user can select multiple items (using CTRL + click);</li>
        </ul>
        
        To enable one selection mode or the other, use the <b>SelectionMode</b> property, <br />
        which can be set either to <span class="option2">Single</span> or <span class="option2">Multiple</span>.<br /><br />
            
    </span>
    
</asp:Content>