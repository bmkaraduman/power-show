<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="aspnet_master_detail_excel_style.aspx.cs" Inherits="Grid_aspnet_master_detail_excel_style" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />
		
        <span class="tdText"><b>ASP.NET Grid - Master/Detail with "Excel-style" editing</b></span>

        <br /><br />
				
		<obout:Grid id="Grid1" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false"
			AllowRecordSelection="false" AllowAddingRecords="false"
			ShowFooter="false" AllowSorting="false" PageSize="-1" ShowLoadingMessage="false"
			DataSourceID="SqlDataSource1" OnRowDataBound="grid1_RowDataBound" FolderStyle="styles/premiere_blue">
			<Columns>
				<obout:Column ID="Column1" DataField="CustomerID" ReadOnly="true" Visible="false" HeaderText="CUSTOMER ID" Width="100" runat="server">
                    <TemplateSettings TemplateId="PlainEditTemplate" />
                </obout:Column>				
				<obout:Column ID="Column3" DataField="CompanyName" HeaderText="COMPANY NAME" Width="185" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
                <obout:Column DataField="Address" HeaderText="ADDRESS" Width="125" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
				<obout:Column ID="Column4" DataField="City" HeaderText="CITY" Width="125" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>								
				<obout:Column ID="Column7" DataField="Country" HeaderText="COUNTRY" Width="125" runat="server">
				    <TemplateSettings TemplateId="PlainEditTemplate" />
				</obout:Column>
			</Columns>
			<Templates>
                <obout:GridTemplate runat="server" ID="PlainEditTemplate">
                    <Template>
                        <asp:TextBox runat="server" ID="TextBox1" CssClass="excel-textbox" Text='<%# Container.Value %>' 
                            onfocus="markAsFocused(this)" onblur="markAsBlured(this)" />
                    </Template>
                </obout:GridTemplate>
			</Templates>
            <MasterDetailSettings LoadingMode="OnLoad" />
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                    AllowAddingRecords="false" AllowSorting="false" AllowRecordSelection="false" ShowFooter="false" 
                    AllowPageSizeSelection="false" AllowPaging="false" Serialize="false" PageSize="-1"
                    DataSourceID="SqlDataSource2" ForeignKeys="CustomerID" ShowLoadingMessage="false"
                    FolderStyle="styles/premiere_blue" OnRowDataBound="grid2_RowDataBound">
                    <Columns>
				        <obout:Column ID="Column8" DataField="OrderID" ReadOnly="true" Visible="false" HeaderText="ORDER ID" Width="100" runat="server">
                            <TemplateSettings TemplateId="PlainDetailEditTemplate" />
                        </obout:Column>				        
				        <obout:Column ID="Column10" DataField="ShipName" HeaderText="SHIP NAME" Width="165" runat="server">
				            <TemplateSettings TemplateId="PlainDetailEditTemplate" />
				        </obout:Column>
                        <obout:Column ID="Column9" DataField="OrderDate" HeaderText="ORDER DATE" Width="125" runat="server" DataFormatString="{0:MM/dd/yyyy}">
				            <TemplateSettings TemplateId="PlainDetailEditTemplate" />
				        </obout:Column>						
				        <obout:Column ID="Column11" DataField="ShipCity" HeaderText="SHIP CITY" Width="125" runat="server">
				            <TemplateSettings TemplateId="PlainDetailEditTemplate" />
				        </obout:Column>
				        <obout:Column ID="Column14" DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="110" runat="server">
				            <TemplateSettings TemplateId="PlainDetailEditTemplate" />
				        </obout:Column>
			        </Columns>
                    <Templates>
                        <obout:GridTemplate runat="server" ID="PlainDetailEditTemplate">
                            <Template>
                                <asp:TextBox runat="server" ID="TextBox1" CssClass="excel-textbox" Text='<%# Container.Value %>' 
                                    onfocus="markAsFocused(this)" onblur="markAsBlured(this)" />
                            </Template>
                        </obout:GridTemplate>
			        </Templates>
                </obout:DetailGrid>
            </DetailGrids>
		</obout:Grid>

		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 5 * FROM Customers">
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="SqlDataSource2" SelectCommand="SELECT TOP 5 * FROM [Orders] WHERE CustomerID = @CustomerID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br />
		
		<obout:OboutButton ID="OboutButton1" runat="server" Text="Save Changes" OnClick="SaveChanges" />
		
		<br /><br />
		
		<span class="tdText">
		    This example showcases the ability to edit the cells of a master/detail Grid similar to an Excel spreadsheet.<br />
            To edit a cell simply click it with the mouse. When clicking the "Save Changes" button all the changes from the master<br />
            and from the details are saved into the database at once.
		</span>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        function markAsFocused(textbox) {
            textbox.className = 'excel-textbox-focused';
        }

        function markAsBlured(textbox) {
            textbox.className = 'excel-textbox';
        }

    </script>
        
    <style type="text/css">
        .excel-textbox
        {
            background-color: transparent;
            border: 0px;
    	    margin: 0px;
    	    padding: 0px;
    	    outline: 0;
    	    font: inherit;
    	    width: 100%;
    	    padding-top: 4px;
    	    padding-bottom: 4px;
        }
    
        .excel-textbox-focused
        {
            background-color: #FFFFFF;
            border: 0px;
    	    margin: 0px;
    	    padding: 0px;
    	    outline: 0;
    	    font: inherit;
    	    width: 100%;
    	    padding-top: 4px;
    	    padding-bottom: 4px;
        }
    
        .excel-textbox-error
        {
            color: #FF0000;
        }
    
	    .ob_gCc2, .ob_gDGCCT .ob_gC_Fc .ob_gCc2
	    {
           padding-left: 3px !important;
	    }
	
	    .ob_gC_Fc .ob_gCc2
	    {
	        padding-left: 20px !important;
	    }
	
	    .ob_gBCont
	    {
		    border-bottom: 1px solid #C3C9CE;
	    }
    </style>

</asp:Content>

