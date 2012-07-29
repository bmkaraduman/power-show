<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>



<html>
	<head>
        <title>Client AttachTo</title>
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
        
        
        <!-- Create a link-->
        <center>
           <input type="button" id="Button1" value="Click to Attach To Me [Button1]" onclick="<%=Flyout1.getClientID()%>.AttachTo('Button1');"/>
           <input type="button" id="Button2" value="Click to Attach To Me [Button2]" onclick="<%=Flyout1.getClientID()%>.AttachTo('Button2');"/>
                 
	    </center>

        
			
		<!-- Create Flyout with basic styles -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="Button1" >
	        <img src="images/calendar.jpg"/>
        </obout:Flyout>			
     
        
	</body>
</html>
