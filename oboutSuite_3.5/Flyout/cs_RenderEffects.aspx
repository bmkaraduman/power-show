<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<script runat="server">
    
    Flyout Flyout1 = new Flyout();
    void Page_Load(object sender, EventArgs e)
    {
        Flyout1.AttachTo = "ad1";
        Image img = new Image();
        img.ImageUrl = "images/calendar.jpg";
        Flyout1.Controls.Add(img);
    }
    void Page_Init(object o, EventArgs e)
    {
        Flyout1 = new Flyout();
        Flyout1.ID = "Flyout1";

        Page.Controls.Add(Flyout1);
    }

    protected void option_change(Object s, EventArgs e)
    {
        switch (option.SelectedValue)
        {
            case "Default":
                Flyout1.NoneEffect = false;
                Flyout1.FadingEffect = false;
                Flyout1.SlidingEffect = SlidingEffectStyle.NONE;
                Flyout1.FlyingEffect = FlyingEffectStyle.MIDDLE_CENTER;
                break;
            case "None":
                Flyout1.NoneEffect = true;
                Flyout1.FadingEffect = false;
                Flyout1.SlidingEffect = SlidingEffectStyle.NONE;
                Flyout1.FlyingEffect = FlyingEffectStyle.NONE;
                break;

            case "Fading":
                Flyout1.NoneEffect = false;
                Flyout1.FadingEffect = true;
                Flyout1.SlidingEffect = SlidingEffectStyle.NONE;
                Flyout1.FlyingEffect = FlyingEffectStyle.NONE;
                break;
            case "Sliding":
                Flyout1.NoneEffect = false;
                Flyout1.FadingEffect = false;
                Flyout1.SlidingEffect = SlidingEffectStyle.LEFT;
                Flyout1.FlyingEffect = FlyingEffectStyle.NONE;
                Flyout1.SlidingRange = 10;
                break;
            case "Fading+Sliding":
                Flyout1.NoneEffect = false;
                Flyout1.FadingEffect = false;
                Flyout1.SlidingEffect = SlidingEffectStyle.LEFT;
                Flyout1.FlyingEffect = FlyingEffectStyle.NONE;
                Flyout1.SlidingRange = 10;
                break;


        }
    }

</script>

<html>
	<head>
        <title>Render Effects</title>
 		    <style type="text/css">
			    body {
				    font:11px Verdana;
				    color:#333333;
			    }
			    a {
				    font:11px Verdana;
				    color:#315686;
				    text-decoration:underline;
			    }
			    a:hover {
				    color:crimson;
			    }
		    </style>          
	</head>
	<body>
	    <form runat="server">
	    <a href="Default.aspx?div=cs">« Back to examples</a>
	    

        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create a link-->
        <center>
        
	    <asp:DropDownList runat="server" ID="option" OnSelectedIndexChanged="option_change" AutoPostBack="true">
	        <asp:ListItem>Default</asp:ListItem>
	        <asp:ListItem>None</asp:ListItem>
	        <asp:ListItem>Fading</asp:ListItem>
	        <asp:ListItem>Sliding</asp:ListItem>
	        <asp:ListItem>Fading+Sliding</asp:ListItem>
	    </asp:DropDownList>
	    <br /><br /><br /><br />        
            <a id="ad1" href="http://www.obout.com/calendar/" style="font-family:Verdana;font-size:8pt;">Calendar</a>	
	    </center>

        
			
        			
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
        </form>          
	</body>
</html>
