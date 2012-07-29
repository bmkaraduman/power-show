<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Dialog ClientEvents</title>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">        
        
            <input type="Button" value="Open" onclick="myDialog.Open()" />
        
        <div id="eventTrace" style="width:300px;background-color:Yellow;border:solid thin black;">
        </div>
        <script type="text/javascript">
            function init_handle()
            {
                var eventTrace = document.getElementById("eventTrace");
                eventTrace.innerHTML = eventTrace.innerHTML + "<b>OnInit</b>: Dialog has been initiated<br/>";   
            }
            function preopen_handle()
            {
                var eventTrace = document.getElementById("eventTrace");
                eventTrace.innerHTML = eventTrace.innerHTML + "<b>OnPreOpen</b>: Dialog is ready to open<br/>";   
            }
            function open_handle()
            {
                var eventTrace = document.getElementById("eventTrace");
                eventTrace.innerHTML = eventTrace.innerHTML + "<b>OnOpen</b>: Dialog has been opened<br/>";   
            }
            function close_handle()
            {
                var eventTrace = document.getElementById("eventTrace");
                eventTrace.innerHTML = eventTrace.innerHTML + "<b>OnClose</b>: Dialog has been closed<br/>";   
            }
            
        </script>
        
        <br />
        <!--Create Hello World Dialog -->
        <owd:Dialog OnClientInit="init_handle()" OnClientPreOpen="preopen_handle()" OnClientOpen="open_handle()" OnClientClose="close_handle()" ID="myDialog" IsModal="false" runat="server" Height="115" StyleFolder="wdstyles/default" Title="Obout Dialog" Width="200" VisibleOnLoad="false" zIndex="10">
            <center>
                <br />
                Hello World
                <br /><br />
                <input type="Button" value="OK" onclick="myDialog.Close()" />
                
            </center>
        </owd:Dialog>
        </form>
        
</body>
</html>
