<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        <br />

        <center>
            <input type="Button" value="Open" onclick="myDialog.Open()" />
        </center>
        <br />
        <!--Create Hello World Dialog -->
        <owd:Dialog ID="myDialog" runat="server" IsModal="true" Height="115" StyleFolder="wdstyles/default" Title="Obout Dialog" Width="200" VisibleOnLoad="false" zIndex="10">
            
            <center>
                <br />
                Hello World
                <br /><br />
                <input type="Button" value="OK" onclick="myDialog.Close()" />
                
            </center>
        </owd:Dialog>

</body>
</html>
