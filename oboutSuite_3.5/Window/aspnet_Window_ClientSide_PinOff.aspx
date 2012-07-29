<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window Client-Side PinOff</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br />
        
        <form id="Form1" runat="Server">
            
        Enable PinOff will make Window remain its position regardless of browser scrolling.            
        <hr />
        
        
        <br /><br /><br />
            <input type="Button" value="Open" onclick="myWindow.Open()" />
        
        <br />
        <!--Create Window -->
        <owd:Window ID="myWindow" Status="Statusbar" runat="server" 
                    Left="200" Top="100" Height="240"  Width="320" VisibleOnLoad="true" 
                    StyleFolder="wdstyles/xpluna" Title="obout Window">
                    <br />
                    <br />
                    <table>
                        <tr>
                            <td style="width:10px;"></td>
                            <td>
                                <input type="checkbox" id="myCheckBox" onchange="SetPin()" /><label for="myCheckBox">Pin off Window</label>    
                            </td>
                        
                        </tr>
                    </table>                        
                    
                        
        </owd:Window>   

        <script type="text/javascript">
            function SetPin()
            {
                myWindow.PinOff(document.getElementById("myCheckBox").checked);
            }
        </script>
       
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />        
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br />              
        </form>
        
        
</body>
</html>
