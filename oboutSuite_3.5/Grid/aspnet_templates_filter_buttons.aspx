<%@ Page Language="C#"%>
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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for the "Show Filter"/"Apply Filter"/"Hide Filter"/"Remove Filter" buttons</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="false" AllowFiltering="true"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" Visible="false" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="300" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="COMPANY ADDRESS" Width="250" runat="server" />
				<obout:Column DataField="City" HeaderText="CITY" Width="200" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="125" runat="server" />
			</Columns>
			<Templates>								
				<obout:GridTemplate runat="server" ID="tplShowFilter">
                    <Template>
                        <input type="button" id="btnShowFilter" class="tdTextSmall" value="Show Filter" onclick="grid1.showFilter()"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplApplyFilter">
                    <Template>
                        <input type="button" id="btnApplyFilter" class="tdTextSmall" value="Apply Filter" onclick="grid1.filter()"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplHideFilter">
                    <Template>
                        <input type="button" id="btnHideFilter" class="tdTextSmall" value="Hide Filter" onclick="grid1.hideFilter()"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplRemoveFilter">
                    <Template>
                        <input type="button" id="btnRemoveFilter" class="tdTextSmall" value="Remove Filter" onclick="grid1.removeFilter()"/>
                    </Template>
                </obout:GridTemplate>			
			</Templates>
			<TemplateSettings FilterShowButton_TemplateId="tplShowFilter" FilterApplyButton_TemplateId="tplApplyFilter"
            FilterHideButton_TemplateId="tplHideFilter" FilterRemoveButton_TemplateId="tplRemoveFilter"/>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">		   
		    Use the <b>FilterShowButton_TemplateId</b>, <b>FilterApplyButton_TemplateId</b>, <b>FilterHideButton_TemplateId</b> and <b>FilterRemoveButton_TemplateId</b><br />
		    properties of the <b>Grid</b> class to specify the Templates for the "Show Filter"/"Apply Filter"/"Hide Filter"/"Remove Filter" buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>