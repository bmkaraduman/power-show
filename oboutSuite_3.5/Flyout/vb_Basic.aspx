<%@ Page Language="VB" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        Basic example
-->

<html>
	<head>
        <title>Basic</title>
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
		    
		    <script runat="server" language="VB">
		        Dim oFlyout As Flyout
		        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		            oFlyout.AttachTo = "ad1"
		            Dim img As New Image
		            img.ImageUrl = "images/calendar.jpg"
		            oFlyout.Controls.Add(img)
		        End Sub
		        Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		            oFlyout = New Flyout()
		            oFlyout.ID = "Flyout1"

		            Page.Controls.Add(oFlyout)

		        End Sub
		            
		    </script>       
	</head>
	<body>
	    <a href="Default.aspx?div=vb">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create a link-->
        <center>
            <a id="ad1" href="http://www.obout.com/calendar/" style="font-family:Verdana;font-size:8pt;">Calendar</a>	
	    </center>		
        
        
	</body>
</html>
