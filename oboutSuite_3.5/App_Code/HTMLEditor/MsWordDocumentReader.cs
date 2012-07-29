using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Web;
using System.IO;
using System.Threading;
using System.Runtime.InteropServices;
using System.Text;

public class MsWordDocumentReader : Obout.Ajax.UI.HTMLEditor.Popups.IDocumentReader
{
    object fltDocFormat = 10; //For filtered HTML Output
    protected object missing = System.Reflection.Missing.Value;
    protected object readOnly = false; //Open file in readOnly mode
    protected object isVisible = false;//The process has to be in invisible mode

    // implementing the method of the 'IDocumentReader' interface
    /// <summary>
    /// Read the document's content
    /// </summary>
    /// <param name="path">Path of the file to be read</param>
    /// <param name="alertMessage">Message to be alerted on document import (usually to indicate an error)</param>
    /// <returns>HTML content of the document to be imported</returns>
    public string GetHtml(string path, out string alertMessage)
    {
        alertMessage = ""; // no alert by default
        string result = ""; // result content
        Microsoft.Office.Interop.Word.ApplicationClass objApp = null; // MS Word application
        object hName = path + ".html"; // temporary HTML file
        object wName = path; // path of the source file
        string url = System.Web.HttpContext.Current.Request.QueryString["url"]; // relative URL of the source file
        
        // comment the following line if you want to have relative URL's in the document
        url = Obout.Ajax.UI.HTMLEditor.Popups.GalleryManager.GetHttpRoot(System.Web.HttpContext.Current.Request) + url;

        string clearedFileName = HttpUtility.UrlPathEncode(Path.GetFileName(path)); // cleared file name of the source

        if (File.Exists(hName.ToString())) // remove the temporary file if exists
        {
            if (CanAccess(hName.ToString()))
            {
                File.Delete(hName.ToString());
            }
        }

        try
        {
            // create application
            objApp = new Microsoft.Office.Interop.Word.ApplicationClass();
            // open document
            objApp.Documents.Open(ref wName, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
            // make the application invisible
            objApp.Visible = false;
            // get the active document
            Microsoft.Office.Interop.Word.Document oDoc = objApp.ActiveDocument;
            // save it to the temporay HTML file
            oDoc.SaveAs(ref hName, ref fltDocFormat, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
            // quite the application
            objApp.Quit(ref missing, ref missing, ref missing);

            // get the content of the temporary HTML file
            if (CanAccess(hName.ToString()))
            {
                // get styles and body's content from the temporary HTML document
                result = (new Obout.Ajax.UI.HTMLEditor.Popups.HtmlReader()).GetHtml(hName.ToString(), out alertMessage);
                // for images URL's
                result = result.Replace(clearedFileName, url);
                // we don't need this file anymore
                File.Delete(hName.ToString());
            }
        }
        catch (Exception ex)
        {
            // something wrong...
            alertMessage = ex.Message;
        }
        finally
        {
            // ensure the MS Word application is stopped
            if (objApp != null)
            {
                objApp = null;
                GC.Collect();
                GC.WaitForPendingFinalizers();
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
        }

        return result;
    }

    // wait for the file can be accessed
    private bool CanAccess(String path)
    {
        DateTime maxTime = DateTime.Now.AddSeconds(10.0);
        bool retval = false;
        while (DateTime.Now < maxTime)
        {
            Thread.Sleep(1000);
            if (File.Exists(path))
            {
                if (!IsLocked(path))
                {
                    retval = true;
                    break;
                }
            }
        }
        return retval;
    }

    // check the file is locked
    private bool IsLocked(string filepath)
    {
        try
        {
            Stream stream = File.Open(filepath, FileMode.Open, FileAccess.ReadWrite, FileShare.None);
            if (stream != null)
            {
                stream.Dispose();
                return false;
            }
            return true;
        }
        catch
        {
            return true;
        }
    }
}