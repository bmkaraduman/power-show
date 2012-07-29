<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
            var gridInAddEditMode = false;

            window.onload = function () {
                oboutGrid.prototype.initiateCallbackOld = oboutGrid.prototype.initiateCallback;
                oboutGrid.prototype.initiateCallback = function (param1, param2, param3, param4) {
                    if (gridInAddEditMode) {
                        if (!confirm('There are unsaved changes in the grid. Are you sure you don\'t want to save your changes before continuing?')) {
                            return;
                        }
                    }

                    this.initiateCallbackOld(param1, param2, param3, param4);
                }
            }

            function grid1_AddEdit(sender, args) {
                gridInAddEditMode = true;
            }

            function grid1_CancelAddEdit(sender, args) {
                gridInAddEditMode = false;
            }

            function grid1_BeforeInsertUpdate(sender, args) {
                gridInAddEditMode = false;
            }
        </script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Detect Unsaved Changes</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" DataSourceID="SqlDataSource1">
            <ClientSideEvents ExposeSender="true"
                OnClientAdd="grid1_AddEdit" OnClientEdit="grid1_AddEdit"
                OnBeforeClientInsert="grid1_BeforeInsertUpdate" OnBeforeClientUpdate="grid1_BeforeInsertUpdate"
                OnClientCancelAdd="grid1_CancelAddEdit" OnClientCancelEdit="grid1_CancelAddEdit"/>
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="125" runat="server" />
				<obout:Column DataField="ShipRegion" HeaderText="REGION" Width="125" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="125" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="125" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>
		
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 50 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
            InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
            <InsertParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />                
            </DeleteParameters>
        </asp:SqlDataSource>
					
		<br /><br />
		
		<span class="tdText">
		    Using the client-side events of the Grid you can detect if the end user tries to perform an action on the Grid that will result in losing the pending changes.<br /><br />

            In this sample, try to add / edit a record, without pressing the "Save" / "Update" links, and then try to sort by a column or change the page. <br />
            You'll get a pop-up confirmation message asking whether you are sure you want to perform the action without saving the changes first.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>