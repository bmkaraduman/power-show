<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Login</title>
<script runat="server">
    protected void Page_Load(Object s, EventArgs e)
    {
        if (IsPostBack)
        {
            if (txtUsername.Text.ToLower() == "user" && txtPassword.Text == "user")
            {
                //Correct password
                
                loginDialog.Visible= false;
                succeedNotice.Visible= true;
                failNotice.Visible= false;                
                
            }
            else
            {
                //Wrong password
                txtPassword.Text = "";
                loginDialog.Visible= true;
                failNotice.Visible= true;
                succeedNotice.Visible = false;                
            }

        }
        else
        {
            loginDialog.Visible = true;
            failNotice.Visible = false;
            succeedNotice.Visible = false;
        }
    }

</script>


</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>

    <form runat="server">
        <br />
        <center>
            <b>Username:</b> user
            <br />
            <b>Password:</b> user 
        </center>
        <br />
        <!--Create Hello World Dialog -->
        <owd:Dialog ID="loginDialog" runat="server" IsModal="true" Width="300" Height="150" StyleFolder="wdstyles/default" Title="Login" zIndex="10" VisibleOnLoad="true" ShowCloseButton="false">
            <br />
            <center>
                <table>
                    <tr>
                        <td>Username:</td>
                        <td><asp:TextBox runat="server" ID="txtUsername"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><asp:TextBox runat="server" ID="txtPassword" TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <br />
                            <asp:Button runat="server" ID="btnLogin" Text="Login"/>
                        </td>
                    </tr>
                </table>  
            </center>      
        </owd:Dialog>
        <owd:Dialog ID="succeedNotice" runat="server" IsModal="true" Width="220" Height="120" StyleFolder="wdstyles/default" Title="Notice" zIndex="20" VisibleOnLoad="true" ShowCloseButton="false">
            <br />
            <center>
            <table>
                <tr>
                    <td align="center">Welcome user!</td>
                </tr>
                <tr>                
                    <td align="center"><br /><input type="button" value="OK" style="width:60px;" onclick="succeedNotice.Close()" /></td>
                </tr>
                
            </table>
            </center>
        </owd:Dialog>
        <owd:Dialog ID="failNotice" runat="server" IsModal="true" Width="220" Height="120" StyleFolder="wdstyles/default" Title="Notice" zIndex="20" VisibleOnLoad="true" ShowCloseButton="false">
            <br />
            <center>
            <table>
           
                <tr>
                    <td align="center">Incorrect username or password!</td>
                </tr>
                <tr>                
                    <td align="center"><br /><input type="button" value="OK" style="width:60px;" onclick="failNotice.Close()" /></td>
                </tr>
                
            </table>
            </center>
        </owd:Dialog>        
                
</form>
</body>
</html>
