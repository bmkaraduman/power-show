<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutTextBox txt1;

    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);
        txt1.TextChanged += txt1_TextChanged;

        txtPlaceHolder.Controls.Add(txt1);
    }
    
    protected void txt1_TextChanged(object sender, EventArgs e)
    {
        label1.Text = "The text was modified to: " + txt1.Text + "<br /><br />";
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - Server-Side events</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder" />
		
		<br />
		
		<asp:Button runat="server" Text="Submit" CssClass="tdText" />
		
		<br /><br />
		
		<span class="tdText">
		    The <b>TextChanged</b> server event is raised when the text of the textbox is changed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>