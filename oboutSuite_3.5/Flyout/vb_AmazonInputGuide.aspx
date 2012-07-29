<%@ Page Language="VB" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        Basic example
-->

<html>
	<head>
        <title>Amazon Input Guide</title>
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
		        oFlyout.AttachTo = "txtRoutingNo"
		        Dim img As New Image
		        img.ImageUrl = "images/amazon_routing_no.gif"
		        oFlyout.Position = PositionStyle.TOP_CENTER
		        oFlyout.Controls.Add(img)
		        oFlyout.OpenEvent = OpenEvents.ONFOCUS
		        oFlyout.CloseEvent = CloseEvents.ONFOCUSOUT
		    End Sub
		    Protected Sub Page_Init(ByVal o As Object, ByVal e As EventArgs)
            
		        oFlyout = New Flyout()
		        oFlyout.ID = "fbguide"

		        Page.Controls.Add(oFlyout)
		    End Sub
		</script> 		             
	</head>
	<body>
	    <a href="Default.aspx?div=vb">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />        
	<table style="width:100%;font-family:Verdana;font-size:8pt;">
	    <tr>
	        <td class="tdText" align="right">Rounting Number :</td>
	        <td class="tdText" align="left">
	        
                <input type="text" id = "txtRoutingNo" value=""  class="tdText"/>   
                 
   	        </td>
	    </tr>
	</table>
	     
        
	</body>
</html>
