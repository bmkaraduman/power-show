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
		</style>
		<script type="text/javascript">
		    function requestPermission() {
		        return confirm("Are you sure you want to do this?");
		    }
		</script>
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutButton - Client-Side Events</b></span>
		
		<br /><br />
		
		<obout:OboutButton runat="server" ID="OboutButton0"
		    FolderStyle="styles/grand_gray/OboutButton" Text="Do Something"
		    OnClientClick="return requestPermission();" />
		    
        <br /><br />
		
		<span class="tdText">
		    Use the <b>OnClientClick</b> property to set a client-side event handler for the 'click' event.<br />
		    You can use this to execute some client-side code before posting the page back to the server.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>