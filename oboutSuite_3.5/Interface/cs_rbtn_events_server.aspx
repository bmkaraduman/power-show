<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutRadioButton OboutRadioButton1;
    OboutRadioButton OboutRadioButton2;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutRadioButton1 = new OboutRadioButton();
        OboutRadioButton1.ID = "OboutRadioButton1";
        OboutRadioButton1.FolderStyle = "styles/grand_gray/OboutRadioButton";
        OboutRadioButton1.Text = "Option 1";
        OboutRadioButton1.GroupName = "g1";
        OboutRadioButton1.AutoPostBack = true;

        OboutRadioButton1.CheckedChanged += OboutRadioButton_CheckedChanged;
        
        PlaceHolder1.Controls.Add(OboutRadioButton1);
        
        
        OboutRadioButton2 = new OboutRadioButton();
        OboutRadioButton2.ID = "OboutRadioButton2";
        OboutRadioButton2.FolderStyle = "styles/grand_gray/OboutRadioButton";
        OboutRadioButton2.Text = "Option 2";
        OboutRadioButton2.GroupName = "g1";
        OboutRadioButton2.AutoPostBack = true;

        OboutRadioButton2.CheckedChanged += OboutRadioButton_CheckedChanged;

        PlaceHolder2.Controls.Add(OboutRadioButton2);
    }

    protected void OboutRadioButton_CheckedChanged(object sender, EventArgs e)
    {
        label1.Text = "<br /><br />The checked state of the radio button has been changed to: " + ((OboutRadioButton)sender).Checked.ToString().ToLower();
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
		
		<span class="tdText"><b>obout Interface - OboutRadioButton - Server-Side Events</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		    
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
        
        <br /><br />
		
		<span class="tdText">
		    Use the <b>OnCheckedChanged</b> event to detect when the radio button is checked / unchecked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>