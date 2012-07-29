<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim cal1 As OboutInc.Calendar2.Calendar = New OboutInc.Calendar2.Calendar()
    Dim oTextBox As OboutTextBox = New OboutTextBox()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        
        grid1.FolderStyle = "styles/premiere_blue"

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
				
		
        ' creating the Templates        
        Dim tplDatePicker As Obout.Grid.GridRuntimeTemplate = New GridRuntimeTemplate()
        tplDatePicker.ID = "tplDatePicker"
        tplDatePicker.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(tplDatePicker.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateDatePickerTemplate
        tplDatePicker.ControlID = "txtOrderDate"
        tplDatePicker.ControlPropertyName = "value"
        tplDatePicker.UseQuotes = True
						
		
        ' adding the templates to the Templates collection
        grid1.Templates.Add(tplDatePicker)
		
																						
        ' creating the columns
        Dim oCol1 As Obout.Grid.Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Obout.Grid.Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
	
        Dim oCol3 As Obout.Grid.Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "125"

        Dim oCol4 As Obout.Grid.Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "150"
	
        Dim oCol5 As Obout.Grid.Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "150"

        Dim oCol6 As Obout.Grid.Column = New Column()
        oCol6.DataField = "OrderDateValue"
        oCol6.HeaderText = "ORDER DATE"
        oCol6.Width = "175"
        oCol6.TemplateSettings.EditTemplateId = "tplDatePicker"

        Dim oCol7 As Obout.Grid.Column = New Column()
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
        phGrid1.Controls.Add(cal1)
				
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub        
    
    Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
        cal1.TextBoxId = oTextBox.ClientID
    End Sub

    ' Create the methods that will load the data into the templates	    
    '------------------------------------------------------------------------
    Sub CreateDatePickerTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPlaceHolder As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPlaceHolder)
        AddHandler CType(oPlaceHolder, PlaceHolder).DataBinding, AddressOf DataBindDatePickerTemplate
    End Sub
    Sub DataBindDatePickerTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPlaceHolder As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oPlaceHolder.NamingContainer, Obout.Grid.TemplateContainer)

        Dim oTable As Table = New Table()
        oTable.CellPadding = 0
        oTable.CellSpacing = 0
        oTable.Attributes("width") = "100%"

        Dim oRow As TableRow = New TableRow()

        Dim oCell1 As TableCell = New TableCell()
        Dim oCell2 As TableCell = New TableCell()
        oCell2.Attributes("width") = "30"

        oTextBox = New OboutTextBox()
        oTextBox.ID = "txtOrderDate"
        oTextBox.FolderStyle = "styles/premiere_blue/interface/OboutTextBox"
        oTextBox.Width = Unit.Percentage(100)
        
        oCell1.Controls.Add(oTextBox)


        cal1.ID = "cal1"
        cal1.StyleFolder = "../calendar/styles/default"
        cal1.DatePickerMode = True
        cal1.ShowYearSelector = False
        cal1.DatePickerImagePath = "../calendar/styles/icon2.gif"
        
        oCell2.Controls.Add(cal1)
        
        oRow.Cells.Add(oCell1)
        oRow.Cells.Add(oCell2)

        oTable.Rows.Add(oRow)

        oPlaceHolder.Controls.Add(oTable)
    End Sub
    '------------------------------------------------------------------------


    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 OrderID, ShipName, ShipCity, ShipPostalCode, ShipCountry, OrderDate, FORMAT(OrderDate, ""mm/dd/yyyy"") AS OrderDateValue FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub
		
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry, OrderDate=@OrderDate WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record("OrderDateValue")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country, HomePage) VALUES(@CompanyName, @Address, @Country, @HomePage)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderDate", OleDbType.VarChar).Value = e.Record("OrderDateValue")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        BindGrid()
    End Sub
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
				background-color___:#f6f9fc;
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
		<span class="tdText"><b>ASP.NET Grid - Using the DatePicker inside the Grid</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		You can easily add a DatePicker control into the Grid using Templates for edit.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>