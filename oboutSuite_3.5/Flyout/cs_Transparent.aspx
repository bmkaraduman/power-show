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
		<script runat="server" language="C#" >
            Flyout oFlyout1 = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                oFlyout1.AttachTo = "ad1";
                Image img1 = new Image();
                img1.ImageUrl = "images/calendar.jpg";
                oFlyout1.Opacity = 85;
                oFlyout1.Controls.Add(img1);               
            }		    
            void Page_Init(object o, EventArgs e)
            {
                oFlyout1 = new Flyout();
                oFlyout1.ID = "Flyout1";
                Page.Controls.Add(oFlyout1);
            }    
		</script>		             
	</head>
	<body>
	    <a href="Default.aspx?div=cs">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        
        
        <!-- Create two identical simple links -->
        <center>
			            <a id="ad1" href="http://www.obout.com/calendar/">Calendar</a>	
			            <br /><br />
			            <input type="button" value="Can you see me" />                
        </center>      
 

	</body>
</html>
