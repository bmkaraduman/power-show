<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Create new Window at client-side</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">

        
        <br /><br />
        
        
            <input type="Button" value="Create New Window" onclick="createNewWindow()" />
            <input type="Button" value="Open All" onclick="OpenAll()" />
        
        <br />
        <!--Create Window -->
        <owd:Window ID="myWindow" runat="server" Status="Status"
                    Left="200" Top="100" Height="240"  Width="320"
                    StyleFolder="wdstyles/default" Title="obout Window" Url="http://www.google.com.vn">                    
                    
                        
        </owd:Window>   

        <script type="text/javascript">
            var windownumber = 0;
            function OpenAll()
            {
                
                var oWindows = oWindowManager.getWindows();
                for (var i=0;i<oWindows.length;i++)
                    oWindows[i].Open();
            }
            function createNewWindow()
            {
                //oWindowManager.newWindow(txtWinID,[txtUrl],[bClose],[bMaximize],[bStatusBar],[bResizable],[bDraggable],[bIsModal]); 
                var oWin = oWindowManager.newWindow("win"+windownumber,"http://www.google.com.vn"); 
                oWin.setTitle("obout Window "+windownumber);
                oWin.setPosition(250,100);
                oWin.Open();
                windownumber++;
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
