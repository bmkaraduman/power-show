<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window RelativeElementID</title>

<script runat="server">
    void Page_Load(object o, EventArgs e)
    {
        if (bCondition.Checked)
            myWindow.RelativeElementID = "bluedot";
        else
            myWindow.RelativeElementID = "";
                    
    }
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">
        
        <asp:CheckBox runat="server" ID="bCondition" Text = "Relative Position to BlueDot" AutoPostBack="true" Checked="true"/>
        
        <br /><br />
        
        
            <input type="Button" value="Open" onclick="myWindow.Open()" />
        
        <br />
        <!--Create Hello World Dialog -->
        <owd:Window ID="myWindow" RelativeElementID="bluedot" Status="Statusbar is shown" runat="server" Left="30" Top="0" Height="240"  Width="320" VisibleOnLoad="true" StyleFolder="wdstyles/xpluna" Title="Obout Window">

        </owd:Window>
        </form>
        
        <div id="bluedot" style="position:absolute;top:80px;left:250px;width:20px;height:20px;background-color:lightblue"></div>

</body>
</html>
