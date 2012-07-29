<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Dialog Grid show information</title>
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
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">« Back to examples</a>
	        <br /><br /><br /><br />
    <form runat="server" id="form1">
        <script type="text/javascript">
            function displayMoreInfo(oLink)
            {
		        try 
		        {	        	                
		            var sNewHtml = getRecordInfo(oLink);
		            document.getElementById("divFlyoutContent").innerHTML = sNewHtml;
                    myDialog.Open();    
                } 
                catch(ex){}               
            }
		    function getRecordInfo(oLink) {
		        var oRecord = oLink.parentNode.parentNode.parentNode.parentNode;
		        
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
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>SUPPLIER ID:</b></td><td align='left' class='tdText'>" + sSupplierID + "</td></tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>COMPANY NAME:</b></td><td align='left' class='tdText'>" + sCompanyName + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>CONTACT NAME:</b></td><td align='left' class='tdText'>" + sContactName + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>CONTACT TITLE:</b></td><td align='left' class='tdText'>" + sContactTitle + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>ADDRESS:</b></td><td align='left' class='tdText'>" + sAddress + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>CITY:</b></td><td align='left' class='tdText'>" + sCity + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>REGION:</b></td><td align='left' class='tdText'>" + sRegion + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>POSTAL CODE:</b></td><td align='left' class='tdText'>" + sPostalCode + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>COUNTRY:</b></td><td align='left' class='tdText'>" + sCountry + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>PHONE:</b></td><td align='left' class='tdText'>" + sPhone + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>FAX:</b></td><td align='left' class='tdText'>" + sFax + "</tr>";
		        sNewHtml += "<tr><td align='left' class='tdText' nowrap><b>HAS WEBSITE:</b></td><td align='left' class='tdText'>" + sHomePage + "</tr>";
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    }        
        
        </script>
        
        
        
        
        <br />
        
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="../Grid/styles/style_7" AutoGenerateColumns="false" AllowAddingRecords="false" AllowRecordSelection="false" AllowMultiRecordSelection="false"
			>
			<Columns>
				<obout:Column ID="Column1" DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="ID" Width="60" runat="server"/>				
				<obout:Column ID="Column2" DataField="CompanyName" HeaderText="COMPANY NAME" Width="350" runat="server"/>				
                <obout:Column ID="Column3" DataField="ContactName" HeaderText="CONTACT NAME" Visible="false" Width="175" runat="server" />
                <obout:Column ID="Column4" DataField="ContactTitle" HeaderText="CONTACT TITLE" Visible="false" Width="175" runat="server" />
				<obout:Column ID="Column5" DataField="Address" HeaderText="ADDRESS" Width="175" runat="server" />
				<obout:Column ID="Column6" DataField="City" HeaderText="CITY" Visible="false" Width="175" runat="server" />
				<obout:Column ID="Column7" DataField="Region" HeaderText="REGION" Visible="false" Width="175" runat="server" />
				<obout:Column ID="Column8" DataField="PostalCode" HeaderText="POSTAL CODE" Visible="false" Width="175" runat="server" />
				<obout:Column ID="Column9" DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />
				<obout:Column ID="Column10" DataField="Phone" HeaderText="PHONE" Visible="false" Width="115" runat="server" />
				<obout:Column ID="Column11" DataField="Fax" HeaderText="FAX" Visible="false" Width="115" runat="server" />
				<obout:Column ID="Column12" DataField="HomePage" HeaderText="HOME PAGE" Visible="false" Width="115" runat="server" />
				<obout:Column ID="Column13" HeaderText="INFO" Width="115" runat="server">
				    <TemplateSettings TemplateId="TemplateCompanyName" />
				</obout:Column>
			</Columns>
			<Templates>
				<obout:GridTemplate runat="server" ID="TemplateCompanyName">
					<Template>					    
						<a href="javascript: //" id="grid_link_<%# Container.DataItem["SupplierID"] %>" onclick="displayMoreInfo(this)">More info...</a>
					</Template>
				</obout:GridTemplate>
			</Templates>				
		</obout:Grid>
		        
        <!--Create Hello World Dialog -->
        <owd:Dialog ID="myDialog" runat="server" IsModal="true" Height="350" StyleFolder="wdstyles/default" Title="More info" Width="300" zIndex="10">
           <center>
                <br />
                <div id="divFlyoutContent" style="height:250px; overflow:hidden;">              
                </div>
                <br />

                <input type="Button" value="OK" onclick="myDialog.Close()" style="width:60px;" />
            </center>
        </owd:Dialog>
        
        
        
</form>        
</body>
</html>
