<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutImageButton btn1;
    
    void Page_load(object sender, EventArgs e)
    {
        btn1 = new OboutImageButton();
        btn1.ID = "btn1";
        btn1.ImageUrl = "images/ok_normal.gif";
        btn1.ImageUrl_Over = "images/ok_over.gif";
        btn1.ImageUrl_Focused = "images/ok_focused.gif";
        btn1.ImageUrl_Pressed = "images/ok_pressed.gif";
        btn1.ImageUrl_Disabled = "images/ok_disabled.gif";

        PlaceHolder1.Controls.Add(btn1);
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
		<script type="text/javascript">
		    function clickButton() {
		        btn1.click();
		    }
		
		    function focusButton() {
		        btn1.focus();
		    }

		    function enableButton() {
		        btn1.enable();
		    }

		    function disableButton() {
		        btn1.disable();
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutImageButton - Client-Side Manipulation</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
		<br /><br />
		
		<input type="button" value="Click" class="button" onclick="clickButton()" /> <span class="option2">btn1.click();</span>
		        
        <br /><br />
		
		<input type="button" value="Focus" class="button" onclick="focusButton()" /> <span class="option2">btn1.focus();</span>
		        
        <br /><br />
		
		<input type="button" value="Enable" class="button" onclick="enableButton()" /> <span class="option2">btn1.enable();</span>
		        
        <br /><br />
        
        <input type="button" value="Disable" class="button" onclick="disableButton()" /> <span class="option2">btn1.disable();</span>
        
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutImageButton</b> exposes many client-side methods that allow you manipulate the control on the client-side.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>