<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">-->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Dialog Hello World</title>
    <script runat="server">
        OboutInc.Window.Dialog myDialog;
        protected void Page_Load(Object s, EventArgs e)
        {
            if (!IsPostBack)
            {
                myDialog.StyleFolder = "wdstyles/default";
                myDialog.ID = "myDialog";
                myDialog.Title = "obout Dialog";
                myDialog.IsModal = true;
                myDialog.Width = 200;
                myDialog.Height = 115;
                myDialog.VisibleOnLoad = true;
                myDialog.zIndex = 10;                
            }
            
        }

        protected void Page_Init(Object s, EventArgs e)
        {
            myDialog = new OboutInc.Window.Dialog();
            Literal c = new Literal();
            c.Text = "<center><br />Hello World<br /><br /><input type='Button' value='OK' onclick='myDialog.Close()' /></center>";
            myDialog.Controls.Add(c);
            Page.Controls.Add(myDialog);
        }
    
    </script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=cs">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
        <br />
        <center>
            <input type="Button" value="Open" onclick="myDialog.Open()" />
        </center>
        <br />
        <!--Create Hello World Dialog -->
        
</body>
</html>
