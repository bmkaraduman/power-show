<%@ Page Language="VB" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AutoPostBackOnSelect = True
        grid1.AllowMultiRecordSelection = False
        grid1.PageSize = 50

        grid1.ScrollingSettings.ScrollHeight = 250
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "SupplierID"
        oCol1.ReadOnly = True
        oCol1.Visible = False
        oCol1.HeaderText = "SUPPLIER ID"
        oCol1.Width = "125"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "Address"
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "185"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"
        oCol4.Width = "135"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)

        If Not (Page.IsPostBack) Then
        
            CreateGrid()
        End If
        
    End Sub
    

    Sub CreateGrid()

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Suppliers", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
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
	</head>
    <body>
        <form runat="server"><br />
		    <span class="tdText"><b>ASP.NET Grid - Auto-scroll to selected row during postback</b></span>
    		
		    <br /><br />	
    		
    		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		    
		    <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
	    </form>
	</body>
</html>	

<script type="text/javascript">
var t;

function scrollSelectedRecord() 
{ 
    if(typeof(grid1) == 'undefined') 
    { 
        t = window.setTimeout("scrollSelectedRecord()", 500);
        return; 
    } 
    if(grid1 != null)
    {        
        if(grid1.Rows != null)
        {
            if(grid1.PageSelectedRecords != null &&  grid1.PageSelectedRecords.length > 0) 
            { 
                for(var i=0; i < grid1.Rows.length; i++) 
                { 
                    if(grid1.Rows[i].Cells['SupplierID'].Value ==  grid1.PageSelectedRecords[0].SupplierID) 
                    {
                        grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes[i].scrollIntoView(true);
                    } 
                }       
            }
        } else {
            t = window.setTimeout("scrollSelectedRecord()", 500);
            return;
        }
        
        window.clearTimeout(t); 
    }
} 
scrollSelectedRecord();

</script>
