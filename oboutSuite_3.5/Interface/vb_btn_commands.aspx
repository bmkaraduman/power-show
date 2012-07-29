<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/VB" runat="server">
    Dim OboutButton1 As OboutButton
    Dim OboutButton2 As OboutButton
    Dim OboutButton3 As OboutButton
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutButton1 = new OboutButton()
        OboutButton1.ID = "OboutButton1"
        OboutButton1.Width = Unit.Pixel(150)
        OboutButton1.FolderStyle = "styles/grand_gray/OboutButton"
        OboutButton1.Text = "Add"
        OboutButton1.CommandName = "Add"
        OboutButton1.CommandArgument = "arg1"

        AddHandler OboutButton1.Command, AddressOf Btn_Command

        PlaceHolder1.Controls.Add(OboutButton1)
        
        OboutButton2 = new OboutButton()
        OboutButton2.ID = "OboutButton2"
        OboutButton2.Width = Unit.Pixel(150)
        OboutButton2.FolderStyle = "styles/grand_gray/OboutButton"
        OboutButton2.Text = "Edit"
        OboutButton2.CommandName = "Edit"
        OboutButton2.CommandArgument = "arg2"

        AddHandler OboutButton2.Command, AddressOf Btn_Command

        PlaceHolder2.Controls.Add(OboutButton2)
        
        OboutButton3 = new OboutButton()
        OboutButton3.ID = "OboutButton3"
        OboutButton3.Width = Unit.Pixel(150)
        OboutButton3.FolderStyle = "styles/grand_gray/OboutButton"
        OboutButton3.Text = "Delete"
        OboutButton3.CommandName = "Delete"
        OboutButton3.CommandArgument = "arg3"
       
        AddHandler OboutButton3.Command, AddressOf Btn_Command

        PlaceHolder3.Controls.Add(OboutButton3)
    End Sub
    
    Protected Sub Btn_Command(ByVal sender As Object, ByVal e As CommandEventArgs)
        label1.Text = "<br /><br />Button '" + (CType(sender, OboutButton)).ID + "' has been pressed.<br />"
        label1.Text += "CommandName: '" + e.CommandName + "' / CommandArgument: '" + e.CommandArgument.ToString() + "'"
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
		
		<span class="tdText"><b>obout Interface - OboutButton - Server-Side Commands</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder2" />
		<asp:PlaceHolder runat="server" ID="PlaceHolder3" />
		
		<span class="tdText">
		    <asp:Literal runat="server" ID="label1" />
		</span>
		  
        <br /><br />
		
		<span class="tdText">
		    Use the <b>CommandName</b> and <b>CommandArgument</b> properties to configure the parameters for the commands raised by the buttons.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>