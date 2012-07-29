<%@ Page Language="C#" ASPCOMPAT="TRUE" Debug="true" Inherits="OboutInc.oboutAJAXPage"%>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

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
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record["SupplierID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
		
	}

	public string GetInfo(string SupplierID){
		string sNewHtml = "";
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers WHERE SupplierID = " + SupplierID  , myConn);
		myConn.Open();		
		OleDbDataReader oReader = myComm.ExecuteReader();

		while (oReader.Read())
		{
			sNewHtml += "<li>" + getShortString(oReader.GetValue(0).ToString() ) + "</li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(1).ToString() != System.String.Empty ? getShortString(oReader.GetValue(1).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(2).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(2).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(3).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(3).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(4).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(4).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(5).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(5).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(6).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(6).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(7).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(7).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(8).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(8).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(9).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(9).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(10).ToString() != System.String.Empty  ? getShortString(oReader.GetValue(10).ToString() ): "&#160;") + "</div></li>";
			sNewHtml += "<li><div class='resizableDiv'>" + ( oReader.GetValue(11).ToString() != System.String.Empty  ?  ( oReader.GetValue(11).ToString() == "true"? "yes" : "no") : "&#160;") + "</div></li>";
			
		}



		myConn.Close();	

		return sNewHtml;
	}
	
	private string getShortString(string sIn){
		string sOut = sIn;

		if ( sOut.Length > 22 )
		{
			sOut = sOut.Substring(0, 21);	
		}
		return sOut;
	}

	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}
	</script>


<html>
<head runat="server">
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
	</style>
</head>
<body>
<link href="resources/custom-styles/global-nav-treatment1v12r.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	.tdTextLink {
		font:11px Verdana;
		color:#315686;
		text-decoration:underline;
	}

</style>

<script type="text/javascript">
		   function getRecordInfo(oLink)
			{
				ob_post.AddParam("SupplierID", oLink.id.toString().replace('grid_link_',''));
				ob_post.post(null, "GetInfo", updateClient ) ;
			}

			function updateClient(infoHTMLData){
				document.getElementById("divDetailsInfo").innerHTML = infoHTMLData;
			}


		    function attachFlyoutToLink(oLink) {
				try{
					<%=Flyout1.getClientID()%>.Close();		        
					<%=Flyout1.getClientID()%>.AttachTo(oLink.id);

					getRecordInfo(oLink);
		        
					<%=Flyout1.getClientID()%>.Open();
				 }catch(ex){}
		    }
		    
		    function closeFlyout() {
		        <%=Flyout1.getClientID()%>.Close();	
		    }
        </script>
<br />
<form runat="server">			

		<span class="tdText"><b>ASP.NET Grid - Loading the details with Flyout and AJAX Page</b></span><br />
		<br />		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false" AllowAddingRecords="false" AllowRecordSelection="false" AllowMultiRecordSelection="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />
				<obout:Column HeaderText="INFO" Width="115" runat="server">
					<TemplateSettings  TemplateId="TemplateCompanyName"/> 
				</obout:Column>

			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateCompanyName">
					<Template>					    
						<span class="tdTextLink" id="grid_link_<%# Container.DataItem["SupplierID"] %>" onMouseOver="attachFlyoutToLink(this)" onMouseOut="closeFlyout()">More info...</span>
					</Template>
				</obout:GridTemplate>
			</Templates>				
		</obout:Grid>
		
		<obout:Flyout runat="server" OpenTime="50" ID="Flyout1" Position="BOTTOM_LEFT" Align="LEFT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
				<div id="dd_N10003" class="dd" >
					<div class="dd2cSquare_Top"></div>
					 <div class="container">
						<div class="dd2cSquare_C1">
						<ul class="menu" id="divDetailsLabels">
						<li>SUPPLIER ID:</li>
						<li>COMPANY NAME:</li>
						<li>CONTACT NAME:</li>
						<li>CONTACT TITLE:</li>
						<li>ADDRESS:</li>
						<li>CITY:</li>
						<li>REGION:</li>
						<li>POSTAL CODE:</li>
						<li>COUNTRY:</li>
						<li>PHONE:</li>
						<li>FAX:</li>
						<li>HAS WEBSITE:</li>
						</ul>
						</div>
						<div class="dd2cSquare_C2">
						<ul class="menu" id="divDetailsInfo">                    
						</ul>
						</div>
					</div>
					<div class="footer-wrapper">
					  <div class="dd2cSquare_Base"></div>
					</div>
				</div>
        </obout:Flyout>

		<br />
<br />
<span id="notesContainer">You can use the Grid and Flyout controls together to display more information about a record.<br>
Go with the mouse over "<span style="font-weight: bold">More info...</span>" to see all the available details.</span>
<br /><br />
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
</form>
</body>
</html>

<style type="text/css">
    .resizableDiv
    {
		
    }
</style>