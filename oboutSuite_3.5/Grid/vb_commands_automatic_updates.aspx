<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        
        grid1.AllowAddingRecords = False
        grid1.AllowRecordSelection = False
        grid1.ShowLoadingMessage = False
        
        grid1.FolderStyle = "styles/grand_gray"

        ' setting the event handlers
        AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
        AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
        AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
        AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid
				
		
        ' creating the Templates
		
        ' creating the template for the Country column (view mode)
        '------------------------------------------------------------------------
        Dim TemplateCountry As Obout.Grid.GridRuntimeTemplate
        TemplateCountry = New GridRuntimeTemplate()
        TemplateCountry.ID = "tplCountry"
        TemplateCountry.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateCountry.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCountryTemplate
        '------------------------------------------------------------------------

        ' creating the template for the Sent column (view mode)
        '------------------------------------------------------------------------		
        Dim TemplateSent As Obout.Grid.GridRuntimeTemplate
        TemplateSent = New GridRuntimeTemplate()
        TemplateSent.ID = "tplSent"
        TemplateSent.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(TemplateSent.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateSentTemplate
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        grid1.Templates.Add(TemplateCountry)
        grid1.Templates.Add(TemplateSent)
																						
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
	
        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"        

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"        
	
        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"
        oCol5.TemplateSettings.TemplateId = "tplCountry"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "Sent"
        oCol6.HeaderText = "SENT"
        oCol6.Width = "100"
        oCol6.TemplateSettings.TemplateId = "tplSent"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
		
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
				
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub

	' Create the methods that will load the data into the templates
	'------------------------------------------------------------------------
    Sub CreateSentTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindSentTemplate
    End Sub
    Sub DataBindSentTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""checkbox"" onclick=""updateSent(this.checked, " + oContainer.PageRecordIndex.ToString() + ")""" + IIf(oContainer.Value = "True", " checked='checked'", "") + "/>"
    End Sub
    '------------------------------------------------------------------------
    
    
    '------------------------------------------------------------------------
    Sub CreateCountryTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindEditCountryTemplate
    End Sub
    Sub DataBindEditCountryTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<select class=""ob_gEC"" onchange=""updateCountry(this.value, " + oContainer.PageRecordIndex.ToString() + ")"">" & _
                   "<option value=""""></option>" & _
                            "<option value=""Argentina""" + IIf(oContainer.Value = "Argentina", " selected='selected'", "") + ">Argentina</option>" & _
                            "<option value=""Austria""" + IIf(oContainer.Value = "Austria", "selected='selected'", "") + ">Austria</option>" & _
                            "<option value=""Brazil""" + IIf(oContainer.Value = "Brazil", "selected='selected'", "") + ">Brazil</option>" & _
                            "<option value=""Denmark""" + IIf(oContainer.Value = "Denmark", "selected='selected'", "") + ">Denmark</option>" & _
                            "<option value=""France""" + IIf(oContainer.Value = "France", "selected='selected'", "") + ">France</option>" & _
                            "<option value=""Germany""" + IIf(oContainer.Value = "Germany", "selected='selected'", "") + ">Germany</option>" & _
                            "<option value=""Ireland""" + IIf(oContainer.Value = "Ireland", "selected='selected'", "") + ">Ireland</option>" & _
                            "<option value=""Italy""" + IIf(oContainer.Value = "Italy", "selected='selected'", "") + ">Italy</option>" & _
                            "<option value=""Mexico""" + IIf(oContainer.Value = "Mexico", "selected='selected'", "") + ">Mexico</option>" & _
                            "<option value=""Switzerland""" + IIf(oContainer.Value = "Switzerland", "selected='selected'", "") + ">Switzerland</option>" & _
                            "<option value=""UK""" + IIf(oContainer.Value = "UK", "selected='selected'", "") + ">UK</option>" & _
                            "<option value=""USA""" + IIf(oContainer.Value = "USA", "selected='selected'", "") + ">USA</option>" & _
                            "<option value=""Venezuela""" + IIf(oContainer.Value = "Venezuela", "selected='selected'", "") + ">Venezuela</option>" & _
               "</select>"
    End Sub
    '------------------------------------------------------------------------


	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
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
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry, Sent=@Sent WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record("Sent")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry, Sent) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry, @Sent)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record("Sent")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)	
		BindGrid()
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
		<script type="text/javascript">
		    function updateCountry(sCountry, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = sCountry;
		        oRecord.Sent = grid1.Rows[iRowIndex].Cells[5].Value;
		        
		        grid1.executeUpdate(oRecord);
		    }
		    
		    function updateSent(bSent, iRowIndex) {
		        var oRecord = new Object();
		        
		        oRecord.OrderID = grid1.Rows[iRowIndex].Cells[0].Value;
		        oRecord.ShipName = grid1.Rows[iRowIndex].Cells[1].Value;
		        oRecord.ShipCity = grid1.Rows[iRowIndex].Cells[2].Value;
		        oRecord.ShipPostalCode = grid1.Rows[iRowIndex].Cells[3].Value;
		        oRecord.ShipCountry = grid1.Rows[iRowIndex].Cells[4].Value;
		        oRecord.Sent = bSent;
		        
		        grid1.executeUpdate(oRecord);
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Automatic Updates</b></span>
		
		<br /><br />
		
		<span class="tdText">
		    Change the countries using the drop-down lists, check/uncheck the "SENT" checkboxes - <br />
		    the changes will be updated automatically in the database, without pressing any link/button.
		</span>
			
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		You can use the new <b>executeInsert</b>, <b>executeUpdate</b> and <b>executeDelete</b> client-side methods<br />
		to insert, update and delete records from the Grid without pressing any link/button.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>