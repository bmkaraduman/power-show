<%@ Page Language="VB" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = true	
		grid1.Serialize = true
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = false
        grid1.AllowGrouping = true
        grid1.ShowMultiPageGroupsInfo = false
        grid1.ShowGroupsInfo = true
        grid1.GroupBy = "ShipCountry"
		
        ' creating the columns
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "ShipCountry"
        oCol1.HeaderText = "COUNTRY"
        oCol1.Width = "150"
        
        Dim oCol2 As Column = new Column()
        oCol2.DataField = "ShipCity"
        oCol2.HeaderText = "CITY"
        oCol2.Width = "150"
        
        Dim oCol3 As Column = new Column()
        oCol3.DataField = "ShipPostalCode"
        oCol3.HeaderText = "POSTAL CODE"
        oCol3.Width = "150"
        
        Dim oCol4 As Column = new Column()
        oCol4.DataField = "ShipName"
        oCol4.HeaderText = "NAME"
        oCol4.Width = "200"
          
		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
        
		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
				
		If Not Page.IsPostBack Then
			BindGrid()			
        End If
        
        grid1.ShowGroupsInfo = chkShowGroupsInfo.Checked
                
	End Sub

	Sub BindGrid()
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
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
		<span class="tdText"><b>ASP.NET Grid - Information for Groups</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    <asp:CheckBox runat="server" ID="chkShowGroupsInfo" Checked="true" AutoPostBack="true" />
		    Show Groups Information
		</span>
		
		<br /><br />
				
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		To display the total number of records for each group, set the <b>ShowGroupsInfo</b> property to <span class="option2">true</span>.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>