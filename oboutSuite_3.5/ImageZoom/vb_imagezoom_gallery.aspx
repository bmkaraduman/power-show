<%@ Page Title="" Language="VB" MasterPageFile="~/ImageZoom/vb_imagezoom.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<script runat="server">
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim iz As New ImageZoom()
        iz.ID = "iz"
        iz.ImageUrl = "images"
        iz.StyleFolder = "styles/simple"
        iz.Description = "Description"
        iz.Width = Unit.Pixel(700)
        myPanel.Controls.Add(iz)
        
    End Sub
    
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:Panel runat="server" ID="myPanel" />
</asp:Content>

