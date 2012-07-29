<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_Load(object sender, EventArgs e) 
	{
		obout_ASPTreeView_2_NET.Tree oTree = new obout_ASPTreeView_2_NET.Tree();
		string attachTo = "";
		oTree.id = "tree";

        oTree.FolderIcons = "../TreeView/tree2/icons";
        oTree.FolderScript = "../TreeView/tree2/script";
        oTree.FolderStyle = "../TreeView/tree2/style/Classic";
		oTree.AddRootNode("Hello, I am Root node!", null);

		string Html = "<span style='color:#666666; font:bold; cursor:pointer;' onclick='ob_t25(this)'>obout.com<b style='color:crimson; text-decoration:none;'> Home</b></span>";
		oTree.Add("root", "r1", Html, true, "xpPanel.gif\" onclick=\"ob_t25(document.getElementById('r1'))", null);
		attachTo += "r1,";

		Html = "ASPTreeView";
		oTree.Add("r1", "a0", Html, true, "Folder.gif\" onclick=\"ob_t25(document.getElementById('a0'))", null);
		attachTo += "a0,";	
	
		oTree.Add("a0", "a0_0", "Small", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_0'))", null);
		attachTo += "a0_0,";	
		oTree.Add("a0", "a0_1", "Fast", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_1'))", null);
		attachTo += "a0_1,";	
		oTree.Add("a0", "a0_2", "Easy", null, "ball_glass_redS.gif\" onclick=\"ob_t25(document.getElementById('a0_2'))", null);
		attachTo += "a0_2,";	
	
		Html = "More nodes";
		oTree.Add("r1", "a1", Html, true, "Folder.gif\" onclick=\"ob_t25(document.getElementById('a1'))", null);
		attachTo += "a1,";	
	
		Html = "Different color";
		oTree.Add("a1", "a1_0", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_0'))", null);
		attachTo += "a1_0,";	
	
		Html = "Any HTML";
		oTree.Add("a1", "a1_1", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_1'))", null);
		attachTo += "a1_1,";	
	
		oTree.Add("a1", "a1_2", "Select Icons", null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_2'))", null);
		attachTo += "a1_2,";
	
		Html = "Memobook";
		oTree.Add("a1", "a1_3", Html, null, "ball_glass_blueS.gif\" onclick=\"ob_t25(document.getElementById('a1_3'))", null);
		attachTo += "a1_3,";	

		Html = "Recycle :)";
		oTree.Add("root", "a2", Html, true, "xpRecycle.gif\" onclick=\"ob_t25(document.getElementById('a2'))", null);
		attachTo += "a2,";	
		
		TreeView.Text = oTree.HTML();
		oTree.Width = "150px";
		EasyMenu1.AttachTo = attachTo;
		
		callbackPanel1.BeforePanelUpdate += new OnBeforePanelUpdate(oboutAJAXPage_BeforePanelUpdate);
	}
	
	private bool oboutAJAXPage_BeforePanelUpdate(string PanelId, string UpdateContainer)
	{
		System.Threading.Thread.Sleep(2000);
		return true;
	}
	
</script>

<html>
	<head runat="server">
	    <title>obout ASP.NET Easy Menu examples</title>
		<style type="text/css">
            .tdText {
				        font:11px Verdana;
				        color:#333333;
			        }
	    </style>
		<script type="text/javascript">
			function UpdatePanel()
			{
				ob_post.UpdatePanel("callbackPanel1");
			}
			
		</script>
	</head>
	 <body>
	    <form id="Form1" runat="server">
	
		    <span class="tdText"><b>ASP.NET Easy Menu - Easy Menu and TreeView inside Obout Callback Panel</b></span>
    	
		    <br />
		    <br /><br />
		    <br />
		        <oajax:CallbackPanel id="callbackPanel1" runat="server">
			        <content style="border:1px solid gray;width:300px;height:225px">
				        <table cellpadding="10" cellspacing="5" border="0" width="100%">
					        <tr>
						        <td width="200" valign="top">
							        <asp:Label id="TreeView" runat="server"></asp:Label>
							        <oem:EasyMenu id="EasyMenu1" runat="server" StyleFolder="styles/horizontal4" Width="150">
								        <components>
									        <oem:MenuItem id="menuItem5" OnClientClick="try {alert(targetEl.innerHTML);} catch (e) {}" InnerHtml="Show Node's HTML"></oem:MenuItem>
									        <oem:MenuItem id="menuItem6" OnClientClick="try {targetEl.parentNode.firstChild.firstChild.onclick();} catch (e) {}"
										        InnerHtml="Expand/Collapse Node"></oem:MenuItem>
								        </components>
							        </oem:EasyMenu>
						        </td>
					        </tr>
				        </table>
			        </content>
			        <loading style="border:1px solid gray;width:300px;height:225px">
				        <table width="100%" height="100%">
					        <tr>
						        <td align="center" valign="middle" class="tdText">
							        Loading ...
						        </td>
					        </tr>
				        </table>
			        </loading>
		        </oajax:CallbackPanel>
		        <br />
		        <br />
		        <input type="button" onclick="UpdatePanel()" value="Update Panel" />

                <br /><br /><br />
    		
		        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
	    
        </form>
    </body>
</html>
