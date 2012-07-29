<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutCheckBox OboutCheckBox1;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutCheckBox1 = new OboutCheckBox();
        OboutCheckBox1.ID = "OboutCheckBox1";
        OboutCheckBox1.FolderStyle = "styles/grand_gray/OboutCheckBox";
        OboutCheckBox1.Text = "Select Me";
        OboutCheckBox1.AutoPostBack = true;
        
        OboutCheckBox1.CheckedChanged += OboutCheckBox1_CheckedChanged;

        PlaceHolder1.Controls.Add(OboutCheckBox1);
    }
    
    protected void OboutCheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        label1.Text = "<br /><br />The checked state of the check box has been changed to: " + ((OboutCheckBox)sender).Checked.ToString().ToLower();
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
			
			.button
			{
			    font:11px Verdana;
				color:#333333;
				width: 175px;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Server-Side Events</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
        
        <br /><br />
		
		<span class="tdText">
		    Use the <b>OnCheckedChanged</b> event to detect when the check box is checked / unchecked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>