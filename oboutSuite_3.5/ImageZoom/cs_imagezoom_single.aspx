<%@ Page Language="C#" MasterPageFile="cs_imagezoom.master" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Page_Init(Object s, EventArgs e)
    {
        ImageZoom iz = new ImageZoom();
        iz.ID = "iz";
        iz.ImageUrl = "images/missworld.jpg";
        iz.StyleFolder = "styles/simple";
        iz.Description = "Miss World 2007";
        myPanel.Controls.Add(iz);
    }
</script>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

<center>
    <asp:Panel runat="server" ID="myPanel" />
</center>
</asp:Content>
