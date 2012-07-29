<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script runat="server">

    protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        imageZoom.StyleFolder = ddl.SelectedValue;
        imageZoom.Update();
    }
    
</script>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<h3>Live Styles</h3>
<br />

   <span class="tdText"> Select style: </span> <obout:OboutDropDownList ID="ddl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_SelectedIndexChanged">
        <asp:ListItem Text="simple" Value="styles/simple" Selected="True"></asp:ListItem>
        <asp:ListItem Text="dark_gray" Value="styles/dark_gray"></asp:ListItem>
        <asp:ListItem Text="light_blue" Value="styles/light_blue"></asp:ListItem>
    </obout:OboutDropDownList>

<br />
<br />
    <obout:ImageZoom 
    runat="server" 
    ID="imageZoom" 
    ImageUrl="images" 
    StyleFolder="styles/simple" 
    Description="Description will come here, you can set the layout from the xml template in style folder." 
    Width="650px" 
    PageSize="15" />

</asp:Content>
