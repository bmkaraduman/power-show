<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
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
        
        grid1.FolderStyle = "styles/premiere_blue"
             
        
        ' creating the Template for numbering records
        '------------------------------------------------------------------------
        Dim NumberingRecordsTemplate As Obout.Grid.GridRuntimeTemplate
        NumberingRecordsTemplate = New GridRuntimeTemplate()
        NumberingRecordsTemplate.ID = "tplNumbering"
        NumberingRecordsTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(NumberingRecordsTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateNumberingRecordsTemplate
        '------------------------------------------------------------------------

        
        grid1.Templates.Add(NumberingRecordsTemplate)
		
																						
        Dim oCol1 As Column = new Column()
        oCol1.DataField = ""
		oCol1.ReadOnly = true
        oCol1.HeaderText = "NO."
        oCol1.Width = "50"
        oCol1.TemplateSettings.TemplateId = "tplNumbering"

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
        
        ' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)

        ' add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
				
        If Not Page.IsPostBack Then
            BindGrid()
        End If
    End Sub

	' Create the methods that will load the data into the templates
	'------------------------------------------------------------------------
    Sub CreateNumberingRecordsTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindNumberingRecordsTemplate
    End Sub
    
    Public Sub DataBindNumberingRecordsTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)
        
        oLiteral.Text = "<b>" + (oContainer.RecordIndex + 1).ToString() + ".</b>"
    End Sub

    
    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

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
			
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #FFFFFF;
			}
		</style>			
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Numbering the records</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		    You can use the <b>Container.RecordIndex</b> and <b>Container.PageRecordIndex</b> properties inside templates to access the index of the record.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>