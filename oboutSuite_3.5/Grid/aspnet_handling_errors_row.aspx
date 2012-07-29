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
        // try to delete the record
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to delete the record.");
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        // try to update the record
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to update the record.");
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        // try to insert the record
        // ...
        // throw an exception if something goes wrong
        throw new Exception("An error occured when trying to insert the record.");
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
			
			.rowEditTable
			{
			    position: relative;
			}
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #4B555E;
			}
		</style>
        <script type"text/javascript">
            var errorData = null;
            function onCallbackError(errorMessage, commandType, recordIndex, data) {
                alert(errorMessage);
                if (commandType != "Delete") {
                    errorData = data;
                    window.setTimeout('restoreGridState("' + commandType + '", ' + recordIndex + ');', 250);
                }

            }

            function restoreGridState(commandType, recordIndex) {
                if (commandType == "Update") {
                    grid1.editRecord(recordIndex);
                } else {
                    grid1.addRecord();
                }

                grid1.populateControls(errorData);
                errorData = null;
            }

            window.onload = function () {
                oboutGrid.prototype.populateControls = function (data) {
                    var focusControl = false;

                    for (var i = 0; i < this.ColumnsCollection.length; i++) {
                        var bControlAutomaticallySelected = false;
                        if (this.ColumnsCollection[i].DataField != "" && !this.ColumnsCollection[i].ReadOnly && this.ColumnsCollection[i].RowEditTemplateControlID && this.ColumnsCollection[i].RowEditTemplateControlPropertyName) {
                            var value = this.replaceBRsWithLineBreaks(data[this.ColumnsCollection[i].DataField]);

                            focusControl = this.setValueOfTemplateControl(this.ColumnsCollection[i].RowEditTemplateControlID, this.ColumnsCollection[i].RowEditTemplateControlPropertyName, value, (!focusControl && this.ColumnsCollection[i].Visible));
                        }
                    }
                }
            }            
		</script>
	</head>
	<body>
		<form runat="server">
					
		<br /><br />
		
		<span class="tdText"><b>ASP.NET Grid - Handling Errors with Row Edit Templates</b></span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			AutoGenerateColumns="false" FolderStyle="" EnableRecordHover="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
            <ClientSideEvents OnClientCallbackError="onCallbackError" />
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
                <obout:Column HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<TemplateSettings RowEditTemplateId="tplRowEdit" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtShipName" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Address:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipAddress" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship City:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Region:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipRegion" Width="150" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Postal Code:</td>
                                                <td>
                                                    <obout:OboutTextBox runat="server" ID="txtShipPostalCode" Width="150" />
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td>Ship Country:</td>
                                                <td>
                                                    <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200" MenuWidth="175"
                                                        DataSourceID="sds1" DataTextField="ShipCountry" DataValueField="ShipCountry" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="150" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtRequiredDate" Width="150" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtShippedDate" Width="150" />
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
                                                    <obout:OboutTextBox runat="server" ID="txtShipVia" Width="150" />
                                                </td>
                                            </tr>				                                            
                                            <tr>
                                                <td>Sent:</td><td><input type="checkbox" id="txtSent" /></td>
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
                                        <textarea class="ob_gEC" id="txtAdditionalInformation" style="margin: 5px;width:285px;height:145px;overflow:auto;background-color: #EFEFEF;"></textarea>
                                    </fieldset>
                                 </td>
                             </tr>
                             <tr>
                                <td colspan="3" align="center">
                                    <input type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                    <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" /> 
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>
			</Templates>
		</obout:Grid>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<span class="tdText">
		    You can use the <b>OnClientCallbackError</b> client-side event to catch the exceptions raised on server-side <br />
		    when trying to add/edit/delete records. This can be used when the Grid contains row edit templates as well.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


