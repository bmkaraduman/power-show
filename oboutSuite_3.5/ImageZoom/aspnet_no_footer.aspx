<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<style type="text/css">
.ImageZoomEntryContainer
{
    border:0 !important;
}
.ImageZoomEntryCell
{
    margin:10px !important;
}
.ImageZoomEntryCellSelected
{
    margin:10px !important;
}
</style>
<h3> ImageZoom with no footer </h3>
<br />
    <obout:ImageZoom runat="server" ID="imageZoom" ImageUrl="images" StyleFolder="styles/simple" Effect="Fading" PageSize="100" ShowFooter="false" />

</asp:Content>
