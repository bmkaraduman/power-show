<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Dialog IconPath</title>

<script runat="server">
    void Page_Load(object o, EventArgs e)
    {
        if (bCondition.Checked)
            myDialog.IconPath = "images/outlook.png";
        else
            myDialog.IconPath = "";
    }
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">
        
        <asp:CheckBox runat="server" ID="bCondition" Text = "Show Outlook Icon on Dialog" AutoPostBack="true" Checked="true"/>
        
        <br /><br />
        
        
            <input type="Button" value="Open" onclick="myDialog.Open()" />
        
        <br />
        <!--Create Hello World Dialog -->
        <owd:Dialog ID="myDialog" IsModal="false" runat="server" Height="115" StyleFolder="wdstyles/default" Title="Obout Dialog" Width="200" VisibleOnLoad="true" zIndex="10">
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
