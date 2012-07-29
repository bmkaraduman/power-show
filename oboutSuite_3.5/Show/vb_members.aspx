<%@ Page Language="vb" Inherits="vb_members" Src="vb_members.aspx.vb" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		    .tdText {
                font:11px Verdana;
                color:#333333;
            }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Members show </b></span>
		    <br /><br />

		    <table style="border:1px solid silver;width:170px;">
			    <tr>
				    <td style="background-color:#909DBD;padding:3px;font-weight:bold;font-family:Verdana;font-size:12px;">Members</td>
			    </tr>
			    <tr>
				    <td>
					    <obshow:Show id="Show1" runat="server">
						    <panels>
							    <obshow:Panel>
								    <img src="images/members/seat_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/citroen_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/ford_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/hyundai_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/nissan_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/peugeot_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/renault_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/mazda_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/toyota_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/suzuki_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/mercedes_logo.jpg" />
								    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/alfaromeo_logo.jpg" />
							    </obshow:Panel>
							    <obshow:Panel>
								    <img src="images/members/honda_logo.jpg" />
									    &nbsp;&nbsp;&nbsp;&nbsp;
								    <img src="images/members/subaru_logo.jpg" />
							    </obshow:Panel>
						    </panels>
					    </obshow:Show>
				    </td>
			    </tr>
		    </table>	
		    
		    <br /><br /><br />	
		    
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
	
