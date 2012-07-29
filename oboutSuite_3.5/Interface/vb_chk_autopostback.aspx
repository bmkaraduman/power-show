<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="VB" runat="server">
    Dim OboutCheckBox1 As OboutCheckBox

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        OboutCheckBox1 = New OboutCheckBox()
        OboutCheckBox1.ID = "OboutCheckBox1"
        OboutCheckBox1.Text = "Select Me!"
        OboutCheckBox1.FolderStyle = "styles/premiere_blue/OboutCheckBox"
        OboutCheckBox1.AutoPostBack = True

        chkPlaceHolder.Controls.Add(OboutCheckBox1)
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - AutoPostBack property</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="chkPlaceHolder" />
		
		<br /><br />
		
		<span class="tdText">
		    By setting <b>AutoPostBack</b> to <span class="option2">true</span>, the page will be posted back to the server when the check box is checked / unchecked.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>