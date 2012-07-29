<%@ Page Language="VB" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<script runat="server">
    
		        Dim Flyout1 As Flyout
		        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		            Flyout1.AttachTo = "ad1"
		            Dim img As New Image
		            img.ImageUrl = "images/calendar.jpg"
		            Flyout1.Controls.Add(img)
		        End Sub
		        Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		            Flyout1 = New Flyout()
		            Flyout1.ID = "Flyout1"

		            Page.Controls.Add(Flyout1)

		        End Sub   
    
    Protected Sub option_change(ByVal sender As Object, ByVal e As EventArgs) Handles op.SelectedIndexChanged
        
        If (op.SelectedValue = "Default") Then
            Flyout1.NoneEffect = False
            Flyout1.FadingEffect = False
            Flyout1.SlidingEffect = SlidingEffectStyle.NONE
            Flyout1.FlyingEffect = FlyingEffectStyle.MIDDLE_CENTER
        End If

        If (op.SelectedValue = "None") Then
            Flyout1.NoneEffect = True
            Flyout1.FadingEffect = False
            Flyout1.SlidingEffect = SlidingEffectStyle.NONE
            Flyout1.FlyingEffect = FlyingEffectStyle.NONE
        End If
        If (op.SelectedValue = "Fading") Then
            Flyout1.NoneEffect = False
            Flyout1.FadingEffect = True
            Flyout1.SlidingEffect = SlidingEffectStyle.NONE
            Flyout1.FlyingEffect = FlyingEffectStyle.NONE
        End If
        
        If (op.SelectedValue = "Sliding") Then
            Flyout1.NoneEffect = False
            Flyout1.FadingEffect = False
            Flyout1.SlidingEffect = SlidingEffectStyle.LEFT
            Flyout1.FlyingEffect = FlyingEffectStyle.NONE
            Flyout1.SlidingRange = 10
        End If
        
        If (op.SelectedValue = "Fading+Sliding") Then
            Flyout1.NoneEffect = False
            Flyout1.FadingEffect = True
            Flyout1.SlidingEffect = SlidingEffectStyle.BOTTOM
            Flyout1.FlyingEffect = FlyingEffectStyle.NONE
            Flyout1.SlidingRange = 10
        End If

    End Sub
    

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
	    <a href="Default.aspx?div=vb">« Back to examples</a>
	    

        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create a link-->
        <center>
        
	    <asp:DropDownList runat="server" ID="op" OnSelectedIndexChanged="option_change" AutoPostBack="true">
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
