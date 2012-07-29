<%@ Page Language="C#" ASPCOMPAT="TRUE" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %> 
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
			LoadCustomers();
			
		int CustomerID = 1;
		if (Session["CustomerID"] != null)
            CustomerID = Int32.Parse(Session["CustomerID"].ToString());
		
		LoadCustomerDetails(CustomerID);
		LoadCustomerOrders(CustomerID);
        
		ddlCustomers.SelectedValue = CustomerID.ToString();
    }
	
	private void LoadCustomers() {
		// load customers list from the database
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/customer.mdb"));
		myConn.Open();
		
		OleDbCommand myComm;
		myComm = new OleDbCommand("select CustomerID, CustomerName from Customers", myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		while (myReader.Read())
            ddlCustomers.Items.Add(new ComboBoxItem(myReader.GetString(1), myReader.GetInt32(0).ToString()));
		myReader.Close();
		myConn.Close();	
	}
	
	public void LoadCustomer(int CustomerID) {
        Session["CustomerID"] = CustomerID;
	}
	
	private void LoadCustomerDetails(int CustomerID) {
		// load customers list from the database
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/customer.mdb"));
		myConn.Open();
		
		OleDbCommand myComm;
		myComm = new OleDbCommand("select CustomerName, CustomerCompany, CustomerAddress, CustomerPhone from Customers where CustomerID = " + CustomerID.ToString(), myConn);
		OleDbDataReader myReader = myComm.ExecuteReader();
		while (myReader.Read()) {
			lName.Text = myReader.GetString(0);
			lCompany.Text = myReader.GetString(1);
			lAddress.Text = myReader.GetString(2);
			lPhone.Text = myReader.GetString(3);
		}
		
		myReader.Close();
		myConn.Close();	 
	}
	
	private void LoadCustomerOrders(int CustomerID) {
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/customer.mdb"));

		string query = "SELECT distinct ItemName, ItemPrice,  Format(OrderDate, \"Short Date\") as OrderDate, OrderStatus, count(OrderID) as OrderCount FROM Orders O inner join Items I on O.ItemID = I.ItemID where O.CustomerID = " + CustomerID.ToString() + " group by O.ItemID, ItemName, ItemPrice, OrderDate, OrderStatus";
		
		OleDbCommand myComm = new OleDbCommand(query, myConn);
		myConn.Open();
		OleDbDataReader myReader = myComm.ExecuteReader();
		
		gridOrders.DataSource = myReader;
		gridOrders.DataBind();
		
		myReader.Close();
	}	
	
</script>

<html>
	<head runat="server">
		<script type="text/javascript">
			function SelectCustomer() {
				var CustomerID = ddlCustomers.value();	
				
				// load selected Customer details 
				ob_post.AddParam("CustomerID", CustomerID);
				ob_post.post(null, "LoadCustomer", UpdateCustomerDetails);
			}
			
			function UpdateCustomerDetails() {
				// explicit update customer orders details panel
				ob_post.UpdatePanel("cpCustomerOrders");
				
				// explicit update customer details panel
				ob_post.UpdatePanel("cpCustomerDetails");
			}
		</script>

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
			
			.ob_spl_rightpanelcontent
			{
			    position: relative;
			}
		</style>
	</head>
	<body>
		<form runat="server">
		<br />
		<table border="0">
			<tr>
				<td valign="top" class="h5">	            			            
					<div style="border:1px solid gray;width:680px;height:370px;">
						<div style="width:680px;height:400px;">
							<spl2:Splitter Width="725" id="sp1" runat="server" StyleFolder="../Splitter/styles/default">
								<LeftPanel>
									<Header height="60">
										<div style="padding-left:10px;padding-top:7px">
										<b style="font-size:12px">Customers list:</b>
										<obout:ComboBox id="ddlCustomers" Width="150" runat="server">
											<ClientSideEvents OnSelectedIndexChanged="SelectCustomer" />
										</obout:ComboBox> 
										</div>
									</Header>
									<Content>
										<div style="padding-top:7px;padding-left:10px;border-top:1px solid gray" class="tdText">
											<b>Customer Details</b>
											<br />
											<oajax:CallbackPanel id="cpCustomerDetails" runat="server">
												<content style="width:147px;height:280px;">
													<table>
														<tr>
															<td class="tdText" valign="top">
																<br />
																<b>Name:</b>
																<br />
																<asp:Literal id="lName" runat="server" />
															</td>
														</tr>
														<tr>
															<td class="tdText" valign="top">
																<b>Company:</b>
																<br />
																<asp:Literal id="lCompany" runat="server" />
															</td>
														</tr>
														<tr>
															<td class="tdText" valign="top">
																<b>Address:</b>
																<br />
																<asp:Literal id="lAddress" runat="server" />
															</td>
														</tr>
														<tr>
															<td class="tdText" valign="top">
																<b>Phone:</b>
																<br />
																<asp:Literal id="lPhone" runat="server" />
															</td>
														</tr>
													</table>
												</content>
												<loading style="text-align:center;width:147px;height:280px;">
													<table width=100% height=100% cellpadding=0 cellspacing=0>
														<tr>
															<td align=center>
																<img src="resources/loading_icons/1.gif">
															</td>
														</tr>
													</table>
												</loading>
											</oajax:CallbackPanel>
										</div>
									</Content>
								</LeftPanel>
								<RightPanel>
									<Content>
										<div style="padding-top:7px;padding-left:10px">
											<b>Customer Orders</b>
											<br />
											<br />
											<oajax:CallbackPanel id="cpCustomerOrders" runat="server">
												<content style="width:485px;height:310px">
													<ogrid:Grid id="gridOrders" runat="server" AllowRecordSelection="true"
														KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="false" 
														AllowColumnResizing="true" ShowHeader="true" Width="485px"
														PageSize="10"   FolderStyle="styles/grand_gray" AutoGenerateColumns="false">
														<Columns>
															<ogrid:Column DataField="ItemName" HeaderText="Name" Width="110" runat="server" />
															<ogrid:Column DataField="ItemPrice" HeaderText="Price" Width="75" runat="server">
															    <TemplateSettings TemplateID="tplOrderPrice" />
															</ogrid:Column>
															<ogrid:Column DataField="OrderDate" HeaderText="Date" Width="80" runat="server" />
															<ogrid:Column DataField="OrderCount" HeaderText="Orders" Width="85" runat="server">
															    <TemplateSettings TemplateID="tplOrderCount" />
															</ogrid:Column>
															<ogrid:Column DataField="OrderStatus" HeaderText="Status" Width="80" runat="server">
															    <TemplateSettings TemplateID="tplOrderStatus" />
															</ogrid:Column>
														</Columns>	
														<Templates>
															<ogrid:GridTemplate runat="server" ID="tplOrderStatus">
																<Template>
																	<div style="width:100%;height:100%;text-align:center">
																		<img src="resources/images/<%# Container.Value %>.gif" />
																	</div>
																</Template>
															</ogrid:GridTemplate>
															<ogrid:GridTemplate runat="server" ID="tplOrderCount">
																<Template>
																	<div style="width:100%;height:100%;text-align:center">
																		<%# Container.Value %>
																	</div>
																</Template>
															</ogrid:GridTemplate>
															<ogrid:GridTemplate runat="server" ID="tplOrderPrice">
																<Template>
																	<div style="width:100%;height:100%;">
																		$<%# Container.Value %>
																	</div>
																</Template>
															</ogrid:GridTemplate>
														</Templates>
													</ogrid:Grid>	
												</content>
												<loading style="text-align:center;width:485px;height:310px">
													<table width=100% height=100% cellpadding=0 cellspacing=0>
														<tr>
															<td align=center valign="middle">
																<img src="resources/loading_icons/1.gif">
															</td>
														</tr>
													</table>
												</loading>
											</oajax:CallbackPanel>
										</div>
									</Content>
								</RightPanel>
							</spl2:Splitter>
						</div>
					</div>
				</td>	
			</tr>
		</table>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
