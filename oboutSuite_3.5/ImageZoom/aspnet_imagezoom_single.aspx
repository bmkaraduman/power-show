<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<center>

    <obout:ImageZoom runat="server" ID="imageZoom" ImageUrl="images/missworld.jpg" StyleFolder="styles/simple" Description="Miss World 2007" />

</center>
</asp:Content>
