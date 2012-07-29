<%@ Page Title="" Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>

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
			.super-form {
                margin: 12px;
            }
        
            .ob_fC table td {
                white-space: normal !important;
            }
        
            .command-row .ob_fRwF {
                padding-left: 50px !important;
            }
		</style>	
		<script type="text/javascript">
		    function Grid1_ClientEdit(sender, record) {

		        Window1.Open();

		        document.getElementById('OrderID').value = record.OrderID;
		        SuperForm1_ShipName.value(record.ShipName);
		        SuperForm1_ShipAddress.value(record.ShipAddress);
		        SuperForm1_ShipCity.value(record.ShipCity);
		        SuperForm1_ShipRegion.value(record.ShipRegion);
		        SuperForm1_ShipPostalCode.value(record.ShipPostalCode);
		        SuperForm1_ShipCountry.value(record.ShipCountry);
		        SuperForm1_OrderDate.value(record.OrderDate);
		        SuperForm1_RequiredDate.value(record.RequiredDate);
		        SuperForm1_ShippedDate.value(record.ShippedDate);
		        SuperForm1_ShipVia.value(record.ShipVia);
		        SuperForm1_Sent.checked(record.Sent.toLowerCase() == 'true' ? true : false);

		        return false;
		    }

		    function Grid1_ClientAdd(sender, record) {

		        Window1.Open();

		        document.getElementById('OrderID').value = 0;
		        SuperForm1_ShipName.value('');
		        SuperForm1_ShipAddress.value('');
		        SuperForm1_ShipCity.value('');
		        SuperForm1_ShipRegion.value('');
		        SuperForm1_ShipPostalCode.value('');
		        SuperForm1_ShipCountry.value('');
		        SuperForm1_OrderDate.value('');
		        SuperForm1_RequiredDate.value('');
		        SuperForm1_ShippedDate.value('');
		        SuperForm1_ShipVia.value('');
		        SuperForm1_Sent.checked(false);

		        return false;
		    }

		    function saveChanges() {
		        Window1.Close();

		        var orderId = document.getElementById('OrderID').value;

		        var data = new Object();

		        data.ShipName = SuperForm1_ShipName.value();
		        data.ShipAddress = SuperForm1_ShipAddress.value();
		        data.ShipCity = SuperForm1_ShipCity.value();
		        data.ShipRegion = SuperForm1_ShipRegion.value();
		        data.ShipPostalCode = SuperForm1_ShipPostalCode.value();
		        data.ShipCountry = SuperForm1_ShipCountry.value();
		        data.OrderDate = SuperForm1_OrderDate.value();
		        data.RequiredDate = SuperForm1_RequiredDate.value();
		        data.ShippedDate = SuperForm1_ShippedDate.value();
		        data.ShipVia = SuperForm1_ShipVia.value();
		        data.Sent = SuperForm1_Sent.checked();

		        if (orderId != 0) {
		            data.OrderID = orderId;

		            Grid1.executeUpdate(data);
		        } else {
		            Grid1.executeInsert(data);
		        }
		    }

		    function cancelChanges() {
		        Window1.Close();
		    }
    </script>	
	</head>
	<body>	
		<form id="Form1" runat="server">
					   
            <span class="tdText"><b>ASP.NET Grid - Using Super Form in Window</b></span>
            
            <br /><br />

            <span id="WindowPositionHelper"></span>

            <obout:Grid runat="server" ID="Grid1" Serialize="false" AutoGenerateColumns="false" DataSourceID="SqlDataSource1">
                <Columns>
			        <obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server" />
                    <obout:Column ID="Column2" DataField="ShipName" Width="200" HeaderText="NAME" runat="server" />
                    <obout:Column ID="Column3" DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" runat="server" />
                    <obout:Column ID="Column4" DataField="ShipCity" Width="150" HeaderText="CITY" runat="server" />
                    <obout:Column ID="Column5" DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION" runat="server" />
                    <obout:Column ID="Column6" DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server" />
                    <obout:Column ID="Column7" DataField="ShipCountry" Visible="true" Width="125" Wrap="false" HeaderText="COUNTRY" runat="server" />
                    <obout:Column ID="Column8" DataField="OrderDate" Width="125" HeaderText="ORDER DATE" 
                        DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server" />
                    <obout:Column ID="Column9" DataField="RequiredDate" Visible="false"  Width="200" HeaderText="REQUIRED DATE" 
                        DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server" />
                    <obout:Column ID="Column10" DataField="ShippedDate" Visible="false" Width="200" HeaderText="SHIPPED DATE" 
                        DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server" />
                    <obout:Column ID="Column11" DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server" />
                    <obout:Column ID="Column12" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server" />
                    <obout:Column ID="Column14" HeaderText="EDIT" Width="150" AllowEdit="true" AllowDelete="true" runat="server" />
		        </Columns>		
		        <ClientSideEvents OnBeforeClientEdit="Grid1_ClientEdit" OnBeforeClientAdd="Grid1_ClientAdd" ExposeSender="true" />
            </obout:Grid>

            <owd:Window ID="Window1" runat="server" IsModal="true" ShowCloseButton="true" Status=""
                RelativeElementID="WindowPositionHelper" Top="-25" Left="100" Height="370" Width="551" VisibleOnLoad="false" StyleFolder="../window/wdstyles/blue"
                Title="Add / Edit Record">
                    <input type="hidden" id="OrderID" />

                    <div class="super-form">
                        <obout:SuperForm ID="SuperForm1" runat="server"
                            AutoGenerateRows="false"
                            AutoGenerateInsertButton ="false"
                            AutoGenerateEditButton="false"
                            AutoGenerateDeleteButton="false"                        
                            DataKeyNames="OrderID" DefaultMode="Insert" Width="525">
                            <Fields>
                                <obout:BoundField DataField="ShipName" HeaderText="Ship Name" FieldSetID="FieldSet1" />
                                <obout:BoundField DataField="ShipAddress" HeaderText="Ship Address" FieldSetID="FieldSet1" />
                                <obout:BoundField DataField="ShipCity" HeaderText="Ship City" FieldSetID="FieldSet1" />
                                <obout:BoundField DataField="ShipRegion" HeaderText="Ship Region" FieldSetID="FieldSet1" />
                                <obout:BoundField DataField="ShipPostalCode" HeaderText="Zip Code" FieldSetID="FieldSet1" />
                                <obout:DropDownListField DataField="ShipCountry" HeaderText="Ship Country" FieldSetID="FieldSet1" DataSourceID="SqlDataSource3" />

                                <obout:DateField DataField="OrderDate" HeaderText="Order Date" FieldSetID="FieldSet2" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
                                <obout:DateField DataField="RequiredDate" HeaderText="Required Date" FieldSetID="FieldSet2" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
                                <obout:DateField DataField="ShippedDate" HeaderText="Shipped Date" FieldSetID="FieldSet2" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
                                <obout:BoundField DataField="ShipVia" HeaderText="Ship Via" FieldSetID="FieldSet2" />
                                <obout:CheckBoxField DataField="Sent" HeaderText="Sent" FieldSetID="FieldSet2" />

                                <obout:TemplateField FieldSetID="FieldSet4">
                                    <EditItemTemplate>
                                        <obout:OboutButton ID="OboutButton1" runat="server" Text="Save" OnClientClick="saveChanges(); return false;" Width="75" />
                                        <obout:OboutButton ID="OboutButton2" runat="server" Text="Cancel" OnClientClick="cancelChanges(); return false;" Width="75" />
                                    </EditItemTemplate>
                                </obout:TemplateField>
                            </Fields>
                            <FieldSets>
                                <obout:FieldSetRow>
                                    <obout:FieldSet ID="FieldSet1" Title="Ship Information" />
                                    <obout:FieldSet ID="FieldSet2" Title="Order Information" />
                                </obout:FieldSetRow>
                                <obout:FieldSetRow>
                                    <obout:FieldSet ID="FieldSet4" ColumnSpan="2" CssClass="command-row" />
                                </obout:FieldSetRow>
                            </FieldSets>
                        </obout:SuperForm>
                    </div>
            </owd:Window>
           

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT TOP 25 * FROM [Orders] ORDER BY OrderID DESC"
                UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode,
                               ShipCountry=@ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent=@Sent
                               WHERE OrderID=@OrderID"
                InsertCommand="INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, 
                                    OrderDate, RequiredDate, ShippedDate, ShipVia, Sent)
                                VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, 
                                    @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent)"
                DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
                <UpdateParameters>
                    <asp:Parameter Name="ShipName" Type="String" />
                    <asp:Parameter Name="ShipAddress" Type="String" />
                    <asp:Parameter Name="ShipCity" Type="String" />
                    <asp:Parameter Name="ShipRegion" Type="String" />
                    <asp:Parameter Name="ShipPostalCode" Type="String" />
                    <asp:Parameter Name="ShipCountry" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="RequiredDate" Type="DateTime" />
                    <asp:Parameter Name="ShippedDate" Type="DateTime" />
                    <asp:Parameter Name="ShipVia" Type="Int32" />
                    <asp:Parameter Name="Sent" Type="Boolean" />
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ShipName" Type="String" />
                    <asp:Parameter Name="ShipAddress" Type="String" />
                    <asp:Parameter Name="ShipCity" Type="String" />
                    <asp:Parameter Name="ShipRegion" Type="String" />
                    <asp:Parameter Name="ShipPostalCode" Type="String" />
                    <asp:Parameter Name="ShipCountry" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="RequiredDate" Type="DateTime" />
                    <asp:Parameter Name="ShippedDate" Type="DateTime" />
                    <asp:Parameter Name="ShipVia" Type="Int32" />
                    <asp:Parameter Name="Sent" Type="Boolean" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		         ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
            
            <br /><br />
            
            <span class="tdText">
                The Super Form control can be placed inside a Window control and be used for adding/editing the records of a Grid.<br />
                This approach will increase the usability of the site, because you can display much more fields in the Super Form in Window<br />
                than you can display in a Grid row.
            </span>
            <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
   
