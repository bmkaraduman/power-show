<%@ Page Language="C#" AutoEventWireup="true"  %>
<script runat="server">
    void Page_Init(object o, EventArgs e)
    {
        string imageID = Context.Request.QueryString["ID"];
        if (!String.IsNullOrEmpty(imageID)) // it is the 'file system' gallery image 
        {
            Page.Response.ContentType = "image/gif";
            Page.Response.BinaryWrite((new CustomPopups.ImageBrowserForInsertToDb()).GetImageBytes(int.Parse(imageID)));
            Page.Response.End();
        }
    }
</script>