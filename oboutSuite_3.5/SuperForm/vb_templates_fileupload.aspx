<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_templates_fileupload.aspx.vb" Inherits="SuperForm_vb_templates_fileupload" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - FileUpload Field</b></span>
    
    <br /><br />
    
        
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT ProductID, ProductName, UnitPrice, Image
                       FROM [Products] ORDER BY ProductID ASC"
        UpdateCommand="UPDATE Products SET ProductName=@ProductName, UnitPrice=@UnitPrice, [Image]=@Image
                       WHERE ProductID=@ProductID"
        InsertCommand="INSERT INTO Products (ProductName, UnitPrice, Image)
                        VALUES(@ProductName, @UnitPrice, @Image)"
        DeleteCommand="DELETE FROM Products WHERE ProductID = @ProductID">
        <UpdateParameters>
            <asp:Parameter Name="ProductName" DbType="String" />
            <asp:Parameter Name="UnitPrice" DbType="Double" />
            <asp:Parameter Name="Image" DbType="String" />            
            <asp:Parameter Name="ProductID" DbType="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductName" DbType="String" />
            <asp:Parameter Name="UnitPrice" DbType="Double" />
            <asp:Parameter Name="Image" DbType="String" />           
        </InsertParameters>
    </asp:SqlDataSource>

    <br /><br />
    
    <span class="tdText">
        Use the <b>TemplateField</b> class to gain full control over the layout of the field.<br /> 
        A TemplateField allows developers to specify different templates for view / add / edit modes.<br /><br />

        This example showcases the use of a TemplateField object for the "Image" field.<br />
        Using the TemplateField class we can use a FileUpload control to upload images for products.
    </span>
</asp:Content>

