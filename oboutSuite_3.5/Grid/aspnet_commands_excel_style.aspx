<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" type="text/C#">
    void SaveChanges(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        
        for (int i = 0; i < grid1.RowsInViewState.Count; i++)
        {
            string orderId = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[0]).FindControl("TextBox1")).Text;
            string orderDate = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[1]).FindControl("TextBox1")).Text;
            string shipName = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[2]).FindControl("TextBox1")).Text;
            string shipCity = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[3]).FindControl("TextBox1")).Text;
            string shipPostalCode = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[4]).FindControl("TextBox1")).Text;
            string shipRegion = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[5]).FindControl("TextBox1")).Text;
            string shipCountry = ((TextBox)((GridDataControlFieldCell)grid1.RowsInViewState[i].Cells[6]).FindControl("TextBox1")).Text;
            
            
            OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET OrderDate = @OrderDate, ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion = @ShipRegion, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

            myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = orderDate;
            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = shipName;
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = shipCity;
            myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = shipPostalCode;
            myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = shipRegion;
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = shipCountry;
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId;

            myComm.ExecuteNonQuery();            
        }

        myConn.Close();
    }

    void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.DataRow && grid1.RowsInViewState.Count > 0)
        {
            if (grid1.RowsInViewState.Count > e.Row.RowIndex)
            {
                for (int i = 1; i < e.Row.Cells.Count; i++)
                {
                    GridDataControlFieldCell cell = e.Row.Cells[i] as GridDataControlFieldCell;
                    TextBox textBox = cell.FindControl("TextBox1") as TextBox;

                    GridDataControlFieldCell cellInViewState = grid1.RowsInViewState[e.Row.RowIndex].Cells[i] as GridDataControlFieldCell;
                    TextBox textBoxInViewState = cellInViewState.FindControl("TextBox1") as TextBox;

                    textBox.Text = textBoxInViewState.Text;
                }                
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
		    function markAsFocused(textbox) {
		        textbox.className = 'excel-textbox-focused';
		    }

		    function markAsBlured(textbox) {
                textbox.className = 'excel-textbox';
            }

		</script>		
	</head>
	<body>	
        
        <form id="Form1" runat="server">
		
        <br />
		
        <span class="tdText"><b>ASP.NET Grid - "Excel-style" editing</b></span>
		
        <br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="false" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" AllowRecordSelection="false" AllowAddingRecords="false"
			ShowFooter="false" AllowSorting="false" PageSize="-1" ShowLoadingMessage="false"
			DataSourceID="SqlDataSource1" OnRowDataBound="grid1_RowDataBound">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server">
                    <TemplateSettings TemplateId="PlainEditTemplate" />
                </obout:Column>
				<obout:Column ID="Column2" DataField="OrderDate" HeaderText="DATE" Width="100" runat="server" DataFormatString="{0:MM/dd/yyyy}">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>		
				<obout:Column ID="Column3" DataField="ShipName" HeaderText="NAME" Width="200" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>				
				<obout:Column ID="Column4" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
				<obout:Column ID="Column5" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
				<obout:Column ID="Column6" DataField="ShipRegion" HeaderText="REGION" Width="150" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
				<obout:Column ID="Column7" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
			</Columns>
			<Templates>
                <obout:GridTemplate runat="server" ID="PlainEditTemplate">
                    <Template>
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="excel-textbox" Text='<%# Container.Value %>' 
                            onfocus="markAsFocused(this)" onblur="markAsBlured(this)" />
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>

		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 15 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders]">
        </asp:SqlDataSource>
		
		<br />
		
		<obout:OboutButton runat="server" Text="Save Changes" OnClick="SaveChanges" />
		
		<br /><br />
		
		<span class="tdText">
		    This example showcases the ability to edit the cells of the Grid similar to an Excel spreadsheet.<br />
            To edit a cell simply click it with the mouse.<br />
            When clicking the "Save Changes" button all the changes from the Grid are saved into the database at once.

		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
				
		</form>
	</body>
</html>

<style type="text/css">
    .excel-textbox
    {
        background-color: transparent;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-focused
    {
        background-color: #FFFFFF;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-error
    {
        color: #FF0000;
    }
    
	.ob_gCc2 
	{
       padding-left: 3px !important;
	}
	
	.ob_gBCont
	{
		border-bottom: 1px solid #C3C9CE;
	}
</style>