<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Flyout acts as your cool Tooltip</title>
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
		<style>
		        .ToolTip 
		        { 
		            border:solid 1px;
		            font-family: Tahoma; 
		            font-size:8pt;
		            background-color: lemonchiffon;
		            padding-left:5px;
		            padding-right:5px;
		        }
		 </style>
		 
			<!--    
			        Below are our four cool Flyouts 
			        which act as tooltips, we use the 
			        ABSOLUTE Position and specify the 
			        RelativeLeft, and ReltativeTop.
			        The position of Flyout will be 
			        relative to top left of buttons 
			        attached to.
			-->		 
		 
		<script runat="server" language="C#" >
            Flyout oFlyout1 = new Flyout();
            Flyout oFlyout2 = new Flyout();
            Flyout oFlyout3 = new Flyout();
            Flyout oFlyout4 = new Flyout();
            void Page_Load(object sender, EventArgs e)
            {
                oFlyout1.AttachTo = "btnStart";
                LiteralControl lc1 = new LiteralControl("<div class='ToolTip'>Click here to begin</div>");
                oFlyout1.Controls.Add(lc1);
                oFlyout1.Position = PositionStyle.ABSOLUTE;
                oFlyout1.RelativeTop = -16;
                oFlyout1.RelativeLeft = 20;

                oFlyout2.AttachTo = "btnDesktop";
                LiteralControl lc2 = new LiteralControl("<div class='ToolTip'>Show Desktop</div>");
                oFlyout2.Controls.Add(lc2);
                oFlyout2.Position = PositionStyle.ABSOLUTE;
                oFlyout2.RelativeTop = -15;
                oFlyout2.RelativeLeft = 10;


                oFlyout3.AttachTo = "btnIE";
                LiteralControl lc3 = new LiteralControl("<div class='ToolTip'>Internet Explorer</div>");
                oFlyout3.Controls.Add(lc3);
                oFlyout3.Position = PositionStyle.ABSOLUTE;
                oFlyout3.RelativeTop = -15;
                oFlyout3.RelativeLeft = 10;

                oFlyout4.AttachTo = "btnFirefox";
                LiteralControl lc4 = new LiteralControl("<div class='ToolTip'>Firefox</div>");
                oFlyout4.Controls.Add(lc4);
                oFlyout4.Position = PositionStyle.ABSOLUTE;
                oFlyout4.RelativeTop = -15;
                oFlyout4.RelativeLeft = 10;                                                                       
            }		       
            void Page_Init(object o, EventArgs e)
            {
                //Add Flyout to Button Start
                oFlyout1 = new Flyout();
                oFlyout1.ID = "Flyout1";

                Page.Controls.Add(oFlyout1);




                //Add Flyout to Button Desktop
                oFlyout2 = new Flyout();
                oFlyout2.ID = "Flyout2";
                Page.Controls.Add(oFlyout2);


                //Add Flyout to Button IE
                oFlyout3 = new Flyout();
                oFlyout3.ID = "Flyout3";

                Page.Controls.Add(oFlyout3);


                //Add Flyout to Button Firefox
                oFlyout4 = new Flyout();
                oFlyout4.ID = "Flyout4";
                Page.Controls.Add(oFlyout4);                                                                                               
                
                
            }    
		</script> 
		
				 
	</head>
	<body>
	        <a href="Default.aspx?div=cs">« Back to examples</a>
	        
	<!--    In this examle we want to show you 
            how we can make simple but cool ToolTip 
            from obout Flyout.
            The ideas are simple: 
                - Make a tooltip style with DIV
                - Put Tooltip under Flyout
                - Attach Flyout to each buttons 
	 --> 


	
		<form id="Form1" method="post" runat="server">
		
			<br /><br /><br /><br /><br />
			
			<!-- This table contain the list of image buttons with IDs: btnStart, btnDesktop, btnIE, btnFirefox-->
			<table style="WIDTH: 208px; HEIGHT: 28px" height="28" width="208" bgColor="#d6d3ce">
				<tr>
					<td style="WIDTH: 59px">
					        <!-- Button Start-->
					        <asp:imagebutton id="btnStart" runat="server" ImageUrl="images/start.gif"></asp:imagebutton>
					</td>
					
					
					<td style="WIDTH: 11px"><img src="images/seperate.gif"/></td>
					

					<td style="WIDTH: 18px">
					        <!-- Button Desktop-->
					        <asp:imagebutton id="btnDesktop" runat="server" ImageUrl="images/desktop.gif"></asp:imagebutton>
					</td>
					
					<td style="WIDTH: 23px">
					        <!-- Button Internet Explorer-->
					            <asp:imagebutton id="btnIE" runat="server" ImageUrl="images/ie.gif"></asp:imagebutton>
					</td>
					<td style="WIDTH: 25px">
					        <!-- Button Firefox-->
					         <asp:imagebutton id="btnFirefox" runat="server" ImageUrl="images/firefox.gif"></asp:imagebutton>
					</td>
					
					<td style="WIDTH: 11px"><img src="images/seperate.gif"/></td>
					<td></td>
				</tr>
			</table>
			
		</form>			
			

			

	</body>
</html>
