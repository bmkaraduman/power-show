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
                    lblPath.Text = "<b>Path to folder with Show examples: </b>" + oXMLReader.ReadString();
                }
            }
            oXMLReader.Close();
        }
        catch
        {
        }
        
		if (Request.QueryString["type"] != null)
		{
			ExamplesType.Value = Request.QueryString["type"].ToString();
		}
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>obout ASP.NET Show examples</title>
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
	<script type="text/javascript">
		function showexamples() {
			var exSelect = document.forms[0].exSelect;
			for(var i=0; i<exSelect.length; i++) {
				if(exSelect[i].checked == true) {
					document.getElementById(exSelect[i].value).style.display = "block";
				} else {
					document.getElementById(exSelect[i].value).style.display = "none";
				}
			}
		}
		function showExamplesFromSpan(index) {		   
		    document.forms[0].exSelect[index].checked = true;
		    showexamples(index);
		}
		window.onload = function() {
			var oExamplesType = document.getElementById("ExamplesType");
			if(oExamplesType.value == "ASPNET") {
				document.forms[0].exSelect[0].checked = true;
			} else if(oExamplesType.value == "CSHARP") {
				document.forms[0].exSelect[1].checked = true;
			} else if(oExamplesType.value == "VBNET") {
				document.forms[0].exSelect[2].checked = true;
			} else {
			    document.forms[0].exSelect[0].checked = true;
			}
			showexamples();
		}
	</script>
</head>
<body style="margin-left:30px;">
    <form id="form1" runat="server">
    	
	<input id="ExamplesType" type="hidden" runat="server" />
	
    <span class="tdText">
        <a href="../Default.aspx">« Back to Suite Examples</a>
        <br /><br /><br />
        <span style="font-weight:bold;">obout ASP.NET Show examples</span> (version 1.4.0, released on March 23, 2009)
        <br />
        <br />
        Select the examples you want to see:&#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(0)" value="divASPNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(0)">ASP.NET</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(1)" value="divCSharp" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(1)">C#</span> &#160;&#160;&#160;
        <input type="radio" name="exSelect" onclick="showexamples(2)" value="divVBNET" class="tdText"/><span style="cursor: pointer" onclick="showExamplesFromSpan(2)">VB.NET</span> &#160;&#160;&#160;
        <br /><br />
        <asp:Label runat="server" ID="lblPath"></asp:Label>
        <br /> 
        <br />
        <table>
            <tr>
                <td>
                    <div id="divASPNET">
                        <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <%--<tr>
				                            <td class="header" colspan="2"><b>First Look - 2</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_quick_setup.aspx" style="margin-right:0px;">Quick Setup</a>
				                            </td>
					                        <td>aspnet_quick_setup.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="aspnet_show_images.aspx" style="margin-right:0px;">Show Images</a>
				                            </td>
					                        <td>aspnet_show_images.aspx</td>
			                            </tr>--%>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - 1</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="aspnet_style_gallery.aspx" style="margin-right:0px;">Style Gallery</a>
				                            </td>
					                        <td>aspnet_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Real Life Use - 6</b></td>
				                        </tr>
										
										<tr>
					                        <td class="link">
						                        <a href="aspnet_filmstrip.aspx">Film Strip</a>
					                        </td>
					                        <td>aspnet_filmstrip.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_slideshow.aspx">Slide Show</a>
					                        </td>
					                        <td>aspnet_slideshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_members.aspx">Members</a>
					                        </td>
					                        <td>aspnet_members.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_shoppingshow.aspx">Shopping Cart</a>
					                        </td>
					                        <td>aspnet_shoppingshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_quicknews.aspx">Quick News</a>
					                        </td>
					                        <td>aspnet_quicknews.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_livequotes.aspx">Live Quotes</a>
					                        </td>
					                        <td>aspnet_livequotes.aspx</td>
				                        </tr>
				                        
										
										<tr>
				                            <td class="header" colspan="2"><b>Components Presentation - 2</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_components_show.aspx">Show</a>
					                        </td>
					                        <td>aspnet_components_show.aspx</td>
				                        </tr>
                        				<tr>
					                        <td class="link">
						                        <a href="aspnet_components_manual.aspx">Manual</a>
					                        </td>
					                        <td>aspnet_components_manual.aspx</td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="header" colspan="2"><b>Image Panel - 4</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_imagesshowpath.aspx">ImagesShowPath</a>
					                        </td>
					                        <td>aspnet_imagesshowpath.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_imagesfitavailablesize.aspx">Images fit available size</a>
					                        </td>
					                        <td>aspnet_imagesfitavailablesize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_imagepanels_withcustom_size.aspx">Image panels with custom size</a>
					                        </td>
					                        <td>aspnet_imagepanels_withcustom_size.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_show_database.aspx">Image URL's from database</a>
					                        </td>
					                        <td>aspnet_show_database.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_show_database_content.aspx">Images content from database</a> <b style="color:crimson">New</b>
					                        </td>
					                        <td>aspnet_show_database_content.aspx</td>
				                        </tr>
										<tr>
				                            <td class="header" colspan="2"><b>Manual changer - 5</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_differenttypes.aspx">Different types</a>
					                        </td>
					                        <td>aspnet_differenttypes.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_changercustomize.aspx">Customize</a>
					                        </td>
					                        <td>aspnet_changercustomize.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_customchanger.aspx">Use Custom Buttons</a>
					                        </td>
					                        <td>aspnet_customchanger.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_playpauseshow.aspx">Play/Pause Buttons</a>
					                        </td>
					                        <td>aspnet_playpauseshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_changer_absoluteposition.aspx">Absolute position</a>
					                        </td>
					                        <td>aspnet_changer_absoluteposition.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										
										<tr>
				                            <td class="header" colspan="2"><b>Transition type - 10</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_notransition.aspx">No transition effect</a>
					                        </td>
					                        <td>aspnet_notransition.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_quickscroll.aspx">QuickScroll</a>
					                        </td>
					                        <td>aspnet_quickscroll.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_quickscrollcustomize.aspx">QuickScroll customize</a>
					                        </td>
					                        <td>aspnet_quickscrollcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_fading.aspx">Fading</a>
					                        </td>
					                        <td>aspnet_fading.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_fadingcustomize.aspx">Fading customize</a>
					                        </td>
					                        <td>aspnet_fadingcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_scrollingleft.aspx">Scrolling left</a>
					                        </td>
					                        <td>aspnet_scrollingleft.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_scrollingright.aspx">Scrolling right</a>
					                        </td>
					                        <td>aspnet_scrollingright.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_scrollingtop.aspx">Scrolling top</a>
					                        </td>
					                        <td>aspnet_scrollingtop.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_scrollingbottom.aspx">Scrolling bottom</a>
					                        </td>
					                        <td>aspnet_scrollingbottom.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_scrollingcustomize.aspx">Scrolling customize</a>
					                        </td>
					                        <td>aspnet_scrollingcustomize.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other examples - 15</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_database.aspx">From database</a>
					                        </td>
					                        <td>aspnet_database.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_outsidemasterpage.aspx">Outside Master Page</a>
					                        </td>
					                        <td>aspnet_outsidemasterpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_insidemasterpage.aspx">Inside Master Page</a>
					                        </td>
					                        <td>aspnet_insidemasterpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_differentfont.aspx">Different font</a>
					                        </td>
					                        <td>aspnet_differentfont.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_usingflash.aspx">Using flash</a>
					                        </td>
					                        <td>aspnet_usingflash.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_differentstyles.aspx">Different styles</a>
					                        </td>
					                        <td>aspnet_differentstyles.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_dynamicshow.aspx">Dynamically build show</a>
					                        </td>
					                        <td>aspnet_dynamicshow.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_selectedpanel.aspx">Selected panel</a>
					                        </td>
					                        <td>aspnet_selectedpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_movingpanels.aspx">Moving panels</a>
					                        </td>
					                        <td>aspnet_movingpanels.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_loadpage.aspx">Load page inside panel</a>
					                        </td>
					                        <td>aspnet_loadpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_loadpagerefresh.aspx">Load page inside panel (reload)</a>
					                        </td>
					                        <td>aspnet_loadpagerefresh.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_timebetweenpanels.aspx">Time between panels transition</a>
					                        </td>
					                        <td>aspnet_timebetweenpanels.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="aspnet_starttimedelay.aspx">Start time delay</a>
					                        </td>
					                        <td>aspnet_starttimedelay.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_currentpanel.aspx">Current panel</a>
					                        </td>
					                        <td>aspnet_currentpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="aspnet_multipleshows.aspx">Multiple shows on the same page</a>
					                        </td>
					                        <td>aspnet_multipleshows.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the ASP.NET examples in the <b>Show</b> folder.<br />
				            They have the <b>aspnet_</b> prefix.
			            </span>
                    </div>  
                    
                    <div id="divCSharp">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <%--<tr>
				                            <td class="header" colspan="2"><b>First Look - 2</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_quick_setup.aspx" style="margin-right:0px;">Quick Setup</a>
				                            </td>
					                        <td>cs_quick_setup.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="cs_show_images.aspx" style="margin-right:0px;">Show Images</a>
				                            </td>
					                        <td>cs_show_images.aspx</td>
			                            </tr>--%>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance -1 </b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="cs_style_gallery.aspx" style="margin-right:0px;">Style Gallery</a>
				                            </td>
					                        <td>cs_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                           <tr>
				                            <td class="header" colspan="2"><b>Real Life Use - 6</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_filmstrip.aspx">Film Strip</a>
					                        </td>
					                        <td>cs_filmstrip.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_slideshow.aspx">Slide Show</a>
					                        </td>
					                        <td>cs_slideshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_members.aspx">Members </a>
					                        </td>
					                        <td>cs_members.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_shoppingshow.aspx">Shopping Cart</a>
					                        </td>
					                        <td>cs_shoppingshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_quicknews.aspx">Quick News</a>
					                        </td>
					                        <td>cs_quicknews.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_livequotes.aspx">Live Quotes</a>
					                        </td>
					                        <td>cs_livequotes.aspx</td>
				                        </tr>
				                        
				                        <tr>
				                            <td class="header" colspan="2"><b>Components Presentation - 2</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_components_show.aspx">Show</a>
					                        </td>
					                        <td>cs_components_show.aspx</td>
				                        </tr>
                        				<tr>
					                        <td class="link">
						                        <a href="cs_components_manual.aspx">Manual</a>
					                        </td>
					                        <td>cs_components_manual.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Image Panel - 1</b></td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_imagesshowpath.aspx">ImagesShowPath</a>
					                        </td>
					                        <td>cs_imagesshowpath.aspx</td>
				                        </tr>
				                        <tr>
				                            <td class="header" colspan="2"><b>Manual changer - 3</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_differenttypes.aspx">Different types</a>
					                        </td>
					                        <td>cs_differenttypes.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_changercustomize.aspx">Customize</a>
					                        </td>
					                        <td>cs_changercustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_playpauseshow.aspx">Play/Pause Buttons</a>
					                        </td>
					                        <td>cs_playpauseshow.aspx</td>
				                        </tr>
				                        
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										<tr>
				                            <td class="header" colspan="2"><b>Transition type - 10</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_notransition.aspx">No transition effect</a>
					                        </td>
					                        <td>cs_notransition.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_quickscroll.aspx">QuickScroll</a>
					                        </td>
					                        <td>cs_quickscroll.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_quickscrollcustomize.aspx">QuickScroll customize</a>
					                        </td>
					                        <td>cs_quickscrollcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_fading.aspx">Fading</a>
					                        </td>
					                        <td>cs_fading.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_fadingcustomize.aspx">Fading customize</a>
					                        </td>
					                        <td>cs_fadingcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_scrollingleft.aspx">Scrolling left</a>
					                        </td>
					                        <td>cs_scrollingleft.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_scrollingright.aspx">Scrolling right</a>
					                        </td>
					                        <td>cs_scrollingright.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_scrollingtop.aspx">Scrolling top</a>
					                        </td>
					                        <td>cs_scrollingtop.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_scrollingbottom.aspx">Scrolling bottom</a>
					                        </td>
					                        <td>cs_scrollingbottom.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_scrollingcustomize.aspx">Scrolling customize</a>
					                        </td>
					                        <td>cs_scrollingcustomize.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features - 10</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_database.aspx">From database</a>
					                        </td>
					                        <td>cs_database.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_withmasterpage.aspx">With Master Page</a>
					                        </td>
					                        <td>cs_withmasterpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_differentfont.aspx">Different font</a>
					                        </td>
					                        <td>cs_differentfont.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_selectedpanel.aspx">Selected panel</a>
					                        </td>
					                        <td>cs_selectedpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_movingpanels.aspx">Moving panels</a>
					                        </td>
					                        <td>cs_movingpanels.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_loadpage.aspx">Load page inside panel</a>
					                        </td>
					                        <td>cs_loadpage.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_timebetweenpanels.aspx">Time between panels transition</a>
					                        </td>
					                        <td>cs_timebetweenpanels.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="cs_starttimedelay.aspx">Start time delay</a>
					                        </td>
					                        <td>cs_starttimedelay.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_currentpanel.aspx">Current panel</a>
					                        </td>
					                        <td>cs_currentpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="cs_multipleshows.aspx">Multiple shows on the same page</a>
					                        </td>
					                        <td>cs_multipleshows.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
            			
			            <br />
			            <br />
			            <span class="tdText">
				            You can find the C# examples in the <b>Show</b> folder.<br />
				            They have the <b>cs_</b> prefix.
			            </span>
                    </div> 
                    
                    <div id="divVBNET">
			            <table width="1024">
                            <tr>
                        	    <td valign="top">
                        	        <table>
                        	            <%--<tr>
				                            <td class="header" colspan="2"><b>First Look - 2</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_quick_setup.aspx" style="margin-right:0px;">Quick Setup</a>
				                            </td>
					                        <td>vb_quick_setup.aspx</td>
			                            </tr>
			                            <tr>
				                            <td class="link">
					                            <a href="vb_show_images.aspx" style="margin-right:0px;">Show Images</a>
				                            </td>
					                        <td>vb_show_images.aspx</td>
			                            </tr>--%>
                        	            <tr>
				                            <td class="header" colspan="2"><b>Appearance - 1</b></td>
				                        </tr>
				                        <tr>
				                            <td class="link">
					                            <a href="vb_style_gallery.aspx" style="margin-right:0px;">Style Gallery</a>
				                            </td>
					                        <td>vb_style_gallery.aspx</td>
			                            </tr>
			                            
			                            
			                            
			                            <tr>
				                            <td class="header" colspan="2"><b>Real Life Use - 6</b></td>
				                        </tr>
				                        
										
										<tr>
					                        <td class="link">
						                        <a href="vb_filmstrip.aspx">Filmstrip</a>
					                        </td>
					                        <td>vb_filmstrip.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_slideshow.aspx">Slide show</a>
					                        </td>
					                        <td>vb_slideshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_members.aspx">Members show</a>
					                        </td>
					                        <td>vb_members.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_shoppingshow.aspx">Shopping show</a>
					                        </td>
					                        <td>vb_shoppingshow.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_quicknews.aspx">Quick News</a>
					                        </td>
					                        <td>vb_quicknews.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_livequotes.aspx">Live quotes</a>
					                        </td>
					                        <td>vb_livequotes.aspx</td>
				                        </tr>
				                       										
										<tr>
				                            <td class="header" colspan="2"><b>Components Presentation - 2</b></td>
				                        </tr>
										 <tr>
					                        <td class="link">
						                        <a href="vb_components_show.aspx">Show</a>
					                        </td>
					                        <td>vb_components_show.aspx</td>
				                        </tr>
                        				<tr>
					                        <td class="link">
						                        <a href="vb_components_manual.aspx">Manual</a>
					                        </td>
					                        <td>vb_components_manual.aspx</td>
				                        </tr>
				                        <tr>
				                            <td class="header" colspan="2"><b>Manual changer - 3</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_differenttypes.aspx">Different types</a>
					                        </td>
					                        <td>vb_differenttypes.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_changercustomize.aspx">Customize</a>
					                        </td>
					                        <td>vb_changercustomize.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_playpauseshow.aspx">Play/Pause Buttons</a>
					                        </td>
					                        <td>vb_playpauseshow.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	    
                        	    <td style="width:50px">&#160;</td>
                        	    
                        	    <td valign="top">
                        	        <table>  
										<tr>
				                            <td class="header" colspan="2"><b>Transition type - 10</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_notransition.aspx">No transition effect</a>
					                        </td>
					                        <td>vb_notransition.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_quickscroll.aspx">QuickScroll</a>
					                        </td>
					                        <td>vb_quickscroll.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_quickscrollcustomize.aspx">QuickScroll customize</a>
					                        </td>
					                        <td>vb_quickscrollcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_fading.aspx">Fading</a>
					                        </td>
					                        <td>vb_fading.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_fadingcustomize.aspx">Fading customize</a>
					                        </td>
					                        <td>vb_fadingcustomize.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_scrollingleft.aspx">Scrolling left</a>
					                        </td>
					                        <td>vb_scrollingleft.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_scrollingright.aspx">Scrolling right</a>
					                        </td>
					                        <td>vb_scrollingright.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_scrollingtop.aspx">Scrolling top</a>
					                        </td>
					                        <td>vb_scrollingtop.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_scrollingbottom.aspx">Scrolling bottom</a>
					                        </td>
					                        <td>vb_scrollingbottom.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_scrollingcustomize.aspx">Scrolling customize</a>
					                        </td>
					                        <td>vb_scrollingcustomize.aspx</td>
				                        </tr>
										
										<tr>
				                            <td class="header" colspan="2"><b>Other Features - 11</b></td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_database.aspx">From database</a>
					                        </td>
					                        <td>vb_database.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_withmasterpage.aspx">With Master Page</a>
					                        </td>
					                        <td>vb_withmasterpage.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_differentfont.aspx">Different font</a>
					                        </td>
					                        <td>vb_differentfont.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_imagesshowpath.aspx">ImagesShowPath</a>
					                        </td>
					                        <td>vb_imagesshowpath.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_selectedpanel.aspx">Selected panel</a>
					                        </td>
					                        <td>vb_selectedpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_movingpanels.aspx">Moving panels</a>
					                        </td>
					                        <td>vb_movingpanels.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_loadpage.aspx">Load page inside panel</a>
					                        </td>
					                        <td>vb_loadpage.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_timebetweenpanels.aspx">Time between panels transition</a>
					                        </td>
					                        <td>vb_timebetweenpanels.aspx</td>
				                        </tr>
										<tr>
					                        <td class="link">
						                        <a href="vb_starttimedelay.aspx">Start time delay</a>
					                        </td>
					                        <td>vb_starttimedelay.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_currentpanel.aspx">Current panel</a>
					                        </td>
					                        <td>vb_currentpanel.aspx</td>
				                        </tr>
				                        <tr>
					                        <td class="link">
						                        <a href="vb_multipleshows.aspx">Multiple shows on the same page</a>
					                        </td>
					                        <td>vb_multipleshows.aspx</td>
				                        </tr>
				                    </table>
                        	    </td>
                        	</tr>

			            </table>
			            
			            <br /><br />
			            <span class="tdText">
				            You can find the VB.NET examples in the <b>Show</b> folder.<br />
				            They have the <b>vb_</b> prefix.
			            </span>
                    </div> 
                </td>
			</tr>
        </table>
        <br />
        <br />
        <a href="http://www.obout.com/show/">obout ASP.NET Show home</a>
        <br />
        <a href="http://www.obout.com">obout inc home</a>
       </span>                             
    </form>
</body>
</html>
