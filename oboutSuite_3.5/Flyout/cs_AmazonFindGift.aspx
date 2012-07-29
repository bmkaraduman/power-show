<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Page Language="C#" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Amazon FindGift</title>
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
            Flyout oFlyout = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                oFlyout.AttachTo = "btnFindGift";
                Image img = new Image();
                img.ImageUrl = "images/amazon_findgift.gif";
                oFlyout.Controls.Add(img);             
            }  
            void Page_Init(object o, EventArgs e)
            {
                oFlyout = new Flyout();
                oFlyout.ID = "Flyout1";
                Page.Controls.Add(oFlyout);
            }    
		</script> 		     		
	</head>
	<body>	
	        <a href="Default.aspx?div=cs">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        
	        
        <center>
			<img ID="btnFindGift" src="images/buybox-button-find-gifts-a._V37902950_.gif" />
        </center>

			

	</body>
</html>
