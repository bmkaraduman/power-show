<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutRadioButton OboutRadioButton1;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutRadioButton1 = new OboutRadioButton();
        OboutRadioButton1.ID = "OboutRadioButton1";
        OboutRadioButton1.FolderStyle = "styles/premiere_blue/OboutRadioButton";
        OboutRadioButton1.Text = "Option 1";

        PlaceHolder1.Controls.Add(OboutRadioButton1);
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
		    function checkRadioButton() {
		        OboutRadioButton1.checked(true);
		    }

		    function uncheckRadioButton() {
		        OboutRadioButton1.checked(false);

		    }

		    function focusRadioButton() {
		        OboutRadioButton1.focus();
		    }

		    function enableRadioButton() {
		        OboutRadioButton1.enable();
		    }

		    function disableRadioButton() {
		        OboutRadioButton1.disable();
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutRadioButton - Client-Side Manipulation</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		
		<br /><br />
		
		<input type="button" value="Check" class="button" onclick="checkRadioButton()" /> <span class="option2">OboutRadioButton1.checked(true);</span>
		        
        <br /><br />
        
        <input type="button" value="Uncheck" class="button" onclick="uncheckRadioButton()" /> <span class="option2">OboutRadioButton1.checked(false);</span>
		        
        <br /><br />
		
		<input type="button" value="Focus" class="button" onclick="focusRadioButton()" /> <span class="option2">OboutRadioButton1.focus();</span>
		        
        <br /><br />
		
		<input type="button" value="Enable" class="button" onclick="enableRadioButton()" /> <span class="option2">OboutRadioButton1.enable();</span>
		        
        <br /><br />
        
        <input type="button" value="Disable" class="button" onclick="disableRadioButton()" /> <span class="option2">OboutRadioButton1.disable();</span>
        
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutRadioButton</b> control exposes many client-side methods that allow you manipulate the control on the client-side.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>