<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>


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
	</head>
	<body>
	    <a href="Default.aspx?div=aspnet">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <input type="button" value ="Change Position" onclick="<%=Flyout1.getClientID()%>.setPosition('TOP_CENTER','MIDDLE');"/>
        
        <!-- Create a link-->
        <center>
            <input type="button" id="btnCal" value="Calendar" />
	    </center>

        
			
		<!-- Create Flyout with basic styles -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="btnCal">
	        <img src="images/calendar.jpg"/>
        </obout:Flyout>			
        
        
	</body>
</html>
