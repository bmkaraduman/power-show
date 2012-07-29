<%@ Page Language="C#" %>
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

		if (chkEnableSorting.Checked == true)
		{
			grid1.AllowSorting = true;
		}
		else
		{
			grid1.AllowSorting = false;
		}		
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Products", myConn);
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
		<span class="tdText"><b>ASP.NET Grid - Simple Sorting</b></span>
		<br /><br />	
			
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td class="tdText" valign="middle">Enable sorting</td>
				<td class="tdText" valign="middle">
					<asp:checkbox runat="server" id="chkEnableSorting" CSSClass="tdText" Checked="true"></asp:checkbox>
				</td>
				<td width="15" class="tdText">&#160;</td>
				<td class="tdText" valign="middle">
					<input type="submit" value="Submit" class="tdText" />
				</td>
			</tr>			
		</table>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" AllowSorting="true"
			CallbackMode="true" Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false" >
			<Columns>
				<obout:Column DataField="ProductID" SortOrder="Desc" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="200" runat="server" />
				<obout:Column DataField="Discontinued" HeaderText="Discontinued" Width="100" runat="server" />								
			</Columns>			
		</obout:Grid>				

		<br /><br /><br />

		<span class="tdText">
		Set <b>AllowSorting</b> to <span class="option2">true</span> to enable the sorting feature.<br />
		Use the <b>SortOrder</b> property of the <b>Column</b> class if you want to automatically sort a column when the page loads.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
