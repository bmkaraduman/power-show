<%@ Page Language="VB" Inherits="OboutInc.oboutAJAXPage"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
		
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )		 								
		grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
			
		grid1.DataSourceID="SqlDataSource1"

        grid1.FolderStyle = "styles/black_glass"
        AddHandler grid1.ColumnsCreated, AddressOf grid1_ColumnsCreated
        
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.Visible = False
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
		oCol2.Width = "200"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "125"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipRegion"
		oCol4.HeaderText = "REGION"
		oCol4.Width = "125"


		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipPostalCode"
		oCol5.HeaderText = "POSTAL CODE"
		oCol5.Width = "125"

		Dim oCol6 As Column = new Column()
		oCol6.DataField = "ShipCountry"
		oCol6.HeaderText = "COUNTRY"
		oCol6.Width = "125"

		Dim oCol7 As Column = new Column()
		oCol7.HeaderText = "EDIT"
		oCol7.Width = "125"
		oCol7.AllowEdit = True
        oCol7.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		grid1.Columns.Add(oCol7)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		

    End Sub
    
    Sub grid1_ColumnsCreated(ByVal sender As Object, ByVal e As EventArgs)
        If Session("ColumnWidths") <> Nothing Then

            Dim columnWidths() As String = Session("ColumnWidths").ToString().Split(",")
            Dim i As Integer
            
            For i = 0 To columnWidths.Length - 1
                grid1.Columns(i).Width = columnWidths(i)
            Next i
        End If
        
    End Sub

    Sub saveColumnWidths(ByVal ColumnWidths As String)
        
        Session("ColumnWidths") = ColumnWidths
        
    End Sub
</script>
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
				

		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
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
				 
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>