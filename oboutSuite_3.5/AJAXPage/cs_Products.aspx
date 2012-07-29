<%@ Page Language="c#" Inherits="cs_Products" Src="cs_Products.aspx.cs"%>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 

<html>
	<head runat="server">
		<style>
			.ob_gPST /*.ob_gridPageSizeText*/
			{           
				display: none;
			}
			.ob_gPSS /*.ob_gridPageSizeSelector*/
			{
				display: none;
				cursor: default;           
				font-family: Verdana;
				font-size: 10px;
				color:#323232;
				background-color: #F5F5F5;
				margin-left: 7px;
			}    
			
			td {font: 10pt Tahoma; margin: 20px;}
			.title {font-size: X-Large; padding: 20px; border-bottom: 2px solid gray; width: 100%; }
		</style>
		
		<script type="text/javascript">
		
		function UpdateStockAutomatically() {
			ob_post.post(null, "UpdateStockAutomatically", UpdateStock);
		}
		
		function UpdateStock() {
			ob_post.UpdatePanel("cpItems");
			ob_post.UpdatePanel("cpUpdate");
		}
		
		function CancelUpdateStockAutomatically() {
			ob_post.post(null, "CancelUpdateStockAutomatically", function(){});
		}
		
		</script>		
	</head>
	<body>
		<form runat="server">
			<table border="0">
				<tr>
					<td valign="top" width="630" colspan="4">
						<span class="title">Products List example</span><br /><br /><br />
						You can update the stock of products and the last updated date in to ways.
						<br />
						Both panels (<span style="color:black">last updated date</span> and <span style="color:black">products list</span>) are updated once.
						<ul>
							<li>
								On button click, using "Update stock".
							</li>
							<li>
								Automatically at 8 seconds, using "Update stock automatically".
							</li>
						</ul>
						Updates are made, <span style="color:crimson;">without reloading the page</span>.
						<br />
						<br />
						<br />
					</td>
				</tr>
				<tr>
					<td valign="top" class="h5">	            			            
						<span style="color:black">Stock Information</span>
						<table>
							<tr>
								<td style="border:1px solid gray;width:480px;height:480px;" valign="top">
									<table cellpadding="0" cellspacing="0" height="480px">
										<tr>
											<td style="padding-top:20px;padding-left:20px;height:55px" class="tdText" valign="top">
												<table cellpadding="0" cellspacing="0">
													<tr>
														<td class="tdText" style="font-weight:bold;height:35px;border-bottom:1px solid gray;padding-right:5px">
															Last updated on
														</td>
														<td class="tdText" style="font-weight:bold;height:35px;border-bottom:1px solid gray">
															<oajax:CallbackPanel id="cpUpdate" runat="server">
																<content style="width:170px;">
																	<span style="color:red"><asp:Literal id="lUpdate" runat="server" /></span>
																</content>
																<loading style="text-align:center;width:170px;">
																	<table width=100% height=100% cellpadding=0 cellspacing=0>
																		<tr>
																			<td align=center>
																				<img src="loading_icons/1.gif">
																			</td>
																		</tr>
																	</table>
																</loading>
															</oajax:CallbackPanel>
														</td>
													</tr>
												</table>
												<br />
											</td>
										</tr>
										<tr>
											<td valign="top">
												<div style="padding-top:7px;padding-left:10px;width:580px;padding-right:10px">
												<oajax:CallbackPanel id="cpItems" runat="server">
													<content style="width:605px;height:310px;">
														<ogrid:Grid id="gridItems" runat="server" AllowRecordSelection="false"
															KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="true" 
															AllowColumnResizing="true" ShowHeader="true"
															PageSize="10" FolderStyle="../Grid/styles/style_7" AutoGenerateColumns="false">
															<Columns>
																<ogrid:Column DataField="Id" HeaderText="Id" Width="40" runat="server" />
																<ogrid:Column DataField="Name" HeaderText="Name" Width="350" runat="server" />
																<ogrid:Column DataField="Items" HeaderText="Items" Width="90" runat="server">
																    <TemplateSettings TemplateId="tplItems" />
																</ogrid:Column>
																<ogrid:Column DataField="Price" HeaderText="Price" Width="100" runat="server">
																    <TemplateSettings TemplateId="tplPrice" />
																</ogrid:Column>
															</Columns>	
															<Templates>
																<ogrid:GridTemplate runat="server" ID="tplItems">
																	<Template>
																		<div style="width:100%;height:100%;padding-left:12px">
																			<span style="color:red;font-weight:bold;"><%# Container.Value %></span>
																		</div>
																	</Template>
																</ogrid:GridTemplate>
																<ogrid:GridTemplate runat="server" ID="tplPrice">
																	<Template>
																		<div style="width:100%;height:100%;padding-left:10px">
																			$<%# (Double.Parse(Container.Value)).ToString("0.00") %>
																		</div>
																	</Template>
																</ogrid:GridTemplate>
															</Templates>
														</ogrid:Grid>	
													</content>
													<loading style="text-align:center;width:605px;height:310px;">
														<table width=100% height=100% cellpadding=0 cellspacing=0>
															<tr>
																<td align=center valign="middle">
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
											<td style="padding-top:20px;padding-left:20px;padding-bottom:20px;" valign="bottom">
												<nobr />
													<input type="button" onclick="UpdateStock()" value="Update stock" />
													<br /><br />
													<input type="button" onclick="UpdateStockAutomatically()" value="Update stock automatically" />
													<input type="button" onclick="CancelUpdateStockAutomatically()" value="Cancel automatically update" />
												</nobr>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>	
				</tr>
			</table>
			<br /><br /><br />
		
		<a style="font-family:Tahoma;font-size:12px" href="Default.aspx?type=CSHARP">« Back to examples</a>
		</form>
	</body>
</html>