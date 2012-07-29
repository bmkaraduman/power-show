<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage" EnableEventValidation="true"%>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    
    void Page_Load(object sender, EventArgs e) 
    {
        if (!IsPostBack)
        {
            CustomersCombo.SelectedValue = "ALFKI";
            CustomerDetailsDataSource.SelectParameters[0].DefaultValue = "ALFKI";
        }
    }

    protected void CustomersCombo_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        FormView1.DataBind();
        
        ComboBox OrdersCombo = FormView1.FindControl("OrdersCombo") as ComboBox;
        OrdersCombo.SelectedIndex = -1;
        OrdersCombo.SelectedValue = "";
    }

    protected void OrdersCombo_SelectedIndexChanged(object sender, ComboBoxItemEventArgs e)
    {
        ComboBox OrdersCombo = FormView1.FindControl("OrdersCombo") as ComboBox;

        string value = OrdersCombo.SelectedValue;
        OrderDetailsDataSource.SelectParameters[0].DefaultValue = value;
        
    }
</script>

<html>
	<head runat="server">
		<script type="text/javascript">
		    var customerDetailsPanelInitialized = 0;
		    
		    function CustomersCombo_SelectedIndexChanged() {
		        document.getElementById('sp1_ctl00_ctl01_Button1').click();
		    }

		    function OrdersCombo_SelectedIndexChanged() {
		        document.getElementById('sp1_ctl01_ctl01_Button2').click();
		    }

		    function initCustomerDetailsPanel() {
		        if (customerDetailsPanelInitialized == 1 && OrdersCombo.selectedIndex() != 0) {
		            OrdersCombo.selectedIndex(0);
		        }

		        customerDetailsPanelInitialized = 1;
		    }

		    windowOnLoad = window.onload;

	
            window.onload = function () {
                if (windowOnLoad != null) {
                    windowOnLoad();
                }
                window.setTimeout(OrdersCombo_SelectedIndexChanged, 500);
            }
		   

		    function addNewOrder() {
		        if (OrdersCombo.selectedIndex() == -1) {
		            alert('Please select an order');
		            return;
		        }

		        if (ProductsCombo.selectedIndex() == -1) {
		            alert('Please select a product');
		            return;
		        }

		        if (UnitPrice.value() == '') {
		            alert('Please enter a price');
		            return;
		        }

		        var record = new Object();
		        record.OrderID = OrdersCombo.value();
		        record.ProductID = ProductsCombo.value();
		        record.UnitPrice = UnitPrice.value();
		        record.Quantity = Quantity.value() != '' ? Quantity.value() : 1;
		        record.Discount = Discount.value() != '' ? Discount.value() : 0;

		        gridOrders.executeInsert(record);

		        ProductsCombo.selectedIndex(-1);
		        UnitPrice.value('');
		        Quantity.value('');
		        Discount.value('');
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
				background-color:#f6f9fc;
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:Blue;
			} 
			.h5
		    {
		        padding:0 0 0 0 !important;
		    } 
		</style>
	</head>
	<body>
		<form id="Form1" runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Purchase Order  </b></span>
		<br /><br />	
		<table border="0">
			<tr>
				<td valign="top" class="h5">	            			            
					<div style="border:1px solid gray;width:735px;height:410px;">
						<div style="width:735px;height:410px;">
							<spl2:Splitter Width="735" id="sp1" runat="server" StyleFolder="../Splitter/styles/default">
								<LeftPanel>
									<Content>                                        
                                                
                                        <div style="padding-left:10px;padding-top:7px">
										    <b style="font-size:12px">Customers list:</b>
										            
                                            <obout:Combobox Mode="ComboBox" id="CustomersCombo"
                                                Width="150" Height="180" MenuWidth="250" runat="server"
                                                DataSourceID="CustomersDataSource" DataValueField="CustomerID" DataTextField="CompanyName"
                                                OnSelectedIndexChanged="CustomersCombo_SelectedIndexChanged" SelectedValue="ALFKI">
                                                <ClientSideEvents OnSelectedIndexChanged="CustomersCombo_SelectedIndexChanged" />
                                            </obout:Combobox>
										</div>

										<div style="padding-top:7px;padding-left:10px;border-top:1px solid gray" class="tdText">
											<b>Customer Details</b>
											<br />
											<oajax:CallbackPanel id="cpCustomerDetails" runat="server">
												<content style="width:147px;height:280px;">
													
                                                    <div style="display: none;"><asp:Button ID="Button1" runat="server" /></div>
                                                    
                                                    <asp:FormView runat="server" ID="FormView1" DataSourceID="CustomerDetailsDataSource">
                                                        <ItemTemplate>
                                                            <table>
														        <tr>
															        <td class="tdText" valign="top">
																        <br />
																        <b>Company Name:</b>
																        <br />
																        <asp:Literal id="lCompany" runat="server" Text='<%# Eval("CompanyName") %>' />
															        </td>
														        </tr>
														        <tr>
															        <td class="tdText" valign="top">
																        <b>Address:</b>
																        <br />
																        <asp:Literal id="lAddress" runat="server" Text='<%# Eval("Address") %>' />
															        </td>
														        </tr>
														        <tr>
															        <td class="tdText" valign="top">
																        <b>Phone:</b>
																        <br />
																        <asp:Literal id="lPhone" runat="server" Text='<%# Eval("Phone") %>' />
															        </td>
														        </tr>
														        <tr>
															        <td class="tdText" valign="top">
																        <b>OrderID:</b>
																        <br />
																        <obout:Combobox id="OrdersCombo" Width="150" Height="180" runat="server" SelectedIndex="0"
                                                                            DataSourceID="OrdersDataSource" DataTextField="OrderID" DataValueField="OrderID"
                                                                            OnSelectedIndexChanged="OrdersCombo_SelectedIndexChanged">
											                                <ClientSideEvents OnSelectedIndexChanged="OrdersCombo_SelectedIndexChanged"/>
										                                </obout:Combobox>

                                                                        <asp:SqlDataSource runat="server" ID="OrdersDataSource" SelectCommand="SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID"
		                                                                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">        
                                                                            <SelectParameters>
                                                                                <asp:ControlParameter Name="CustomerID" ControlID="CustomersCombo" PropertyName="SelectedValue" />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
															        </td>
														        </tr>														
													        </table>
                                                        </ItemTemplate>
                                                    </asp:FormView>

                                                    <asp:SqlDataSource runat="server" ID="CustomerDetailsDataSource" 
                                                        SelectCommand="SELECT CustomerID, CompanyName, Address, Phone FROM Customers WHERE CustomerID = @CustomerID"
		                                                ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">        
                                                        <SelectParameters>
                                                            <asp:ControlParameter Name="CustomerID" ControlID="CustomersCombo" PropertyName="SelectedValue" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                                    <script type="text/javascript">
                                                        initCustomerDetailsPanel();
                                                    </script>
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
											<table>
											    <tr>
											        <td class="tdText">Product</td>
											        <td class="tdText">UnitPrice($)</td>
											        <td class="tdText">Quantity</td>
											        <td class="tdText">Discount</td>
											    </tr>
											    <tr>
											        <td>
											            <obout:ComboBox id="ProductsCombo" 
                                                            Width="200" MenuWidth="240" Height="220" runat="server"
                                                            DataSourceID="ProductsDataSource" DataValueField="ProductID" DataTextField="ProductName">
								                        </obout:ComboBox>

                                                        <asp:SqlDataSource runat="server" ID="ProductsDataSource" SelectCommand="SELECT ProductID, ProductName FROM Products ORDER BY ProductName ASC"
		                                                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource> 
										            </td>
											        <td><obout:OboutTextBox runat="server" id="UnitPrice" Width="75" MaxLength="4" /></td>
											        <td><obout:OboutTextBox runat="server" id="Quantity" Width="75" MaxLength="4" /></td>
											        <td><obout:OboutTextBox runat="server" id="Discount" Width="75" MaxLength="3" /></td>
											    </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <obout:OboutButton runat="server" Text="Add Item to Order" OnClientClick="addNewOrder(); return false;" />
                                                    </td>
                                                </tr>										    
											</table>
											
                                            <br /><br />

											<oajax:CallbackPanel id="cpCustomerOrders" runat="server">
												<content style="width:485px;height:250px">
                                                    <div style="display: none;"><asp:Button ID="Button2" runat="server" /></div>

													<ogrid:Grid id="gridOrders" runat="server" AllowRecordSelection="true"
														KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="true" 
														AllowColumnResizing="true" ShowHeader="true" Width="485px" AllowSorting="true"
														PageSize="10" FolderStyle="styles/black_glass" AutoGenerateColumns="false" 
                                                        DataSourceID="OrderDetailsDataSource"
														>
														<Columns>
                                                            <ogrid:Column ID="Column7" DataField="OrderID" HeaderText="OrderID" ReadOnly="true" Width="90"  Visible="false" runat="server" />
															<ogrid:Column ID="Column1" DataField="ProductID" HeaderText="ProductID" ReadOnly="true" Width="90"  Visible="false" runat="server" />
                                                            <ogrid:Column ID="Column2" DataField="ProductName" HeaderText="Product Name" ReadOnly="true" Width="140" runat="server" />															
															<ogrid:Column ID="Column3" DataField="UnitPrice" HeaderText="Price" Width="70" runat="server" DataFormatString="{0:C2}" />
															<ogrid:Column ID="Column4" DataField="Quantity" HeaderText="Quantity" Width="80" runat="server"/>
															<ogrid:Column ID="Column5" DataField="Discount" HeaderText="Discount" Width="80" runat="server"/>
															<ogrid:Column ID="Column6" HeaderText="Edit" Width="125" AllowDelete="true"  AllowEdit="true" runat="server"/>
														</Columns>															
													</ogrid:Grid>
                                                    
                                                    <asp:SqlDataSource runat="server" ID="OrderDetailsDataSource" 
                                                        SelectCommand="SELECT OD.OrderID, OD.ProductID, P.ProductName, OD.UnitPrice, OD.Quantity, OD.Discount FROM [Order Details] OD INNER JOIN Products P ON OD.ProductID = P.ProductID WHERE OrderID = @OrderID"
                                                        InsertCommand="INSERT INTO [Order Details] (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES(@OrderID, @ProductID, @UnitPrice, @Quantity, @Discount)"
                                                        UpdateCommand="UPDATE [Order Details] SET UnitPrice=@UnitPrice, Quantity=@Quantity, Discount=@Discount WHERE OrderID=@OrderID AND ProductID=@ProductID"
		                                                DeleteCommand="DELETE FROM [Order Details] WHERE OrderID=@OrderID AND ProductID=@ProductID"
                                                        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">        
                                                        <SelectParameters>
                                                            <asp:Parameter Name="OrderID" DefaultValue="0" />
                                                        </SelectParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="OrderID" Type="Int32" />
                                                            <asp:Parameter Name="ProductID" Type="Int32" />
                                                            <asp:Parameter Name="UnitPrice" Type="Double" />
                                                            <asp:Parameter Name="Quantity" Type="Double" />
                                                            <asp:Parameter Name="Discount" Type="Double" />
                                                        </InsertParameters>
                                                        <UpdateParameters>                                                            
                                                            <asp:Parameter Name="UnitPrice" Type="Double" />
                                                            <asp:Parameter Name="Quantity" Type="Double" />
                                                            <asp:Parameter Name="Discount" Type="Double" />
                                                            <asp:Parameter Name="OrderID" Type="Int32" />
                                                            <asp:Parameter Name="ProductID" Type="Int32" />
                                                        </UpdateParameters>
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="OrderID" Type="Int32" />
                                                            <asp:Parameter Name="ProductID" Type="Int32" />
                                                        </DeleteParameters>
                                                    </asp:SqlDataSource>
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

        <asp:SqlDataSource runat="server" ID="CustomersDataSource" SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>        
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
