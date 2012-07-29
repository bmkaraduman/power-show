<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim OboutCheckBox1 As OboutCheckBox
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutCheckBox1 = New OboutCheckBox()
        OboutCheckBox1.ID = "OboutCheckBox1"
        OboutCheckBox1.FolderStyle = "styles/grand_gray/OboutCheckBox"
        OboutCheckBox1.Text = "Select Me"
        OboutCheckBox1.AutoPostBack = True
        
        AddHandler OboutCheckBox1.CheckedChanged, AddressOf OboutCheckBox1_CheckedChanged

        PlaceHolder1.Controls.Add(OboutCheckBox1)
    End Sub
    
    Protected Sub OboutCheckBox1_CheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
        label1.Text = "<br /><br />The checked state of the check box has been changed to: " + CType(sender, OboutCheckBox).Checked.ToString().ToLower()
    End Sub
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>