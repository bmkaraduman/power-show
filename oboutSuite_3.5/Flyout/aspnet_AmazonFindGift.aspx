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
	</head>
	<body>	
	        <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        
	        
        <center>
			<img ID="btnFindGift" src="images/buybox-button-find-gifts-a._V37902950_.gif" />
        </center>

			
		<obout:Flyout    runat="server"  
			                ID="Flyout1"   
			                AttachTo="btnFindGift" >
                    <img src="images/amazon_findgift.gif" />
	    </obout:Flyout>
			

	</body>
</html>
