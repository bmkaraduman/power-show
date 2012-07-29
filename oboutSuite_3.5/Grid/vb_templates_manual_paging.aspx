<%@ Page Language="VB" EnableEventValidation="false" %>
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
        grid1.PageSize = 7
        grid1.AllowManualPaging = True
        grid1.TemplateSettings.ManualPagingTemplateId = "tplManualPaging"
        grid1.ClientSideEvents.OnClientCallback = "updateCurrentPage"
        
        grid1.FolderStyle = "styles/premiere_blue"
             
        
        ' creating the Template for Manual Paging
        '------------------------------------------------------------------------
        Dim ManualPagingTemplate As Obout.Grid.GridRuntimeTemplate
        ManualPagingTemplate = New GridRuntimeTemplate()
        ManualPagingTemplate.ID = "tplManualPaging"
        ManualPagingTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(ManualPagingTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateManualPagingTemplate
        '------------------------------------------------------------------------

        
        grid1.Templates.Add(ManualPagingTemplate)
		
																						
        Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "225"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "175"

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
    Sub CreateManualPagingTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindManualPagingTemplate
    End Sub
    
    Public Sub DataBindManualPagingTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)
        
        Dim ddlManualPaging As DropDownList = New DropDownList()
        ddlManualPaging.ID = "ddlManualPaging"
        ddlManualPaging.Attributes("onchange") = "grid1.changePage(this.value)"
        ddlManualPaging.Attributes("style") = "width: 50px;"
        ddlManualPaging.Attributes("class") = "ob_gEC"
        
        ddlManualPaging.Items.Add(New ListItem("1", "0"))
        ddlManualPaging.Items.Add(New ListItem("5", "4"))
        ddlManualPaging.Items.Add(New ListItem("10", "9"))
        ddlManualPaging.Items.Add(New ListItem("15", "14"))
        ddlManualPaging.Items.Add(New ListItem("20", "19"))
        ddlManualPaging.Items.Add(New ListItem("25", "24"))
        ddlManualPaging.Items.Add(New ListItem("30", "29"))
        ddlManualPaging.Items.Add(New ListItem("35", "34"))
        ddlManualPaging.Items.Add(New ListItem("40", "39"))
        ddlManualPaging.Items.Add(New ListItem("45", "44"))
        ddlManualPaging.Items.Add(New ListItem("50", "49"))

        oPH1.Controls.Add(ddlManualPaging)
    End Sub

    
    Sub BindGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 350 * FROM Orders ORDER BY OrderID DESC", myConn)
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
		<script type="text/javascript">
		    function updateCurrentPage() {
		        var arrDropDowns = document.getElementsByTagName("SELECT");
		        for(var i=0; i<arrDropDowns.length; i++) {
		            if(arrDropDowns[i].id.indexOf("ddlManualPaging") != -1) {
		                arrDropDowns[i].value = grid1.getCurrentPageIndex();
		                break;
		            }
		        }		        
		    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Templates for Manual Paging</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		
		<span class="tdText">
		    Set the <b>AllowManualPaging</b> property to <span class="option2">true</span> to enable the manual paging feature.<br />
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>