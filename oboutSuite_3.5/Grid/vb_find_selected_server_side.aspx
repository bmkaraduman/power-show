<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
        
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AllowRecordSelection = True
        grid1.AllowMultiRecordSelection = True
        grid1.KeepSelectedRecords = True        
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
        grid1.PageSize = 10
        AddHandler CType(grid1, Grid).Select, AddressOf OnSelectRecords

		
		grid1.FolderStyle = "styles/premiere_blue"

		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "SupplierID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ID"
		oCol1.Width = "45"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "CompanyName"
		oCol2.HeaderText = "COMPANY NAME"
		oCol2.Width = "275"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "Address"
		oCol3.HeaderText = "ADDRESS"
		oCol3.Width = "200"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Country"
		oCol4.HeaderText = "COUNTRY"
		oCol4.Width = "115"

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
		
	End Sub
	
	Sub OnSelectRecords(ByVal sender As Object, ByVal e As GridRecordEventArgs)    
        If Not grid1.SelectedRecords Is Nothing
            Dim sText As String = "These are the selected records (server-side):"
            For Each oRecord As Hashtable in grid1.SelectedRecords            
                sText = sText + "<br />" + oRecord("SupplierID").ToString() + " --- " + oRecord("CompanyName").ToString() + " --- " + oRecord("Address").ToString() + " --- " + oRecord("Country")
            Next

            divSelectedRecords.Text = sText
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
		<span class="tdText"><b>ASP.NET Grid - Find Selected Records - Server-Side</b></span>
		<br /><br />	
			
		
		<table>
		    <tr>
		        <td valign="top" class="tdText">
		            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		            
		            <br />
		            <asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
		            <br />
		        </td>
		    </tr>
		    <tr>
		        <td>	            
					<input type="submit" value="Postback" class="tdText" />
		        </td>
		    </tr>		    
		</table>		
		

		<br /><br /><br />
		<span class="tdText">
		    Use the <b>OnSelect</b> event to execute a server-side action each time a record is selected.<br /><br />
            To access all the selected records on the server-side, use the <b>SelectedRecords</b> property of<br />
            the Grid object: <span class="option2">grid1.SelectedRecords</span>
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>


