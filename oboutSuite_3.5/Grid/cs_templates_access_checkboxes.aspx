<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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

    void ProcessSelectedOrders(object sender, EventArgs e)
    {
        string selectedOrderIds = "";
        for (int i = 0; i < grid1.Rows.Count; i++)
        {
            GridDataControlFieldCell cell = grid1.Rows[i].Cells[0] as GridDataControlFieldCell;
            CheckBox chk = cell.FindControl("ChkID") as CheckBox;
            if (chk.Checked == true)
            {
                if (!string.IsNullOrEmpty(selectedOrderIds))
                    selectedOrderIds += ", ";
                
                selectedOrderIds += chk.ToolTip;
            }
        }
        if (!string.IsNullOrEmpty(selectedOrderIds))
            SelectedOrders.Text = "<span class='tdText'>The orders with the following IDs have been processed: <b>" + selectedOrderIds + "</b></span><br /><br />";
    }
    void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow && grid1.RowsInViewState.Count > 0)
        {
            GridDataControlFieldCell cell = e.Row.Cells[0] as GridDataControlFieldCell;
            CheckBox chk = cell.FindControl("ChkID") as CheckBox;

            GridDataControlFieldCell cellInViewState = grid1.RowsInViewState[e.Row.RowIndex].Cells[0] as GridDataControlFieldCell;
            CheckBox chkInViewState = cellInViewState.FindControl("ChkID") as CheckBox;

            if (cell.Value == chkInViewState.ToolTip)
            {
                chk.Checked = chkInViewState.Checked;
            }
        }
    }
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
		<span class="tdText"><b>ASP.NET Grid - Get selected checkboxes server-side</b></span>
		
		<br /><br />			
		
		<asp:Literal runat="server" ID="SelectedOrders" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="true"
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false" AllowRecordSelection="false" AllowMultiRecordSelection="false"
			OnRowDataBound="grid1_RowDataBound">
			<Columns>
				<obout:Column ID="Column1" DataField="SupplierID" ReadOnly="true" HeaderText="SELECT" Width="100" runat="server">
				    <TemplateSettings TemplateID="TemplateWithCheckbox" />
				</obout:Column>
				<obout:Column ID="Column2" DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server" />
				<obout:Column ID="Column3" DataField="Address" HeaderText="Address" Width="175" runat="server" />
				<obout:Column ID="Column4" DataField="Country" HeaderText="Country" Width="115" runat="server" />
				<obout:Column ID="Column5" DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server" />
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateWithCheckbox">
					<Template>
						<asp:CheckBox runat="server" ID="ChkID" ToolTip="<%# Container.Value %>" />
					</Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<br />
		
		<asp:Button runat="server" OnClick="ProcessSelectedOrders" Text="Process" CssClass="tdText" />

		<br /><br /><br />
		
		<span class="tdText">
		The displayed data can be formatted using templates. Grid also supports templates<br />
		for edit mode. These templates can contain any HTML/ASP.NET control.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_templates.aspx">Templates tutorial</a>
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>