<%@ Page Language="C#" %>
<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	void Page_Load(object sender, EventArgs e) {
	
		// bind a datalist to the list of show panels
		DataListCustomChanger.DataSource = Show1.Panels;
		DataListCustomChanger.DataBind();
	}
	
	protected void DataListCustomChanger_OnItemDataBound(Object sender, DataListItemEventArgs e)
	{
		if (e.Item.ItemType == ListItemType.Item || 
             e.Item.ItemType == ListItemType.AlternatingItem)
        {
			string itemIndex = (e.Item.ItemIndex + 1).ToString();
			HyperLink linkCustomChanger = (HyperLink)e.Item.FindControl("linkCustomChanger");
            linkCustomChanger.Text = itemIndex;
			linkCustomChanger.NavigateUrl = "javascript:Show1.MoveToPanel(" + itemIndex + ")";
        }

	}
	
</script>

<html>
	<head>
	<title>obout ASP.NET Show examples</title>
	   
	<!--// Only needed for this page's formatting //-->
		<style type="text/css">
        .tdText {
				    font:11px Verdana;
				    color:#333333;
        }
        .panelTable
        {
	        border:1px solid #cccccc;
	        padding:7px;
	        height:165px;
	        border-collapse: separate;
	        border-spacing: expression(cellSpacing=0);
	        border-spacing: 0px;
	        border-padding: expression(cellPadding=0);
	        border-padding: 0px;
        }
        .showContainer
        {
	        padding:7px;
	        width:370px;
	        border:0px solid red;
        }
        .imageText
        {
	        color:#CCCCCC;
	        font-weight:bold;
	        font-size:15px;
        }
        
       .tdText 
	    {
            font:11px Verdana;
            color:#333333;
        }
		</style>
	</head>
	<body>
        <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Show - Use Custom Buttons</b></span>
		    <br /><br />
		    <div class="showContainer">
	        <asp:DataList ID="DataListCustomChanger" runat="server" RepeatDirection="Horizontal" OnItemDataBound="DataListCustomChanger_OnItemDataBound">
		        <ItemTemplate>
			        <div style="border:1px solid black;width:20px;height:20px;background-color:gray;" align="center">
				        <asp:HyperLink ID="linkCustomChanger" runat="server" />
			        </div>
		        </ItemTemplate>
	        </asp:DataList>
	        <div style="height:200px;width:390px">
	        <obshow:Show id="Show1" runat="server" Width="390" Height="200" ShowType="manual" ManualChanger="false">
		        <Panels>
			        <obshow:Panel>
				        <table class="panelTable">
					        <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1010914_resize.jpg" alt="Panel 1 image" border="0" /><br />
								    <span class="imageText">Image 1</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 1 content</h3>
								    <h4>Panel 1 content</h4>
								    <h5>Panel 1 content</h5>
								    <h6>Panel 1 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
				    <obshow:Panel>
					    <table class="panelTable">
						    <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1020003_resize.jpg" alt="Panel 2 image" border="0" /><br />
								    <span class="imageText">Image 2</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 2 content</h3>
								    <h4>Panel 2 content</h4>
								    <h5>Panel 2 content</h5>
								    <h6>Panel 2 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
				    <obshow:Panel Selected="true">
					    <table class="panelTable">
						    <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1020153_resize.jpg" alt="Panel 3 image" border="0" /><br />
								    <span class="imageText">Image 3</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 3 content</h3>
								    <h4>Panel 3 content</h4>
								    <h5>Panel 3 content</h5>
								    <h6>Panel 3 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
				    <obshow:Panel>
					    <table class="panelTable">
						    <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1020162_resize.jpg" alt="Panel 4 image" border="0" /><br />
								    <span class="imageText">Image 4</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 4 content</h3>
								    <h4>Panel 4 content</h4>
								    <h5>Panel 4 content</h5>
								    <h6>Panel 4 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
				    <obshow:Panel Selected="false">
					    <table class="panelTable">
						    <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1020291_resize.jpg" alt="Panel 5 image" border="0" /><br />
								    <span class="imageText">Image 5</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 5 content</h3>
								    <h4>Panel 5 content</h4>
								    <h5>Panel 5 content</h5>
								    <h6>Panel 5 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
				    <obshow:Panel>
					    <table class="panelTable">
						    <tr>
							    <td style="padding-top:7px" class="tdText">
								    <img src="images/flowers/P1020294_resize.jpg" alt="Panel 6 image" border="0" /><br />
								    <span class="imageText">Image 6</span>
							    </td>
							    <td class="tdText" style="padding-left:15px;padding-top:3px;" valign="top">
								    <h3>Panel 6 content</h3>
								    <h4>Panel 6 content</h4>
								    <h5>Panel 6 content</h5>
								    <h6>Panel 6 content</h6>
							    </td>
						    </tr>
					    </table>
				    </obshow:Panel>
			    </Panels>
		    </obshow:Show>	
		    </div>
	        <br /><br />
    		
		    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
    </body>
</html>
	