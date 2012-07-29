<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" type="text/VB">
    Dim grid1 As Grid = New Grid()
    Dim TextBox1 As TextBox = New TextBox()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = False
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.ShowFooter = False
        grid1.AllowSorting = False
        grid1.PageSize = -1
        grid1.AllowSorting = False
        grid1.ShowLoadingMessage = False
        grid1.AllowRecordSelection = False
        grid1.AllowAddingRecords = False
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.DataSourceID = "SqlDataSource1"

        AddHandler grid1.RowDataBound, AddressOf grid1_RowDataBound

        ' creating the Templates

        ' creating the template for the Company name column (view mode)
        '------------------------------------------------------------------------
        Dim PlainEditTemplate As GridRuntimeTemplate = New GridRuntimeTemplate()
        PlainEditTemplate.ID = "PlainEditTemplate"
        PlainEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler PlainEditTemplate.Template.CreateTemplate, AddressOf CreatePlainEditTemplate
        '------------------------------------------------------------------------

        ' adding the templates to the Templates collection
        grid1.Templates.Add(PlainEditTemplate)
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"
        oCol1.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "OrderDate"
        oCol2.HeaderText = "DATE"
        oCol2.Width = "100"
        oCol2.DataFormatString = "{0:MM/dd/yyyy}"
        oCol2.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipName"
        oCol3.HeaderText = "NAME"
        oCol3.Width = "200"
        oCol3.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipPostalCode"
        oCol5.HeaderText = "POSTAL CODE"
        oCol5.Width = "150"
        oCol5.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipRegion"
        oCol6.HeaderText = "REGION"
        oCol6.Width = "150"
        oCol6.TemplateSettings.TemplateId = "PlainEditTemplate"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "150"
        oCol7.TemplateSettings.TemplateId = "PlainEditTemplate"

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
    
    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreatePlainEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim ph1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(ph1)

        Dim text As TextBox = New TextBox()
        text.ID = "TextBox1"
        text.CssClass = "excel-textbox"
       
        text.Attributes("onfocus") = "markAsFocused(this)"
        text.Attributes("onblur") = "markAsBlured(this)"
        ph1.Controls.Add(text)

        AddHandler ph1.DataBinding, AddressOf DataBindPlainEditTemplate
    End Sub
    
    Sub DataBindPlainEditTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim ph1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(ph1.NamingContainer, Obout.Grid.TemplateContainer)

        Dim Text As TextBox = CType(ph1.Controls(0), TextBox)
        
        Text.Text = oContainer.Value.ToString()
    End Sub
    
    
    Sub SaveChanges(ByVal sender As Object, ByVal e As EventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim i As Integer
        For i = 0 To grid1.RowsInViewState.Count - 1
     
            Dim orderId As String = CType(CType(grid1.RowsInViewState(i).Cells(0), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim orderDate As String = CType(CType(grid1.RowsInViewState(i).Cells(1), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim shipName As String = CType(CType(grid1.RowsInViewState(i).Cells(2), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim shipCity As String = CType(CType(grid1.RowsInViewState(i).Cells(3), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim shipPostalCode As String = CType(CType(grid1.RowsInViewState(i).Cells(4), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim shipRegion As String = CType(CType(grid1.RowsInViewState(i).Cells(5), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            Dim shipCountry As String = CType(CType(grid1.RowsInViewState(i).Cells(6), GridDataControlFieldCell).FindControl("TextBox1"), TextBox).Text
            
            
            Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET OrderDate = @OrderDate, ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipRegion = @ShipRegion, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

            myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = orderDate
            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = shipName
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = shipCity
            myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = shipPostalCode
            myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = shipRegion
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = shipCountry
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = orderId

            myComm.ExecuteNonQuery()
        Next
        myConn.Close()
    End Sub

    Sub grid1_RowDataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)
   
        If (e.Row.RowType = GridRowType.DataRow And grid1.RowsInViewState.Count > 0) Then
            If (grid1.RowsInViewState.Count > e.Row.RowIndex) Then
                  Dim i As Integer
                For i = 1 To e.Row.Cells.Count - 1
               
                    Dim cell As GridDataControlFieldCell = CType(e.Row.Cells(i), GridDataControlFieldCell)
                    Dim textBox As TextBox = CType(cell.FindControl("TextBox1"), TextBox)

                    Dim cellInViewState As GridDataControlFieldCell = CType(grid1.RowsInViewState(e.Row.RowIndex).Cells(i), GridDataControlFieldCell)
                    Dim textBoxInViewState As TextBox = CType(cellInViewState.FindControl("TextBox1"), TextBox)

                    textBox.Text = textBoxInViewState.Text
                Next
                
            End If
            
        End If
        
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
		    function markAsFocused(textbox) {
		        textbox.className = 'excel-textbox-focused';
		    }

		    function markAsBlured(textbox) {
                textbox.className = 'excel-textbox';
            }

		</script>		
	</head>
	<body>	
        
        <form id="Form1" runat="server">
		
        <br />
		
        <span class="tdText"><b>ASP.NET Grid - "Excel-style" editing</b></span>
		
        <br /><br />
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		

		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 15 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders]">
        </asp:SqlDataSource>
		
		<br />
		
		<obout:OboutButton runat="server" Text="Save Changes" OnClick="SaveChanges" />
		
		<br /><br />
		
		<span class="tdText">
		    This example showcases the ability to edit the cells of the Grid similar to an Excel spreadsheet.<br />
            To edit a cell simply click it with the mouse.<br />
            When clicking the "Save Changes" button all the changes from the Grid are saved into the database at once.

		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
				
		</form>
	</body>
</html>

<style type="text/css">
    .excel-textbox
    {
        background-color: transparent;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-focused
    {
        background-color: #FFFFFF;
        border: 0px;
    	margin: 0px;
    	padding: 0px;
    	outline: 0;
    	font: inherit;
    	width: 100%;
    	padding-top: 4px;
    	padding-bottom: 4px;
    }
    
    .excel-textbox-error
    {
        color: #FF0000;
    }
    
	.ob_gCc2 
	{
       padding-left: 3px !important;
	}
	
	.ob_gBCont
	{
		border-bottom: 1px solid #C3C9CE;
	}
</style>