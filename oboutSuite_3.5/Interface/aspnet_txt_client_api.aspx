<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

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
		    function getValue() {
		        alert(txt1.value());
		    }

		    function setValue() {
		        txt1.value('USA');
		    }

		    function setChangeEvent() {
		        txt1.onchange = onChange;
		    }

		    function removeChangeEvent() {
		        txt1.onchange = null;
		    }

		    function onChange(sender, newText) {
		        alert('The text was modified to: ' + newText);
		    }

		    function enable() {
		        txt1.enable();
		    }

		    function disable() {
		        txt1.disable();
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutTextBox - Client-Side Manipulation</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="txt1" Width="200"
		    FolderStyle="styles/grand_gray/OboutTextBox" Text="Some text" />
		    
		<br /><br />
		
		<input type="button" value="Get Text" class="button" onclick="getValue()" /> <span class="option2">alert(txt1.value());</span>
		        
        <br /><br />
        
        <input type="button" value="Set Text" class="button" onclick="setValue()" /> <span class="option2">txt1.value('USA');</span>
        
        <br /><br />
           
        <input type="button" value="Attach 'onchange' handler" class="button" onclick="setChangeEvent()" /> <span class="option2">txt1.onchange = onChange;</span>
        
        <br /><br />
        
        <input type="button" value="Remove 'onchange' handler" class="button" onclick="removeChangeEvent()" /> <span class="option2">txt1.onchange = null;</span>
				
		<br /><br />
		
		<input type="button" value="Enable" class="button" onclick="enable()" /> <span class="option2">txt1.enable();</span>
		        
        <br /><br />
        
        <input type="button" value="Disable" class="button" onclick="disable()" /> <span class="option2">txt1.disable();</span>
        
        <br /><br />
		
		<span class="tdText">
		    The <b>OboutTextBox</b> exposes many client-side methods that allow you manipulate the control on the client-side.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>