<%@ Page Language="C#"%>
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
			.tdTextLink {
			    font:11px Verdana;
				color:#315686;
				text-decoration:underline;
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
		    function attachFlyoutToLink(oLink) {	
		        try {	        	        
		            <%=Flyout1.getClientID()%>.Close();        
		            <%=Flyout1.getClientID()%>.AttachTo(oLink.id);
		            var sNewHtml = getRecordInfo(oLink);
		            document.getElementById("divFlyoutContent").innerHTML = sNewHtml;
		            <%=Flyout1.getClientID()%>.Open();
                } catch(ex){}
		    }
		    
		    function closeFlyout() {
		        try {
		            <%=Flyout1.getClientID()%>.Close();
		        } catch(ex) {};
		    }
		    
		    function getRecordInfo(oLink) {
		        var oRecord = oLink.parentNode.parentNode.parentNode;
		        
		        // getting row index:
		        var iIndex = 0;
		        var oTempRecord = oRecord.parentNode.firstChild;
		        while(oTempRecord != null && oTempRecord != oRecord) {
		            oTempRecord = oTempRecord.nextSibling;
		            iIndex++;
		        }
		        
		        if(oTempRecord == null) {
		            return;
		        }
		        
		        
		        var sSupplierID = grid1.Rows[iIndex].Cells[0].Value;
		        var sCompanyName = grid1.Rows[iIndex].Cells[1].Value;
		        var sContactName = grid1.Rows[iIndex].Cells[2].Value;
		        var sContactTitle = grid1.Rows[iIndex].Cells[3].Value;
		        var sAddress = grid1.Rows[iIndex].Cells[4].Value;
		        var sCity = grid1.Rows[iIndex].Cells[5].Value;
		        var sRegion = grid1.Rows[iIndex].Cells[6].Value;
		        var sPostalCode = grid1.Rows[iIndex].Cells[7].Value;
		        var sCountry = grid1.Rows[iIndex].Cells[8].Value;
		        var sPhone = grid1.Rows[iIndex].Cells[9].Value;
		        var sFax = grid1.Rows[iIndex].Cells[10].Value;
		        var sHomePage = grid1.Rows[iIndex].Cells[11].Value;
		        
		        if(sHomePage == "true") {
		            sHomePage = "yes";
		        } else {
		            sHomePage = "no";
		        }
		    
		        var sNewHtml = "<table>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>SUPPLIER ID:</b></td><td class='tdText'>" + sSupplierID + "</td></tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>COMPANY NAME:</b></td><td class='tdText'>" + sCompanyName + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CONTACT NAME:</b></td><td class='tdText'>" + sContactName + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CONTACT TITLE:</b></td><td class='tdText'>" + sContactTitle + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>ADDRESS:</b></td><td class='tdText'>" + sAddress + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>CITY:</b></td><td class='tdText'>" + sCity + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>REGION:</b></td><td class='tdText'>" + sRegion + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>POSTAL CODE:</b></td><td class='tdText'>" + sPostalCode + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>COUNTRY:</b></td><td class='tdText'>" + sCountry + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>PHONE:</b></td><td class='tdText'>" + sPhone + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>FAX:</b></td><td class='tdText'>" + sFax + "</tr>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>HAS WEBSITE:</b></td><td class='tdText'>" + sHomePage + "</tr>";
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    }
        </script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Flyout inside the Grid</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false" AllowAddingRecords="false" AllowRecordSelection="false" AllowMultiRecordSelection="false"
			>
			<Columns>
				<obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="350" runat="server">					<TemplateSettings  TemplateId="TemplateCompanyName" />
				</obout:Column>	
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Visible="false" Width="175" runat="server" />
                <obout:Column DataField="ContactTitle" HeaderText="CONTACT TITLE" Visible="false" Width="175" runat="server" />
				<obout:Column DataField="Address" HeaderText="ADDRESS" Width="175" runat="server" />
				<obout:Column DataField="City" HeaderText="CITY" Visible="false" Width="175" runat="server" />
				<obout:Column DataField="Region" HeaderText="REGION" Visible="false" Width="175" runat="server" />
				<obout:Column DataField="PostalCode" HeaderText="POSTAL CODE" Visible="false" Width="175" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />
				<obout:Column DataField="Phone" HeaderText="PHONE" Visible="false" Width="115" runat="server" />
				<obout:Column DataField="Fax" HeaderText="FAX" Visible="false" Width="115" runat="server" />
				<obout:Column DataField="HomePage" HeaderText="HOME PAGE" Visible="false" Width="115" runat="server" />

			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateCompanyName">
					<Template><%# Container.Value %>
						<%# Int32.Parse(Container.DataItem["SupplierID"].ToString()) % 5 == 3? "<img src=\"resources/images/question.gif\" alt=\"\"  onmouseover=\"attachFlyoutToLink(this)\" onmouseout=\"closeFlyout()\" id=\"grid_link_"  + Container.DataItem["SupplierID"] + "\"/>" : ""%>
					</Template>
				</obout:GridTemplate>
			</Templates>				
		</obout:Grid>
		
		<obout:Flyout runat="server" ID="Flyout1" Align="LEFT" Position="BOTTOM_RIGHT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <div id="divFlyoutContent" style="width: 250px; height: 250px; background-color: #EEEEEE; border: 1px solid #000000;" class="tdText"> 
		        test               
            </div>
        </obout:Flyout>

		<br /><br /><br />
		
		<span class="tdText">
		    Using Templates you can use also the Flyout control inside the Grid.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>