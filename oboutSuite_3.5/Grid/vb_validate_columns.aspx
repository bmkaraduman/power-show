<%@ Page Language="VB"%>
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
        AddHandler grid1.Rebind, AddressOf RebindGrid
        AddHandler grid1.InsertCommand, AddressOf InsertRecord
        AddHandler grid1.DeleteCommand, AddressOf DeleteRecord
        AddHandler grid1.UpdateCommand, AddressOf UpdateRecord

        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeClientInsert"
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeClientUpdate"

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "SupplierID"
        oCol1.Visible = False
        oCol1.ReadOnly = True
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
        oCol4.Width = "125"

        Dim oCol5 As Column = New Column()
        oCol5.HeaderText = "Edit"
        oCol5.Width = "125"
        oCol5.AllowEdit = True
        oCol5.AllowDelete = True


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)

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
    

    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)

        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Suppliers WHERE SupplierID = @SupplierID", myConn)

        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record("SupplierID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
  
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Suppliers SET CompanyName = @CompanyName, Address = @Address, Country = @Country WHERE SupplierID = @SupplierID", myConn)

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record("Address")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")
        myComm.Parameters.Add("@SupplierID", OleDbType.Integer).Value = e.Record("SupplierID")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
   
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()

        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Suppliers (CompanyName, Address, Country) VALUES(@CompanyName, @Address, @Country)", myConn)

        myComm.Parameters.Add("@CompanyName", OleDbType.VarChar).Value = e.Record("CompanyName")
        myComm.Parameters.Add("@Address", OleDbType.VarChar).Value = e.Record("Address")
        myComm.Parameters.Add("@Country", OleDbType.VarChar).Value = e.Record("Country")

        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
    
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
   
        CreateGrid()
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
<script type="text/javascript">
function onBeforeClientInsert(record) 
{
    for(var i in record) 
    {
        if(record[i] == '') 
        {
            // if value is not filled
            alert("Column " + i + " is mandatory.");
            return false;
        }
    }
    return true;
}

function onBeforeClientUpdate(record) 
{
    for(var i in record) 
    {
        if(record[i] == '') 
        {
            // if value is not filled
            alert("Column " + i + " is mandatory.");
            return false;
        }
    }
    return true;
}

    function onClientEdit(record) { 
        document.getElementById('editTextBox').readOnly = true; 
        return true;
    }

</script>
<style type="text/css">
	.tdText {
		font:11px Verdana;
		color:#333333;
	}
</style>
</head>
<body>	
		<form id="Form1" runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Validation on unknown columns name</b></span>
		<br /><br />
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
		 <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		</form>
</body>
</html>