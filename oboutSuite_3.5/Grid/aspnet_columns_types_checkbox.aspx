<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_columns_types_checkbox.aspx.cs" Inherits="Grid_aspnet_columns_types_checkbox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - CheckBoxColumn</b></span>		
	
    <br /><br />

    <obout:OboutRadioButton runat="server" ID="RbtnObout" GroupName="ControlType" Text="OboutCheckBox Controls" Checked="true" AutoPostBack="true" />
    &#160;&#160;
    <obout:OboutRadioButton runat="server" ID="RbtnStandard" GroupName="ControlType" Text="Standard CheckBox Controls" AutoPostBack="true" />

    <br /><br />

    <obout:Grid id="Grid1" runat="server" DataSourceID="SqlDataSource1" Serialize="false"
        AutoGenerateColumns="false" AllowAddingRecords="true" AllowColumnReordering="true">
        <Columns>
            <obout:Column DataField="OrderID" Visible="false" />            
            <obout:Column DataField="ShipName" HeaderText="SHIP NAME" />            
            <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" />
            <obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" />
            <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" />
            <obout:CheckBoxColumn DataField="Sent" HeaderText="SENT" Width="75" ShowHeader="true" />
            <obout:Column AllowEdit="true" AllowDelete="true" />
        </Columns>
	</obout:Grid>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 500 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry], [Sent], Sent AS Sent2 FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipPostalCode, ShipCountry, Sent) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @Sent)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity,ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry, Sent=@Sent WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="Sent" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="Sent" Type="Boolean" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />                
        </DeleteParameters>
    </asp:SqlDataSource>

    <br />

    <span class="tdText">
        The Grid provides various types of columns that are designed to perform a specific task.<br />
        The <b>CheckBoxColumn</b> column allows developers to add a column containing checkboxes for displaying boolean values.<br />
        The checkboxes are disabled in view mode, but they are enabled in add/edit mode.<br />
        You can choose whether you want to use standard ASP.NET CheckBox or OboutCheckBox controls by setting the <b>ControlType</b> property <br />
        to either <span class="option2">GridControlType.Standard</span> or <span class="option2">GridControlType.Obout</span>.
    </span>
</asp:Content>

