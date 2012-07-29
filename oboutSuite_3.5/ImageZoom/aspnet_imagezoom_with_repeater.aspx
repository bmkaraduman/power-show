<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    void Page_Load()
    {
        if (!IsPostBack)
        {
            DataSet imagesdata = new DataSet();
            imagesdata.ReadXml(MapPath("imagesdata.xml"));
            imageset.DataSource = imagesdata;
            imageset.DataBind();
        }        
    }
    void OnItemDataBound_Handle(Object o, RepeaterItemEventArgs e)
    {
        ImageZoom iz = (ImageZoom)e.Item.FindControl("imagez");
        
        DataRowView rv = (DataRowView)e.Item.DataItem;

        iz.ImageUrl = "images/" + rv.Row["bigimage"].ToString();

        iz.Description = rv.Row["description"].ToString();
    }
    
</script>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<h3>ImageZoom with Repeater</h3>
<div style="width:250px;">
<asp:Repeater id="imageset" runat="server" OnItemDataBound="OnItemDataBound_Handle">
    <ItemTemplate>
        <div style="width:102px;height:80px;float:left;">
            <obout:ImageZoom runat="server" ID="imagez" StyleFolder="styles/simple" />
        </div>
    </ItemTemplate>
</asp:Repeater>
</div>

</asp:Content>
