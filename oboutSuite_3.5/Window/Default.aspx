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
					lblPath.Text = "<b>Path to folder with Window examples: </b>" + oXMLReader.ReadString();
				}
			}
			oXMLReader.Close();
		}
        catch (Exception ex) { if (ex != null) { ex = null; } }
			
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window Examples</title>
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

 <div class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout Window examples</span>
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" id="raspnet" name="exSelect" value ="asp" onclick="exChange('aspnet')"/> ASP.NET
        <input type="radio" id="rcs" name="exSelect" value ="cs" onclick="exChange('cs')"/> C#.NET
        <input type="radio" id ="rvb" name="exSelect" value ="vb" onclick="exChange('vb')"/> VB.NET
        <br /><br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /><br />
 		<div id="aspnet" style="display:block">
		    <span class="tdText"><b>ASP.NET</b></span>
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Client-side Window Extras</b></td>
							</tr>
							<tr>
								<td class="link">
									<a href="aspnet_biWindow_SimpleAlert.aspx">SimpleAlert</a>
								</td>
								<td>aspnet_biWindow_SimpleAlert.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_biWindow_TypesOfAlert.aspx">TypesOfAlert</a>
								</td>
								<td>aspnet_biWindow_TypesOfAlert.aspx</td>
							</tr>	
													
	
							<tr>
								<td class="header" colspan="2"><b>Dialog</b></td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_helloworld.aspx">HelloWorld</a>
								</td>
								<td>aspnet_Dialog_helloworld.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_serverside_updatecontent.aspx">ServerUpdateContent</a>
								</td>
								<td>aspnet_Dialog_serverside_updatecontent.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_clientside_updatecontent.aspx">ClientUpdateContent</a>
								</td>
								<td>aspnet_Dialog_clientside_updatecontent.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_login.aspx">LoginPanel</a>
								</td>
								<td>aspnet_Dialog_login.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_Grid_showinfo.aspx">ShowInfoInGrid</a>
								</td>
								<td>aspnet_Dialog_Grid_showinfo.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_Grid_edit.aspx">EditInfoInGrid</a>
								</td>
								<td>aspnet_Dialog_Grid_edit.aspx</td>
							</tr>															
							
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_ClientEvents.aspx">ClientEvents</a> 
								</td>
								<td>aspnet_Dialog_ClientEvents.aspx</td>
							</tr>															
							
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_IconPath.aspx">IconPath</a> 
								</td>
								<td>aspnet_Dialog_IconPath.aspx</td>
							</tr>	
							
							
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_IsDraggable.aspx">IsDraggable</a> 
								</td>
								<td>aspnet_Dialog_IsDraggable.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_IsModal.aspx">IsModal</a> 
								</td>
								<td>aspnet_Dialog_IsModal.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_Opacity.aspx">Opacity</a> 
								</td>
								<td>aspnet_Dialog_Opacity.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_Position.aspx">Position</a> 
								</td>
								<td>aspnet_Dialog_Position.aspx</td>
							</tr>	
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_ShowCloseButton.aspx">ShowCloseButton</a> 
								</td>
								<td>aspnet_Dialog_ShowCloseButton.aspx</td>
							</tr>	
														
															
							
							
							<tr>
								<td class="header" colspan="2"><b>Window</b></td>
							</tr>												
										
									
							<tr>
								<td class="link">
									<a href="aspnet_Window_IsResizable.aspx">IsResizable</a> 
								</td>
								<td>aspnet_Window_IsResizable.aspx</td>
							</tr>											
																											
							<tr>
								<td class="link">
									<a href="aspnet_Window_LoadWeb.aspx">Window_LoadWeb</a> 
								</td>
								<td>aspnet_Window_LoadWeb.aspx</td>
							</tr>											
							<tr>
								<td class="link">
									<a href="aspnet_Window_MinWidth_MinHeight.aspx">MinWidth_MinHeight</a> 
								</td>
								<td>aspnet_Window_MinWidth_MinHeight.aspx</td>
							</tr>											
							<tr>
								<td class="link">
									<a href="aspnet_Dialog_ShowCloseButton.aspx">ShowCloseButton</a> 
								</td>
								<td>aspnet_Dialog_ShowCloseButton.aspx</td>
							</tr>											
							<tr>
								<td class="link">
									<a href="aspnet_Window_OverFlow.aspx">OverFlow</a> 
								</td>
								<td>aspnet_Window_OverFlow.aspx</td>
							</tr>											
							<tr>
								<td class="link">
									<a href="aspnet_Window_RelativeElementID.aspx">RelativeElementID</a> 
								</td>
								<td>aspnet_Window_RelativeElementID.aspx</td>
							</tr>											
														
							<tr>
								<td class="link">
									<a href="aspnet_Window_ShowStatusBar.aspx">ShowStatusBar</a>
								</td>
								<td>aspnet_Window_ShowStatusBar.aspx</td>
							</tr>	
							
							
	
							
							<tr>
								<td class="link">
									<a href="aspnet_Window_InitialMode.aspx">InitialMode</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_InitialMode.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_Window_ShowMaximizeButton.aspx">ShowMaximizeButton</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_ShowMaximizeButton.aspx</td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="aspnet_Window_ClientSide_screenCenter.aspx">Clientside_screenCenter</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_ClientSide_screenCenter.aspx</td>
							</tr>															
							
						    <tr>
								<td class="link">
									<a href="aspnet_Window_oWindowManager_newWindow.aspx">Clientside_newWindow</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_oWindowManager_newWindow.aspx</td>
							</tr>							
							
							
						    <tr>
								<td class="link">
									<a href="aspnet_Window_ClientSide_PinOff.aspx">ClientSide_PinOff</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_ClientSide_PinOff.aspx</td>
							</tr>							
							
						    <tr>
								<td class="link">
									<a href="aspnet_Window_PageOpacity.aspx">Change page opacity</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_PageOpacity.aspx</td>
							</tr>							
							
							
							
							<tr>
								<td class="header" colspan="2"><b>Integrations</b></td>
							</tr>								
							
						    <tr>
								<td class="link">
									<a href="aspnet_Window_and_Splitter.aspx">Window with Splitter</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_and_Splitter.aspx</td>
							</tr>							

						    <tr>
								<td class="link">
									<a href="aspnet_Window_EasyMenu.aspx">Window and EasyMenu</a> <b style='color:crimson;'>New</b>
								</td>
								<td>aspnet_Window_EasyMenu.aspx</td>
							</tr>							
							
															
							
						</table>
					</td>
				</tr>
			</table>
		</div>   		   
		        
		<div id="cs" style="display:none">
		    <span class="tdText"><b>C#.NET</b></span>
			<table width="1024">
				<tr>
					<td valign="top">
						<table>
											
							<tr>
								<td class="header" colspan="2"><b>Built-in Window</b></td>
							</tr>	
							
							
							<tr>
								<td class="header" colspan="2"><b>Dialog</b></td>
							</tr>	
							<tr>
								<td class="link">
									<a href="cs_Dialog_helloworld.aspx">HelloWorld</a>
								</td>
								<td>cs_Dialog_helloworld.aspx</td>
							</tr>
							<tr>
								<td class="link">
									<a href="cs_Dialog_showerror.aspx">Dialog Show Error</a> 
								</td>
								<td>cs_Dialog_showerror.aspx</td>
							</tr>															
	
							
							<tr>
								<td class="header" colspan="2"><b>Window</b></td>
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
								<td class="header" colspan="2"><b>Built-in Window</b></td>
							</tr>

							
							
							<tr>
								<td class="header" colspan="2"><b>Dialog</b></td>
							</tr>	
							
							<tr>
								<td class="link">
									<a href="vb_Dialog_showerror.aspx">Dialog Show Error</a> 
								</td>
								<td>vb_Dialog_showerror.aspx</td> 
							</tr>							
								
													
							<tr>
								<td class="header" colspan="2"><b>Window</b></td>
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
        <a href="http://www.obout.com/Window">obout Window home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>

      </div>       

</body>
</html>
