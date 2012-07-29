<%@ Page Language="VB" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        One of Flyout feature is the ability to change
        style. In this example, we want make a cool 
        Flyout with transparent style.
-->

<html>
	<head>
        <title>Basic VS Transparent</title>
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
            Dim oFlyout1 as Flyout
		    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
                
		        oFlyout1.AttachTo = "ad1"               
		        Dim img1 As New Image()
		        img1.ImageUrl = "images/calendar.jpg"
		        oFlyout1.Opacity = 85
		        oFlyout1.Controls.Add(img1)
		        
		    End Sub
            Protected Sub Page_Init(ByVal o as Object, ByVal e as EventArgs)
            
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
        
        
         <!-- Create simple link -->
        <center>
			            <a id="ad1" href="http://www.obout.com/calendar/">Calendar</a>	
			            <br /><br />
			            <input type="button" value="Can you see me" />                
        </center>   
 

			
	</body>
</html>
