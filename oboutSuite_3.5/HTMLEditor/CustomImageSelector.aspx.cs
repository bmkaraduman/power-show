using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Obout.Ajax.UI.HTMLEditor;
using Obout.Ajax.UI.HTMLEditor.ToolbarButton;
using System.Collections.ObjectModel;
using System.Globalization;

public partial class HTMLEditor_CustomImageSelector : System.Web.UI.Page
{
    // folder with images
    public string relativeUrl = "~/App_Obout/HTMLEditor/ImageGallery/Nature";

    protected void Page_Load(object sender, EventArgs e)
    {
        // resolved URL
        string folderUrl = ResolveUrl(relativeUrl);
        // path to the folder with images
        string folderPath = Page.MapPath(folderUrl);
        if (Directory.Exists(folderPath)) // such folder exists
        {
            // get all entires
            string[] entires = Directory.GetFileSystemEntries(folderPath);
            foreach (string entire in entires)
            {
                FileAttributes attr = File.GetAttributes(entire);
                string name = Path.GetFileName(entire);
                // get files only
                if (!((attr & FileAttributes.Directory) == FileAttributes.Directory))
                {
                    string ext = Path.GetExtension(entire).ToLower();
                    // images only
                    if (ext == ".gif" || ext == ".jpg" || ext == ".jpeg" || ext == ".bmp" || ext == ".png")
                    {
                        string width = "", height = "";
                        GetWidthHeight(entire, out width, out height);
                        string title = GetTitle(entire);
                        string url = Path.Combine(folderUrl, name).Replace("\\", "/");
                        // put the 'preview' image into the page
                        string str = "<img align=\"top\" title=\""+(ext.Substring(1)+" "+width+"x"+height)+"\" alt=\"\" style=\"cursor: pointer; border-style: solid; border-color: white; border-width:3px\" onmouseout=\"if(!this.selected) this.style.borderColor = 'white';\" onmouseover=\"if(!this.selected) this.style.borderColor = 'gray';\" onclick=\"_setResult(this);\" ondblclick=\"_returnResult(this);\" width=\"100\" src=\"" + url + "\" source-url=\"" + url + "\" source-height=\"" + height + "\" source-width=\"" + width + "\" source-title=\"" + title + "\" />";
                        Literal1.Text += str+"\n";
                    }
                }
            }
        }
    }
    // gets the image's title
    private string GetTitle(string filename)
    {
        return ""; // you can override it
    }

    // gets the image's sizes
    private void GetWidthHeight(string filename, out string width, out string height)
    {
        width = "";
        height = "";
        System.Drawing.Image objImage;
        MemoryStream objStream;

        FileStream binStream = File.OpenRead(filename);
        byte[] buf = new byte[binStream.Length];

        System.Drawing.Image.GetThumbnailImageAbort myCallback = new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback);

        binStream.Read(buf, 0, (int)binStream.Length);
        binStream.Close();

        objStream = new MemoryStream(buf);
        objStream.Position = 0;
        try
        {
            objImage = System.Drawing.Image.FromStream(objStream);
            width = objImage.Width.ToString();
            height = objImage.Height.ToString();
            objImage.Dispose();
        }
        catch { }
        objStream.Close();
    }
    private bool ThumbnailCallback()
    {
        return false;
    }
}
