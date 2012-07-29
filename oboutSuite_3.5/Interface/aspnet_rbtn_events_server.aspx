<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
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
		
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton1" OnCheckedChanged="OboutRadioButton_CheckedChanged"
		    FolderStyle="styles/grand_gray/OboutRadioButton" Text="Option 1" AutoPostBack="true" GroupName="g1" />
		    
		<obout:OboutRadioButton runat="server" ID="OboutRadioButton2" OnCheckedChanged="OboutRadioButton_CheckedChanged"
		    FolderStyle="styles/grand_gray/OboutRadioButton" Text="Option 2" AutoPostBack="true" GroupName="g1" />
		    
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>OnCheckedChanged</b> event to detect when the radio button is checked / unchecked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>