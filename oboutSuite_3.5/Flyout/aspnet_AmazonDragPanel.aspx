<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>


<html>
	<head>
        <title>Amazon Drag Panel</title>
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
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td><img src="images/wishlist_button.gif" style="cursor:pointer"/></td>
                    <td><img id ="btDrop" src="images/wishlist_dropbutton.gif" style="cursor:pointer"/></td>
                </tr>
            </table>	
	    </center>

        
			
		<!-- Create Flyout with basic styles -->
        <obout:Flyout runat="server" ID="Flyout1"  AttachTo="btDrop" OpenEvent="ONCLICK" CloseEvent="NONE" Position="ABSOLUTE" RelativeLeft="-360" RelativeTop="0">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="width:208px;height:21px;background-image:url(images/wishlist_dragpanel.gif);">
                        <obout:DragPanel runat="server" DraggingOpacity="50">
                            <span style="width:208px;height:21px;" >&#160;</span>
                        </obout:DragPanel>            
                                           
                    </td>
                    <td style="width:22px;height:21px;background-repeat:no-repeat;background-image:url(images/wishlist_close.gif);"><span style="cursor:pointer;width:40px;height:21px;" onclick="<%=Flyout1.getClientID()%>.Close()">&#160;&#160;&#160;</span></td>
                </tr>
                <tr>
                    <td colspan="2"><img src="images/wishlist_body.gif"/></td>
                </tr>
            </table>
        </obout:Flyout>			
       
	</body>
</html>
