<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Simple Alert</title>

</head>
<body style="font-family:Tahoma;font-size:10pt;">
<form runat="server">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        <!--Register BuiltInWindow-->
        <owd:Window runat="server" StyleFolder="wdstyles/default" EnableClientSideControl="true"/>
        
        <!--Call windowalert at client-side-->
        <script type="text/javascript">
            function showalert()
            {
                windowalert("Hello world");
            }
        </script>

        <br />
        <center>
            <input type="Button" value="Show Alert" onclick="showalert()" />
        </center>
        <br />
        
</form>
        
</body>
</html>
