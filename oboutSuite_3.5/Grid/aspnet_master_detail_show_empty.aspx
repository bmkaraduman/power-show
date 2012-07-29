<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" language="C#">
    void changeShowEmptyDetails(object sender, EventArgs e)
    {
        grid1.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
        grid2.MasterDetailSettings.ShowEmptyDetails = ChkShowEmptyDetails.Checked;
        
        grid1.DataBind();
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
		</style>
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Master / Detail - Showing Empty Detail Grids with OnLoad</b></span>		
		
		<br /><br />
		
		<span class="tdText">
		    <asp:CheckBox runat="server" ID="ChkShowEmptyDetails" AutoPostBack="true" Text="Show Empty Detail Grids" OnCheckedChanged="changeShowEmptyDetails" />
		</span>
		
		<br /><br />
		
		<obout:Grid runat="server" ID="grid1" AutoGenerateColumns="false" Serialize="false"
		    DataSourceID="sds1" FolderStyle="styles/grand_gray" AllowAddingRecords="false">
             <Columns>
                <obout:Column DataField="EmployeeID" ReadOnly="true" Visible="false"></obout:Column>
                <obout:Column DataField="FirstName" Width="200"></obout:Column>
                <obout:Column DataField="LastName"></obout:Column>
                <obout:Column DataField="City"></obout:Column>
                <obout:Column DataField="Country"></obout:Column>
                <obout:Column DataField="ReportsTo" Visible="false"></obout:Column>
            </Columns>            
            <MasterDetailSettings LoadingMode="OnLoad" ShowEmptyDetails="false" />            
            <DetailGrids>
                <obout:DetailGrid runat="server" ID="grid2" AutoGenerateColumns="false"  Serialize="false"
                 AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                 DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="EmployeeID">
                    <Columns>
                        <obout:Column DataField="EmployeeID" ReadOnly="true" Visible="false"></obout:Column>
                        <obout:Column DataField="FirstName"></obout:Column>
                        <obout:Column DataField="LastName"></obout:Column>
                        <obout:Column DataField="City"></obout:Column>
                        <obout:Column DataField="Country"></obout:Column>
                        <obout:Column DataField="ReportsTo" Visible="false"></obout:Column>
                    </Columns>
                    <MasterDetailSettings LoadingMode="OnLoad" ShowEmptyDetails="false" />            
                    <DetailGrids>
                        <obout:DetailGrid runat="server" ID="grid3" AutoGenerateColumns="false"  Serialize="false"
                         AllowAddingRecords="false" ShowFooter="true" AllowPageSizeSelection="false" AllowPaging="false"
                         DataSourceID="sds2" FolderStyle="styles/grand_gray" ForeignKeys="EmployeeID">
                            <Columns>
                                <obout:Column DataField="EmployeeID" ReadOnly="true" Visible="false"></obout:Column>
                                <obout:Column DataField="FirstName"></obout:Column>
                                <obout:Column DataField="LastName"></obout:Column>
                                <obout:Column DataField="City"></obout:Column>
                                <obout:Column DataField="Country" Width="150"></obout:Column>
                                <obout:Column DataField="ReportsTo" Visible="false"></obout:Column>
                            </Columns>
                        </obout:DetailGrid>
                    </DetailGrids>
                </obout:DetailGrid>
            </DetailGrids>
        </obout:Grid>
		
		<br /><br />				
		
		<div class="tdText" style="width: 725px;">
            The Grid allows developers to choose whether the empty detail grids (which don't contain any rows) should be displayed or not.
            To control this behavior, you need to use the <b>MasterDetailSettings.ShowEmptyDetails</b> property.<br /><br />
            
            When using the <b>OnLoad</b> pattern, since all the detail grids are loaded at once when the page is loaded, setting the
            <b>MasterDetailSettings.ShowEmptyDetails</b> property is enough for the Grid to determine which details to show and which to hide.<br /><br /> 

            When using the <b>OnCallback</b> patter, since the detail grids are loaded on demand via AJAX, setting the 
            <b>MasterDetailSettings.ShowEmptyDetails</b> property is not enough for the Grid to determine which details to show and which to hide.
            Developers also need to use the <b>MasterDetailSettings.DetailsCountField</b> property, to indicate the name of the field
            from the data source which contains the number of details for each row. To populate this field, you can use a sub-query in the main query 
            that loads the data for the detail grid (check the source code of this sample).
        </div>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM [Employees] WHERE ReportsTo IS NULL"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		</asp:SqlDataSource>
		
		<asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM [Employees] WHERE ReportsTo = @EmployeeID"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
                <asp:Parameter Name="EmployeeID" Type="Int32" />
            </SelectParameters>
		</asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>