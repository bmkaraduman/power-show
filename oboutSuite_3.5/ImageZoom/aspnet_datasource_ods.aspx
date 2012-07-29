<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <h3> Binding to ObjectDataSource </h3> 
        
    <br />
    <obout:ImageZoom ID ="ImageZoomTable2" runat="server" DataSourceID="Ods" DataUrlField="imageUrl" DataDescriptionField="imageDescription" Effect="Fading" Width="700px"  StyleFolder="styles/simple"></obout:ImageZoom>
    <asp:ObjectDataSource ID="Ods" runat="server" SelectMethod="GetImageZoomData" 
            TypeName="ImageZoomData"></asp:ObjectDataSource>
    
</asp:Content>
