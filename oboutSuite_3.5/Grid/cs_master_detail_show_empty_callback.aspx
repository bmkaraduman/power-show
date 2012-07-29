<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_master_detail_show_empty_callback.aspx.cs" Inherits="Grid_cs_master_detail_show_empty_callback" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Showing Empty Detail Grids with OnLoad</b></span>		
		
	<br /><br />
    
        <span class="tdText">
		    <asp:CheckBox runat="server" ID="ChkShowEmptyDetails" AutoPostBack="true" Text="Show Empty Detail Grids" />
		</span>
		
		<br /><br />
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
        		
		<br /><br />				
		
        <div class="tdText" style="width: 725px;">
            The Grid allows developers to choose whether the empty detail grids (which don't contain any rows) should be displayed or not.
            To control this behavior, you need to use the <b>MasterDetailSettings.ShowEmptyDetails</b> property.<br /><br />
            
            When using the <b>OnLoad</b> pattern, since all the detail grids are loaded at once when the page is loaded, setting the
            <b>MasterDetailSettings.ShowEmptyDetails</b> property is enough for the Grid to determine which details to show and which to hide.<br /><br /> 

            When using the <b>OnCallback</b> patter, since the detail grids are loaded on demand via AJAX, setting the 
            <b>MasterDetailSettings.ShowEmptyDetails</b> property is not enough for the Grid to determine which details to show and which to hide.
            Developers also need to use the <b>MasterDetailSettings.DetailsCountField</b> property, to indicate the name of the field
            from the data source which contains the number of details for each row. To populate this field, you can use a sub-query in the main query 
            that loads the data for the detail grid (check the source code of this sample).
        </div>

		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT *, (SELECT COUNT(*) FROM Employees WHERE ReportsTo = E.EmployeeID) AS HasDetails FROM [Employees] E WHERE ReportsTo IS NULL"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT *, (SELECT COUNT(*) FROM Employees WHERE ReportsTo = E.EmployeeID) AS HasDetails FROM [Employees] E WHERE ReportsTo = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
   
</asp:Content>

