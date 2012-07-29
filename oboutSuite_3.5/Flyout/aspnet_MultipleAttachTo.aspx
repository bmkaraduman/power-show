<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<%@ Page Language="C#" %>
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
		

	</head>
	<body>
	        <a href="Default.aspx?div=aspnet">« Back to examples</a>
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
			
			
			
			
			 <!-- Add Flyout object attaching to both imagebutton -->
			<obout:Flyout ID="Flyout1" runat="server" AttachTo=" ImageButton1 , ImageButton2">
  		                    <style>
            
                                    .gc-popover-tiny { FONT-SIZE: 10px; FONT-FAMILY: verdana,arial,helvetica,sans-serif }
                                    .gc-popover-tiny A { COLOR: #003399; TEXT-DECORATION: none }
                                    .gc-popover-tiny A:visited { COLOR: #003399; TEXT-DECORATION: none }
                                    .gc-popover-tiny A:hover { COLOR: #cc6600; TEXT-DECORATION: underline }
                                    .gc-tiny { FONT-SIZE: 1em; FONT-FAMILY: verdana,arial,helvetica,sans-serif }
                                    .gc-title { MARGIN-TOP: 10px; FONT-WEIGHT: bold; MARGIN-BOTTOM: 6px; COLOR: #c60; LINE-HEIGHT: 1em; FONT-FAMILY: tahoma, sans-serif }
		                    </style>                        
                          <table width=500px cellpadding="0" cellspacing="0" border="0" style="border:2px solid #A5C6DE;">
                            <tr>
                            <td style="width: 497px">
                            <table width=100% style="border-bottom:1px dotted #999999;"><tr><td width="33%"><a href="http://www.obout.com"><img src="images/gc-logo-popover-a._V39690492_.gif" width="116" alt="Gift Central" height="30" border="0" /></a></td>
                            <td width=66%><img src="images/popover-blurb._V37077551_.gif" width="318" alt="Gift Central" height="28" border="0" /> 
                            </td></tr>
                            </table>
                            </td>
                            </tr>
                            <tr>
                            <td valign="top" style="width: 497px">
                            <table width=100% cellpadding="0" cellspacing="0" border="0" style="border-collapse:collapse;">
                            <tr>
                            <td style="padding-left:6px;"><div class="gc-title">Gift Guides</div></td>

                            <td style="padding-left:6px;"><div class="gc-title">Lists &amp; Registries</div></td>
                            <td style="padding-left:6px; width: 164px;"><div class="gc-title">More to Explore</div></td>
                            </tr>
                            <tr>
                            <td valign="top" class="gc-popover-tiny" style="line-height:2em;padding-right:6px;padding-top:3px;padding-left:6px;">
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts for the Holidays</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts by Price</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts by Relationship</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts for Kids and Teens</a><br />

                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts by Personality</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gifts by Occasion</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<nobr><a href="http://www.obout.com" style="font-weight:bold;">See all Gift Guides</a></nobr><br />
                            </td>
                            <td valign="top" class="gc-popover-tiny" style="line-height:1.7em;padding-right:none;padding-top:3px;padding-left:6px;">
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Wish Lists</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Baby Registry</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Wedding Registry</a><br /><br />
                            <span class="gc-tiny" style="font-weight:bold;color:#cc6600;"><nobr>Find someone's Wish List:</nobr></span><br />
                            <form style="margin:0px;" method="get" name="wishlist-search">

                            <input type="hidden" name="type" value="wishlist">
                            <nobr><input type="text" style="border:1px solid #999999;height:16px;width:130px;font-family:verdana,arial,sans-serif;font-size:9px;color:#666666;" value="name or e-mail" name="field-name" onclick="this.value='';" />&nbsp;
                            <input type="image" src="images/go-button.gif" style="vertical-align:middle" value="Go" alt="Go"  onClick="parseName();" /></nobr>
                            </form>
                            </td>
                            <td valign="top" class="gc-popover-tiny" style="line-height:1.7em;padding-right:none;padding-top:3px;padding-left:6px; width: 164px;">
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Gift Organizer</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">E Cards</a><br />
                            <strong><font color="#cc6600">&#8250;</font></strong>&nbsp;<a href="http://www.obout.com">Fresh Flowers</a><br /><br />
                            <a href="http://www.obout.com"><img src="images/gift-cert-roto-pop-a._V36626569_.gif" width="157" alt="Gift Certificates" height="58" border="0" /></a><br />
                            </td>
                            </tr>
                            </table>

                            </td>
                            </tr>
                            </table>
			</obout:Flyout>

	</body>
</html>
