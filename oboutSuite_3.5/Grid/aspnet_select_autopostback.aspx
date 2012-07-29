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

        if (grid1.SelectedRecords != null)
        {
            string sText = "These are the selected records (server-side):";
            foreach (Hashtable oRecord in grid1.SelectedRecords)
            {
                sText += "<br />" + oRecord["SupplierID"] + " --- " + oRecord["CompanyName"] + " --- " + oRecord["Address"] + " --- " + oRecord["Country"];
            }

            divSelectedRecords.Text = sText;
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
	</head>
	<body>	
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>ASP.NET Grid - PostBack on Select</b></span>
		<br /><br />	
			
		
		<table>
		    <tr>
		        <td valign="top" class="tdText">
		            <obout:Grid id="grid1" runat="server" CallbackMode="true" AllowRecordSelection="true" AllowMultiRecordSelection="true" 
		                KeepSelectedRecords="true" Serialize="true" AllowAddingRecords="false" 
			             FolderStyle="styles/black_glass" AutoGenerateColumns="false" AutoPostBackOnSelect="true">
			            <Columns>
				            <obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="45" runat="server"/>				
				            <obout:Column DataField="CompanyName" HeaderText="Company Name" Width="275" runat="server"/>				
				            <obout:Column DataField="Address" HeaderText="Address" Width="225" runat="server" />
				            <obout:Column DataField="Country" HeaderText="Country" Width="115" runat="server" />								
			            </Columns>			
		            </obout:Grid>
		            
		            <br />
		            <asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
		            <br />
		        </td>
		    </tr>		    	    
		</table>		
		

		<br /><br /><br />
		<span class="tdText">
		    Set the <b>AutoPostBackOnSelect</b> property to <span class="option2">true</span> to post the page <br />
		    back to the server after selecting records.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


