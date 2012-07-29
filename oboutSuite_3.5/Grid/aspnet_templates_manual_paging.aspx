<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)		
	{        
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 350 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
	</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
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
		    function updateCurrentPage() {		        
		        document.getElementById("ddlManualPaging").value = grid1.getCurrentPageIndex();
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for Manual Paging</b></span>
		
		<br /><br />        
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" PageSize="7" AllowManualPaging="true" >
			<ClientSideEvents OnClientCallback="updateCurrentPage" />
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="225" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="175" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />				
			</Columns>
			<TemplateSettings ManualPagingTemplateId="tplManualPaging" />
			<Templates>
			    <obout:GridTemplate runat="server" ID="tplManualPaging">
			        <Template>
			            <select id="ddlManualPaging" class="ob_gEC" style="width: 50px;" onchange="grid1.changePage(this.value)">
			                <option value="0">1</option>
			                <option value="4">5</option>
			                <option value="9">10</option>
			                <option value="14">15</option>
			                <option value="19">20</option>
			                <option value="24">25</option>
			                <option value="29">30</option>
			                <option value="34">35</option>
			                <option value="39">40</option>
			                <option value="44">45</option>
			                <option value="49">50</option>
			            </select>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		Set the <b>AllowManualPaging</b> property to <span class="option2">true</span> to enable the manual paging feature.<br />
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>