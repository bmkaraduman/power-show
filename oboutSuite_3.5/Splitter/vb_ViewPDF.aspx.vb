imports System
imports System.IO
imports System.Web

public class vb_ViewPDF 
	inherits  System.Web.UI.Page
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	
		dim bookId as string = Request.QueryString("bookId").ToString()

        Dim srFile As New FileStream(HttpContext.Current.Server.MapPath("resources/pdf/book_" & bookId & ".pdf"), FileMode.Open, FileAccess.Read)

        Dim pdfData(srFile.Length - 1) As Byte

        srFile.Read(pdfData, 0, srFile.Length - 1)
        srFile.Close()

        Response.AddHeader("Last-Modified", Now & " GMT")
        Response.AddHeader("Cache-Control", "no-cache, must-revalidate")
        Response.AddHeader("Content-Type", "application/pdf")
        Response.BinaryWrite(pdfData)
        Response.Flush()
        Response.End()
    End Sub
	
End Class
