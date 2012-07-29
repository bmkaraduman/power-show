<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script type="text/C#" runat="server">
    OboutCheckBox OboutCheckBox1;
    
    void Page_load(object sender, EventArgs e)
    {
        OboutCheckBox1 = new OboutCheckBox();
        OboutCheckBox1.ID = "OboutCheckBox1";
        OboutCheckBox1.FolderStyle = "styles/premiere_blue/OboutCheckBox";
        OboutCheckBox1.Text = "Select Me";

        PlaceHolder1.Controls.Add(OboutCheckBox1);
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
		    function checkCheckBox() {
		        OboutCheckBox1.checked(true);
		        // or:
		        // OboutCheckBox1.checked(Obout.Interface.OboutCheckBox.CheckedState.Checked);
		    }

		    function partiallyCheckCheckBox() {
		        OboutCheckBox1.checked(Obout.Interface.OboutCheckBox.CheckedState.PartiallyChecked);
		        // or:
		        // OboutCheckBox1.checked(3);
		    }

		    function uncheckCheckBox() {
		        OboutCheckBox1.checked(false);
		        // or:
		        // OboutCheckBox1.checked(Obout.Interface.OboutCheckBox.CheckedState.Unchecked);
		    }

		    function focusCheckBox() {
		        OboutCheckBox1.focus();
		    }

		    function enableCheckBox() {
		        OboutCheckBox1.enable();
		    }

		    function disableCheckBox() {
		        OboutCheckBox1.disable();
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutCheckBox - Client-Side Manipulation</b></span>
		
		<br /><br />
		
		<asp:PlaceHolder runat="server" ID="PlaceHolder1" />
		    
		<br /><br />
		
		<input type="button" value="Check" class="button" onclick="checkCheckBox()" /> <span class="option2">OboutCheckBox1.checked(true);</span>
		        
        <br /><br />
        
        <input type="button" value="Partially Check" class="button" onclick="partiallyCheckCheckBox()" /> <span class="option2">OboutCheckBox1.checked(Obout.Interface.OboutCheckBox.CheckedState.PartiallyChecked);</span>
		        
        <br /><br />
        
        <input type="button" value="Uncheck" class="button" onclick="uncheckCheckBox()" /> <span class="option2">OboutCheckBox1.checked(false);</span>
		        
        <br /><br />
		
		<input type="button" value="Focus" class="button" onclick="focusCheckBox()" /> <span class="option2">OboutCheckBox1.focus();</span>
		        
        <br /><br />
		
		<input type="button" value="Enable" class="button" onclick="enableCheckBox()" /> <span class="option2">OboutCheckBox1.enable();</span>
		        
        <br /><br />
        
        <input type="button" value="Disable" class="button" onclick="disableCheckBox()" /> <span class="option2">OboutCheckBox1.disable();</span>
        
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutCheckBox</b> control exposes many client-side methods that allow you manipulate the control on the client-side.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>