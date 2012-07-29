<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Dim countriesDataSet As DataSet = Nothing
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountry ASC", myConn)
        
        Dim da As OleDbDataAdapter = New OleDbDataAdapter()
        countriesDataSet = New DataSet()
        da.SelectCommand = myComm
        da.Fill(countriesDataSet, "Orders")
        
        
        Dim ddlCountries2 As DropDownList = CType(grid2.Templates(0).Container.FindControl("ddlCountries2"), DropDownList)
        ddlCountries2.DataSource = countriesDataSet
        ddlCountries2.DataBind()

        myConn.Close()
    End Sub

    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub

    Sub RowDataBound3(ByVal sender As Object, ByVal e As GridRowEventArgs)
        If e.Row.RowType = GridRowType.DataRow
            Dim cell As GridDataControlFieldCell = CType(e.Row.Cells(3), GridDataControlFieldCell)
            Dim ddlCountries3 As DropDownList = CType(cell.FindControl("ddlCountries3"), DropDownList)
            ddlCountries3.SelectedValue = cell.Text
        End If
    End Sub

    Sub RowDataBound4(ByVal sender As Object, ByVal e As GridRowEventArgs)
        If e.Row.RowType = GridRowType.DataRow Then
            Dim cell As GridDataControlFieldCell = CType(e.Row.Cells(3), GridDataControlFieldCell)
            Dim ddlCountries4 As DropDownList = CType(cell.FindControl("ddlCountries4"), DropDownList)

            ddlCountries4.DataSource = countriesDataSet
            ddlCountries4.DataBind()
            
            ddlCountries4.SelectedValue = cell.Text
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
		<span class="tdText"><b>ASP.NET Grid - Using Databound DropDownList inside GridTemplates</b></span>
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 OrderID, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sdsCountries" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountry ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<span class="tdText">DropDownList inside Edit Template populated from a DataSourceControl</span> <br />
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5"
			OnUpdateCommand="UpdateRecord">
			<Columns>				
			    <obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column4" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server">
				    <TemplateSettings EditTemplateId="CountryTemplate" />
				</obout:Column>
				<obout:Column runat="server" DataField="" AllowEdit="true" Width="125" Align="center" />
			</Columns>
			<Templates>
			    <obout:GridTemplate ID="CountryTemplate" ControlID="ddlCountries" ControlPropertyName="value">
			        <Template>
			            <asp:DropDownList runat="server" ID="ddlCountries" DataSourceID="sdsCountries"
			                DataValueField="ShipCountry" DataTextField="ShipCountry" 
			                CssClass="ob_gEC"/>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">DropDownList inside Edit Template populated at runtime using the DataSource property</span> <br />
		<obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5"
			OnUpdateCommand="UpdateRecord">
			<Columns>				
			    <obout:Column ID="Column5" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column6" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column7" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column8" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server">
				    <TemplateSettings EditTemplateId="CountryTemplate2" />
				</obout:Column>
				<obout:Column ID="Column9" runat="server" DataField="" AllowEdit="true" Width="125" Align="center" />
			</Columns>
			<Templates>
			    <obout:GridTemplate ID="CountryTemplate2" ControlID="ddlCountries2" ControlPropertyName="value">
			        <Template>
			            <asp:DropDownList runat="server" ID="ddlCountries2"
			                DataValueField="ShipCountry" DataTextField="ShipCountry" 
			                CssClass="ob_gEC"/>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<br /><br /><br />
		
		<span class="tdText">DropDownList inside View Mode Template populated from a DataSourceControl</span> <br />
		<obout:Grid id="grid3" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5" AllowRecordSelection="false"
			OnRowDataBound="RowDataBound3">
			<Columns>				
			    <obout:Column ID="Column10" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column11" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column12" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column13" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server">
				    <TemplateSettings TemplateId="CountryTemplate3" />
				</obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate ID="CountryTemplate3">
			        <Template>
			            <asp:DropDownList runat="server" ID="ddlCountries3" DataSourceID="sdsCountries"
			                DataValueField="ShipCountry" DataTextField="ShipCountry" 
			                CssClass="ob_gEC"/>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">DropDownList inside View Mode Template populated at runtime using the DataSource property</span> <br />
		<obout:Grid id="grid4" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" DataSourceID="sds1" AllowAddingRecords="false" PageSize="5" AllowRecordSelection="false"
			OnRowDataBound="RowDataBound4">
			<Columns>				
			    <obout:Column ID="Column14" DataField="OrderID" HeaderText="ORDER ID" Visible="false" Width="150" runat="server"/>
				<obout:Column ID="Column15" DataField="ShipName" HeaderText="SHIP NAME" runat="server" />				
				<obout:Column ID="Column16" DataField="ShipCity" HeaderText="SHIP CITY" runat="server" />
				<obout:Column ID="Column17" DataField="ShipCountry" HeaderText="SHIP COUNTRY" runat="server">
				    <TemplateSettings TemplateId="CountryTemplate4" />
				</obout:Column>
			</Columns>
			<Templates>
			    <obout:GridTemplate ID="CountryTemplate4">
			        <Template>
			            <asp:DropDownList runat="server" ID="ddlCountries4"
			                DataValueField="ShipCountry" DataTextField="ShipCountry" 
			                CssClass="ob_gEC"/>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>
					
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>