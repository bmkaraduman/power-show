<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog updates content by post back</title>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
    <form id="form1" runat="server">
    
        <center>
        <table border="0" style="border:solid thin gray;background-color:Yellow;" cellpadding="0" cellspacing="0">
            <tr style="background-color:lightblue;">
                <td colspan="2">Contact Detail</td>
                <td align="right"><a href="javascript:void 0" onclick="myDialog.Open()">Edit</a></td>
            </tr>   
            
            <tr>
                <td style="width:50px; font-weight:bold;">Name:</td>
                <td><%=txtName.Text%></td>
            </tr>
            <tr>
                <td style="font-weight:bold;">Age:</td>
                <td><%=ddAge.SelectedValue%></td>
            </tr>
            <tr>
                <td style="font-weight:bold;">Email:</td>
                <td><%=txtEmail.Text%></td>
            </tr>  
                               
        </table>
        </center>
        
        
        <!-- Create Dialog -->
        <owd:Dialog ID="myDialog" runat="server" Height="190" StyleFolder="wdstyles/default" Title="Contact Details" Width="300" IsModal="true">
           <center>
           <br />
            <table>
                <tr>
                    <td style="width:50px;" align="left">Name:</td>
                    <td align="left"><asp:TextBox ID="txtName" runat="server">William</asp:TextBox></td>
                </tr>
                <tr>
                    <td align="left">Age</td>
                    <td align="left">
                            <asp:DropDownList runat="server" ID ="ddAge">
                                <asp:ListItem>18-23</asp:ListItem>
                                <asp:ListItem>24-30</asp:ListItem>
                                <asp:ListItem>31-40</asp:ListItem>
                            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left">Email:</td>
                    <td align="left"><asp:TextBox ID="txtEmail" runat="server">william@obout.com</asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <br />
                        <table style="width:150px">
                            <tr>
                                <td align="left"><asp:Button ID="Button1" runat="server" Text="Update" OnClientClick="myDialog.Close()"/></td>
                                <td align="right"><input type="button" value="Cancel" onclick="myDialog.Close()" /></td>
                            </tr>
                        </table>                        
                    </td>
                </tr>
            </table>
            </center>
        </owd:Dialog>
        
        
    </form>
</body>
</html>
