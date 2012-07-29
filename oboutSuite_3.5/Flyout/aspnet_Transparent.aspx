<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        One of Flyout feature is the ability to change
        style. In this example, we want make a cool 
        Flyout with transparent style.
-->

<html>
	<head>
        <title>Transparent</title>
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
	    <a href="Default.aspx?div=aspnet">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create simple link -->
        <center>
			            <a id="ad1" href="http://www.obout.com/calendar/">Calendar</a>	
			            <br /><br />
			            <input type="button" value="Can you see me" />                
        </center>
        
	
			
			
        <!-- Create Flyout WITH transparent -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="ad1" Opacity="85">
	       <img src="images/calendar.jpg"/>
        </obout:Flyout>			
	
			
			
			
	</body>
</html>
