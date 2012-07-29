<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="cs_commands_add_position.aspx.cs" Inherits="Grid_cs_commands_add_position" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Position for New Record / Links</b></span>		
	
    <br /><br />

    <div style="position: relative;">
        <fieldset class="tdText" style="width: 300px;display: inline-block;">
		    <legend>Position for "Add New" / "Save" / "Cancel" links</legend>
            <obout:OboutRadioButton ID="AddLinksPosition_Bottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="AddLinksPositionGroup" /> <br />
            <obout:OboutRadioButton ID="AddLinksPosition_Top" runat="server" AutoPostBack="true"
                Text="Top" GroupName="AddLinksPositionGroup" /> <br />
            <obout:OboutRadioButton ID="AddLinksPosition_TopAndBottom" runat="server" Checked="true" AutoPostBack="true"
                Text="Top and Bottom" GroupName="AddLinksPositionGroup" />
	    </fieldset>

        <fieldset class="tdText" style="width: 200px;display: inline-block; margin-left: 20px;">
		    <legend>Position for New Record</legend>
            <obout:OboutRadioButton ID="NewRecordPosition_Bottom" runat="server" AutoPostBack="true"
                Text="Bottom" GroupName="NewRecordPositionGroup" /> <br />
            <obout:OboutRadioButton ID="NewRecordPosition_Top" runat="server" AutoPostBack="true"
                Text="Top" GroupName="NewRecordPositionGroup" /> <br />
            <obout:OboutRadioButton ID="NewRecordPosition_Dynamic" runat="server" Checked="true" AutoPostBack="true"
                Text="Dynamic" GroupName="NewRecordPositionGroup" />
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
        The Grid exposes properties that allow developers to change the position of the new record and of the "Add New" / "Save" / "Cancel" links.<br /><br />
        Use the <b>AddEditDeleteSettings.AddLinksPosition</b> property to change the position of the "Add New" / "Save" / "Cancel" links.<br />
        This property accepts values of type <b>GridElementPosition</b>, which can be <span class="option2">Bottom</span>, <span class="option2">Top</span> and <span class="option2">TopAndBottom</span>.<br /><br />
        Use the <b>AddEditDeleteSettings.NewRecordPosition</b> property to change the position of the new record.<br />
        This property accepts values of type <b>GridDynamicElementPosition</b>, which can be <span class="option2">Bottom</span>, <span class="option2">Top</span> and <span class="option2">Dynamic</span>.<br />
        When <span class="option2">Dynamic</span> is used the new record will be positioned either at the top or at the bottom, depending on which "Add New" link was clicked.
    </span>
</asp:Content>

