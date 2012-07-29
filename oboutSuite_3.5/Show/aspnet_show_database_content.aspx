<%@ Register TagPrefix="obshow" Namespace="OboutInc.Show" Assembly="obout_Show_Net" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	void Page_Load(object sender, EventArgs e) {
	
		string sConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/StoredImages.mdb");
		OleDbConnection myConn = new OleDbConnection(sConnectionString);
		myConn.Open();
		
		string query = "SELECT id FROM tbImage";
		OleDbCommand myComm = new OleDbCommand(query, myConn);
		OleDbDataReader oReader = myComm.ExecuteReader();
		
		while (oReader.Read())
		{
			string sImageId = oReader.GetInt32(0).ToString();
            Show1.AddImagePanel("ImageLOader.ashx?imageid=" + sImageId);
		}
		
		myConn.Close();
	}
	
</script>


<html>
	<head>
	<title>obout ASP.NET Show examples</title>
	   
	<!--// Only needed for this page's formatting //-->
		<style type="text/css">
        .tdText {
				    font:11px Verdana;
				    color:#333333;
        }
		.panelTable
		{
			border:1px solid #cccccc;
			padding:7px;
			height:157px;
			border-collapse: separate;
			border-spacing: expression(cellSpacing=0);
			border-spacing: 0px;
			border-padding: expression(cellPadding=0);
			border-padding: 0px;
		}
		.showContainer
		{
			padding:7px;
			width:180px;
			height:180px;
			border:1px solid silver;
		}
		.imageText
		{
			color:#CCCCCC;
			font-weight:bold;
			font-size:15px;
		}
		.small
		{
			font-size:10px;
		}
		.meddium
		{
			font-size:11px;
		}
		.tdText 
        {
            color:#333333;
            font:11px Verdana;
        }
		</style>
	</head>
	<body>
	<form id="Form1" runat="server">
	
		<span class="tdText"><b>ASP.NET Show - Images content from database</b></span>
	
		<br />
		<br /><br />
		<br />
		<div class="showContainer">
			<obshow:Show id="Show1" runat="server" Width="180" Height="180" ShowType="show" TransitionType="QuickScroll" />
		</div>
	     <br /><br /><br />
            		
	    <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">« Back to examples</a>
            	
		</form>
    </body>
</html>
	