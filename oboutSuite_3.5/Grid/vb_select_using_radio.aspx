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
        grid1.AllowRecordSelection = True
        grid1.AllowMultiRecordSelection = False
        grid1.KeepSelectedRecords = True        
		grid1.AutoGenerateColumns = False
		grid1.AllowAddingRecords = False
        grid1.PageSize = 10
        grid1.FolderStyle = "styles/grand_gray"
        grid1.ClientSideEvents.OnClientCallback = "resetRadio"
		grid1.ClientSideEvents.OnClientSelect = "onRecordSelect"
        grid1.GenerateRecordIds = True
        
        
        ' creating the template for the Company name column (view mode)
        '------------------------------------------------------------------------
        Dim CheckTemplate As Obout.Grid.GridRuntimeTemplate
        CheckTemplate = New GridRuntimeTemplate()
        CheckTemplate.ID = "CheckTemplate"
        CheckTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(CheckTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateCheckTemplate
        '------------------------------------------------------------------------
        
        ' adding the templates to the Templates collection
        grid1.Templates.Add(CheckTemplate)
				

		' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = ""
        oCol1.ReadOnly = True
        oCol1.HeaderText = "Select"
        oCol1.TemplateSettings.TemplateId = "CheckTemplate"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ProductID"
        oCol2.HeaderText = "Product ID"
        oCol2.Width = "125"
        oCol2.ReadOnly = True


        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ProductName"
        oCol3.HeaderText = "Product Name"
        oCol3.Width = "225"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "UnitPrice"
        oCol4.HeaderText = "Unit Price"
        oCol4.Width = "150"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)

		' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        If Not Page.IsPostBack Then
            BindGrid()
        End If
		
    End Sub
    
    ' Create the methods that will load the data into the templates
    '------------------------------------------------------------------------
    Sub CreateCheckTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oLiteral As Literal = New Literal()
        e.Container.Controls.Add(oLiteral)
        AddHandler CType(oLiteral, Literal).DataBinding, AddressOf DataBindCheckTemplate
    End Sub
    Sub DataBindCheckTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oLiteral As Literal = CType(sender, Literal)
        Dim oContainer As Obout.Grid.TemplateContainer
        oContainer = CType(oLiteral.NamingContainer, Obout.Grid.TemplateContainer)

        oLiteral.Text = "<input type=""radio"" name=""radio"" id=""rad_grid_" + oContainer.DataItem("ProductID").ToString() + """/>"
    End Sub
    '------------------------------------------------------------------------
		
	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Products", myConn)
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
			function onRecordSelect(arrSelectedRecords) {
				var sMessage;
				
				if ( 0 <grid1.SelectedRecords.length ) {
					var id = grid1.SelectedRecords[0].ProductID;

					var radio = document.getElementById( "rad_grid_" + id );
					radio.checked =  true;
				}
			
			}
			function resetRadio (){
				// populate the previously checked radio buttons
                var arrPageSelectedRecords = grid1.PageSelectedRecords;
                if ( 0<arrPageSelectedRecords.length ) {                    
                    var oCheckbox = document.getElementById("rad_grid_" + arrPageSelectedRecords[0].ProductID);
                    oCheckbox.checked = true;
                }
			}
		</script>
	</head>
	<body>	
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select using Radio Buttons</b></span>
		<br /><br />	
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
							
		<br /><br /><br />
		
		<span class="tdText">
		    Use the radio buttons to select records from the Grid. 		   
		</span>
		
		<br /><br /><br />
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<script type="text/javascript">
var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = resetRadio;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    resetRadio();
    }
}
</script>