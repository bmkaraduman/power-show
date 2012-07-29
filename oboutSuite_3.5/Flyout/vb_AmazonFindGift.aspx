<%@ Page Language= "VB" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
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
		<script runat="server" language="VB" >
		    Dim oFlyout As Flyout
		    
		    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		        oFlyout.AttachTo = "btnFindGift"
		        Dim img As New Image
		        img.ImageUrl = "images/amazon_findgift.gif"
		        oFlyout.Controls.Add(img)
		    End Sub
		    
		    Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
		        oFlyout = New Flyout()
		        oFlyout.ID = "Flyout1"

		        Page.Controls.Add(oFlyout)
		    End Sub
		</script> 		     		
	</head>
	<body>	
	        <a href="Default.aspx?div=vb">« Back to examples</a>
	        <br /><br /><br /><br />
	        <br /><br /><br /><br />
	        
	        
        <center>
			<img ID="btnFindGift" src="images/buybox-button-find-gifts-a._V37902950_.gif" />
        </center>

			

	</body>
</html>
