<%@ WebHandler Language="C#" Class="GetImageHandler" %>
using System;
using System.Web;
using System.Data;
using System.Data.OleDb;

/// <summary>
/// Get image from database
/// </summary>
public class GetImageHandler : IHttpHandler
{
    /// <summary>
    /// Define the main method (IHttpHandler)
    /// </summary>
    /// <param name="context">Current context</param>
    public void ProcessRequest(HttpContext context)
    {
        string imageId = context.Request.QueryString["imageid"];

        // if it is a request for the image
        if (!string.IsNullOrEmpty(imageId))
        {
            writeImage(context, imageId);
        }
    }

    /// <summary>
    /// Write the image's binary content to the response
    /// </summary>
    /// <param name="context">Current context</param>
    /// <param name="imageId">ID of the row in the data table</param>
    private static void writeImage(HttpContext context, string imageId)
    {
        context.Response.ContentType = "image/jpeg";
        context.Response.BinaryWrite(GetImageBytes(int.Parse(imageId)));
        context.Response.End();
    }
    
    /// <summary>
    /// Get bytes of the image
    /// </summary>
    /// <param name="id">ID of the row in the data table</param>
    /// <returns>byte[]</returns>
    private static byte[] GetImageBytes(int id)
    {
        byte[] content = null;
        OleDbConnection connection = new OleDbConnection();
        try
        {
            connection.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + System.Web.HttpContext.Current.Server.MapPath("../App_Data/StoredImages.mdb") + ";";
            connection.Open();
            string sqlString = "Select * from tbImage Where id=" + id.ToString();
            OleDbDataAdapter eAdapter = new OleDbDataAdapter(sqlString, connection);
            DataTable eTable = new DataTable();
            eAdapter.Fill(eTable);

            if (eTable.Rows.Count > 0)
            {
                content = (byte[])eTable.Rows[0]["fldContent"];
            }

            eAdapter.Dispose();
            eTable.Dispose();
        }
        finally
        {
            connection.Close();
            connection.Dispose();
        }
        return content;
    }

    /// <summary>
    /// Define the IsReusable property (IHttpHandler).
    /// </summary>
    public bool IsReusable
    {
        get { return true; }
    }
}