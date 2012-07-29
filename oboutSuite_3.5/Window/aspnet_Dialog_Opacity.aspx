<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Opacity</title>
<script runat="server">

    void btnOpacity_click(Object s, EventArgs e)
    {
        myDialog.Opacity = Convert.ToInt16(txtOpacity.Text);
    }
</script>
<script>
    function clientsideChangeOpacity()
    {
        var opacity = parseInt(document.getElementById("txtOpacity").value);
        myDialog.setOpacity(opacity);
    }

</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        <br />
        <form runat="server">
        <center>
            <table>
                <tr>
                    <td>Opacity</td>
                    <td><asp:TextBox runat="server" ID="txtOpacity">100</asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2">
                    <input type="button" value="Client-side Change Opacity" onclick="clientsideChangeOpacity()"/>
                    
                    </td>
                </tr>
                <tr>
                <td colspan="2" align="center"><asp:Button runat="server" ID="btnOpacity" Text="Server-side Change Opacity" OnClick="btnOpacity_click"/></td>
                </tr>
            </table>
        </center>
        <br />
        <!--Create Hello World Dialog -->
        <owd:Dialog ID="myDialog" runat="server" IsModal="false" Height="115" StyleFolder="wdstyles/default" Title="Obout Dialog" Width="200" VisibleOnLoad="true" zIndex="10">
            <center>
                <br />
                Hello World
                <br /><br />
                <input type="Button" value="OK" style="width:60px" />
                
            </center>
        </owd:Dialog>
        </form>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	                
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        
</body>
</html>
