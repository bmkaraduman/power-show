<%@ Page Language="VB" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<html>
	<head>
        <title>Position and Align</title>
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
		<script runat="server" language="VB" >
		    Dim oFlyout1 As Flyout
		    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
                
		        oFlyout1.AttachTo = "ad_calendar"                
		        Dim img1 As New Image
		        img1.ImageUrl = "images/calendar.jpg"
		        oFlyout1.Controls.Add(img1)
		        'Create Flyout with MIDDLE_RIGHT position and MIDDLE alignment
		        oFlyout1.Position = PositionStyle.MIDDLE_RIGHT
		        oFlyout1.Align = AlignStyle.TOP
		        
		    End Sub
		    Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)            
		        oFlyout1 = New Flyout()
		        oFlyout1.ID = "Flyout1"               
		        Page.Controls.Add(oFlyout1)
		    End Sub
		</script>				             
	</head>
	<body>
	    <a href="Default.aspx?div=vb">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        <!-- Create two simple links -->
        <center style="font-family:Verdana;font-size:8pt;">

			<a id="ad_calendar" href="http://www.obout.com/calendar/">Calendar</a>	
			<br />[Position:MIDDLE_RIGHT;Align:TOP]

	    </center>
			
					
	
			
			
			
	</body>
</html>
