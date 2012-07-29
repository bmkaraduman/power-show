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

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Products");*/
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
				
				if ( 0 <grid1.SelectedRecords.length ) {
					var id = grid1.SelectedRecords[0].ProductID;

					var radio = document.getElementById( "rad_grid_" + id );
					radio.checked =  true;
				}
			
			}
			function resetRadio (){
				// populate the previously checked radio buttons
                var arrPageSelectedRecords = grid1.PageSelectedRecords;
                if ( 0<arrPageSelectedRecords.length ) {                    
                    var oCheckbox = document.getElementById("rad_grid_" + arrPageSelectedRecords[0].ProductID);
                    oCheckbox.checked = true;
                }
			}
		</script>
		
		</head>
	<body>		
		<form id="Form1" runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select using Radio Buttons</b></span>
		<br /><br />
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/premiere_blue" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
			 GenerateRecordIds="true">
			<ClientSideEvents OnClientCallback="resetRadio" onClientSelect="onRecordSelect"/>
			<Columns>
			    <obout:Column HeaderText="Select" runat="server">
			        <TemplateSettings TemplateID="CheckTemplate"/>
			    </obout:Column>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="150" runat="server" />					            
			</Columns>
			<Templates>				
                <obout:GridTemplate runat="server" ID="CheckTemplate">
	                <Template>
	                    <input type="radio" name="radio" onclick="/*selectRow(this);*/" id="rad_grid_<%# Container.DataItem["ProductID"] %>"/>
	                </Template>
                </obout:GridTemplate>        
			</Templates>
		</obout:Grid>
							
		<br /><br /><br />
		
		<span class="tdText">
		    Use the radio buttons to select records from the Grid. 		   
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<script type="text/javascript">
var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = resetRadio;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    resetRadio();
    }
}
</script>