<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<center>

    <obout:ImageZoom runat="server" ID="imageZoom" ImageUrl="images/mw.jpg" BigImageUrl="images/missworld.jpg" StyleFolder="styles/dark" Description="Miss World 2007" />

</center>
</asp:Content>
