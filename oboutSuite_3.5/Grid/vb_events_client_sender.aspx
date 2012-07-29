<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
    Dim grid3 As Obout.Grid.Grid = New Grid()
    	
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
		grid1.ID = "grid1"
		grid1.CallbackMode = true
		grid1.Serialize = true
		grid1.AutoGenerateColumns = false
		grid1.FolderStyle = "styles/grand_gray"
        grid1.DataSourceID = "sds1"
        grid1.AllowAddingRecords = false
        grid1.PageSize = 5
        
        grid1.ClientSideEvents.ExposeSender = true
        grid1.ClientSideEvents.OnClientSelect = "onSelect"
        
		' creating the columns
        Dim oCol1 As Column = New Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "150"
        oCol1.Visible = false        

        Dim oCol2 As Column = New Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "SHIP NAME"

        Dim oCol3 As Column = New Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "SHIP CITY"

        Dim oCol4 As Column = New Column()
		oCol4.DataField = "ShipCountry"
		oCol4.HeaderText = "SHIP COUNTRY"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
       		
        
        
        grid2.ID = "grid2"
		grid2.CallbackMode = true
		grid2.Serialize = true
		grid2.AutoGenerateColumns = false
		grid2.FolderStyle = "styles/grand_gray"
        grid2.DataSourceID = "sds1"
        grid2.AllowAddingRecords = false
        grid2.PageSize = 5
        
        grid2.ClientSideEvents.ExposeSender = true
        grid2.ClientSideEvents.OnClientSelect = "onSelect"
        
		' creating the columns
        Dim oCol2_1 As Column = New Column()
		oCol2_1.DataField = "OrderID"
		oCol2_1.ReadOnly = true
		oCol2_1.HeaderText = "ORDER ID"
		oCol2_1.Width = "150"
        oCol2_1.Visible = false        

        Dim oCol2_2 As Column = New Column()
		oCol2_2.DataField = "ShipName"
		oCol2_2.HeaderText = "SHIP NAME"

        Dim oCol2_3 As Column = New Column()
		oCol2_3.DataField = "ShipCity"
		oCol2_3.HeaderText = "SHIP CITY"

        Dim oCol2_4 As Column = New Column()
		oCol2_4.DataField = "ShipCountry"
		oCol2_4.HeaderText = "SHIP COUNTRY"

		' add the columns to the Columns collection of the grid
		grid2.Columns.Add(oCol2_1)
		grid2.Columns.Add(oCol2_2)
		grid2.Columns.Add(oCol2_3)
		grid2.Columns.Add(oCol2_4)
        
            
	    
        grid3.ID = "grid3"
		grid3.CallbackMode = true
		grid3.Serialize = true
		grid3.AutoGenerateColumns = false
		grid3.FolderStyle = "styles/grand_gray"
        grid3.DataSourceID = "sds1"
        grid3.AllowAddingRecords = false
        grid3.PageSize = 5
        
        grid3.ClientSideEvents.ExposeSender = true
        grid3.ClientSideEvents.OnClientSelect = "onSelect"
        
		' creating the columns
        Dim oCol3_1 As Column = New Column()
		oCol3_1.DataField = "OrderID"
		oCol3_1.ReadOnly = true
		oCol3_1.HeaderText = "ORDER ID"
		oCol3_1.Width = "150"
        oCol3_1.Visible = false        

        Dim oCol3_2 As Column = New Column()
		oCol3_2.DataField = "ShipName"
		oCol3_2.HeaderText = "SHIP NAME"

        Dim oCol3_3 As Column = New Column()
		oCol3_3.DataField = "ShipCity"
		oCol3_3.HeaderText = "SHIP CITY"

        Dim oCol3_4 As Column = New Column()
		oCol3_4.DataField = "ShipCountry"
		oCol3_4.HeaderText = "SHIP COUNTRY"

		' add the columns to the Columns collection of the grid
		grid3.Columns.Add(oCol3_1)
		grid3.Columns.Add(oCol3_2)
		grid3.Columns.Add(oCol3_3)
		grid3.Columns.Add(oCol3_4)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)
        phGrid3.Controls.Add(grid3)
    End Sub
</script>

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
		</style>
		<script type="text/javascript">
		    function onSelect(sender, records) {
		        alert("A record from " + sender.ID + " was selected.");
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Exposing the sender for client-side events</b></span>
		
		<br /><br />
		
		<span class="tdText">Please select some records from the following grids.</span>
		
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 OrderID, ShipName, ShipAddress, ShipCity, ShipCountry FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
		
		<br /><br /><br />
		
		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>
		
		<br /><br />
		
		<span class="tdText">
		    By setting the <b>ClientSideEvents.ExposeSender</b> property to <span class="option2">true</span>, the client-side grid object<br />
		    that raised the event will be available in the client-side event handlers.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>