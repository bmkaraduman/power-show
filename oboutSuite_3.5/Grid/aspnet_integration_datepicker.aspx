<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
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

        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("cal1") as OboutInc.Calendar2.Calendar;
        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateValue FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry, OrderDate=@OrderDate WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDateValue"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @OrderDate)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record["OrderDateValue"];
        
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
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
		<span class="tdText"><b>ASP.NET Grid - Using the DatePicker inside the Grid</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" HeaderText="ORDER ID" Width="100" Visible="false" runat="server" />
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>											
				<obout:Column ID="Column6" DataField="ShipCity" HeaderText="CITY" Width="125" runat="server"/>
				<obout:Column ID="Column3" DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column ID="Column7" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="OrderDateValue" HeaderText="ORDER DATE" Width="175" runat="server">
				    <TemplateSettings EditTemplateId="tplDatePicker" />
				</obout:Column>
				<obout:Column ID="Column5" DataField="" HeaderText="EDIT" Width="125" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<Templates>								
				<obout:GridTemplate runat="server" ID="tplDatePicker" ControlID="txtOrderDate" ControlPropertyName="value">
			        <Template>
			            <table width="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
			                <tr>
			                    <td valign="middle">
			                        <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="100%"
			                            FolderStyle="styles/premiere_blue/interface/OboutTextBox" />
			                    </td>
			                    <td valign="middle" width="30">			                        
			                        <obout:Calendar ID="cal1" runat="server" 
									    StyleFolder="../calendar/styles/default" 
									    DatePickerMode="true"
									    ShowYearSelector="false"
									    DatePickerImagePath ="../calendar/styles/icon2.gif"/>
							    </td>
					        </tr>
						</table>
			        </Template>
			    </obout:GridTemplate>
			</Templates>
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		You can easily add a DatePicker control into the Grid using Templates for edit.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>