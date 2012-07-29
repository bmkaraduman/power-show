<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <h3> Binding to SqlDataSource </h3> 
        
    <br />
    <obout:ImageZoom ID ="ImageZoomTable2" runat="server" DataSourceID="Sds" DataUrlField="imageUrl" DataDescriptionField="imageDescription" Effect="Fading" Width="700px" StyleFolder="styles/simple" ></obout:ImageZoom>
        <asp:SqlDataSource ID="Sds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ImageZoomOle %>" 
        ProviderName="<%$ ConnectionStrings:ImageZoomOle.ProviderName %>" 
        SelectCommand="SELECT [id], [imageUrl], [imageDescription] FROM [tbl_ImageZoom]">
    </asp:SqlDataSource>
    
</asp:Content>
    