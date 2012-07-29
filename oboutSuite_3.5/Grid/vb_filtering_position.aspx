<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_filtering_position.aspx.vb" Inherits="Grid_vb_filtering_position" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Position for New Record / Links</b></span>		
	
    <br /><br />

    <div style="position: relative;">
        <fieldset class="tdText" style="width: 300px;display: inline-block; vertical-align:top">
		    <legend>Position for Filter links</legend>
            <obout:OboutRadioButton ID="PositionTop" runat="server" AutoPostBack="true"
                Text="Top" GroupName="AddLinksPositionGroup" /><br />
            <obout:OboutRadioButton ID="PositionBottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="AddLinksPositionGroup" /> <br />
            <obout:OboutRadioButton ID="PositionTopAndBottom" runat="server" AutoPostBack="true"
                Text="Top And Bottom" GroupName="AddLinksPositionGroup" Checked="true"/> <br />
	    </fieldset>

        <fieldset class="tdText" style="width: 200px;display: inline-block; margin-left: 20px; vertical-align:top">
		    <legend>Position for Filter Row</legend>
            <obout:OboutRadioButton ID="NewFilterRow_PositionTop" runat="server" AutoPostBack="true"
                Text="Top" GroupName="NewRecordPositionGroup" /> <br />
            <obout:OboutRadioButton ID="NewFilterRow_PositionBottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="NewRecordPositionGroup" Checked="true"/><br />
	    </fieldset>
    </div>

    <br /><br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 25 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity,ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />                
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />                
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
		The Grid exposes properties that allow developers to change the position of the filter row and of the "Show Filter" / "Apply Filter" / "Hide Filter" / "Remove Filter" links.<br /><br />

        Use the <b>FilteringSettings.FilterLinksPosition</b> property to change the position of the "Show Filter" / "Apply Filter" / "Hide Filter" / "Remove Filter" links. <br />
        This property accepts values of type <b>GridElementPosition</b>, which can be <span class="option2">Bottom</span>, <span class="option2">Top</span> and <span class="option2">TopAndBottom</span>.<br /><br />

        Use the <b>FilteringSettings.FilterPosition</b> property to change the position of the filter row . This property accepts values of type <b>GridFilterPosition</b>, which can be <span class="option2">Top</span> and <span class="option2">Bottom</span>.  
	</span>
</asp:Content>

