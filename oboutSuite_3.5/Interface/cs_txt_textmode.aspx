<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutTextBox txt1;
    OboutTextBox txt2;
    OboutTextBox txt3;
    
    void Page_load(object sender, EventArgs e)
    {
        txt1 = new OboutTextBox();
        txt1.ID = "txt1";
        txt1.Width = Unit.Pixel(200);
        txt1.FolderStyle = "styles/grand_gray/OboutTextBox";
        txt1.TextMode = TextBoxMode.SingleLine;

        txtPlaceHolder1.Controls.Add(txt1);

        txt2 = new OboutTextBox();
        txt2.ID = "txt2";
        txt2.Width = Unit.Pixel(200);
        txt2.FolderStyle = "styles/grand_gray/OboutTextBox";
        txt2.TextMode = TextBoxMode.Password;

        txtPlaceHolder2.Controls.Add(txt2);

        txt3 = new OboutTextBox();
        txt3.ID = "txt3";
        txt3.Width = Unit.Pixel(200);
        txt3.Height = Unit.Pixel(100);
        txt3.FolderStyle = "styles/grand_gray/OboutTextBox";
        txt3.TextMode = TextBoxMode.MultiLine;

        txtPlaceHolder3.Controls.Add(txt3);
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - TextMode property</b></span>
		
		<br /><br />
		
		<span class="tdText">TextMode="SingleLine"</span><br />
		<asp:PlaceHolder runat="server" ID="txtPlaceHolder1" />
		
		<br /><br />
		
	    <span class="tdText">TextMode="Password"</span><br />
	    <asp:PlaceHolder runat="server" ID="txtPlaceHolder2" />
	    
	    <br /><br />
	    
	    <span class="tdText">TextMode="MultiLine"</span><br />
	    <asp:PlaceHolder runat="server" ID="txtPlaceHolder3" />
			
		<br /><br />
		
		<span class="tdText">
		    Use the <b>TextMode</b> property to specify whether the control is displayed as a single-line, multi-line or password text box.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>