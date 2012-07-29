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
		<script runat="server" language="C#" >
            Flyout oFlyout1 = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                oFlyout1.AttachTo = "ad_calendar";
                Image img1 = new Image();
                img1.ImageUrl = "images/calendar.jpg";
                oFlyout1.Controls.Add(img1);
                //Create Flyout with MIDDLE_RIGHT position and MIDDLE alignment
                oFlyout1.Position = PositionStyle.MIDDLE_RIGHT;
                oFlyout1.Align = AlignStyle.TOP;
           
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
        <br /><br /><br /><br />
        
        <!-- Create two simple links -->
        <center style="font-family:Verdana;font-size:8pt;">

			<a id="ad_calendar" href="http://www.obout.com/calendar/">Calendar</a>	
			<br />[Position:MIDDLE_RIGHT;Align:TOP]

	    </center>
			

			
	</body>
</html>
