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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders", myConn);
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
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Formatting Currencies</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/grand_gray" AutoGenerateColumns="false" AllowAddingRecords="false">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="Freight" HeaderText="Freight in USD" Width="200" runat="server">				
					<TemplateSettings TemplateId="usdTemplate"/>
				</obout:Column>

				<obout:Column DataField="" HeaderText="Freight in JPY" Width="150" runat="server" >				
						<TemplateSettings TemplateId="jpyTemplate"/>
				</obout:Column>
				<obout:Column DataField="" HeaderText="Freight in GBP" Width="150" runat="server" >
						<TemplateSettings TemplateId="gbpTemplate"/>
				</obout:Column>
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="usdTemplate">
					<Template>
					    <%# Container.Value != String.Empty && Container.Value != "&#160;" ? String.Format("{0:C}", Convert.ToDecimal( Container.Value )) : ""%>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="jpyTemplate">
					<Template>
					    <%# (Container.DataItem["Freight"].ToString() != String.Empty) && (Container.DataItem["Freight"].ToString() != "&#160;") ? 
						( Convert.ToDouble( Container.DataItem["Freight"] )  * 118.19  ).ToString("¥#,##0.00;(¥#,##0.00);Zero") : ""
						%>
					</Template>
				</obout:GridTemplate>
				<obout:GridTemplate runat="server" ID="gbpTemplate">
					<Template>
					    <%# (Container.DataItem["Freight"].ToString() != String.Empty) && (Container.DataItem["Freight"].ToString() != "&#160;") ? 
						( Convert.ToDouble( Container.DataItem["Freight"] )  / 1.9565 ).ToString("£#,##0.00;(£#,##0.00);Zero") : ""
						%>
					</Template>
				</obout:GridTemplate>
			</Templates>	
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Templates can be used also to format currencies.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>