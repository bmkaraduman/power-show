<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutImageButton OboutImageButton1;
    OboutImageButton OboutImageButton2;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutImageButton1 = new OboutImageButton();
        OboutImageButton1.ID = "OboutImageButton1";
        OboutImageButton1.ImageUrl = "images/ok_normal.gif";
        OboutImageButton1.ImageUrl_Over = "images/ok_over.gif";
        OboutImageButton1.ImageUrl_Focused = "images/ok_focused.gif";
        OboutImageButton1.ImageUrl_Pressed = "images/ok_pressed.gif";
        OboutImageButton1.CommandName = "Add";
        OboutImageButton1.CommandArgument = "arg1";

        OboutImageButton1.Command += new CommandEventHandler(Btn_Command);

        PlaceHolder1.Controls.Add(OboutImageButton1);

        OboutImageButton2 = new OboutImageButton();
        OboutImageButton2.ID = "OboutImageButton2";
        OboutImageButton2.ImageUrl = "images/buy_normal.gif";
        OboutImageButton2.ImageUrl_Over = "images/buy_over.gif";
        OboutImageButton2.ImageUrl_Focused = "images/buy_focused.gif";
        OboutImageButton2.ImageUrl_Pressed = "images/buy_pressed.gif";
        OboutImageButton2.CommandName = "Edit";
        OboutImageButton2.CommandArgument = "arg2";

        OboutImageButton2.Command += new CommandEventHandler(Btn_Command);

        PlaceHolder2.Controls.Add(OboutImageButton2);
    }
    
    protected void Btn_Command(object sender, CommandEventArgs e)
    {
        label1.Text = "<br /><br />Button '" + ((OboutImageButton)sender).ID + "' has been pressed.<br />";
        label1.Text += "CommandName: '" + e.CommandName + "' / CommandArgument: '" + e.CommandArgument.ToString() + "'"; 
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
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Server-Side Commands</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>CommandName</b> and <b>CommandArgument</b> properties to configure the parameters for the commands raised by the buttons.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>