<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window ShowStatusBar</title>

<script runat="server">
    void Page_Load(object o, EventArgs e)
    {
        switch (ddlSelect.SelectedItem.Text)
        {
            case "NORMAL":
                myWindow.InitialMode = InitialModes.NORMAL;
                break;
            case "MAXIMIZE":
                myWindow.InitialMode = InitialModes.MAXIMIZE;
                break;
        }
    } 
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">
        
        InitialMode = 
        <asp:DropDownList runat="Server" ID="ddlSelect" AutoPostBack="true">
            <asp:ListItem>NORMAL</asp:ListItem>
            <asp:ListItem>MAXIMIZE</asp:ListItem>            
        </asp:DropDownList>
        
        <br /><br />
        
        
            <input type="Button" value="Open" onclick="myWindow.Open()" />
        
        <br />
        <!--Create Window -->
        <owd:Window runat="server" ID="myWindow"  StyleFolder="wdstyles/default" Overflow="AUTO"   
                    Left="200" Top="100" Height="480"  Width="640" Title="Obout Window" ShowMaximizeButton="true"
                    ShowStatusBar="true" Status="obout Homepage" VisibleOnLoad="true" Url="http://www.obout.com">
            
            
        </owd:Window>
        
        
        </form>
        
</body>
</html>
