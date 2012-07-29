<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
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

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

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
		            <obout:Grid id="grid1" runat="server" CallbackMode="true" AllowRecordSelection="true" AllowMultiRecordSelection="true" 
		                 KeepSelectedRecords="true" Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			             FolderStyle="styles/black_glass" AutoGenerateColumns="false">
			            <ClientSideEvents OnClientSelect="onRecordSelect" />
			            <Columns>
				            <obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				            <obout:Column DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				            <obout:Column DataField="Address" HeaderText="Address" Width="225" runat="server" />
				            <obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			            </Columns>			
		            </obout:Grid>
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
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


