<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<script runat="server" Language="C#">
	void Page_load(object sender, EventArgs e)
	{
	    try
		{
			XmlTextReader oXMLReader = null;
			oXMLReader = new XmlTextReader(Server.MapPath("examples.xml"));
			while (oXMLReader.Read())
			{
				if (oXMLReader.NodeType == XmlNodeType.Element && oXMLReader.Name == "path")
				{
					lblPath.Text = "<b>Path to folder with Flyout examples: </b>" + oXMLReader.ReadString();
				}
			}
			oXMLReader.Close();
		}
		catch (Exception ex)
		{
            if (ex != null) { ex = null; }
		}
			
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Flyout Examples</title>
    <style type="text/css">
		td.link{
			padding-left:30px;
			width:250px;			
		}
		
		td.header {
			padding-top:20px;
			border-bottom:1px solid #eeeeee;
			color:#555555;
		}
		
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;
			background-color___:#f6f9fc;
			padding-left:4px;
			padding-right:4px;
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
	<script>
	    function exChange(nameDIV)
	    {
		    document.getElementById("cs").style.display = "none";
            document.getElementById("vb").style.display = "none";
            document.getElementById("aspnet").style.display = "none";
            document.getElementById(nameDIV).style.display = "block";
            document.getElementById("rcs").checked = false;
            document.getElementById("raspnet").checked = false;
            document.getElementById("rvb").checked = false;  
            document.getElementById("r"+nameDIV).checked = true;                       
	    }
	</script>
</head>
<body>

 <span class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout Flyout examples</span>
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" id="raspnet" name="exSelect" value ="asp" onclick="exChange('aspnet')"/> ASP.NET
        <input type="radio" id="rcs" name="exSelect" value ="cs" onclick="exChange('cs')"/> C#.NET
        <input type="radio" id ="rvb" name="exSelect" value ="vb" onclick="exChange('vb')"/> VB.NET
        <br /><br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
		        
		<div id="cs" style="display:none">
		    <span class="tdText"><b>C#.NET</b></span>
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Styles and Effects</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="cs_Basic.aspx">Basic</a>
								</td>
								<td>cs_Basic.aspx</td>
							</tr>							
							<tr>
								<td class="link">
									<a href="cs_Transparent.aspx">Transparent</a>
								</td>
								<td>cs_Transparent.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_RenderEffects.aspx">RenderEffects</a>
								</td>
								<td>cs_RenderEffects.aspx</td>
							</tr>								
							
							
							<tr>
								<td class="header" colspan="2"><b>Basic Functionalities</b></td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="cs_PositionAndAlign.aspx">PositionAndAlign</a>
								</td>
								<td>cs_PositionAndAlign.aspx</td>
							</tr>							<tr>
								<td class="link">
									<a href="cs_WindowsToolTip.aspx">WindowsToolTip</a>
								</td>
								<td>cs_WindowsToolTip.aspx</td>
							</tr>

							<tr>
								<td class="link">
									<a href="cs_MultipleAttachTo.aspx">MutipleAttachTo</a>
								</td>
								<td>cs_MultipleAttachTo.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="cs_ImageMap.aspx">ImageMap</a>
								</td>
								<td>cs_ImageMap.aspx</td>
							</tr>								
																				
							
							
							
							<tr>
								<td class="header" colspan="2"><b>Cool Applications</b></td>
							</tr>						
							
							
							<tr>
								<td class="link">
									<a href="cs_AmazonFindGift.aspx">AmazonFindGift</a>
								</td>
								<td>cs_AmazonFindGift.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="cs_AmazonInputGuide.aspx">AmazonInputGuide</a>
								</td>
								<td>cs_AmazonInputGuide.aspx</td>
							</tr>
															
														

						</table>
					</td>
				</tr>
			</table>
		</div>  
    
		<div id="vb" style="display:none">
		    <span class="tdText"><b>VB.NET</b></span>
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
						

						
							<tr>
								<td class="header" colspan="2"><b>Styles and Effects</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="vb_Basic.aspx">Basic</a>
								</td>
								<td>vb_Basic.aspx</td>
							</tr>							
							<tr>
								<td class="link">
									<a href="vb_Transparent.aspx">Transparent</a>
								</td>
								<td>vb_Transparent.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="vb_RenderEffects.aspx">RenderEffects</a>
								</td>
								<td>vb_RenderEffects.aspx</td>
							</tr>								
							
							
							
							<tr>
								<td class="header" colspan="2"><b>Basic Functionalities</b></td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="vb_PositionAndAlign.aspx">PositionAndAlign</a>
								</td>
								<td>vb_PositionAndAlign.aspx</td>
							</tr>							<tr>
								<td class="link">
									<a href="vb_WindowsToolTip.aspx">WindowsToolTip</a>
								</td>
								<td>vb_WindowsToolTip.aspx</td>
							</tr>

							<tr>
								<td class="link">
									<a href="vb_MultipleAttachTo.aspx">MutipleAttachTo</a>
								</td>
								<td>vb_MultipleAttachTo.aspx</td>
							</tr>
								
							<tr>
								<td class="link">
									<a href="vb_ImageMap.aspx">ImageMap</a>
								</td>
								<td>vb_ImageMap.aspx</td>
							</tr>									
								
													
							<tr>
								<td class="header" colspan="2"><b>Cool Applications</b></td>
							</tr>						
							
							<tr>
								<td class="link">
									<a href="vb_AmazonFindGift.aspx">AmazonFindGift</a>
								</td>
								<td>vb_AmazonFindGift.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_AmazonInputGuide.aspx">AmazonInputGuide</a>
								</td>
								<td>vb_AmazonInputGuide.aspx</td>
							</tr>
															
														

						</table>
					</td>
				</tr>
			</table>
		</div>     
    
 		<div id="aspnet" style="display:block">
		    <span class="tdText"><b>ASP.NET</b></span>
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Styles and Effects</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="aspnet_Basic.aspx">Basic</a>
								</td>
								<td>aspnet_Basic.aspx</td>
							</tr>							
							<tr>
								<td class="link">
									<a href="aspnet_Transparent.aspx">Transparent</a>
								</td>
								<td>aspnet_Transparent.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="aspnet_RenderEffects.aspx">RenderEffects</a>
								</td>
								<td>aspnet_RenderEffects.aspx</td>
							</tr>							
							
						
							
	
							<tr>
								<td class="header" colspan="2"><b>Basic Functionalities</b></td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_PositionAndAlign.aspx">PositionAndAlign</a>
								</td>
								<td>aspnet_PositionAndAlign.aspx</td>
							</tr>							<tr>
								<td class="link">
									<a href="aspnet_WindowsToolTip.aspx">WindowsToolTip</a>
								</td>
								<td>aspnet_WindowsToolTip.aspx</td>
							</tr>

							<tr>
								<td class="link">
									<a href="aspnet_MultipleAttachTo.aspx">MutipleAttachTo</a>
								</td>
								<td>aspnet_MultipleAttachTo.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_ImageMap.aspx">ImageMap</a>
								</td>
								<td>aspnet_ImageMap.aspx</td>
							</tr>								

							
							
							<tr>
								<td class="header" colspan="2"><b>Client-side Functions</b></td>
							</tr>							
							<tr>
								<td class="link">
									<a href="aspnet_client_AttachTo.aspx">ClientAttachTo</a>
								</td>
								<td>aspnet_client_AttachTo.aspx</td>
							</tr>
							<tr>
							<tr>
								<td class="link">
									<a href="aspnet_client_PositionAndAlign.aspx">ClientPositionAndAlign</a>
								</td>
								<td>aspnet_client_PositionAndAlign.aspx</td>
							</tr>
							<tr>
							<tr>
								<td class="link">
									<a href="aspnet_client_OpenClose.aspx">ClientOpenClose</a>
								</td>
								<td>aspnet_client_OpenClose.aspx</td>
							</tr>
							<tr>								
													
							<tr>
								<td class="header" colspan="2"><b>Cool Applications</b></td>
							</tr>						
							
							<tr>
								<td class="link">
									<a href="aspnet_AmazonFindGift.aspx">AmazonFindGift</a>
								</td>
								<td>aspnet_AmazonFindGift.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="aspnet_AmazonInputGuide.aspx">AmazonInputGuide</a>
								</td>
								<td>aspnet_AmazonInputGuide.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_AmazonDragPanel.aspx">AmazonDragPanel</a>
								</td>
								<td>aspnet_AmazonDragPanel.aspx</td>
							</tr>	
							
														
							<tr>
								<td class="link">
									<a href="aspnet_MicrosoftQuickLinks.aspx">MicrosoftQuickLinks</a>
								</td>
								<td>aspnet_MicrosoftQuickLinks.aspx</td>
							</tr>																					
							<tr>
								<td class="link">
									<a href="aspnet_DownloadDotComToolTip.aspx">DownloadDotComToolTip</a>
								</td>
								<td>aspnet_DownloadDotComToolTip.aspx</td>
							</tr>							
							
							<tr>
								<td class="link">
									<a href="aspnet_OptionalFeedback.aspx">OptionalFeedback</a>
								</td>
								<td>aspnet_OptionalFeedback.aspx</td>
							</tr>								
																											
														

						</table>
					</td>
				</tr>
			</table>
		</div>   
		
		<script type="text/javascript">
		    exChange("<% Response.Write((Request.Params["div"]==null)?"aspnet":Request.Params["div"]); %>");
		</script>
		
		<br />
		<br />
		<div class="tdText" style="width: 525px;">
		 </div>
        <br />
        <br />
        <a href="http://www.obout.com/Flyout">obout Flyout home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>

      </span>       

</body>
</html>
