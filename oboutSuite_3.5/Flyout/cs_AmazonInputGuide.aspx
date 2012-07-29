<%@ Page Language="C#" %>

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
		<script runat="server" language="C#" >
            Flyout oFlyout = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                oFlyout.AttachTo = "txtRoutingNo";
                Image img = new Image();
                img.ImageUrl = "images/amazon_routing_no.gif";
                oFlyout.Position = PositionStyle.TOP_CENTER;
                oFlyout.Controls.Add(img);
                oFlyout.OpenEvent = OpenEvents.ONFOCUS;
                oFlyout.CloseEvent = CloseEvents.ONFOCUSOUT;                               
            }      
            void Page_Init(object o, EventArgs e)
            {
                oFlyout = new Flyout();
                oFlyout.ID = "fbguide";

                Page.Controls.Add(oFlyout);
            }    
		</script> 		             
	</head>
	<body>
	    <a href="Default.aspx?div=cs">« Back to examples</a>
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
