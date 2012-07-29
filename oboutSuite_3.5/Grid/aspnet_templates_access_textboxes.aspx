<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
   
    void ProcessOrder(object sender, EventArgs e)
    {
        string selectedProducts = "";

        for (int i = 0; i < grid1.RowsInViewState.Count; i++)
        {
            GridDataControlFieldCell cell = grid1.RowsInViewState[i].Cells[3] as GridDataControlFieldCell;
            TextBox textBox = cell.FindControl("Quantity") as TextBox;
            HiddenField hiddenField = cell.FindControl("ProductName") as HiddenField;

            if (textBox.Text != "" && textBox.Text != "0")
            {
                if (!string.IsNullOrEmpty(selectedProducts))
                    selectedProducts += "<br />";

                selectedProducts += hiddenField.Value + ": " + textBox.Text + " items";
            }
        }

        if (!string.IsNullOrEmpty(selectedProducts))
            OrderSummary.Text = "<span class='tdText'><b>The following products have been ordered: </b> <br />" + selectedProducts + "</span><br /><br />";
    }

    void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow && grid1.RowsInViewState.Count > 0)
        {
            if (grid1.RowsInViewState.Count > e.Row.RowIndex)
            {
                GridDataControlFieldCell cell = e.Row.Cells[3] as GridDataControlFieldCell;
                TextBox textBox = cell.FindControl("Quantity") as TextBox;
                HiddenField hiddenField = cell.FindControl("ProductName") as HiddenField;

                GridDataControlFieldCell cellInViewState = grid1.RowsInViewState[e.Row.RowIndex].Cells[3] as GridDataControlFieldCell;
                TextBox textBoxInViewState = cellInViewState.FindControl("Quantity") as TextBox;
                HiddenField hiddenFieldInViewState = cellInViewState.FindControl("ProductName") as HiddenField;

                textBox.Text = textBoxInViewState.Text;
                hiddenField.Value = hiddenFieldInViewState.Value;
            }
        }
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
		<span class="tdText"><b>ASP.NET Grid - Templates - Get values from textboxes</b></span>
		
		<br /><br />			
		
		<asp:Literal runat="server" ID="OrderSummary" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="true" AllowAddingRecords="false" AllowSorting="false"
			AutoGenerateColumns="false" DataSourceID="sds1" PageSize="15" AllowPageSizeSelection="false" AllowPaging="false"
			OnRowDataBound="grid1_RowDataBound">
			<Columns>
				<obout:Column DataField="ProductID" ReadOnly="true" Visible="false" runat="server" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="300" runat="server" />
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" runat="server" />				
				<obout:Column DataField="" HeaderText="Quantity" Width="100" AllowEdit="true">
				    <TemplateSettings TemplateId="TplQuantity" />
				</obout:Column>
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TplQuantity">
					<Template>
					    <asp:HiddenField runat="server" ID="ProductName" Value='<%# Container.DataItem["ProductName"] %>' />
						<obout:OboutTextBox runat="server" ID="Quantity" Width="100%" />						
					</Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<br />
		
		<obout:OboutButton runat="server" OnClick="ProcessOrder" Text="Process Order" />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 15 * FROM Products ORDER BY ProductID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>		 

		<br /><br /><br />
		
		<span class="tdText">
		    This example showcases the retrieval of the values from the textboxes placed inside the Grid, at postback.<br />
		    Upon clicking the "Process Order" button, the page is posted back to the server, where the click event of the button is handled<br />
		    and the quantities are extracted from the textboxes.
		</span>

		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>