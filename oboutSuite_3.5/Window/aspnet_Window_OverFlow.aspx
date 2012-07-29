<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window OverFlow</title>

<script runat="server">
    void Page_Load(object o, EventArgs e)
    {
        if (bCondition.Checked)
        {
            myWindow.Overflow = OverflowStyles.AUTO;
            myWindow.Status = "Overflow = AUTO";
        }
        else
        {
            myWindow.Overflow = OverflowStyles.HIDDEN;
            myWindow.Status = "Overflow = HIDDEN";
        }
        
    }
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">
        <input type="hidden" runat="server" id="pHidden" />
        <asp:CheckBox runat="server" ID="bCondition" Text = "Show AUTO Scrolling" AutoPostBack="true" Checked="true"/>
        
        <br /><br />
        
        
            <input type="Button" value="Open" onclick="myWindow.Open()" />
       
        <br />
        <!--Create Windows -->
        <owd:Window ID="myWindow" runat="server" IsModal="false" ShowCloseButton="true" Status="Hello" Left="200" Top="100" Height="240"  Width="320" VisibleOnLoad="true" StyleFolder="wdstyles/default" Title="Obout Window">
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />
            Long content
            <br />                        
        </owd:Window>
        

        </form>
</body>
</html>
