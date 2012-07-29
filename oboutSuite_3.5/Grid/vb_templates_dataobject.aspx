<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
        grid1.Serialize = False
		grid1.AutoGenerateColumns = False		
        grid1.FolderStyle = "styles/grand_gray"
        grid1.AllowFiltering = True
        grid1.AllowAddingRecords = False

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        
        
        ' creating the template for the Company name column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateAddInfo As Obout.Grid.GridRuntimeTemplate
        TemplateAddInfo = New GridRuntimeTemplate()
        TemplateAddInfo.ID = "TemplateAddInfo"
        TemplateAddInfo.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateAddInfo.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateAddInfoTemplate
        '------------------------------------------------------------------------
        
        grid1.Templates.Add(TemplateAddInfo)
        
		
		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "200"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
        oCol2.HeaderText = "ADDITIONAL INFO"
        oCol2.Width = "300"
        oCol2.TemplateSettings.TemplateId = "TemplateAddInfo"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
        oCol3.Width = "250"

        Dim oCol4 As Column = new Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "250"


		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		
		' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        Dim ods1 As ObjectDataSource = New ObjectDataSource()
        ods1.ID = "ods1"
        ods1.SelectMethod = "GetGenericOrdersWithInfo"
        ods1.TypeName = "OrdersGenericData"
        phGrid1.Controls.Add(ods1)
			
		If Not Page.IsPostBack Then
            grid1.DataSourceID = "ods1"
		End If
    End Sub
    
    
    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreateAddInfoTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindAddInfoTemplate
    End Sub
    Sub DataBindAddInfoTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oOrder As Order = CType(oContainer.DataObject, Order)

        oLiteral.Text = CType(oOrder.AdditionalInfo(0), AdditionalInformation).Text + " --- " + CType(oOrder.AdditionalInfo(1), AdditionalInformation).Text
    End Sub
    '------------------------------------------------------------------------
	
		
	Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
		Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName='" + e.Record("ShipName").ToString().Replace("'", "''") + "', ShipCity='" + e.Record("ShipCity").ToString().Replace("'", "''") + "', ShipCountry='" + e.Record("ShipCountry").ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record("OrderID").ToString(), myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
	End Sub
	
	Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
		myConn.Open()
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES('" + e.Record("ShipName").ToString().Replace("'", "''") + "', '" + e.Record("ShipCity").ToString().Replace("'", "''") + "', '" + e.Record("ShipCountry").ToString().Replace("'", "''") + "')", myConn)
		myComm.ExecuteNonQuery()
		myConn.Close()
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
		<span class="tdText"><b>ASP.NET Grid - Using Container.DataObject</b></span>
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    When the Grid is bounded to a collection of custom objects, you can use the <b>Container.DataObject</b> object<br />
		    to access the custom objects from the collection (and all their properties and complex properties)
		</span>
		
		<br /><br /><br />				 
				
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>