<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutButton OboutButton1;
    OboutButton OboutButton2;
    OboutTextBox OboutTextBox1;
    OboutTextBox OboutTextBox2;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutTextBox1 = new OboutTextBox();
        OboutTextBox1.ID = "OboutTextBox1";
        OboutTextBox1.FolderStyle = "styles/premiere_blue/OboutTextBox";

        PlaceHolder1.Controls.Add(OboutTextBox1);
        
        OboutTextBox2 = new OboutTextBox();
        OboutTextBox2.ID = "OboutTextBox2";
        OboutTextBox2.FolderStyle = "styles/premiere_blue/OboutTextBox";

        PlaceHolder2.Controls.Add(OboutTextBox2);
        
        OboutButton1 = new OboutButton();
        OboutButton1.ID = "OboutButton1";
        OboutButton1.FolderStyle = "styles/premiere_blue/OboutButton";
        OboutButton1.Text = "Button1";
        
        OboutButton1.Click += new EventHandler(Btn_Click);

        PlaceHolder3.Controls.Add(OboutButton1);

        OboutButton2 = new OboutButton();
        OboutButton2.ID = "OboutButton2";
        OboutButton2.FolderStyle = "styles/premiere_blue/OboutButton";
        OboutButton2.Text = "Button2";

        OboutButton2.Click += new EventHandler(Btn_Click);

        PlaceHolder4.Controls.Add(OboutButton2);
    }
    
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
				
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		
		<br /><br />				
		    
        <asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder4" />
		  
		<span class="tdText">
		    <asp:Literal runat="server" ID="Literal1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>defaultbutton</b> property of the <b>&lt;form&gt;</b> element to specify the default button of the page.<br />
		    When hitting Enter in any textbox, the default button will be activated.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>