<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_paging_position.aspx.cs" Inherits="Grid_cs_columns_reordering" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Position for Paging Buttons and Page Size Selector</b></span>		
	
    <br /><br />

    <div style="position: relative;">
        <fieldset class="tdText" style="width: 200px;display: inline-block;">
		    <legend>Position for Page Size Selector</legend>
            <obout:OboutRadioButton ID="PageSizeSelectorPosition_Bottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="PageSizeSelectorPosition" /> <br />
            <obout:OboutRadioButton ID="PageSizeSelectorPosition_Top" runat="server" AutoPostBack="true"
                Text="Top" GroupName="PageSizeSelectorPosition" /> <br />
            <obout:OboutRadioButton ID="PageSizeSelectorPosition_TopAndBottom" runat="server" Checked="true" AutoPostBack="true"
                Text="Top and Bottom" GroupName="PageSizeSelectorPosition" />
	    </fieldset>

        <fieldset class="tdText" style="width: 200px;display: inline-block; margin-left: 20px;">
		    <legend>Position for Paging Buttons</legend>
            <obout:OboutRadioButton ID="PagingButtonsPosition_Bottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="PagingButtonsPosition" /> <br />
            <obout:OboutRadioButton ID="PagingButtonsPosition_Top" runat="server" AutoPostBack="true"
                Text="Top" GroupName="PagingButtonsPosition" /> <br />
            <obout:OboutRadioButton ID="PagingButtonsPosition_TopAndBottom" runat="server" Checked="true" AutoPostBack="true"
                Text="Top and Bottom" GroupName="PagingButtonsPosition" />
	    </fieldset>
    </div>
    
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC" />

    <br />

    <span class="tdText">
        The Grid exposes properties that allow developers to change the position of the paging buttons and the page size selector.<br /><br />
        Use the <b>PagingSettings.Position</b> property to change the position of the paging buttons.<br />
        Use the <b>PagingSettings.PageSizeSelectorPosition</b> property to change the position of the page size selector.<br />
        Both properties accept values of type <b>GridElementPosition</b>, which can be <span class="option2">Bottom</span>, <span class="option2">Top</span> and <span class="option2">TopAndBottom</span>
    </span>
</asp:Content>

