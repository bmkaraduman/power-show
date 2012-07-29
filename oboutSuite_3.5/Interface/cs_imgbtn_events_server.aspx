<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutImageButton OboutImageButton1;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutImageButton1 = new OboutImageButton();
        OboutImageButton1.ID = "OboutImageButton1";
        OboutImageButton1.ImageUrl = "images/buy_normal.gif";
        OboutImageButton1.ImageUrl_Over = "images/buy_over.gif";
        OboutImageButton1.ImageUrl_Focused = "images/buy_focused.gif";
        OboutImageButton1.ImageUrl_Pressed = "images/buy_pressed.gif";

        OboutImageButton1.Click += new ImageClickEventHandler(Btn_Click);
        
        PlaceHolder1.Controls.Add(OboutImageButton1);
    }

    protected void Btn_Click(object sender, ImageClickEventArgs e)
    {
        label1.Text = "<br /><br />The button has been clicked.";
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
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Server-Side Events</b></span>
		
		<br /><br />
				
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>Click</b> event to detect when the button is pressed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>