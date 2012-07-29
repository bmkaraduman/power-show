<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat=server>

    protected void Page_Load(object sender, EventArgs e)
    {

        ImageZoom ImageZoom1 = new ImageZoom();
        ImageZoom1.ID = "ImageZoom1";
        ImageZoom1.DataUrlField = "imageUrl";
        ImageZoom1.DataDescriptionField = "imageDescription";
        ImageZoom1.StyleFolder = "styles/simple";
        ImageZoom1.Effect = OboutInc.ImageZoom.Enums.ImageZoomEffects.Fading;
        ImageZoom1.PageSize = 10;
        ImageZoom1.Width = Unit.Pixel(700);

        ImageZoom1.DataSourceID = "Sds";

        phIZ.Controls.Add(ImageZoom1);

    }
    
</script>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <h3> Binding to SqlDataSource </h3> 
        
    <br />
    <asp:PlaceHolder ID="phIZ" runat="server"></asp:PlaceHolder>
        <asp:SqlDataSource ID="Sds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ImageZoomOle %>" 
        ProviderName="<%$ ConnectionStrings:ImageZoomOle.ProviderName %>" 
        SelectCommand="SELECT [id], [imageUrl], [imageDescription] FROM [tbl_ImageZoom]">
    </asp:SqlDataSource>
    </form>
    
</asp:Content>
    