<%@ Page Language="VB"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
		
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )		

		If Not Page.IsPostBack Then
			BindGrid()
		End If

	End Sub
	
	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
		myConn.Open()
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub


    Sub ProcessSelectedOrders(ByVal sender As Object, ByVal e As EventArgs)
    
        Dim selectedOrderIds As String = ""
        Dim i As Integer
        
        For i = 0 To grid1.Rows.Count - 1
            Dim cell As GridDataControlFieldCell
            cell = grid1.Rows.Item(i).Cells.Item(0)
            Dim chk As CheckBox
            chk = cell.FindControl("ChkID")
            If (chk.Checked = True) Then
            
                If (Not String.IsNullOrEmpty(selectedOrderIds)) Then
                    selectedOrderIds += ", "
                End If
                selectedOrderIds += chk.ToolTip
                
            End If
        Next i
        If (Not String.IsNullOrEmpty(selectedOrderIds)) Then
            SelectedOrders.Text = "<span class='tdText'>The orders with the following IDs have been processed: <b>" + selectedOrderIds + "</b></span><br /><br />"
        End If
                        
    End Sub
    Sub grid1_RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)

        If (e.Row.RowType = GridRowType.DataRow And grid1.RowsInViewState.Count > 0) Then

            Dim cell As GridDataControlFieldCell = CType(e.Row.Cells(0), GridDataControlFieldCell)
            Dim chk As CheckBox = CType(cell.FindControl("ChkID"), CheckBox)

            Dim cellInViewState As GridDataControlFieldCell = CType(grid1.RowsInViewState(e.Row.RowIndex).Cells(0), GridDataControlFieldCell)
            Dim chkInViewState As CheckBox = CType(cellInViewState.FindControl("ChkID"), CheckBox)

            If (cell.Value = chkInViewState.ToolTip) Then
 
                chk.Checked = chkInViewState.Checked
            End If
            
        End If
        
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
		<span class="tdText"><b>ASP.NET Grid - Get selected checkboxes server-side</b></span>
		
		<br /><br />			
		
		<asp:Literal runat="server" ID="SelectedOrders" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="true"
			FolderStyle="styles/grand_gray" AutoGenerateColumns="false" AllowRecordSelection="false" AllowMultiRecordSelection="false"
			OnRowDataBound="grid1_RowDataBound">
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="SELECT" Width="100" runat="server">
				    <TemplateSettings TemplateID="TemplateWithCheckbox" />
				</obout:Column>
				<obout:Column DataField="CompanyName" HeaderText="Company Name" Width="250" runat="server" />
				<obout:Column DataField="Address" HeaderText="Address" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />
				<obout:Column DataField="HomePage" HeaderText="Has WebSite" Width="125" runat="server" />
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
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>