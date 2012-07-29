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
			.tdTextSmall {
	            font:9px Verdana;
	            color:#333333;
            }
		</style>
		<script type="text/javascript" language="javascript">




		    function expandBYRowIndex(index) {

		        index = eval(index) * 2;

		        var rowsContainer = grid1.GridBodyContainer.firstChild.firstChild.childNodes[1]
		        var rowArray = rowsContainer.childNodes;

		        if (rowArray[index]) {
		            if (rowArray[index].firstChild.firstChild.firstChild) {
		                expandObj = rowArray[index].firstChild.firstChild.childNodes[1].firstChild;

		                if (typeof expandObj.onclick == "function")
		                    expandObj.onclick();
		            }
		        }
		    }

		    function expandByIndex() {

		        var indx = document.getElementById("txtValue").value;
		        expandBYRowIndex(indx);
		    }

		    function expandByKey() {

		        var txtKey = document.getElementById("txtKey").value;
		        expandByKeyText(txtKey);
		    }

		    function expandByKeyText(key) {

		        var rowsContainer = grid1.GridBodyContainer.firstChild.firstChild.childNodes[1]
		        var rowArray = rowsContainer.childNodes;

		        for (i = 0; i < rowArray.length; i++) {

		            if (rowArray[i].className != "ob_gDGC") {

		                if (key == rowArray[i].firstChild.firstChild.firstChild.innerHTML) {
		                    var expandObj = rowArray[i].firstChild.firstChild.childNodes[1].firstChild;
		                    if (typeof expandObj.onclick == "function")
		                        expandObj.onclick();
		                }
		            }

		        }
		    }

		    function getElementText(e) {
		        if (e.innerText) {
		            return e.innerText;
		        }
		        else {
		            return e.textContent;
		        }
		    }

		    
    </script>
    
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Expand / Collapse Detail Grids on the Client-Side</b></span>		
		<br /><br /><br />
		<table class="tdText" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        Row Index:
                    </td>
                    <td>
                        <input type="text" id="txtValue" class="tdText" /><input type="button" id="btnIndex"
                            value="Expand/ Collapse" class="tdText" onclick="expandByIndex()" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Customer ID:
                    </td>
                    <td>
                        <input type="text" id="txtKey" class="tdText" /><input type="button" id="btnKey"
                            value="Expand/ Collapse" class="tdText" onclick="expandByKey()" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <table>
                <tr>
                    <td style="vertical-align: top">
                        <obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" DataSourceID="sds1"
                            FolderStyle="../grid/styles/grand_gray" AllowAddingRecords="false">
                            <Columns>
                                <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="true" Width="110">
                                </obout:Column>
                                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="200">
                                </obout:Column>
                                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Width="150">
                                </obout:Column>
                                <obout:Column DataField="Country" HeaderText="COUNTRY" Width="140">
                                </obout:Column>
                            </Columns>
                            <MasterDetailSettings LoadingMode="OnLoad" />
                            <DetailGrids>
                                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false" AllowAddingRecords="false"
                                    PageSize="1" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                                    DataSourceID="sds2" FolderStyle="../grid/styles/grand_gray" ForeignKeys="CustomerID">
                                    <Columns>
                                        <obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" ReadOnly="true" Visible="false">
                                        </obout:Column>
                                        <obout:Column DataField="OrderID" HeaderText="ORDER ID" ReadOnly="true" Visible="false">
                                        </obout:Column>
                                        <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}"
                                            Width="225">
                                        </obout:Column>
                                        <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}">
                                        </obout:Column>
                                        <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}">
                                        </obout:Column>
                                    </Columns>
                                </obout:DetailGrid>
                            </DetailGrids>
                        </obout:Grid>
                        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 3 * FROM [Customers]"
                            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT TOP 3 * FROM [Orders] WHERE CustomerID = @CustomerID"
                            ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
                            <SelectParameters>
                                <asp:Parameter Name="CustomerID" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
            <br />

		<span class="tdText">
		    The detail grids can be expanded / collapsed on the client-side based on
            the master row index or based on the primary key value. 
		</span>
				
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>