<%@ Page Language="C#" Debug="true"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
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
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country=@Country WHERE SupplierID = @SupplierID", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];
                myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = oRecord["SupplierID"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
        if (e.RecordsCollection.Count > 0)
        {
            OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
            myConn.Open();

            foreach (Hashtable oRecord in e.RecordsCollection)
            {
                OleDbCommand myComm = new OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn);

                myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = oRecord["CompanyName"];
                myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = oRecord["Address"];
                myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = oRecord["Country"];

                myComm.ExecuteNonQuery();
            }

            myConn.Close();
        }	
	}
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
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
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>		
	</head>
	<body>	
		<form runat="server">
        <script type="text/javascript">
            window.onload = function () {
                oboutGrid.prototype.showMultiRecordsSaveCancelButtonsOld = oboutGrid.prototype.showMultiRecordsSaveCancelButtons;
                oboutGrid.prototype.showMultiRecordsSaveCancelButtons = function (show) {
                    var newDisplay = show ? '' : 'none';

                    document.getElementById('saveAll').style.display = newDisplay;
                    document.getElementById('cancelAll').style.display = newDisplay;
                }
            }
	
        </script>
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - External Buttons</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			FolderStyle="styles/black_glass" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"			
			AllowMultiRecordAdding="true" AllowMultiRecordEditing="true" AllowMultiRecordDeleting="true">
			
			<Columns>
				<obout:Column DataField="SupplierID" ReadOnly="true" HeaderText="ID" Width="60" Visible="false" runat="server"/>				
				<obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				<obout:Column DataField="Address" HeaderText="COMPANY ADDRESS" Width="200" runat="server" />
				<obout:Column DataField="City" HeaderText="CITY" Width="250" runat="server" />
				<obout:Column DataField="Country" HeaderText="COUNTRY" Width="115" runat="server" />	
				<obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server">
				    <TemplateSettings 
				        TemplateId="editBtnTemplate" EditTemplateId="updateBtnTemplate"
				        ModifyTemporaryEditedRecord_TemplateId="modifyTempEditedRecordBtnTemplate"
				        CancelTemporaryEditedRecord_TemplateId="cancelTempEditedRecordBtnTemplate"
				        ModifyTemporaryAddedRecord_TemplateId="modifyTempAddedRecordBtnTemplate"
				        CancelTemporaryAddedRecord_TemplateId="cancelTempAddedRecordBtnTemplate"
				        RemoveTemporaryAddedRecord_TemplateId="removeTempAddedRecordBtnTemplate"
				        UndeleteTemporaryDeletedRecord_TemplateId="undeleteTempRecordBtnTemplate"				        
				    />	
				</obout:Column>
			</Columns>
			<TemplateSettings NewRecord_TemplateId="addTemplate" NewRecord_EditTemplateId="saveTemplate"
			MultiRecordSaveCancel_TemplateId="multirecord_save_cancel_tpl" />
			<Templates>								
				<obout:GridTemplate runat="server" ID="editBtnTemplate">
                    <Template>
                        <input type="button" class="tdTextSmall" value="Edit" onclick="grid1.edit_record(this)"/>
                        |
                        <input type="button" class="tdTextSmall" value="Delete" onclick="grid1.delete_record(this)"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="updateBtnTemplate">
                    <Template>
                        <input type="button" value="Update" class="tdTextSmall" onclick="grid1.update_record(this)"/> 
                        |
                        <input type="button" value="Cancel" class="tdTextSmall" onclick="grid1.cancel_edit(this)"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="addTemplate">
                    <Template></Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="saveTemplate">
                    <Template></Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="multirecord_save_cancel_tpl">
                    <Template>
                        <input type="button" value="Save All" class="tdTextSmall" onclick="grid1.saveAll()" style="display:none;"/>
                        <input type="button" value="Cancel All" class="tdTextSmall" onclick="grid1.cancelAll()" style="display:none;"/> 
                    </Template>
                </obout:GridTemplate>                
                <obout:GridTemplate runat="server" ID="modifyTempEditedRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Modify" class="tdTextSmall" onclick="grid1.modifyTemporaryRecord(this)"/> 
                        |
                        <input type="button" value="Delete" class="tdTextSmall" onclick="grid1.delete_record(this);"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="cancelTempEditedRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Cancel" class="tdTextSmall" onclick="grid1.cancel_edit(this, true)"/> 
                        |
                        <input type="button" value="Delete" class="tdTextSmall" onclick="grid1.delete_record(this)"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="modifyTempAddedRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Modify" class="tdTextSmall" onclick="grid1.modifyTemporaryRecord(this)"/> 
                        |
                        <input type="button" value="Remove" class="tdTextSmall" onclick="grid1.removeTemporaryRecord(this, 'EDIT')"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="cancelTempAddedRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Cancel" class="tdTextSmall" onclick="grid1.cancel_edit(this, true)"/> 
                        |
                        <input type="button" value="Remove" class="tdTextSmall" onclick="grid1.removeTemporaryRecord(this, 'EDIT')"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="removeTempAddedRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Remove" class="tdTextSmall" onclick="grid1.removeTemporaryRecord(this, 'ADD')"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="undeleteTempRecordBtnTemplate">
                    <Template>
                        <input type="button" value="Undelete" class="tdTextSmall" onclick="grid1.undeleteTemporaryRecord(this)"/>
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>		
		<br/>
		<input id="addNew" type="button" value="Add New" onclick="grid1.addRecord();" class="tdtext"/>
		<input id="saveAll" type="button" value="Save All" onclick="grid1.saveAll();" class="tdtext" style="display:none;"/>
		<input id="cancelAll" type="button" value="Cancel All" onclick="grid1.cancelAll();" class="tdtext" style="display:none;"/>
		

		<br /><br /><br />

		<span class="tdText">
		    Use the <b>TemplateSettings</b> property of the <b>Column</b> class to specify the Templates for the Edit/Modify/Cancel/Delete/Undelete/Remove buttons.
		    <br /><br />
		    Use the <b>NewRecord_TemplateId</b> and <b>MultiRecordSaveCancel_TemplateId</b> properties of the <b>Grid</b> class to specify the Templates for the Add New/Save All/Cancel All buttons.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<style type="text/css">
	.ob_gALFS
	{
		width: 30px;
		text-align: center;
		display: none;
	}

</style>