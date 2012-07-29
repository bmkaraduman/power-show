<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>


<html>
	<head>
        <title>Image Map</title>
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
	            <br>
	            <br>
                <img id="myImage" src="images/shapes.jpg" style="border: none;" usemap="#shapes" />
                
                
            <map name="shapes">

            <area id="myCircle" shape="circle"
	            coords="58,50,40"
	            href="javascript:clicked_on('circle');"
	            title="Circle">

            <area id="myRect"	shape="rect"
	            coords="136,11,227,89"
	            href="javascript:clicked_on('rectangle');"
	            title="Rectangle">

            <area id="myPolygon"	shape="poly"
	            coords="309,13,358,89,   257,89"
	            href="javascript:clicked_on('triangle');"
	            title="Triangle">

            </map>		    

        </center>

        
			
		<!-- Create Flyout with basic styles -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="myImage[myRect]" >
	        <img src="images/calendar.jpg"/>
        </obout:Flyout>		
        
        	
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
	</body>
</html>
