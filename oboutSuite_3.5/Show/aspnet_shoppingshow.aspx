<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelTable
		{
			background-color:white;
			padding:7px;
			height:100%;
			width:100%;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showContainer
		{
			width:400px;
			padding:7px;
			border:1px solid #cccccc;
		}
		ul li
		{
			font-size:10px;
		}
		a
		{
			font-size:10px;
		}
		.examples
		{
			font-size:12px;
		}
		body
		{
			font-family:Tahoma;
		}
		.tdText 
        {
            color:#333333;
            font:11px Verdana;
        }
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
	
	    <span class="tdText"><b>ASP.NET Splitter - Shopping show </b></span>
        <br /><br />
		
		<div class="showContainer">
	    <obshow:Show id="Show1" runat="server" Width="400" Height="220" ShowType="show" 
		    SelectedPanel="1" TransitionType="scrolling" ScrollDirection="top">
		    <Panels>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td valign="top">
							    <img src="images/shoppingshow/notebook1.jpg" />
						    </td>
						    <td valign="top">
							    <table>
								    <tr>
									    <td colspan="2">
										    <a href="#">Notebook nw8440 Centrino Duo T7600</a>
									    </td>
								    </tr>
								    <tr>
									    <td colspan="2" class="tdText">
										    <br />
										    <ul>
											    <li>
												    Intel Core 2 Duo
											    </li>
											    <li>
												    Centrino Duo T7600
											    </li>
											    <li>
												    2330 MHz
											    </li>
											    <li>
												    160GB, SATA, 5400 rpm
											    </li>
											    <li>
												    DVD+/-RW Dual Layer Fixed
											    </li>
											    <li>
												    ATI Mobility FireGL V5200
											    </li>
										    </ul>
									    </td>
								    </tr>
								    <tr>
									    <td>
										    <a href="#">Compare</a>
									    </td>
									    <td align="right">
										    <a href="#" style="color:red;font-weight:bold;">Add to Basket</a>
									    </td>
								    </tr>
							    </table>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td valign="top">
							    <img src="images/shoppingshow/notebook2.jpg" />
						    </td>
						    <td valign="top">
							    <table>
								    <tr>
									    <td colspan="2">
										    <a href="#">Notebook 5005WLHi, Turion 64 X2</a>
									    </td>
								    </tr>
								    <tr>
									    <td colspan="2" class="tdText">
										    <br />
										    <ul>
											    <li>
												    Mobile AMD
											    </li>
											    <li>
												    Turion 64 X2 TL60
											    </li>
											    <li>
												    2000 MHz
											    </li>
											    <li>
												    160GB, SATA, 5400 rpm
											    </li>
											    <li>
												    HD-DVD
											    </li>
											    <li>
												    ATI Mobility Radeon X1600
											    </li>
										    </ul>
									    </td>
								    </tr>
								    <tr>
									    <td>
										    <a href="#">Compare</a>
									    </td>
									    <td align="right">
										    <a href="#" style="color:red;font-weight:bold;">Add to Basket</a>
									    </td>
								    </tr>
							    </table>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
			    <obshow:Panel>
				    <table class="panelTable">
					    <tr>
						    <td valign="top">
							    <img src="images/shoppingshow/notebook3.jpg" />
						    </td>
						    <td valign="top">
							    <table>
								    <tr>
									    <td colspan="2">
										    <a href="#">Notebook P1610 Centrino U1400</a>
									    </td>
								    </tr>
								    <tr>
									    <td colspan="2" class="tdText">
										    <br />
										    <ul>
											    <li>
												    Centrino
											    </li>
											    <li>
												    Intel Core Solo U1400
											    </li>
											    <li>
												    1200 MHz
											    </li>
											    <li>
												    ATA100, 4200 rpm
											    </li>
											    <li>
												    DVD-RW Dual Layer (Extern)
											    </li>
											    <li>
												    Graphic Media Accelerator 950
											    </li>
										    </ul>
									    </td>
								    </tr>
								    <tr>
									    <td>
										    <a href="#">Compare</a>
									    </td>
									    <td align="right">
										    <a href="#" style="color:red;font-weight:bold;">Add to Basket</a>
									    </td>
								    </tr>
							    </table>
						    </td>
					    </tr>
				    </table>
			    </obshow:Panel>
		    </Panels>
	    </obshow:Show>	
	    </div>
    	
	    <br /><br /><br />
            		
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
            	
		</form>
	</body>
</html>
	
