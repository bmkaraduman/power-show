<%@ Page Language="VB" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>
<script runat="server">
    Dim myDialog As Dialog
		        
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        If (Not IsPostBack) Then
            myDialog.Title = "Notice"
            myDialog.Width = 300
            myDialog.Height = 115
            myDialog.zIndex = 10
            myDialog.IsModal = True
        End If

    End Sub
    Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
        myDialog = new Dialog()
        myDialog.ID = "myDialog"
        myDialog.StyleFolder = "wdstyles/default"
        Dim c As New LiteralControl("<center><br />You must fill the name to submit<br /><br /><input type='button' value='OK' onclick='myDialog.Close()' /></center>")
        myDialog.Controls.Add(c)
        form1.Controls.Add(myDialog)   
    
    End Sub
    
    
    Protected Sub btnSubmit_Click(ByVal o As Object, ByVal e As EventArgs) Handles btnSubmit.Click
        If (txtName.Text.Trim() = "") Then
            myDialog.Visible = True
            myDialog.VisibleOnLoad = True
        Else
            myDialog.Visible = False
            Response.Write("Your name [" & txtName.Text & "] has been submitted")
        End If
    End Sub
    
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
<form runat="server" id="form1">
            <a href="Default.aspx?div=vb">« Back to examples</a>
	        <br /><br /><br /><br />

                Name: <asp:TextBox runat="server" ID="txtName"></asp:TextBox>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit"/>

            
        <br />
        
</form>        
</body>
</html>
