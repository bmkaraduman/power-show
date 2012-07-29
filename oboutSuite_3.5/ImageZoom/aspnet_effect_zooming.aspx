<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<h3>Zooming effect</h3>
    <obout:ImageZoom runat="server" ID="imageZoom" ImageUrl="images" StyleFolder="styles/simple" Effect="Zooming" Width="650px" />

</asp:Content>
