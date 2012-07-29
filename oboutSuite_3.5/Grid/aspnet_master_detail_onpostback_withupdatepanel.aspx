<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_onpostback_withupdatepanel.aspx.cs" Inherits="Grid_aspnet_master_detail_onpostback_withupdatepanel" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head"  Runat="Server">
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
			
			#<%= UpdateProgress1.ClientID %>
            {
                position: absolute;
                z-index: 50; 
                top: 0px; 
                bottom: 0px; 
                left: -5px; 
                right: 5px; 
                width: auto; 
                height: auto;
                background-color: #EEEEEE;
                text-align: center;
                filter: alpha(opacity=60);
                -moz-opacity: 0.6;
                opacity: 0.6;
            }
        
            .loading-image
            {
                position: absolute;
                font-family: Verdana;
	            font-size: 10px;
	            color:#0C416F;
	            height: 10px;
	            top: 50%;	
	            bottom: 0px;
	            margin-top: -5px;	
	            left: 0px;
	            right: 0px;
	            margin-left: auto;
	            margin-right: auto;
	            text-align: center;
	            width: 100%;
            }
		</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Master / Detail - Load On PostBack with UpdatePanel</b></span>		
		
		<br /><br />
		
		<asp:ScriptManager ID="ScriptManager1" runat="server" />

		<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                
                <div style="position: relative; z-index: 0;">

		            <obout:Grid runat="server" ID="Grid1" AutoGenerateColumns="false" Serialize="false" CallbackMode="false"
		                DataSourceID="sds1" AllowAddingRecords="false">
                        <Columns>
                            <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                            <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                            <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Width="200"></obout:Column>
                            <obout:Column DataField="Country" HeaderText="COUNTRY" Width="180"></obout:Column>                
                        </Columns>
                        <MasterDetailSettings LoadingMode="OnCallback" />
                        <DetailGrids>
                            <obout:DetailGrid runat="server" ID="Grid2" AutoGenerateColumns="false" CallbackMode="false"
                             AllowAddingRecords="false" ShowFooter="true" Serialize="true"
                             AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="sds2" ForeignKeys="CustomerID">
                                <Columns>
                                    <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                                    <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="225"></obout:Column>
                                    <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}" Width="200"></obout:Column>
                                    <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}" Width="175"></obout:Column>
                                </Columns>
                                <MasterDetailSettings LoadingMode="OnCallback" />
                                <DetailGrids>
                                    <obout:DetailGrid runat="server" ID="Grid3" AutoGenerateColumns="false" CallbackMode="false"
                                         AllowAddingRecords="false" ShowFooter="true" Serialize="true"
                                         AllowPageSizeSelection="false" AllowPaging="false"
                                         DataSourceID="sds3" ForeignKeys="OrderID">
                                            <Columns>
                                                <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>                                
                                                <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="200"></obout:Column>
                                                <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="200"></obout:Column>
                                                <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="170"></obout:Column>
                                            </Columns>
                                    </obout:DetailGrid>
                                </DetailGrids>
                            </obout:DetailGrid>
                        </DetailGrids>
                    </obout:Grid>

                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1"
                        DisplayAfter="0">
                        <ProgressTemplate>
			                <div class="loading-image">
						        <img src="../AJAXPage/loading_icons/2.gif">
					        </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
		        </div>		        		        

            </ContentTemplate>
	    </asp:UpdatePanel>
		
		<br /><br />				
		
		<span class="tdText">
		    The detail grids can be loaded using postbacks as well. Set the <span class="option2">CallbackMode</span> property of the master / detail grids<br />
            to false and each time a detail grid is expanded a postback will occur. Using this approach you can have only one detail grid expanded at a time.<br /><br />
            If you want to prevent the full page postbacks you can simply place the Grid inside an ASP.NET AJAX UpdatePanel to make the detail grids be loaded using asynchronous postbacks.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = ?"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>

</asp:Content>

