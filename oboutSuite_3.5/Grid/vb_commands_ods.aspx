<%@ Page Language="VB"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
		
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )		 								
		grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
			
        grid1.DataSourceID = "ods1"

        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowFiltering = True

		' creating the columns
		Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "125"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
		oCol2.Width = "200"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipPostalCode"
		oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "150"

		Dim oCol6 As Column = new Column()
		oCol6.DataField = "ShipCountry"
		oCol6.HeaderText = "COUNTRY"
        oCol6.Width = "150"

		Dim oCol7 As Column = new Column()
		oCol7.HeaderText = "EDIT"
		oCol7.Width = "125"
		oCol7.AllowEdit = True
        oCol7.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)
		grid1.Columns.Add(oCol7)

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
		<span class="tdText"><b>ASP.NET Grid - Insert/Update/Delete using ObjectDataSource</b></span>
		<br /><br />
				

		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<asp:ObjectDataSource runat="server" ID="ods1" SelectMethod="GetOrders" TypeName="OrdersData"
		    InsertMethod="InsertOrder" UpdateMethod="UpdateOrder" DeleteMethod="DeleteOrder">		    
		</asp:ObjectDataSource>
					
		<br /><br />
		
		<span class="tdText">
		    You can use the <b>InsertMethod</b>, <b>UpdateMethod</b> and <b>DeleteMethod</b> properties <br />
		    of the <b>ObjectDataSource</b> control to insert / update / delete records.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>