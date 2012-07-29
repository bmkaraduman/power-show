<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
			
			.ob_fC table td
            {
                white-space: normal !important;
            }
        
            .command-row .ob_fRwF
            {
                padding-left: 200px !important;
            }
        
            .ob_gRETpl #ob_iTSuperForm1_AdditionalInformationContainer
            {
                height: 160px !important;
            }
		</style>		
	</head>
	<body>
		<form runat="server">
					
		<br />
    
        <span class="tdText"><b>ASP.NET Grid - Using Super Form to Add/Edit Records</b></span>
    
        <br /><br />

        <obout:Grid runat="server" ID="Grid1" Serialize="false" AutoGenerateColumns="false" DataSourceID="SqlDataSource1">
            <Columns>
			    <obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server">
				    <TemplateSettings RowEditTemplateControlId="OrderID" RowEditTemplateControlPropertyName="value"/>
			    </obout:Column>
                <obout:Column ID="Column2" DataField="ShipName" Width="200" HeaderText="NAME" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipName" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column3" DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipAddress" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column4" DataField="ShipCity" Width="150" HeaderText="CITY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipCity" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column5" DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipRegion" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column6" DataField="ShipPostalCode" Width="150" HeaderText="POSTAL CODE" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipPostalCode" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column7" DataField="ShipCountry" Visible="true" Width="125" Wrap="false" HeaderText="COUNTRY" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipCountry" RowEditTemplateControlPropertyName="value" />
                </obout:Column>                
                <obout:Column ID="Column8" DataField="OrderDate" Width="125" HeaderText="ORDER DATE" 
                    DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_OrderDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column9" DataField="RequiredDate" Visible="false"  Width="200" HeaderText="REQUIRED DATE" 
                    DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_RequiredDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column10" DataField="ShippedDate" Visible="false" Width="200" HeaderText="SHIPPED DATE" 
                    DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShippedDate" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column11" DataField="ShipVia" Visible="false" Width="200" HeaderText="SHIP VIA" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_ShipVia" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column12" DataField="Sent" Visible="false" Width="175" HeaderText="SENT" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_Sent" RowEditTemplateControlPropertyName="checked" />
                </obout:Column>
                <obout:Column ID="Column13" DataField="AdditionalInformation" Visible="false" Width="200" HeaderText="ADDITIONAL INFORMATION" runat="server">
                    <TemplateSettings RowEditTemplateControlId="SuperForm1_AdditionalInformation" RowEditTemplateControlPropertyName="value" />
                </obout:Column>
                <obout:Column ID="Column14" HeaderText="EDIT" Width="150" AllowEdit="true" AllowDelete="true" runat="server" />
		    </Columns>
		    <TemplateSettings RowEditTemplateId="tplRowEdit" />
		    <Templates> 			    
			    <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <input type="hidden" id="OrderID" />

                        <obout:SuperForm ID="SuperForm1" runat="server" 
                            DataSourceID="SqlDataSource2"
                            AutoGenerateRows="false"
                            AutoGenerateInsertButton ="false"
                            AutoGenerateEditButton="false"
                            AutoGenerateDeleteButton="false"                        
                            DataKeyNames="OrderID" DefaultMode="Insert" Width="99%">
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

                                <obout:MultiLineField DataField="AdditionalInformation" HeaderText="" FieldSetID="FieldSet3" HeaderStyle-Width="1" />

                                <obout:TemplateField FieldSetID="FieldSet4">
                                    <EditItemTemplate>
                                        <obout:OboutButton runat="server" Text="Save" OnClientClick="Grid1.save(); return false;" Width="75" />
                                        <obout:OboutButton runat="server" Text="Cancel" OnClientClick="Grid1.cancel(); return false;" Width="75" />
                                    </EditItemTemplate>
                                </obout:TemplateField>
                            </Fields>
                            <FieldSets>
                                <obout:FieldSetRow>
                                    <obout:FieldSet ID="FieldSet1" Title="Ship Information" />
                                    <obout:FieldSet ID="FieldSet2" Title="Order Information" />
                                    <obout:FieldSet ID="FieldSet3" Title="Additional Information" />
                                </obout:FieldSetRow>
                                <obout:FieldSetRow>
                                    <obout:FieldSet ID="FieldSet4" ColumnSpan="3" CssClass="command-row" />
                                </obout:FieldSetRow>
                            </FieldSets>
                        </obout:SuperForm>                       				                         
                    </Template>
                </obout:GridTemplate>
		    </Templates>
        </obout:Grid>
   

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT TOP 25 * FROM [Orders] ORDER BY OrderID DESC"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode,
                           ShipCountry=@ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent=@Sent,
                           AdditionalInformation=@AdditionalInformation WHERE OrderID=@OrderID"
            InsertCommand="INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, 
                                OrderDate, RequiredDate, ShippedDate, ShipVia, Sent, AdditionalInformation)
                            VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, 
                                @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent, @AdditionalInformation)"
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
                <asp:Parameter Name="AdditionalInformation" Type="String" />
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
                <asp:Parameter Name="AdditionalInformation" Type="String" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		     ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Orders] WHERE OrderID = @OrderID"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry,
                             OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate WHERE OrderID=@OrderID">
            <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
        <br /><br />
    
        <span class="tdText">
            The Super Form control can be placed inside the row edit template of a Grid to generate the form used for adding/editing records.<br />
            Using this approach makes development easier because the code is smaller and cleaner, as opposed to the standard approach of using <br />
            HTML markup and ASP.NET controls inside the row edit template of the Grid.
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


