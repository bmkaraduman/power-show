<%@ Page Language="C#" Src="cs_playpauseshow.aspx.cs" Inherits="cs_playpauseshow" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<title>obout ASP.NET Show examples</title>
		<style type="text/css">
		.panelDiv
		{
			background-color:#cccccc;
			padding:7px;
		}
		.title
		{
			font-family:Tahoma;
			font-size:16px;
			font-weight:bold;
			color:#6B89AF;
			display:block;
		}
		.content
		{
			font-size:12px;
			font-family:Tahoma;
		}
		body
		{
			font-family:Tahoma;
		}
		.examples
		{
			font-size:12px;
		}
		</style>
	</head>
	<body>
		<h1>Play/Pause show example</h1>
		<br /><br />
		<table>
			<tr>
				<td>
					<obshow:Show id="Show1" runat="server">
						<Panels>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic1.jpg" alt="slide 1 image" border="1" />
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Comet of the century</span>
												<span class="content">
												Comet McNaught flares in early-morning skies over the Chilean city of Pucon, 500
												miles south of Santiago, on Jan. 19. The comet was visible to the naked eye in the 
												Northern Hemisphere during early January, but turned into a spectacular sight for
												the Southern Hemisphere later in the month.
												</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic3.jpg" alt="slide 3 image" border="1" />									
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Rings of light</span>
												<span class="content">Saturn's backlit rings shine in this image,
												taken by the Cassini spacecraft as the planet came between the sun and 
												the spacecraft. The shite box highlights our own planet, which appears
												as a pale blue dot within the rings.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic4.jpg" alt="slide 4 image" border="1" />
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Light up the night</span>
												<span class="content">The space shuttle Discovery streaks across the sky over Daytona Beach, 
												Fla., after its Dec. 9 liftoff from Kennedy Space Center, on a mission to the 
												international space station. The event was NASA's first nighttime space shuttle 
												launch in four years.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic5.jpg" alt="slide 5 image" border="1" />
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">									
												<span class="title">Getting to work</span>
												<span class="content">Discovery astronaut Christer Fuglesang, a mission specialist 
												from the European Space Agency, works outside the international space station. 
												Fuglesang and fellow astronaut Robert Curbeam reconfigured the space station's 
												power system during the second of four spacewalks for Discovery's mission.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic7.jpg" alt="slide 7 image" border="1" />									
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Stardust</span>
												<span class="content">A photo from the Hubble Space Telescope shows newly formed, 
												bright blue stars that are blowing a cavity in the center of a star-forming 
												region known as N90. Because N90 is located far from the central body of the Small 
												Magellanic Cloud, numerous background galaxies in this picture can be seen, delivering a 
												grand backdrop for the stellar newcomers. The dust in the region gives these distant 
												galaxies a reddish-brown tint.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic10.jpg" alt="slide 10 image" border="1" />									
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Martian vista</span>
												<span class="content">NASA's Opportunity captured this vista of Victoria Crater 
												from the viewpoint of Cape Verde, one of the outcrops that are part of the rim 
												of the Martian ccrater. Opportunity drove onto Cape Verde shortly after arriving 
												at the rim of Victoria in September 2006. The view combines hundreds of exposures 
												taken by the rover's panoramic camera.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic11.jpg" alt="slide 11 image" border="1" />
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Jupiter from a distance</span>
												<span class="content">The New Horizons probe's Long Range Reconnaissance 
												Imager was 35.3 million miles (57 million kilometers) from Jupiter when it took 
												this picture. At right ate the moons Io (bottom) and Ganymede. Ganymede's shadow can be 
												seen on Jupiter's disk. New Horizons is on its way to a rendezvous with Pluto in 2015.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
							<obshow:Panel>
								<div align="center" class="panelDiv">
									<table cellspacing="0" cellpadding="0">
										<tr>
											<td class="tdText">
												<img src="images/cosmic/cosmic12.jpg" alt="slide 12 image" border="1" />									
											</td>
											<td class="tdText" style="padding-left:5px;text-align:justify;width:200px" valign="top">
												<span class="title">Laser light</span>
												<span class="content">A laser beam flashes from the Gemini North telescope 
												on Mauna Kea in Hawaii. The "guide star" helps calibrate the telescope for 
												observations. The remains of evening twilight can be seen to the right, and the lightd of 
												Hilo to the left.</span>
											</td>
										</tr>
									</table>
								</div>
							</obshow:Panel>
						</Panels>
					</obshow:Show>	
				</td>
			</tr>
			<tr>
				<td align="left" class="tdText">
				</td>
			</tr>
		</table>
		
		<br /><br /><br />
		
	<a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=CSHARP">« Back to examples</a>
	
	</body>
</html>
	
