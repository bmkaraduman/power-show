<%@ Page Language="C#" %>

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
	</head>
	<body>
	     <a href="Default.aspx?div=aspnet">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create two simple links -->
        <center style="font-family:Verdana;font-size:8pt;">

			<a id="ad_calendar" href="http://www.obout.com/calendar/">Calendar</a>	
			<br />[Position:MIDDLE_RIGHT;Align:TOP]
	    
	    </center>
			
			
			
		<!-- Create Flyout with MIDDLE_RIGHT position and TOP alignment-->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="ad_calendar" Position="MIDDLE_RIGHT" Align="TOP" >
	        <img src="images/calendar.jpg"/>
        </obout:Flyout>			
	
	
			
			
			
	</body>
</html>
