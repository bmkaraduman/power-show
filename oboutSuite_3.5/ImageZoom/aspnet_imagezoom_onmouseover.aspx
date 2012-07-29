<%@ Page Language="C#" MasterPageFile="aspnet_imagezoom.master" Title="ASPNET ImageZoom example" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.ImageZoom" Assembly="obout_ImageZoom_NET"%>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataSet imagesdata = new DataSet();
            imagesdata.ReadXml(MapPath("seachimagesdata.xml"));
            imageset.DataSource = imagesdata;
            imageset.DataBind();
        }
    }

    void OnItemDataBound_Handle(Object o, RepeaterItemEventArgs e)
    {
        ImageZoom iz = (ImageZoom)e.Item.FindControl("imagez");
        DataRowView rv = (DataRowView)e.Item.DataItem;
        iz.ImageUrl = "images/imagesearch/" + rv.Row["smallimage"].ToString();
        iz.BigImageUrl = "images/imagesearch/" + rv.Row["bigimage"].ToString();
        iz.Description = "<span style='color:green;'>" + rv.Row["description"].ToString() + "</span><br/>" + rv.Row["bigimage"].ToString();
        iz.Attributes["onmouseover"] = "zoom(this)";
    }    
</script>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<script type="text/javascript">
    var _open = new Array();
    var _big_image_click = false;
    function zoom(obj) {
        var imagez = eval("window." + obj.id + "_ImageZoom");
        imagez.zoomIn();
        setTimeout(function () {
            var _big_image = OboutIZ_obj(imagez._id + ".bigimage");
            _big_image.parentNode.onmouseout = function () { imagez.zoomOut(); };
            imagez.___BIWasOvered = false;
            _big_image.parentNode.onmouseover = function () { imagez.___BIWasOvered = true; };
            setTimeout(function () {
                if (!imagez.___BIWasOvered) {
                    imagez.zoomOut();
                }
            }, 500);
        }, 0);    }
    function OnBeforeZoomIn_Handle(sender, arg) {
        for (var i in _open) {
            if (_open[i].id != sender.id && (_open[i].getStatus() == "opened" || _open[i].getStatus() == "opening" || _open[i].getStatus() == "loading")) {
                _open[i].zoomOut();
            }
        }
        return true;
    }
    function OnZoomIn_Handle(sender, arg) {
        for (var i in _open) {
            if (_open[i].id != sender.id && (_open[i].getStatus() == "opened" || _open[i].getStatus() == "opening" || _open[i].getStatus() == "loading")) {
                _open[i].zoomOut();
            }
        }
        _open[sender.id] = sender;
    }
    function OnBeforeBigImageClick_Handle(sender, arg) {
        _big_image_click = true;
        return false;
    }
    document.onclick = function () {
        if (_big_image_click) {
            _big_image_click = false;
            return;
        }
        for (var i in _open)
            if (_open[i].getStatus() == "opened")
                _open[i].zoomOut();
    }    
</script>
<h3>Open with MouseOver</h3>
<div style="width:600px;height:320px" >
To open the large image move the cursor over the thumbnail.
<br />
<asp:Repeater id="imageset" runat="server" OnItemDataBound="OnItemDataBound_Handle">
    <ItemTemplate>
        <div style="width:150px;height:150px;float:left;">
        <table>
            <tr>
                <td align="center" valign="middle">
                    <div style="padding:3px;border:solid 1px gray;">
                        <obout:ImageZoom runat="server" ID="imagez" NumberOfFrames="5" ZoomTime="100" Position="IMAGE_CENTER" StyleFolder="styles/simple" BackgroundOpacity="0" OnZoomIn="OnZoomIn_Handle" OnBeforeZoomIn="OnBeforeZoomIn_Handle" OnBeforeBigImageClick="OnBeforeBigImageClick_Handle"/>    
                    </div>
                </td>
            </tr>
        </table>
        </div>    
    </ItemTemplate>
</asp:Repeater>
</div>

</asp:Content>
