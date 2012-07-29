<%@ Page Language="C#"%>
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
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM Orders", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
	
	void SelectAll(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipCountry FROM Orders", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.SelectedRecords = new ArrayList();

        while (myReader.Read())
        {
            Hashtable row = new Hashtable();
            row["OrderID"] = myReader.GetInt32(0);
            row["ShipName"] = !myReader.IsDBNull(1) ? myReader.GetString(1) : "";
            row["ShipCity"] = !myReader.IsDBNull(2) ? myReader.GetString(2) : "";
            row["ShipCountry"] = !myReader.IsDBNull(3) ? myReader.GetString(3) : "";
            grid1.SelectedRecords.Add(row);
        }
        
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>		
        <script type="text/javascript">
            function deselectAll() {
                for (i = 0; i < grid1.Rows.length; i++) {
                    grid1.deselectRecord(i);
                }

                grid1.SelectedRecordsContainer.value = "";
                grid1.SelectedRecords = new Array();
            }
        </script>
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select All Records</b></span>
		<br /><br />		
		<obout:Grid id="grid1" runat="server" AllowRecordSelection="true" AllowMultiRecordSelection="true" 
		    KeepSelectedRecords="true" AllowAddingRecords="false" CallbackMode="true" Serialize="true" AllowColumnResizing="true" 
		    AutoGenerateColumns="false">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="Order ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="Name" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="City" Width="150" runat="server" />				
				<obout:Column DataField="ShipCountry" HeaderText="Country" Width="150" runat="server" />
			</Columns>		
		</obout:Grid>
		
		<br /><br />
		
		<obout:OboutButton ID="Button1" runat="server" Text="Select All" OnClick="SelectAll" OnClientClick="deselectAll(); return true;" Width="75" />		
		
	
		<br /><br /><br />
		
		<span class="tdText">
		    By populating the <b>SelectedRecords</b> collection on the server-side, you can select all the records from the grid (from all the pages).
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>