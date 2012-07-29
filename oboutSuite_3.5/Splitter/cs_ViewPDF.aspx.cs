using System;
using System.IO;
using System.Web;

public class cs_ViewPDF : System.Web.UI.Page
{
	void Page_Load(object sender, EventArgs e) {

		string bookId = Request.QueryString["bookId"].ToString();
		
        FileStream srFile = new FileStream(HttpContext.Current.Server.MapPath("resources/pdf/book_" + bookId + ".pdf"), FileMode.Open, FileAccess.Read);

        byte[] pdfData = new byte[srFile.Length - 1];

        srFile.Read(pdfData, 0, (int)srFile.Length - 1);
        srFile.Close();

        Response.AddHeader("Last-Modified", DateTime.Now + " GMT");
        Response.AddHeader("Cache-Control", "no-cache, must-revalidate");
        Response.AddHeader("Content-Type", "application/pdf");
        Response.BinaryWrite(pdfData);
        Response.Flush();
        Response.End();
		
    }
}
