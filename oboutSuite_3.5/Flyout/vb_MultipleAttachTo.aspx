<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Page Language="VB" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html>
	<head>
		<title>Multiple IDs</title>
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
		        'Dynamically attach to two ImageButton
		        oFlyout.AttachTo = " ImageButton1, ImageButton2 "
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
	<!--    
	        One of features of Flyout is the ability
	        to attach one Flyout to multiple objects.
	        What need to do is to specify the AttachTo = "id1,id2,id3".
	        See how the example works:
	           - One Flyout attached to 2 imagebuttons
	-->
	
	
<form id="Form1" runat="server">
<!-- Add two image button -->
<table style="width:100%;valign:middle;">
    <tr>
    
    
        <td align="center">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="images/buybox-button-find-gifts-a._V37902950_.gif" />
        </td>

        
        <td align="center">
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="images/buybox-button-find-gifts-a._V37902950_.gif" />
        </td>
        
        
    </tr>
</table>			
</form>			
			

	</body>
</html>
