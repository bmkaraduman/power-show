<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ImageZoom1.DataSource = ImageZoomData.GetImageZoomData();
            ImageZoom1.DataBind();
        }
    }
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <h3>  Binding to Dataset </h3> 
    <br />
    <obout:ImageZoom ID ="ImageZoom1" runat="server" DataUrlField="imageUrl" DataDescriptionField="imageDescription" StyleFolder="styles/simple" Effect="Fading" PageSize="10" Width="700px" ></obout:ImageZoom>
</asp:Content>
