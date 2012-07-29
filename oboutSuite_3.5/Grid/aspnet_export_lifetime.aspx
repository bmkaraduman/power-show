<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
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
        else
        {
            grid1.ExportingSettings.ExportedFilesLifeTime = int.Parse(ddlLifeTime.SelectedValue);
        }
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 250 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}

    protected void OboutButton1_Click(object sender, EventArgs e)
    {
        string fileName = grid1.ExportToExcel();

        Downloader.Text = "The Grid has been exported to an Excel file on the server. <br /><a href=\"resources/exports/" + fileName + "\">Click here to download the file.</a>";
    }

    protected void OboutButton2_Click(object sender, EventArgs e)
    {
        string fileName = grid1.ExportToWord();

        Downloader.Text = "The Grid has been exported to a Word file on the server. <br /><a href=\"resources/exports/" + fileName + "\">Click here to download the file.</a>";
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
		<span class="tdText"><b>ASP.NET Grid - Setting the Life Time for the Exported files</b></span>
		<br /><br />
		
		<table>
		    <tr>
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle">Delete Previously Exported Files:</td>
		                    <td class="tdText" valign="middle">
		                        <asp:DropDownList runat="server" ID="ddlLifeTime" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="0" Selected="true">Always</asp:ListItem>
		                            <asp:ListItem Value="-1">Never</asp:ListItem>
		                            <asp:ListItem Value="60">After 1 min</asp:ListItem>
		                            <asp:ListItem Value="900">After 15 min</asp:ListItem>
		                            <asp:ListItem Value="1800">After 30 min</asp:ListItem>
		                            <asp:ListItem Value="3600">After 1 h</asp:ListItem>
		                            <asp:ListItem Value="43200">After 12 h</asp:ListItem>
		                            <asp:ListItem Value="86400">After 24 h</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>
		                </tr>		                		                		    		    
		            </table>
		        </td>                
            </tr>
            <tr>
		        <td valign="top" class="tdText">
                    <br /><br />
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClick="OboutButton1_Click" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClick="OboutButton2_Click" />

                    <br /><br />

                    <asp:Literal runat="server" ID="Downloader" />
		        </td>
		    </tr>
		</table>		
		
		<br /><br />		
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/premiere_blue" AllowFiltering="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"
			FolderExports="resources/exports">
            <ExportingSettings ExportedFilesLifeTime="0" />
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>					
		
		<br /><br /><br />
		
		<div class="tdText">
    		Use the <b>ExportingSettings.ExportedFilesLifeTime</b> property to set the life time of the previously exported files.<br />
    		Each time a new file is created the Grid will <b>automatically delete</b> the previously exported files <br />
    		with the life time expired from the server.
    		<br /><br />
    		Open the <b>grid/resources/exports</b> folder to see how the files are deleted.
    		<br />
    		<br />
    		Possible values for the <b>ExportingSettings.ExportedFilesLifeTime</b> property
    		<ul>
    		    <li><b>0</b> - delete all previously exported files</li>
    		    <li><b>-1</b> - delete no files</li>
    		    <li>any other value - delete all the files older than the specified number of <b>seconds</b></li>
    		</ul>
		</div>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>