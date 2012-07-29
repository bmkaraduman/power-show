<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_fields_dropdownlistfield.aspx.cs" Inherits="SuperForm_cs_fields_dropdownlistfield" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - DropDownListField</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, O.CustomerID, ShipCountry, C.CompanyName FROM [Orders] O 
                        INNER JOIN Customers C ON C.CustomerID = O.CustomerID ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET CustomerID = @CustomerID, ShipCountry=@ShipCountry
                         WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (CustomerID, ShipCountry)
                        VALUES(@CustomerID, @ShipCountry)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC" />
    
    <br /><br />
    
    <span class="tdText">
        Add <b>DropDownListField</b> objects to the <b>Fields</b> collection to manually specify the fields that will be editable using a DropDownList.<br />
        This type of field will render an OboutDropDownList control in add / edit mode, which will allow end users to modify the underlying data.<br /><br />

        The <b>DropDownListField</b> class exposes some important properties:<br />
        <ul>
            <li><b>DataField</b> - gets or sets the name of the data field to bind to the DropDownListField object.</li>
            <li><b>HeaderText</b> - gets or sets the text that is displayed as the label of the field.</li>
            <li><b>ReadOnly</b> - gets or sets a value indicating whether the field is editable in add/edit mode.</li>
            <li><b>DataSourceID</b> - gets or sets the ID of the control from which the <b>OboutDropDownList</b> control retrieves its list of data items.</li>
            <li><b>DisplayField</b> - gets or sets a value indicating the field from the data source that will be used to display data in view mode.</li>
            <li><b>DataTextField</b> - gets or sets a value indicating the field of the data source that provides the text content for the list items.</li>
            <li><b>DataValueField</b> - gets or sets a value indicating the field of the data source that provides the value for the list items.</li>
        </ul>
        
        The <b>AutoGenerateRows</b> property of the Super Form needs to be set to <span class="option2">false</span> when manually defining the fields.
    </span>
</asp:Content>


