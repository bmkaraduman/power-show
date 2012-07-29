<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void EmptyCommand(object sender, GridRecordEventArgs e)
    {
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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>
		<script type="text/javascript">
		    function onEmptyCommand(record) {
		        alert('The operation was successful. For this example, the database has not been updated.');
		    }
		</script>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Using Templates for Action Buttons inside Detail Grids</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" PageSize="5"
		    DataSourceID="sds1" FolderStyle="styles/grand_gray" AllowAddingRecords="true"
		    OnInsertCommand="EmptyCommand" OnUpdateCommand="EmptyCommand" OnDeleteCommand="EmptyCommand">
		    <ClientSideEvents OnClientInsert="onEmptyCommand" OnClientUpdate="onEmptyCommand" OnClientDelete="onEmptyCommand" />
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true">
                    <TemplateSettings TemplateId="editBtnTemplate1" EditTemplateId="updateBtnTemplate1" />
                </obout:Column>
            </Columns>
            <TemplateSettings NewRecord_TemplateId="addTemplate1" NewRecord_EditTemplateId="saveTemplate1" />
            <Templates>								
		        <obout:GridTemplate runat="server" ID="editBtnTemplate1">
                    <Template>
                        <input type="button" id="btnEdit" class="tdTextSmall" value="Edit" onclick="grid1.edit_record(this)"/>
                        |
                        <input type="button" id="btnDelete" class="tdTextSmall" value="Delete" onclick="grid1.delete_record(this)"/>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="updateBtnTemplate1">
                    <Template>
                        <input type="button" id="btnUpdate" value="Update" class="tdTextSmall" onclick="grid1.update_record(this)"/> 
                        |
                        <input type="button" id="btnCancel" value="Cancel" class="tdTextSmall" onclick="grid1.cancel_edit(this)"/> 
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="addTemplate1">
                    <Template>
                        <input type="button" id="btnAddNew" class="tdTextSmall" value="Add New" onclick="grid1.addRecord()"/>
                    </Template>
                </obout:GridTemplate>
                 <obout:GridTemplate runat="server" ID="saveTemplate1">
                    <Template>
                        <input type="button" id="btnSave" value="Save" class="tdTextSmall" onclick="grid1.insertRecord()"/> 
                        |
                        <input type="button" id="btnCancel" value="Cancel" class="tdTextSmall" onclick="grid1.cancelNewRecord()"/> 
                    </Template>
                </obout:GridTemplate>				
	        </Templates>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="true" ShowFooter="true" PageSize="5"
                 DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="CustomerID"
                 OnInsertCommand="EmptyCommand" OnUpdateCommand="EmptyCommand" OnDeleteCommand="EmptyCommand">
                    <ClientSideEvents OnClientInsert="onEmptyCommand" OnClientUpdate="onEmptyCommand" OnClientDelete="onEmptyCommand" />
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="225">
                        </obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}">                            
                        </obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                        <obout:Column DataField="" HeaderText="" AllowEdit="true" AllowDelete="true" Width="170">
                            <TemplateSettings TemplateId="editBtnTemplate2" EditTemplateId="updateBtnTemplate2" />
                        </obout:Column>
                    </Columns>
                    <TemplateSettings NewRecord_TemplateId="addTemplate2" NewRecord_EditTemplateId="saveTemplate2" />
                    <Templates>								
				        <obout:GridTemplate runat="server" ID="editBtnTemplate2">
                            <Template>
                                <input type="button" id="btnEdit" class="tdTextSmall" value="Edit" onclick="<%# Container.GridClientID %>.edit_record(this)"/>
                                |
                                <input type="button" id="btnDelete" class="tdTextSmall" value="Delete" onclick="<%# Container.GridClientID %>.delete_record(this)"/>
                            </Template>
                        </obout:GridTemplate>
                        <obout:GridTemplate runat="server" ID="updateBtnTemplate2">
                            <Template>
                                <input type="button" id="btnUpdate" value="Update" class="tdTextSmall" onclick="<%# Container.GridClientID %>.update_record(this)"/> 
                                |
                                <input type="button" id="btnCancel" value="Cancel" class="tdTextSmall" onclick="<%# Container.GridClientID %>.cancel_edit(this)"/> 
                            </Template>
                        </obout:GridTemplate>
                        <obout:GridTemplate runat="server" ID="addTemplate2">
                            <Template>
                                <input type="button" id="btnAddNew" class="tdTextSmall" value="Add New" onclick="<%# Container.GridClientID %>.addRecord()"/>
                            </Template>
                        </obout:GridTemplate>
                         <obout:GridTemplate runat="server" ID="saveTemplate2">
                            <Template>
                                <input type="button" id="btnSave" value="Save" class="tdTextSmall" onclick="<%# Container.GridClientID %>.insertRecord()"/> 
                                |
                                <input type="button" id="btnCancel" value="Cancel" class="tdTextSmall" onclick="<%# Container.GridClientID %>.cancelNewRecord()"/> 
                            </Template>
                        </obout:GridTemplate>				
			        </Templates>
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<span class="tdText">
		    The DetailGrids can use all the features that are available for regular grids (e.g. adding, editing, deleting, sorting, paging, etc.)
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" ProviderName="System.Data.OleDb"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
		    SelectCommand="SELECT TOP 15 * FROM [Customers]">		    
		 </asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>