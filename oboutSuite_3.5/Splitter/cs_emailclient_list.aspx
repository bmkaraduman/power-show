<%@ Page Language="C#" Inherits="cs_emailclient_list" Src="cs_emailclient_list.aspx.cs" %>
<html>
	<head>
		<style>
			.messageText
			{
				font-family:Tahoma;
				font-size:8pt;
				color:back;
			}
		</style>
		<script>
			function EmailFillDetails(EmailID)
			{
				window.parent.sp2.loadPage("RightContent", "cs_emailclient_detail.aspx?EmailID=" + EmailID);
			}
		</script>
	</head>
	<body onload="EmailFillDetails(<%=selectedEmailID%>)">
		<div style="background-color:white">
			<asp:Repeater id="emailList" runat="server">
				<ItemTemplate>
					<div style="cursor:pointer;padding-left:5px;padding-right:5x;padding-top:1px">
						<table id="<%# DataBinder.Eval(Container.DataItem, "EmailID") %>" style="border-top:1px solid gray;width:98%" onClick="EmailFillDetails('<%# DataBinder.Eval(Container.DataItem, "EmailID") %>')" onMouseOver="this.style.backgroundColor = '#ffffcc'" onMouseOut="this.style.backgroundColor = '#ffffff'">
							<tr>
								<td class="messageText">
									<img src="images/open_folder.gif" />
									From: 
									<span class="emailFrom">
									<%# DataBinder.Eval(Container.DataItem, "EmailFrom") %>
									</span>
								</td>
							</tr>
							<tr>
								<td class="messageText" style="padding-left:20px">
									<span class="emailSubject">
									<%# DataBinder.Eval(Container.DataItem, "EmailSubject") %>
									</span>
								</td>
							</tr>
						</table>
					</div>
				</ItemTemplate>
			</asp:Repeater>	
			<%if (emailList.Items.Count > 0) { %><div style="border-top:1px solid gray;width:98%"></div><% } %>
		</div>
	</body>
</html>