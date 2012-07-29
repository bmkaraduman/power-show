<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Center Window on screen</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br />
        
        <form id="Form1" runat="Server">
            
        Client-side <i>screenCenter()</i> function will make Window position at center of screen when called.
        <br />
        Try to drag Window around then click to "Screen Center" button.
        <hr />
        
        
        <br /><br /><br />
            <input type="Button" value="Open" onclick="myWindow.Open()" />
        
        <br />
        <!--Create Window -->
        <owd:Window ID="myWindow" Status="Statusbar" runat="server" 
                    Left="200" Top="100" Height="240"  Width="320" VisibleOnLoad="true" 
                    StyleFolder="wdstyles/default" Title="Obout Window">
                    
                    <center>
                        <br />
                        <br />
                        <br />
                        <input type="button" value = "Screen Center" onclick="myWindow.screenCenter()" />
                    </center>
                    
        </owd:Window> 
        
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        
                 
        </form>
        
</body>
</html>
