<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowAddingRecords = False
        grid1.DataSourceID = "sds1"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "SUPPLIER ID"
        oCol1.Width = "125"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "175"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Phone"
        oCol4.HeaderText = "PHONE"
        oCol4.Width = "125"
        
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Fax"
        oCol5.HeaderText = "FAX"
        oCol5.Width = "125"
        oCol5.NullDisplayText = "N/A"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
    End Sub
</script>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		<span class="tdText"><b>ASP.NET Grid - Using the NullDisplayText property</b></span>		
		
		<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    Use the <b>NullDisplayText</b> property of the <b>Column</b> class to replace the NULL values from the database with a specific text.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Suppliers"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>