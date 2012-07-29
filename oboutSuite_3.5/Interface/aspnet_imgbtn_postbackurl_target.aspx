<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        OboutTextBox OboutTextBox1 = (OboutTextBox)Page.PreviousPage.FindControl("OboutTextBox1");
        Literal1.Text = OboutTextBox1.Text;
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}			
			
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Cross-Page Posting</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    Textbox value from the source page: <asp:Literal ID="Literal1" runat="server" />
		</span>		
		  
		<br /><br /><br />
		
		<a href="javascript: history.back();">« Back to source page</a>
		
		</form>    
	</body>
</html>