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
		 
	</head>
	<body>
	        <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        
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
			
			<!--    
			        Below are our four cool Flyouts 
			        which act as tooltips, we use the 
			        ABSOLUTE Position and specify the 
			        RelativeLeft, and ReltativeTop.
			        The position of Flyout will be 
			        relative to top left of buttons 
			        attached to.
			-->
			
			
			<obout:Flyout  runat="server" id="Flyout1"  AttachTo="btnStart" Position="ABSOLUTE" RelativeTop="-16" RelativeLeft="20" >
				<div class="ToolTip">Click here to begin
				</div>
			</obout:Flyout>
			
			<obout:Flyout  runat="server" id="Flyout2" AttachTo="btnDesktop" Position="ABSOLUTE" RelativeTop="-15" RelativeLeft="10" >
				<div class="ToolTip">Show desktop
				</div>
			</obout:Flyout>
			
			<obout:Flyout runat="server" id="Flyout3"  AttachTo="btnIE" Position="ABSOLUTE" RelativeTop="-15" RelativeLeft="10" >
				<div class="ToolTip">Internet Explorer
				</div>
			</obout:Flyout>
			
			<obout:Flyout  runat="server" id="Flyout4" AttachTo="btnFirefox" Position="ABSOLUTE" RelativeTop="-15" RelativeLeft="10" >
				<div class="ToolTip">Mozilla Firefox</div>
		    </obout:Flyout>

	</body>
</html>
