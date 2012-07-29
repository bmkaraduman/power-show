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
        		
		        sMessage = "These are all the selected records : ";
		         for(var i=0; i<grid1.SelectedRecords.length;i++) {
	                var record = grid1.SelectedRecords[i];
		            sMessage += "<br />" + record.SupplierID + " --- " + record.CompanyName + " --- " + record.Address + " --- " + record.Country;
		        }
		        var oDiv = document.getElementById("divAllSelectedRecords");
		        oDiv.innerHTML = sMessage;
	        }
	        function showAllSelectedRecords() {
                var sMessage;
                if(grid1.SelectedRecords.length > 0) {
                    sMessage = "These are all the selected records : ";
                } else {
                    sMessage = "There are no selected records.";
                }
             
                for(var i=0; i<grid1.SelectedRecords.length;i++) {
                    var record = grid1.SelectedRecords[i];
                    sMessage += "<br />" + record.SupplierID + " --- " + record.CompanyName + " --- " + record.Address + " --- " + record.Country;
                }
        		
                var oDiv = document.getElementById("divAllSelectedRecords");
                oDiv.innerHTML = sMessage;
            }
            
            function showPageSelectedRecords() {
                var sMessage;
                if(grid1.PageSelectedRecords.length > 0) {
                    sMessage = "These are all the selected records from the current page: ";
                } else {
                    sMessage = "There are no selected records on this page.";
                }
             
                for(var i=0; i<grid1.PageSelectedRecords.length;i++) {
                    var record = grid1.PageSelectedRecords[i];
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
		<span class="tdText"><b>ASP.NET Grid - Find Selected Records - Client-Side</b></span>
		<br /><br />	
			
		
		<table>
		    <tr>
		        <td valign="top">
		            <obout:Grid id="grid1" runat="server" CallbackMode="true" AllowRecordSelection="true" AllowMultiRecordSelection="true" 
		                KeepSelectedRecords="true" Serialize="true" AllowAddingRecords="false" AllowColumnResizing="true" 
			            FolderStyle="styles/grand_gray" AutoGenerateColumns="false">
			            <ClientSideEvents OnClientSelect="onRecordSelect" />
			            <Columns>
				            <obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				            <obout:Column DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				            <obout:Column DataField="Address" HeaderText="Address" Width="200" runat="server" />
				            <obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			            </Columns>			
		            </obout:Grid>
		        </td>
		    </tr>
		    <tr>
		        <td>	            
					<div class="tdText" style="border:1px solid #000; width:650px; height: 150px; overflow:auto;" id="divAllSelectedRecords"></div>
					<input type="button" value="Show All Selected Records" onclick="showAllSelectedRecords()" class="tdText" />
	                <input type="button" value="Show Selected Records from current page" onclick="showPageSelectedRecords()" class="tdText" />
		        </td>
		    </tr>		    
		</table>		
		

		<br /><br /><br />
		<span class="tdText">
		    Use the <b>OnClientSelect</b> event to execute a specific action each time a record is selected.<br /><br />
            To access all the selected records on the client-side, use the <b>SelectedRecords</b> property of<br />
            the Grid client-side object: <span class="option2">grid1.SelectedRecords</span><br /><br />
            You can also use the <b>PageSelectedRecords</b> property to access only the records from the current page:<br />
            <span class="option2">grid1.PageSelectedRecords</span>
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


