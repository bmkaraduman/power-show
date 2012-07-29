<%@ Page Language="C#" %>

<!-- Register Flyout component -->
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<!--
        - This example is to show how Flyout can help us
        to make a very nice download.com style software tooltip.
        - This example also show how to use the Backgound_transparent
        style
-->

<html>
	<head>
        <title>Download.Com ToolTip</title>
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
        
        <!-- Style of box, loading background image -->
        <style>
                .tdText 
                {
			        font:11px Verdana;
			        color:#333333;
		        }
        </style>
        
        
	</head>
	<body>
	    <a href="Default.aspx?div=aspnet">« Back to examples</a>
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />        
        
        <!-- Create the link -->
        <center>
            <a id = "window_monkey" href="javascript:void()" style="font-family:Arial;font-size:10pt;"><b>Window Monkey 1.3</b>&nbsp;<img src="http://i.d.com.com/i/dl/publ/os_mac.gif" width="14" height="16" border="0" /></a>		
        </center>
        
        <!--    Create Flyout attached with above link with BackGound_transparent style
                which supports alpha image.
        -->
        

        <obout:Flyout runat="server" ID="window_money_flyout" AttachTo="window_monkey" Position="ABSOLUTE" RelativeLeft="150" RelativeTop="-143" >
            <div style="width:366px;height:220px;">
                <div style="position:absolute;top:0px;left:0px;width:366px;height:220px;background-image:url(images/origin_downloadcombox.png);"></div>
                <div style="position:absolute;top:0px;left:0px;width:366px;height:220px;">
                    <table style="width:100%">
                        <tr>
                            <td style="width:60px"></td>
                            <td class="tdText"></td>
                            <td style="width:20px"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="tdText"><b><font size="3pt" color="black">Window Monkey 1.3</font></b></td>
                            <td></td>
                        </tr>  
                        <tr>
                            <td></td>
                            <td class="tdText"><br /><b>User Rating: </b> <img src="http://i.d.com.com/i/dl/global/strs/user_review_stars_4.gif" /></td>
                            <td></td>
                        </tr>     
                         <tr>
                            <td></td>
                            <td class="tdText"><b>Date added:</b> 09/01/1999 </td>
                            <td></td>
                        </tr>  
                        <tr>
                            <td></td>
                            <td class="tdText"><b>Flatform:</b> System 7.x</td>
                            <td></td>
                        </tr> 
                         <tr>
                            <td></td>
                            <td class="tdText"><b>Licence:</b> Free to try, $19.95 to buy</td>
                            <td></td>
                        </tr> 
                        <tr>
                            <td></td>
                            <td class="tdText"><b>Total downloads:</b> 41,464</td>
                            <td></td>
                        </tr> 
                        <tr>
                            <td></td>
                            <td class="tdText"><b>Downloads last week:</b> 7</td>
                            <td></td>
                        </tr> 
                        <tr>
                            <td></td>
                            <td class="tdText"><b>File size:</b> 847.06K</td>
                            <td></td>
                        </tr>                
                    </table>
                
                </div>
            </div>
        </obout:Flyout>        
              
        
	</body>

</html>
