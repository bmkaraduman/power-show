<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window MinWidth MinHeight</title>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br />
        
        <form id="Form1" runat="Server">
        
        <br /><br />
           Specify MinWidth and MinHeight to limit Window width and height that user can resize
        <br />
        <!--Create Windows -->
        <owd:Window ID="myWindow1" MinWidth="150" MinHeight="150" runat="server" IsModal="false" ShowCloseButton="true" Left="100" Top="100" Height="240"  Width="320" VisibleOnLoad="true" StyleFolder="wdstyles/blue" Title="Obout Window 1">
            <div style="padding:10px;">
                MinWidth = 150
                <br />
                MinHeight = 150
            </div>
        </owd:Window>
        
        <owd:Window ID="myWindow2" MinWidth="200" MinHeight="200" runat="server" IsModal="false" ShowCloseButton="true" Left="500" Top="100" Height="240"  Width="320" VisibleOnLoad="true" StyleFolder="wdstyles/blue" Title="Obout Window 2">
            <div style="padding:10px;">
                MinWidth = 200
                <br />
                MinHeight = 200
            </div>

        </owd:Window>


        </form>
</body>
</html>
