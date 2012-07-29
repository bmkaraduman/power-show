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
        grid1.ClientSideEvents.OnClientSelect = "onRecordSelect"
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
        grid1.PageSize = 10

		
		grid1.FolderStyle = "styles/grand_gray"

		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "SupplierID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ID"
		oCol1.Width = "45"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "CompanyName"
		oCol2.HeaderText = "COMPANY NAME"
		oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "Address"
		oCol3.HeaderText = "ADDRESS"
		oCol3.Width = "225"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "Country"
		oCol4.HeaderText = "COUNTRY"
		oCol4.Width = "100"

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
		<script type="text/javascript">
		    function onRecordSelect(arrSelectedRecords) {
	            var sMessage;
	            if(arrSelectedRecords.length == 1) {
	                sMessage = "The following record was selected : ";
	            } else {
	                sMessage = "The following records were selected : ";
	            }
	            for(var i=0; i<arrSelectedRecords.length;i++) {
	                var record = arrSelectedRecords[i];
		            sMessage += "<br />" + record.SupplierID + " --- " + record.CompanyName + " --- " + record.Address + " --- " + record.Country;
		        }
        		
		        var oDiv = document.getElementById("divSelectedRecords");
		        oDiv.innerHTML = sMessage;
        		
        		
		        sMessage = "These are all the selected records : ";
		         for(var i=0; i<grid1.SelectedRecords.length;i++) {
	                var record = grid1.SelectedRecords[i];
		            sMessage += "<br />" + record.SupplierID + " --- " + record.CompanyName + " --- " + record.Address + " --- " + record.Country;
		        }
		        var oDiv = document.getElementById("divAllSelectedRecords");
		        oDiv.innerHTML = sMessage;
	        }
		</script>		
	</head>
	<body>	
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>Select Records</b></span>
		
		<br /><br />
		
		<table>
		    <tr>
		        <td valign="top">		
		            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		         </td>
		        <td valign="top">
		            <div class="tdText" style="border:1px solid #000; width:500px;" id="divSelectedRecords"></div>
					<div class="tdText" style="border:1px solid #000; width:500px;" id="divAllSelectedRecords"></div>
		        </td>
		    </tr>
		</table>	

		<br /><br /><br />
		<span class="tdText">
		Use <b>AllowRecordSelection</b> to enable the record selection feature.<br />
		Use <b>AllowMultiRecordSelection</b> to enable the multi record selection feature.<br />
		Multiple records can be selected using:<br />
		- CTRL + Click<br />
		- SHIFT + Click<br />
		- Dragging a selection zone with the mouse<br />
		<br />
        To keep the selected records between callbacks/postbacks, set <b>KeepSelectedRecords</b> to <span class="option2">true</span>
		<br /><br />
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>


