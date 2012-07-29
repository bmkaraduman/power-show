<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	void Page_load(object sender, EventArgs e)		
	{        
        grid1.Columns[1].Align = ddlCompanyName.SelectedValue;
        grid1.Columns[2].Align = ddlAddress.SelectedValue;
        grid1.Columns[3].Align = ddlCountry.SelectedValue;
        grid1.Columns[4].Align = ddlHasWebsite.SelectedValue;

        grid1.Columns[1].HeaderAlign = ddlCompanyName.SelectedValue;
        grid1.Columns[2].HeaderAlign = ddlAddress.SelectedValue;
        grid1.Columns[3].HeaderAlign = ddlCountry.SelectedValue;
        grid1.Columns[4].HeaderAlign = ddlHasWebsite.SelectedValue;
        
		CreateGrid();
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
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Align and HeaderAlign properties for Columns</b></span>
		<br /><br />
		<span class="tdText">Set the alignment of each column<br /></span>
		<ul>
			<table cellspacing="0" cellpadding="0">				
				<tr>
					<td class="tdText">
						<li type="disc">Company Name:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlCompanyName" CssClass="tdText">
							<asp:ListItem Value="left" Selected="true">left</asp:ListItem>
							<asp:ListItem Value="center">center</asp:ListItem>
							<asp:ListItem Value="right">right</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">Address:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlAddress" CssClass="tdText">
							<asp:ListItem Value="left" Selected="true">left</asp:ListItem>
							<asp:ListItem Value="center">center</asp:ListItem>
							<asp:ListItem Value="right">right</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>				
				<tr>
					<td class="tdText">
						<li type="disc">Country:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlCountry" CssClass="tdText">
							<asp:ListItem Value="left" Selected="true">left</asp:ListItem>
							<asp:ListItem Value="center">center</asp:ListItem>
							<asp:ListItem Value="right">right</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText">
						<li type="disc">Has WebSite:&#160;</li>
					</td>
					<td class="tdText">
						<asp:DropDownList runat="server" id="ddlHasWebsite" CssClass="tdText">
							<asp:ListItem Value="left" Selected="true">left</asp:ListItem>
							<asp:ListItem Value="center">center</asp:ListItem>
							<asp:ListItem Value="right">right</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>
				<tr>
					<td class="tdText" align="right" colspan="2">
						<br />
						<input type="submit" value="Submit" class="tdText" />
					</td>
				</tr>
			</table>			
		</ul>			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" EnableRecordHover="true"
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false">
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="Address" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server" />				
			</Columns>			
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Align</b> and <b>HeaderAlign</b> properties of the <b>Column</b> class <br />
		    to align the text inside the columns/headers.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>