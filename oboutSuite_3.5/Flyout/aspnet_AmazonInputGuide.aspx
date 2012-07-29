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
	</head>
	<body>
	    <a href="Default.aspx?div=aspnet">« Back to examples</a>
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
			
    <obout:Flyout runat="server" ID="fbRoutingNo" AttachTo="txtRoutingNo"  Position="TOP_CENTER" Align="TOP">
        <img src="images/amazon_routing_no.gif" />
    </obout:Flyout>         
        
	</body>
</html>
