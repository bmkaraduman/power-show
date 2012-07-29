<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
    <form runat="server">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
                <center>
                    <input type="button" value="Open Window" onclick="myWindow.Open();" />
                    <input type="button" value="Google" onclick="myWindow.setUrl('http://www.google.com');myWindow.setStatus('http://www.google.com');" />
                    <input type="button" value="Obout Inc" onclick="myWindow.setUrl('http://www.obout.com');myWindow.setStatus('http://www.obout.com');" />
                </center>
	        <asp:Button runat="server" ID="postback" Text="Post Back" />             
            <owd:Window runat="server"  Title="Browser" Url="http://www.anogle.com" Overflow="AUTO" ID="myWindow" Width="800" Height="500" Left="200" Top="100" VisibleOnLoad="false" StyleFolder="wdstyles/default" ShowStatusBar="true" Status="http://www.obout.com">
                sfsdfsdf
            </owd:Window>
    </form>            
</body>


</html>
