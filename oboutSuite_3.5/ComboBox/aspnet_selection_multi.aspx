<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Multi Item Selection</b></span>	
    
    <br /><br />
    
    <obout:ComboBox runat="server" ID="ComboBox1" EmptyText="Select multiple countries ..." Width="400"
        DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryID" AllowEdit="false"
        SelectionMode="Multiple"
        />
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT TOP 15 CountryID, CountryName FROM Country ORDER BY CountryName DESC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox provides two selection modes:
        
        <ul>
            <li>single item selection - when using this mode, only an item from the list can be selected at a time;</li>
            <li>multi item selection - when using this mode, the end user can select multiple items (using CTRL + click);</li>
        </ul>
        
        To enable one selection mode or the other, use the <b>SelectionMode</b> property, <br />
        which can be set either to <span class="option2">Single</span> or <span class="option2">Multiple</span>.<br /><br />
        
        When using the <span class="option2">Multiple</span> selection mode, the end user can also select multiple items <br />
        using the autocomplete feature. The items will be separated in the input field using a separator, <br />
        which is set by default to a comma ",". This character can be changed using the <b>MultiSelectionSeparator</b> property.
            
    </span>
    
</asp:Content>