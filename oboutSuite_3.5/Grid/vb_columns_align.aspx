<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
		grid1.AutoGenerateColumns = False
		
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.EnableRecordHover = True
		
		' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ID"
        oCol1.Width = "60"
        oCol1.Visible = false

        Dim oCol2 As Column = new Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "Address"
        oCol4.HeaderText = "ADDRESS"
        oCol4.Width = "175"

        Dim oCol5 As Column = new Column()
        oCol5.DataField = "Country"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "115"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "HomePage"
        oCol6.HeaderText = "HAS WEBSITE"
        oCol6.Width = "125"                

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)        
		
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		
        grid1.Columns(1).Align = ddlCompanyName.SelectedValue
        grid1.Columns(2).Align = ddlAddress.SelectedValue
        grid1.Columns(3).Align = ddlCountry.SelectedValue
        grid1.Columns(4).Align = ddlHasWebsite.SelectedValue

        grid1.Columns(1).HeaderAlign = ddlCompanyName.SelectedValue
        grid1.Columns(2).HeaderAlign = ddlAddress.SelectedValue
        grid1.Columns(3).HeaderAlign = ddlCountry.SelectedValue
        grid1.Columns(4).HeaderAlign = ddlHasWebsite.SelectedValue
		
        BindGrid()
		
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		'Dim da = new OleDbDataAdapter()
		'Dim ds = new DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub		
	</script>		

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Align</b> and <b>HeaderAlign</b> properties of the <b>Column</b> class <br />
		    to align the text inside the columns/headers.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>