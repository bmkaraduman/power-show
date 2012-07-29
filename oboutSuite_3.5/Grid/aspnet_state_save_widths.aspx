<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    protected void grid1_ColumnsCreated(object sender, EventArgs e)
    {
        if (Session["ColumnWidths"] != null)
        {
            string[] columnWidths = Session["ColumnWidths"].ToString().Split(',');

            for (int i = 0; i < columnWidths.Length; i++)
            {
                grid1.Columns[i].Width = columnWidths[i];
            }
        }
    }
    
    public void saveColumnWidths(string ColumnWidths)
    {
        Session["ColumnWidths"] = ColumnWidths;
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
		</style>
        <script type="text/javascript">
            window.onload = function () {
                oboutGrid.prototype.resizeColumnOld = oboutGrid.prototype.resizeColumn;
                oboutGrid.prototype.resizeColumn = function (param1, param2, param3) {
                    this.resizeColumnOld(param1, param2, param3);

                    saveColumnWidths();
                }
            }

            function saveColumnWidths() {
                var columnWidths = new Array();

                for (var i = 0; i < grid1.ColumnsCollection.length; i++) {
                    columnWidths.push(grid1.ColumnsCollection[i].Width);
                }
                
                ob_post.AddParam('ColumnWidths', columnWidths.join(','));
                ob_post.post(null, 'saveColumnWidths', null);
            }

            
        </script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Save Column Widths</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" DataSourceID="SqlDataSource1" OnColumnsCreated="grid1_ColumnsCreated">
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
		    The Grid allows you to detect the column resizing action of the end user and save the new column widths either in the database or in a session / cookie variable.<br />
            Thus, when the user visits the page again, the columns of the Grid can be set up with the last widths that were used by the user.<br />
            The main advantage of using this feature is that the end users don't need to do the same thing over and over again (resizing the columns to suit their needs),<br />
            when visiting the specific page containing the Grid.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>