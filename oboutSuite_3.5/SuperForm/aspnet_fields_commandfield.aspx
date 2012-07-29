<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="aspnet_fields_commandfield.aspx.cs" Inherits="SuperForm_aspnet_fields_commandfield" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - CommandField</b></span>
    
    <br /><br />
    
    <table>
        <tr>
            <td>
                <obout:SuperForm ID="SuperForm1" 
                    Title="Order Details"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateRows="False"
                    DataKeyNames="OrderID"
                    RunAt="server"
                    AllowPaging="True" AllowDataKeysInsert="False" 
                    EnableModelValidation="True"
                    DefaultMode="Edit">
                    <Fields>
                        <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" />
                        <obout:BoundField DataField="ShipName" HeaderText="Ship Name" />
                        <obout:BoundField DataField="ShipCity" HeaderText="Ship City" />
                        <obout:BoundField DataField="ShipCountry" HeaderText="Ship Country" />
                        <obout:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ShowInsertButton="true" />
                    </Fields>
                </obout:SuperForm>
            </td>
            <td width="25">&#160;</td>
            <td>
                <obout:SuperForm ID="SuperForm2" 
                    Title="Order Details"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateRows="False"
                    DataKeyNames="OrderID"
                    RunAt="server"
                    AllowPaging="True" AllowDataKeysInsert="False" 
                    EnableModelValidation="True"
                    DefaultMode="Edit">
                    <Fields>
                        <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" />
                        <obout:BoundField DataField="ShipName" HeaderText="Ship Name" />
                        <obout:BoundField DataField="ShipCity" HeaderText="Ship City" />
                        <obout:BoundField DataField="ShipCountry" HeaderText="Ship Country" />
                        <obout:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ShowInsertButton="true" />
                    </Fields>
                </obout:SuperForm>
            </td>
            <td width="25">&#160;</td>
            <td>
                <obout:SuperForm ID="SuperForm3" 
                    Title="Order Details"
                    DataSourceID="SqlDataSource1"
                    AutoGenerateRows="False"
                    DataKeyNames="OrderID"
                    RunAt="server"
                    AllowPaging="True" AllowDataKeysInsert="False" 
                    EnableModelValidation="True"
                    DefaultMode="Edit">
                    <Fields>
                        <obout:BoundField DataField="OrderID" HeaderText="Order ID" ReadOnly="true" InsertVisible="false" />
                        <obout:BoundField DataField="ShipName" HeaderText="Ship Name" />
                        <obout:BoundField DataField="ShipCity" HeaderText="Ship City" />
                        <obout:BoundField DataField="ShipCountry" HeaderText="Ship Country" />
                        <obout:CommandField ButtonType="Image" 
                            ShowEditButton="true" ShowDeleteButton="true" ShowInsertButton="true" 
                            EditImageUrl="resources/icons/Edit.png"
                            DeleteImageUrl="resources/icons/Delete.png"
                            NewImageUrl="resources/icons/Add.png"
                            InsertImageUrl="resources/icons/Save.png"
                            UpdateImageUrl="resources/icons/Save.png"
                            CancelImageUrl="resources/icons/Delete.png"
                            />
                    </Fields>
                </obout:SuperForm>
            </td>
        </tr>
    </table>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipCountry
                       FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipCountry=@ShipCountry
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipCountry)
                        VALUES(@ShipName, @ShipCity, @ShipCountry)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        Use the <b>CommandField</b> class to manipulate the action buttons of a Super Form.<br />
        Using this class you can specify the type of the buttons and which buttons to be shown.<br /><br />

        The <b>CommandField</b> class exposes the <b>ButtonType</b> property that allows you to select the type of buttons to be used.<br />
        There are three options:<br />
        <ul>
            <li><b>Button</b> - the buttons will be generated using <b>OboutButton</b> objects.</li>
            <li><b>Image</b> - the buttons will be generated using <b>OboutImageButton</b> objects.</li>
            <li><b>ReadOnly</b> - the buttons will be generated using <b>LinkButton</b> objects.</li>
        </ul>
        
        The <b>AutoGenerateDeleteButton</b>, <b>AutoGenerateEditButton</b> and <b>AutoGenerateInsertButton</b> properties <br />
        of the Super Form need to be set to <span class="option2">false</span> when manually defining a <b>CommandField</b>.
    </span>
</asp:Content>

