<%@ Page Title="" Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_master_detail_flyout.aspx.cs" Inherits="Grid_aspnet_master_detail_flyout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET"%>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Display Info in Flyout</b></span>		
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false"
		    DataSourceID="sds1" FolderStyle="styles/black_glass" AllowAddingRecords="false">
            <Columns>
                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column>
                <obout:Column ID="Column1" HeaderText="INFO" Width="115" runat="server">
				    <TemplateSettings TemplateId="Template1" />
				</obout:Column>
            </Columns>
            <MasterDetailSettings LoadingMode="OnCallback" />
            <Templates>
				<obout:GridTemplate runat="server" ID="Template1">
					<Template>					    
						<span class="tdTextLink" id="grid_link1_<%# Container.DataItem["CustomerID"] %>" onmouseover="attachFlyout1ToLink(grid1, this, <%# Container.PageRecordIndex.ToString() %>)" onmouseout="closeFlyout1()">More info...</span>
					</Template>
				</obout:GridTemplate>
			</Templates>
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" 
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds2" FolderStyle="styles/black_glass" ForeignKeys="CustomerID">
                    <Columns>
                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" Width="220"></obout:Column>
                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"></obout:Column>
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"></obout:Column>
                        <obout:Column ID="Column2" HeaderText="INFO" Width="115" runat="server">
				            <TemplateSettings TemplateId="Template2" />
				        </obout:Column>
                    </Columns>                    
                    <MasterDetailSettings LoadingMode="OnCallback" />
                    <Templates>
				        <obout:GridTemplate runat="server" ID="Template2">
					        <Template>					    
						        <span class="tdTextLink" id="grid_link2_<%# Container.DataItem["OrderID"] %>" onmouseover="attachFlyout2ToLink(<%# Container.GridClientID %>, this, <%# Container.PageRecordIndex.ToString() %>)" onmouseout="closeFlyout2()">More info...</span>
					        </Template>
				        </obout:GridTemplate>
			        </Templates>
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false" 
                             AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                             DataSourceID="sds3" FolderStyle="styles/black_glass" ForeignKeys="OrderID">
                                <Columns>
                                    <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false"></obout:Column>                             
                                    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" ReadOnly="true" Visible="false"></obout:Column>
                                    <obout:Column DataField="UnitPrice" HeaderText="UNIT PRICE" DataFormatString="{0:C2}" Width="180"></obout:Column>
                                    <obout:Column DataField="Quantity" HeaderText="QUANTITY" Width="185"></obout:Column>
                                    <obout:Column DataField="Discount" HeaderText="DISCOUNT" DataFormatString="{0:F2}%" Width="175"></obout:Column>
                                    <obout:Column ID="Column3" HeaderText="INFO" Width="115" runat="server">
				                        <TemplateSettings TemplateId="Template3" />
				                    </obout:Column>
                                </Columns>
                                <Templates>
				                <obout:GridTemplate runat="server" ID="Template3">
					                <Template>					    
						                <span class="tdTextLink" id="grid_link3_<%# Container.DataItem["ProductID"] %>" onmouseover="attachFlyout3ToLink(<%# Container.GridClientID %>, this, <%# Container.PageRecordIndex.ToString() %>)" onmouseout="closeFlyout3()">More info...</span>
					                </Template>
				                </obout:GridTemplate>
			                </Templates>
                        </obout:DetailGrid>
                    </DetailGrids>
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>

        <obout:Flyout runat="server" ID="Flyout1" zIndex="100" Align="LEFT" Position="BOTTOM_LEFT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <div id="divFlyout1Content" style="width: 250px; height: 110px; background-color: #EEEEEE; border: 1px solid #000000;" class="tdText"> 
		        test
            </div>
        </obout:Flyout>

        <obout:Flyout runat="server" ID="Flyout3" zIndex="100" Align="LEFT" Position="BOTTOM_LEFT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <div id="divFlyout3Content" style="width: 250px; height: 110px; background-color: #EEEEEE; border: 1px solid #000000;" class="tdText"> 
		        test
            </div>
        </obout:Flyout>

        <obout:Flyout runat="server" ID="Flyout2" zIndex="100" Align="LEFT" Position="BOTTOM_LEFT" CloseEvent="NONE" OpenEvent="NONE" DelayTime="500">
		    <div id="divFlyout2Content" style="width: 250px; height: 110px; background-color: #EEEEEE; border: 1px solid #000000;" class="tdText"> 
		        test
            </div>
        </obout:Flyout>
		
		<br /><br />				
		
		<span class="tdText">
		    You can use the <b>Grid</b> and <b>Flyout</b> controls together to display more information about a record. <br />
            Go with the mouse over <b>"More info..."</b> to see all the available details. You can attach <b>Flyout</b> <br />
            controls to the rows of a detail grid as well.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Orders] WHERE CustomerID = @CustomerID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="CustomerID" Type="String" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT * FROM [Order Details] WHERE OrderID = @OrderID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>

    <script type="text/javascript">
		    
            // Level 1
            function attachFlyout1ToLink(grid, oLink, index) {	
		        try {	        	        
		            <%=Flyout1.getClientID()%>.Close();        
		            <%=Flyout1.getClientID()%>.AttachTo(oLink.id);
		            var sNewHtml = getRecordInfo1(grid, oLink, index);
		            document.getElementById("divFlyout1Content").innerHTML = sNewHtml;
		            <%=Flyout1.getClientID()%>.Open();
                } catch(ex){}
		    }
		    
		    function closeFlyout1() {
		        try {
		            <%=Flyout1.getClientID()%>.Close();
		        } catch(ex) {};
		    }
		    
		     function getRecordInfo1(grid, oLink, iIndex) {
		        var sCompanyName = grid.Rows[iIndex].Cells[1].Value;
                var sContactName = grid.Rows[iIndex].Cells[2].Value;
                var sCountry = grid.Rows[iIndex].Cells[3].Value;
		        		    
		        var sNewHtml = "<table>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>COMPANY NAME:</b></td><td class='tdText'>" + sCompanyName + "</tr>";	
                sNewHtml += "<tr><td class='tdText' nowrap><b>CONTACT NAME:</b></td><td class='tdText'>" + sContactName + "</tr>";		       
                sNewHtml += "<tr><td class='tdText' nowrap><b>COUNTRY:</b></td><td class='tdText'>" + sCountry + "</tr>";		       	       
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    }


            // Level 2
            function attachFlyout2ToLink(grid, oLink, index) {	
		        try {	        	        
		            <%=Flyout2.getClientID()%>.Close();        
		            <%=Flyout2.getClientID()%>.AttachTo(oLink.id);
		            var sNewHtml = getRecordInfo2(grid, oLink, index);
		            document.getElementById("divFlyout2Content").innerHTML = sNewHtml;
		            <%=Flyout2.getClientID()%>.Open();
                } catch(ex){}
		    }
		    
		    function closeFlyout2() {
		        try {
		            <%=Flyout2.getClientID()%>.Close();
		        } catch(ex) {};
		    }
		    
		    function getRecordInfo2(grid, oLink, iIndex) {
		        var orderDate = grid.Rows[iIndex].Cells[2].Value;
                var shippedDate = grid.Rows[iIndex].Cells[3].Value;
                var freight = grid.Rows[iIndex].Cells[4].Value;
		        		    
		        var sNewHtml = "<table>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>ORDER DATE:</b></td><td class='tdText'>" + orderDate + "</tr>";		  
                sNewHtml += "<tr><td class='tdText' nowrap><b>SHIPPED DATE:</b></td><td class='tdText'>" + shippedDate + "</tr>";		       
                sNewHtml += "<tr><td class='tdText' nowrap><b>FREIGHT:</b></td><td class='tdText'>" + freight + "</tr>";		            
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    } 


            // Level 3
            function attachFlyout3ToLink(grid, oLink, index) {	
		        try {	        	        
		            <%=Flyout3.getClientID()%>.Close();        
		            <%=Flyout3.getClientID()%>.AttachTo(oLink.id);
		            var sNewHtml = getRecordInfo3(grid, oLink, index);
		            document.getElementById("divFlyout3Content").innerHTML = sNewHtml;
		            <%=Flyout3.getClientID()%>.Open();
                } catch(ex){}
		    }
		    
		    function closeFlyout3() {
		        try {
		            <%=Flyout3.getClientID()%>.Close();
		        } catch(ex) {};
		    }
		    
		    function getRecordInfo3(grid, oLink, iIndex) {
		        var quantity = grid.Rows[iIndex].Cells[3].Value;
                var unitPrice = grid.Rows[iIndex].Cells[2].Value;
                var discount = grid.Rows[iIndex].Cells[4].Value;
		        		    
		        var sNewHtml = "<table>";
		        sNewHtml += "<tr><td class='tdText' nowrap><b>UNIT PRICE:</b></td><td class='tdText'>" + unitPrice + "</tr>";		 
                sNewHtml += "<tr><td class='tdText' nowrap><b>QUANTITY:</b></td><td class='tdText'>" + quantity + "</tr>";		       
                sNewHtml += "<tr><td class='tdText' nowrap><b>DISCOUNT:</b></td><td class='tdText'>" + discount + "%</tr>";		             
		        sNewHtml += "</table>";
		        
		        return sNewHtml;
		    }
        </script>

</asp:Content>

