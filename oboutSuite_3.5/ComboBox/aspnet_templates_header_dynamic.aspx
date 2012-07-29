<%@ Page Language="C#" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="aspnet_templates_header_dynamic.aspx.cs" Inherits="ComboBox_aspnet_templates_header_dynamic" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_iLboICHCM
        {
            overflow: hidden;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Dynamic Header Templates</b></span>	
    
    <br /><br />
    
    <%--
	<asp:UpdatePanel runat="server" ID="CascadingPanel">
	    <ContentTemplate>	
	--%>
	
    <obout:ComboBox runat="server" ID="ComboBox1" Width="275" Height="200" AppendDataBoundItems="false"
        DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
        AutoPostBack="true"
        OnSelectedIndexChanged="ComboBox1_OnSelectedIndexChanged">
    </obout:ComboBox>
	
	&#160;&#160;&#160;
    
    <obout:ComboBox runat="server" ID="ComboBox2" Width="200" Height="200" Enabled="false" AppendDataBoundItems="false"
        DataSourceID="sds2" DataTextField="OrderID" DataValueField="OrderID"
        AutoPostBack="true"
        OnSelectedIndexChanged="ComboBox2_OnSelectedIndexChanged">        
    </obout:ComboBox>
    
    &#160;&#160;&#160;
    
    <obout:ComboBox runat="server" ID="ComboBox3" Width="200" Height="200" Enabled="false" AppendDataBoundItems="false"
        DataSourceID="sds3" DataTextField="CompanyName" DataValueField="SupplierID">
    </obout:ComboBox>
	
	<%--
	    </ContentTemplate>
	</asp:UpdatePanel>
	--%>
    
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
	 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID ORDER BY OrderID ASC"
	 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="CustomerID" Type="String"  />
	    </SelectParameters>
	 </asp:SqlDataSource>
	 
	 <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT S.SupplierID, S.CompanyName FROM  (((Suppliers S INNER JOIN Products P ON S.SupplierID = P.SupplierID) INNER JOIN [Order Details] ON P.ProductID = [Order Details].ProductID) INNER JOIN Orders O ON [Order Details].OrderID = O.OrderID) WHERE (O.OrderID = @OrderID) ORDER BY S.CompanyName"
	 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
	    <SelectParameters>
	        <asp:Parameter Name="OrderID" Type="Int32"  />
	    </SelectParameters>
	 </asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The ComboBox provides a way to customize the header of the list, by using the <b>HeaderTemplate</b> property. <br />
        You can embed any content inside the header template, including HTML markup and ASP.NET server controls <br />
        (any control from the Obout suite may be added to the header template).<br /><br />

        This sample shows how to dynamically change the text in the HeaderTemplate based on the selections from different controls.
    </span>

</asp:Content>

