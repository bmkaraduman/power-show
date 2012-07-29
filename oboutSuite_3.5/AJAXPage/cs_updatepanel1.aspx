<%@ Page Language="C#" Inherits="cs_updatepanel1" Src="cs_updatepanel1.aspx.cs" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<html>
	<head runat="server">
		<script language="JavaScript">
			function AddContact() {
				ob_post.AddParam("name", document.getElementById('txtName').value);
				ob_post.AddParam("phone", document.getElementById('txtPhone').value);
				ob_post.AddParam("email", document.getElementById('txtEmail').value);
				
				ob_post.post(null, "AddContact", EndAddContact);
			}
			
			function EndAddContact() {
				ob_post.UpdatePanel("postbackPanel2");
			}
			
			function ClearContacts() {
				ob_post.post(null, "ClearContacts", EndAddContact);
			}
		</script>
		<style>
			.title {
				font-size: X-Large; 
				padding: 20px; 
				border-bottom: 2px solid gray; 
				width: 100%; 
			}
		</style>
	</head>
	<body>
		<table border="0">
			<tr>
				<td valign="top" width="630" colspan="4">
					<span class="title">Callback Panel - UpdatePanel</span><br /><br /><br />
				</td>
			</tr>
		</table>
		<br />
		Add a new contact to the contacts list.    
		<br />
		The contacts list is stored in server session object and is updated <span style='color:crimson'>without reloading the page</span>.
		<br />
		<br />
		<table style="border-bottom:1px solid gray" cellspacing="0" cellpadding="0">
			<tr>
				<td style="padding-left:20px">
					<table>
						<tr>
							<td class="tdText">
								<b>Add New Contact</b>
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td class="tdText">Name:</td>
										<td><input id="txtName" type="text" style="height:20px" value="some name"></td>
									</tr>
									<tr>
										<td class="tdText">Phone:</td>
										<td><input id="txtPhone" type="text" style="height:20px" value="355 220 1800"></td>
									</tr>
									<tr>
										<td class="tdText">Email:</td>
										<td><input id="txtEmail" type="text" style="height:20px" value="email@email.com"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td style="padding-left:15px;padding-top:6px">
								<input type="button" value="Add Contact" onclick="AddContact()" />
							</td>
						</tr>
					</table>
				</td>
				<td align="center" valign="top" style="border-left:1px solid gray;width:150px">
					<table>
						<tr>
							<td align="center"  class="tdText">
								<b style="text-decoration:underline">My Contacts List</b>
								<br />
							</td>
						</tr>
						<tr>
							<td valign="top" class="tdText">
								<div style="height:141px;overflow:auto;width:163px;border:1px solid gray;">
									<oajax:CallbackPanel runat="server" ID="postbackPanel2">
										<content style="width:145px;height:139px">
											<table width=100% height=100% cellpadding=0 cellspacing=0>
												<tr>
													<td align=center valign="top">
														<style>
														.divItem
														{
															border-bottom:1px solid gray;
															font-size:12px;
															width:130px;
															padding-top:4px;
															padding-bottom:4px;
														}
														</style>
														<asp:DataList id="contactList" runat="server">
															<ItemTemplate>
																<div class="divItem">
																<b>Name:</b><%# DataBinder.Eval(Container.DataItem, "name") %><br />
																<b>Phone:</b><%# DataBinder.Eval(Container.DataItem, "phone") %><br />
																<b>Email:</b><%# DataBinder.Eval(Container.DataItem, "email") %><br />
																</div>
															</ItemTemplate>
														</asp:DataList>
													</td>
												</tr>
											</table>
										</content>
										<loading style="width:145px;height:139px">
											<table width=100% height=100% cellpadding=0 cellspacing=0>
												<tr>
													<td align=center>
														<img src="loading_icons/1.gif">
													</td>
												</tr>
											</table>
										</loading>
									</oajax:CallbackPanel>
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align:center">
								<a onclick="ClearContacts()" style="cursor:pointer;color:navy;text-decoration:underline;font-weight:bold">Clear Contacts List</a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
	</body>
</html>