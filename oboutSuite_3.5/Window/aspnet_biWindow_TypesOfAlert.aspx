<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Types of Alerts</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        <!--Register BuiltInWindow-->
        <owd:Window runat="server" StyleFolder="wdstyles/default" EnableClientSideControl="true"/>
        <!--Call windowalert at client-side-->
        <script type="text/javascript">
            function showWarningAlert()
            {
                windowalert("Waring","My Alert","warning");
            }
            function showInfoAlert()
            {
               windowalert("Info","My Alert","info");
            }
            function showErrorAlert()
            {
                windowalert("Error","My Alert","error");
            }                        
        </script>

        <br />
        <center>
        <table>
            <tr>
                <td> <input type="Button" value="Info Alert" onclick="showInfoAlert()" /></td>
                <td><input type="Button" value="Warning Alert" onclick="showWarningAlert()" /></td>
                <td><input type="Button" value="Error Alert" onclick="showErrorAlert()" /></td>
            </tr>
        </table>
        
        
           
        </center>
        <br />
        

        
</body>
</html>
