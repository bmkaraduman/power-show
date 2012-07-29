<%@ Page Language="C#" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
                    lblPath.Text = "<b>Path to folder with SlideMenu examples: </b>" + oXMLReader.ReadString();
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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout ASP.NET Slide Menu examples</title>
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
    <body style="margin-left:30px;">
    <form name="form1" id="form1" runat="server">
    <span class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ASP.NET Slide Menu examples</span> (version 3.3.1.5, released on June 12, 2007)
        <br /><br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" id="raspnet" name="exSelect" value ="asp" onclick="exChange('aspnet')"/> ASP.NET
        <input type="radio" id="rcs" name="exSelect" value ="cs" onclick="exChange('cs')"/> C#.NET
        <input type="radio" id ="rvb" name="exSelect" value ="vb" onclick="exChange('vb')"/> VB.NET
        <br />
        <br />        
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
		        
 
    
  
    
 		<div id="aspnet" style="display:block">
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Styles</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="aspnet_cubes.aspx">Cubes</a>
								</td>
								<td>aspnet_cubes.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="aspnet_gray.aspx">Gray</a>
								</td>
								<td>aspnet_gray.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_navy.aspx">Navy</a>
								</td>
								<td>aspnet_navy.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_outlook.aspx">Outlook</a>
								</td>
								<td>aspnet_outlook.aspx</td>
							</tr>																																									
																		

							<tr>
								<td class="link">
									<a href="aspnet_plain.aspx">Plain</a>
								</td>
								<td>aspnet_plain.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_1.aspx">Pro_1</a>
								</td>
								<td>aspnet_pro_1.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_11.aspx">Pro_11</a>
								</td>
								<td>aspnet_pro_11.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_12.aspx">Pro_12</a>
								</td>
								<td>aspnet_pro_12.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="aspnet_pro_2.aspx">Pro_2</a>
								</td>
								<td>aspnet_pro_2.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_3.aspx">Pro_3</a>
								</td>
								<td>aspnet_pro_3.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_4.aspx">Pro_4</a>
								</td>
								<td>aspnet_pro_4.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_5.aspx">Pro_5</a>
								</td>
								<td>aspnet_pro_5.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_6.aspx">Pro_6</a>
								</td>
								<td>aspnet_pro_6.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_7.aspx">Pro_7</a>
								</td>
								<td>aspnet_pro_7.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_pro_8.aspx">Pro_8</a>
								</td>
								<td>aspnet_pro_8.aspx</td>
							</tr>																																																	

							<tr>
								<td class="link">
									<a href="aspnet_pro_9.aspx">Pro_9</a>
								</td>
								<td>aspnet_pro_9.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_slideshow.aspx">SlideShow</a>
								</td>
								<td>aspnet_slideshow.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_xp_blue.aspx">Xp_Blue</a>
								</td>
								<td>aspnet_xp_blue.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_xp_mcenter.aspx">Xp_MCenter</a>
								</td>
								<td>aspnet_xp_mcenter.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_xp_silver.aspx">Xp_Silver</a>
								</td>
								<td>aspnet_xp_silver.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="aspnet_xp_true.aspx">Xp_True</a>
								</td>
								<td>aspnet_xp_true.aspx</td>
							</tr>	
							<tr>
								<td class="header" colspan="2"><b>XML</b></td>
							</tr>							
							<tr>
								<td class="link">
									<a href="aspnet_xml.aspx"> Xml </a>
								</td>
								<td>aspnet_xml.aspx</td>
							</tr>
							
						</table>
					</td>
				</tr>
			</table>
			<br /><br />
            <span class="tdText">
	            You can find the ASP.NET examples in the <b>SlideMenu</b> folder.<br />
	            They have the <b>aspnet_</b> prefix.
            </span>
		</div>   
	
		<div id="vb" style="display:none">
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
						

						
							<tr>
								<td class="header" colspan="2"><b>Styles</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="vb_cubes.aspx">Cubes</a>
								</td>
								<td>vb_cubes.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="vb_gray.aspx">Gray</a>
								</td>
								<td>vb_gray.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_navy.aspx">Navy</a>
								</td>
								<td>vb_navy.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_outlook.aspx">Outlook</a>
								</td>
								<td>vb_outlook.aspx</td>
							</tr>																																									
																		

							<tr>
								<td class="link">
									<a href="vb_plain.aspx">Plain</a>
								</td>
								<td>vb_plain.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_1.aspx">Pro_1</a>
								</td>
								<td>vb_pro_1.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_11.aspx">Pro_11</a>
								</td>
								<td>vb_pro_11.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="vb_pro_12.aspx">Pro_12</a>
								</td>
								<td>vb_pro_12.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="vb_pro_2.aspx">Pro_2</a>
								</td>
								<td>vb_pro_2.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_3.aspx">Pro_3</a>
								</td>
								<td>vb_pro_3.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_4.aspx">Pro_4</a>
								</td>
								<td>vb_pro_4.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="vb_pro_5.aspx">Pro_5</a>
								</td>
								<td>vb_pro_5.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_6.aspx">Pro_6</a>
								</td>
								<td>vb_pro_6.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_7.aspx">Pro_7</a>
								</td>
								<td>vb_pro_7.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_pro_8.aspx">Pro_8</a>
								</td>
								<td>vb_pro_8.aspx</td>
							</tr>																																																	

							<tr>
								<td class="link">
									<a href="vb_pro_9.aspx">Pro_9</a>
								</td>
								<td>vb_pro_9.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="vb_slideshow.aspx">SlideShow</a>
								</td>
								<td>vb_slideshow.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_xp_blue.aspx">Xp_Blue</a>
								</td>
								<td>vb_xp_blue.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_xp_mcenter.aspx">Xp_MCenter</a>
								</td>
								<td>vb_xp_mcenter.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_xp_silver.aspx">Xp_Silver</a>
								</td>
								<td>vb_xp_silver.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="vb_xp_true.aspx">Xp_True</a>
								</td>
								<td>vb_xp_true.aspx</td>
							</tr>	
							<tr>
								<td class="header" colspan="2"><b>XML</b></td>
							</tr>							
							<tr>
								<td class="link">
									<a href="vb_xml.aspx"> Xml </a>
								</td>
								<td>vb_xml.aspx</td>
							</tr>
																						
						</table>
					</td>
				</tr>
			</table>
			<br /><br />
            <span class="tdText">
	            You can find the VB.NET examples in the <b>SlideMenu</b> folder.<br />
	            They have the <b>vb_</b> prefix.
            </span>
		</div>   
		
		<div id="cs" style="display:none">
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Styles</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="cs_cubes.aspx">Cubes</a>
								</td>
								<td>cs_cubes.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="cs_gray.aspx">Gray</a>
								</td>
								<td>cs_gray.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_navy.aspx">Navy</a>
								</td>
								<td>cs_navy.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_outlook.aspx">Outlook</a>
								</td>
								<td>cs_outlook.aspx</td>
							</tr>																																									
																		

							<tr>
								<td class="link">
									<a href="cs_plain.aspx">Plain</a>
								</td>
								<td>cs_plain.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_1.aspx">Pro_1</a>
								</td>
								<td>cs_pro_1.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_11.aspx">Pro_11</a>
								</td>
								<td>cs_pro_11.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="cs_pro_12.aspx">Pro_12</a>
								</td>
								<td>cs_pro_12.aspx</td>
							</tr>												

							<tr>
								<td class="link">
									<a href="cs_pro_2.aspx">Pro_2</a>
								</td>
								<td>cs_pro_2.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_3.aspx">Pro_3</a>
								</td>
								<td>cs_pro_3.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_4.aspx">Pro_4</a>
								</td>
								<td>cs_pro_4.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="cs_pro_5.aspx">Pro_5</a>
								</td>
								<td>cs_pro_5.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_6.aspx">Pro_6</a>
								</td>
								<td>cs_pro_6.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_7.aspx">Pro_7</a>
								</td>
								<td>cs_pro_7.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_pro_8.aspx">Pro_8</a>
								</td>
								<td>cs_pro_8.aspx</td>
							</tr>																																																	

							<tr>
								<td class="link">
									<a href="cs_pro_9.aspx">Pro_9</a>
								</td>
								<td>cs_pro_9.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="cs_slideshow.aspx">SlideShow</a>
								</td>
								<td>cs_slideshow.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_xp_blue.aspx">Xp_Blue</a>
								</td>
								<td>cs_xp_blue.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_xp_mcenter.aspx">Xp_MCenter</a>
								</td>
								<td>cs_xp_mcenter.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_xp_silver.aspx">Xp_Silver</a>
								</td>
								<td>cs_xp_silver.aspx</td>
							</tr>
							
							<tr>
								<td class="link">
									<a href="cs_xp_true.aspx">Xp_True</a>
								</td>
								<td>cs_xp_true.aspx</td>
							</tr>	
							<tr>
								<td class="header" colspan="2"><b>XML</b></td>
							</tr>							
							<tr>
								<td class="link">
									<a href="cs_xml.aspx"> Xml </a>
								</td>
								<td>cs_xml.aspx</td>
							</tr>
																						
						</table>
					</td>
				</tr>
			</table>
			<br /><br />
            <span class="tdText">
	            You can find the C# examples in the <b>SlideMenu</b> folder.<br />
	            They have the <b>cs_</b> prefix.
            </span>
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
        <a href="http://www.obout.com/sm3/">obout ASP.NET Slide Menu home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>

      </span>       
    </form>
</body>
</html>
