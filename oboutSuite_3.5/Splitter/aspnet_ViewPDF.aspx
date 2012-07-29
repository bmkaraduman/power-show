<%@ Import Namespace="System.IO" %>
<%@ Page Language="c#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
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
</script>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
