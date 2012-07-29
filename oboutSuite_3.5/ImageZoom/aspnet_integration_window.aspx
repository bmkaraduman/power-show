<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<%@ Register Assembly="obout_ImageZoom_NET" Namespace="OboutInc.ImageZoom" TagPrefix="obout" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<h3> ImageZoom with Window </h3>
    <div>
    <input type="button" value="Open Window" onclick="myWindow.Open();" />
    <owd:Window runat="server"  Title="Sample Images" ID="myWindow" Width="480" Height="480" Left="200" Top="100"  StyleFolder="../window/wdstyles/dogma" VisibleOnLoad="false" ShowMaximizeButton="true">

        <obout:ImageZoom ID="ImageZoom1" runat="server" ShowLoading="true" Width="100%" zIndex="2000"
                    Effect="Fading" Position="SCREEN_CENTER" PageSize="50" StyleFolder="styles/simple"
                    ThumbnailHeight="50" Thumbnailwidth="50" DisplayStyle="ListView" 
                    ImageUrl="images" BackgroundOpacity="2">
        </obout:ImageZoom>
    </owd:Window>
    </div>
</asp:Content>