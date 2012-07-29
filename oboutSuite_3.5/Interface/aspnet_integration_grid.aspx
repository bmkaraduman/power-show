<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
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

        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("gridCal1") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar requiredDateCalendar = grid1.Templates[0].Container.FindControl("gridCal2") as OboutInc.Calendar2.Calendar;
        OboutInc.Calendar2.Calendar shippedDateCalendar = grid1.Templates[0].Container.FindControl("gridCal3") as OboutInc.Calendar2.Calendar;

        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        OboutTextBox txtRequiredDate = grid1.Templates[0].Container.FindControl("txtRequiredDate") as OboutTextBox;
        OboutTextBox txtShippedDate = grid1.Templates[0].Container.FindControl("txtShippedDate") as OboutTextBox;

        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
        requiredDateCalendar.TextBoxId = txtRequiredDate.ClientID;
        shippedDateCalendar.TextBoxId = txtShippedDate.ClientID;
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent = @Sent, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, AdditionalInformation=@AdditionalInformation WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDateFormatted"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDateFormatted"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record["AdditionalInformation"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia, AdditionalInformation) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @AdditionalInformation)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDateFormatted"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDateFormatted"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];
        myComm.Parameters.Add("@AdditionalInformation", OleDbType.VarChar).Value = e.Record["AdditionalInformation"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	void RebindGrid(object sender, EventArgs e)
	{
		CreateGrid();
	}			
	</script>		


<html>
	<head runat="server">
		<title>obout Interface examples</title>
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
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #4B555E;
			}
			
			.ob_gFBSp
            {
                visibility: hidden;
            }
		</style>
		<script type="text/javascript">
		    function blurButton(btnId) {
		        var btn = eval(btnId);
		        btn.blur();
		    }

		    function editRecord(btn) {
		        blurButton(btn.id);

		        grid1.edit_record(btn);

		        return false;
		    }

		    function updateRecord(btn, btnObj) {
		        blurButton(btnObj);

		        grid1.update_record(btn);

		        return false;
		    }

		    function cancelEdit(btn, btnObj) {
		        blurButton(btnObj);

		        grid1.cancel_edit(btn);

		        return false;
		    }

		    function deleteRecord(btn) {
		        blurButton(btn.id);

		        grid1.delete_record(btn);

		        return false;
		    }

		    function saveChanges(btnObj) {
		        blurButton(btnObj);

		        grid1.save();

		        return false;
		    }

		    function cancelChanges(btnObj) {
		        blurButton(btnObj);

		        grid1.cancel();

		        return false;
		    }

		    function addNew(btnObj) {
		        blurButton(btnObj);

		        grid1.addRecord();

		        return false;
		    }

		    function saveNew(btnObj) {
		        blurButton(btnObj);

		        grid1.insertRecord();

		        return false;
		    }

		    function cancelNew(btnObj) {
		        blurButton(btnObj);

		        grid1.cancelNewRecord();

		        return false;
		    }

		    function showFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.showFilter();

		        return false;
		    }

		    function applyFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.filter();

		        return false;
		    }

		    function hideFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.hideFilter();

		        return false;
		    }

		    function removeFilter(btnObj) {
		        blurButton(btnObj);

		        grid1.removeFilter();

		        return false;
		    }
		</script>
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		
		<span class="tdText"><b>obout Interface - Inside Grid Templates</b></span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" EnableRecordHover="true" AllowFiltering="true"
			FolderStyle="../Grid/styles/premiere_blue"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server">
				    <TemplateSettings RowEditTemplateControlId="txtOrderID" RowEditTemplateControlPropertyName="innerHTML"/>
				</obout:Column>
                <obout:Column DataField="ShipName" Width="200" HeaderText="NAME" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCity" Width="150" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipCountry" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="ddlCountries" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column DataField="OrderDateFormatted" Width="175" HeaderText="ORDER DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtOrderDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="RequiredDateFormatted" Visible="false"  Width="200" HeaderText="REQUIRED DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtRequiredDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShippedDateFormatted" Visible="false" Width="200" HeaderText="SHIPPED DATE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShippedDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtShipVia" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column1" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtSent" RowEditTemplateControlPropertyName="checked" RowEditTemplateUseQuotes="false" />
                </obout:Column>
                <obout:Column DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="txtAdditionalInformation" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server">
                    <TemplateSettings TemplateId="ButtonsTemplate" EditTemplateId="ButtonsEditTemplate" />
                </obout:Column>
			</Columns>
			<TemplateSettings RowEditTemplateId="tplRowEdit" NewRecord_TemplateId="addTemplate" NewRecord_EditTemplateId="saveTemplate"
			    FilterShowButton_TemplateId="tplShowFilter" FilterApplyButton_TemplateId="tplApplyFilter"
                FilterHideButton_TemplateId="tplHideFilter" FilterRemoveButton_TemplateId="tplRemoveFilter" />
			<Templates> 			    
			    <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <table class="rowEditTable">
                            <tr>
                                <td valign="top">
                                    <fieldset style="width: 275px; height: 175px;">
                                        <legend>Ship Information</legend>
                                        <table>					                                            
                                            <tr>
                                                <td>Ship Name:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipName" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Address:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipAddress" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship City:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Region:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipRegion" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Postal Code:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipPostalCode" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Country:</td>
                                                <td>
                                                    <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200" MenuWidth="175"
                                                        DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry"
                                                        FolderStyle="styles/premiere_blue/OboutDropDownList" />
                                                </td>
                                            </tr>					                                            
                                            <tr>
                                                <td colspan="2">
                                                    <br />
			                                        
                                                </td>
                                            </tr>
                                        </table>
                                     </fieldset>
                                 </td>
                                 <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td>Order ID:</td><td><span id="txtOrderID" style="width: 150px;"></span></td>
                                            </tr>					                                            					                                            
                                            <tr>
                                                <td>Order Date:</td>
                                                <td valign="middle">
                                                    <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal1" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Required Date:</td>
                                                <td valign="middle">
                                                    <obout:OboutTextBox runat="server" ID="txtRequiredDate" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal2" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>	
                                            <tr>
                                                <td>Shipped Date:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShippedDate" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                                <td valign="middle">
                                                    <obout:Calendar ID="gridCal3" runat="server" 
				                                        StyleFolder="../Calendar/styles/expedia" 
				                                        DatePickerMode="true"
				                                        DatePickerImagePath ="../Calendar/styles/icon2.gif"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Via:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipVia" Width="150" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                                </td>
                                            </tr>				                                            
                                            <tr>
                                                <td>Sent:</td><td><obout:OboutCheckBox runat="server" ID="txtSent" FolderStyle="styles/premiere_blue/OboutCheckBox" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />			                                        
                                                </td>
                                            </tr>
                                        </table>
                                     </fieldset>
                                 </td>
                                 <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Additional Information</legend>
                                        <div style="padding: 10px;">
                                            <obout:OboutTextBox runat="server" ID="txtAdditionalInformation" Height="140" Width="285" 
                                                TextMode="MultiLine" FolderStyle="styles/premiere_blue/OboutTextBox" />
                                        </div>
                                    </fieldset>
                                 </td>
                             </tr>
                             <tr>
                                <td colspan="3" align="center">
                                    <obout:OboutButton ID="BtnSaveChanges" runat="server" Text="Save" OnClientClick="return saveChanges('BtnSaveChanges');" FolderStyle="styles/premiere_blue/OboutButton" /> &#160;
                                    <obout:OboutButton ID="BtnCancelChanges" runat="server" Text="Cancel" OnClientClick="return cancelChanges('BtnCancelChanges');" FolderStyle="styles/premiere_blue/OboutButton" />
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>
                
                <obout:GridTemplate runat="server" ID="ButtonsTemplate">
                    <Template>
                        <obout:OboutButton runat="server" Text="Edit" Width="70" OnClientClick="return editRecord(this);" FolderStyle="styles/premiere_blue/OboutButton" /> &#160;
                        <obout:OboutButton runat="server" Text="Delete" Width="70" OnClientClick="return deleteRecord(this);" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="ButtonsEditTemplate">
                    <Template>
                        <obout:OboutButton ID="BtnUpdate" runat="server" Text="Update" Width="70" OnClientClick="return updateRecord(this, 'BtnUpdate');" FolderStyle="styles/premiere_blue/OboutButton" /> &#160;
                        <obout:OboutButton ID="BtnCancel" runat="server" Text="Cancel" Width="70" OnClientClick="return cancelEdit(this, 'BtnCancel');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                
                <obout:GridTemplate runat="server" ID="addTemplate">
                    <Template>
                        <obout:OboutButton ID="BtnAddNew" runat="server" Text="Add New" OnClientClick="return addNew('BtnAddNew');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                 <obout:GridTemplate runat="server" ID="saveTemplate">
                    <Template>
                        <obout:OboutButton ID="BtnSaveNew" runat="server" Text="Save" OnClientClick="return saveNew('BtnSaveNew');" FolderStyle="styles/premiere_blue/OboutButton" /> &#160;
                        <obout:OboutButton ID="BtnCancelNew" runat="server" Text="Cancel" OnClientClick="return cancelNew('BtnCancelNew');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                                
                <obout:GridTemplate runat="server" ID="tplShowFilter">
                    <Template>
                        <obout:OboutButton ID="BtnShowFilter" runat="server" Text="Show Filter" OnClientClick="return showFilter('BtnShowFilter');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplApplyFilter">
                    <Template>
                        <obout:OboutButton ID="BtnApplyFilter" runat="server" Text="Apply Filter" OnClientClick="return applyFilter('BtnApplyFilter');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplHideFilter">
                    <Template>
                        <obout:OboutButton ID="BtnHideFilter" runat="server" Text="Hide Filter" OnClientClick="return hideFilter('BtnHideFilter');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplRemoveFilter">
                    <Template>
                        <obout:OboutButton ID="BtnRemoveFilter" runat="server" Text="Remove Filter" OnClientClick="return removeFilter('BtnRemoveFilter');" FolderStyle="styles/premiere_blue/OboutButton" />
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the OboutDropDownList and OboutTextBox controls inside Grid templates to modify data.<br />
		    The OboutButton control can be used to replace the standard hyperlinks (used for performing various actions).
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


