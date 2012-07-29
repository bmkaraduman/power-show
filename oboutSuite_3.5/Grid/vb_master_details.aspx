<%@ Page Language="VB" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>
<%@ Register TagPrefix="ogrid" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="spl2" Namespace="OboutInc.Splitter2" Assembly="obout_Splitter2_Net" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %> 
<%@ Import Namespace="obout_ASPTreeView_2_NET" %>
<%@ Import Namespace="System.Data.OleDb" %>
<script language="VB" runat="server">
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )		
        If Not Page.IsPostBack Then
            LoadCustomerList()
        End If
			
        Dim CustomerID As Integer = 1
        If Session("CustomerID") <> Nothing Then
            CustomerID = Int32.Parse(Session("CustomerID").ToString())
        End If
		
        LoadCustomerOrders(CustomerID)

    End Sub
    Public Sub LoadCustomer(ByVal CustomerID As Integer)
        Session("CustomerID") = CustomerID
    End Sub
	
    Private Sub LoadCustomerList()
        ' load customers list from the database
        
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/customer.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand
        myComm = New OleDbCommand("select TOP 50 CustomerID, CustomerName, CustomerCompany, CustomerAddress, CustomerPhone from Customers", myConn)
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
        

        gridMaster.SelectedRecords = New ArrayList()

        ' creating some records that will be selected
        Dim oRecord As Hashtable = New Hashtable()
        oRecord.Add("CustomerID", "1")
        oRecord.Add("CustomerName", "John Cash")
        oRecord.Add("CustomerCompany", "Bartec Dispensing Technology")
        oRecord.Add("CustomerAddress", "5830 S. 129th E. Ave. • Tulsa, OK - United States")
        oRecord.Add("CustomerPhone", "856-988-9414")

        ' adding the records to the SelectedRecords collection
        gridMaster.SelectedRecords.Add(oRecord)
        
        gridMaster.DataSource = myReader
        gridMaster.DataBind()
		
        myReader.Close()
        myConn.Close()
    End Sub
	
    Private Sub LoadCustomerOrders(ByVal CustomerID As Integer)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/customer.mdb"))

        Dim query As String = "SELECT distinct ItemName, ItemPrice,  Format(OrderDate, ""Short Date"") as OrderDate, OrderStatus, count(OrderID) as OrderCount FROM Orders O inner join Items I on O.ItemID = I.ItemID where O.CustomerID = " + CustomerID.ToString() + " group by O.ItemID, ItemName, ItemPrice, OrderDate, OrderStatus"
		
        Dim myComm As OleDbCommand = New OleDbCommand(query, myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()
		
        gridDetails.DataSource = myReader
        gridDetails.DataBind()
		
        myReader.Close()
    End Sub
	
</script>

<html>
	<head runat="server">
		<title>obout ASP.NET Grid examples</title>
		<script type="text/javascript">
			function SelectCustomer(oRecord) {
				var CustomerID = parseInt(oRecord[0].CustomerID);	
				
				// load selected Customer details 
				ob_post.AddParam("CustomerID", CustomerID);
				ob_post.post(null, "LoadCustomer", UpdateCustomerOrders);
				document.getElementById("order_label").innerHTML = "Orders made by " + oRecord[0].CustomerName;
			}
			
			function UpdateCustomerOrders() {
			    gridDetails.refresh();
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
		</style>
	</head>
	<body>
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Separated Master/Detail Grids</b></span>
		<br /><br />
		<span class="tdText">
		Please select a customer from the customers list.<br /><br />

        In a master-detail relationship you have at least two grids.<br />
        One is linked to the other somehow.<br />
        In this demo, we have a list of customers, and orders for each customer.<br />
        </span><br /><br />
		<b>Customers List</b>
        <ogrid:Grid id="gridMaster" runat="server" AllowRecordSelection="true" AllowPageSizeSelection="true"
			KeepSelectedRecords="true" AllowAddingRecords="false" CallbackMode="true" Serialize="true" 
			AllowColumnResizing="true" ShowHeader="true" Width="485px" PageSize="5" FolderStyle="styles/premiere_blue" AutoGenerateColumns="false">
			<ClientSideEvents OnClientSelect="SelectCustomer" />
			<Columns>
			    <ogrid:Column ID="Column1" DataField="CustomerID" HeaderText="CustomerID" Width="110" Visible="false" runat="server" />
				<ogrid:Column ID="Column2" DataField="CustomerName" HeaderText="Name" Width="110" runat="server" />
				<ogrid:Column ID="Column3" DataField="CustomerCompany" HeaderText="Company" Width="170" runat="server"/>
				<ogrid:Column ID="Column4" DataField="CustomerAddress" HeaderText="Address" Width="250" runat="server" />
				<ogrid:Column ID="Column5" DataField="CustomerPhone" HeaderText="Phone No." Width="110" runat="server"/>
			</Columns>	
			
		</ogrid:Grid>	
															
	
	    <br /><br />
	    <b><span id="order_label">Orders made by John Cash</span></b>
		<ogrid:Grid id="gridDetails" runat="server" AllowRecordSelection="true"
			KeepSelectedRecords="false" AllowAddingRecords="false" CallbackMode="true" Serialize="false" 
			AllowColumnResizing="true" ShowHeader="true" Width="485px"
			PageSize="10"   FolderStyle="styles/premiere_blue" AutoGenerateColumns="false">
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
	
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
