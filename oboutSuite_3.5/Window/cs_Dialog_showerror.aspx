<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>
<script runat="server">
    Dialog myDialog;
    protected void Page_Load(Object s, EventArgs e)
    {
        if (!IsPostBack)
        {
            myDialog.Title = "Notice";
            myDialog.Width = 300;
            myDialog.Height = 115;
            myDialog.zIndex = 10;
            myDialog.IsModal = true;         
        }
    }
    protected void Page_Init(Object s, EventArgs e)
    {
        myDialog = new Dialog();
        myDialog.ID = "myDialog";
        myDialog.StyleFolder = "wdstyles/default";
        LiteralControl c = new LiteralControl("<center><br />You must fill the name to submit<br /><br /><input type='button' value='OK' onclick='myDialog.Close()' /></center>");
        myDialog.Controls.Add(c);
        form1.Controls.Add(myDialog);
    }
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtName.Text.Trim() == "")
        {
            myDialog.Visible = true;
            myDialog.VisibleOnLoad = true;
        }
        else
        {
            myDialog.Visible = false;
            Response.Write("Your name \""+txtName.Text+"\" has been submitted");
        }        
    }
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
<form runat="server" id="form1">
            <a href="Default.aspx?div=cs">« Back to examples</a>
	        <br /><br /><br /><br />

                Name: <asp:TextBox runat="server" ID="txtName"></asp:TextBox>

                <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />

            
        <br />
        
</form>        
</body>
</html>
