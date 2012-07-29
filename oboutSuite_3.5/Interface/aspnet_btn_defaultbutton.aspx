<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    protected void Btn_Click(object sender, EventArgs e)
    {
        Literal1.Text = "<br /><br />" + ((Button)sender).Text + " has been clicked.";
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
		<form id="Form1" runat="server" defaultbutton="OboutButton1">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutButton - Default Button</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="OboutTextBox1" FolderStyle="styles/premiere_blue/OboutTextBox" Text=""  />
		<obout:OboutTextBox runat="server" ID="OboutTextBox2" FolderStyle="styles/premiere_blue/OboutTextBox" Text=""  />
		
		<br /><br />
		
		<obout:OboutButton runat="server" ID="OboutButton1" OnClick="Btn_Click"
		    FolderStyle="styles/premiere_blue/OboutButton" Text="Button1" />
		    
		<obout:OboutButton runat="server" ID="OboutButton2" OnClick="Btn_Click"
		    FolderStyle="styles/premiere_blue/OboutButton" Text="Button2" />
		  
		<span class="tdText">
		    <asp:Literal runat="server" ID="Literal1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>defaultbutton</b> property of the <b>&lt;form&gt;</b> element to specify the default button of the page.<br />
		    When hitting Enter in any textbox, the default button will be activated.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>