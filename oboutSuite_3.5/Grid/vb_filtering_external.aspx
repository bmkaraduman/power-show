<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">	
	Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
    
   Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.AllowMultiRecordSelection = False

        grid1.ClientSideEvents.OnClientSelect = "grid1_Select"
        grid1.ClientSideEvents.ExposeSender = True

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "CustomerID"
        oCol1.Visible = False
        oCol1.HeaderText = "CUSTOMER ID"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "CompanyName"
        oCol2.HeaderText = "COMPANY NAME"
        oCol2.Width = "250"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ContactName"
        oCol3.HeaderText = "CONTACT NAME"
        oCol3.Width = "250"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "Country"
        oCol4.HeaderText = "COUNTRY"

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)

        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = False
        grid2.AutoGenerateColumns = False
        grid2.AllowAddingRecords = False
        grid2.AllowFiltering = True
        grid2.FilterType = GridFilterType.ProgrammaticOnly

        ' creating the columns
        oCol1 = New Column()
        oCol1.DataField = "ShipCountry"
        oCol1.HeaderText = "COUNTRY"
        oCol1.Width = "175"

        oCol2 = New Column()
        oCol2.DataField = "ShipCity"
        oCol2.HeaderText = "CITY"
        oCol2.Width = "150"

        oCol3 = New Column()
        oCol3.DataField = "ShipPostalCode"
        oCol3.HeaderText = "POSTAL CODE"
        oCol3.Width = "150"

        oCol4 = New Column()
        oCol4.DataField = "ShipName"
        oCol4.HeaderText = "NAME"
        oCol4.Width = "200"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "OrderID"
        oCol5.HeaderText = "ORDER ID"
        oCol5.ReadOnly = False
        oCol5.Visible = False
        oCol5.Width = "125"

        ' add the columns to the Columns collection of the grid
        grid2.Columns.Add(oCol1)
        grid2.Columns.Add(oCol2)
        grid2.Columns.Add(oCol3)
        grid2.Columns.Add(oCol4)
        grid2.Columns.Add(oCol5)


        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)

        PopulateMainGrid()
        PopulateDetailGrid()
    End Sub
    
    Sub PopulateMainGrid()
        
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim commandText As String = "SELECT * FROM Customers"
        Dim whereClause As String = ""

        If (IsAppliedFilter.Value = "1") Then

            If Not (FilterCustomerID.Text = "") Then
           
                whereClause += "CustomerID LIKE '%" + FilterCustomerID.Text.Replace("'", "''") + "%'"
            End If
            

            If Not (FilterCompanyName.Text = "") Then
          
                If Not (whereClause = "") Then
                
                    whereClause += " AND "
                End If
                

                whereClause += "CompanyName LIKE '%" + FilterCompanyName.Text.Replace("'", "''") + "%'"
            End If
            

            If Not (FilterContactName.Text = "") Then
           
                If Not (whereClause = "") Then
             
                    whereClause += " AND "
                End If
                
                whereClause += "ContactName LIKE '%" + FilterContactName.Text.Replace("'", "''") + "%'"
            End If

            If Not (FilterCountry.Text = "") Then
            
                If Not (whereClause = "") Then
               
                    whereClause += " AND "
                End If

                whereClause += "Country LIKE '%" + FilterCountry.Text.Replace("'", "''") + "%'"
            End If

            If Not (whereClause = "") Then
            
                commandText += " where " + whereClause
            End If
            
        End If
        

        Dim myComm As OleDbCommand = New OleDbCommand(commandText, myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
    End Sub

    Sub PopulateDetailGrid()

        Dim customerID As String = CurrentCustomerID.Value
        
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT * FROM Orders where CustomerID = '" + customerID + "'", myConn)
        myConn.Open()
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()

        grid2.DataSource = myReader
        grid2.DataBind()

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
			.floating
			{
			    float: left;
			    padding-right: 10px;
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
	        function filterMainGrid() {
	            document.getElementById('IsAppliedFilter').value = 1;
	            grid1.refresh();

	            return false;
	        }

	        function clearMainGridFilter() {
	            document.getElementById('IsAppliedFilter').value = 0;

	            //document.getElementById('CurrentCustomerID').value = 0;

	            FilterCustomerID.value('');
	            FilterCompanyName.value('');
	            FilterContactName.value('');
	            FilterCountry.value('');
	            
	            grid1.refresh();
	            //grid2.refresh();

	            return false;
	        }
	        
	        function grid1_Select(sender, records) {
	            document.getElementById('CurrentCustomerID').value = records[0].CustomerID;
	            grid2.refresh();
	        }
	    </script>
	</head>	
	<body>	
		<form runat="server">
		
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Master/Detail with External Filters</b></span>		
		
		<br /><br />
		
		<asp:HiddenField runat="server" ID="IsAppliedFilter" />
		<asp:HiddenField runat="server" ID="CurrentCustomerID" Value="0" />
		
		<table class="tdText">
		    <tr>
		        <td>Customer ID:</td>
		        <td><obout:OboutTextBox runat="server" ID="FilterCustomerID" /></td>
		    </tr>
		    <tr>
		        <td>Company Name:</td>
		        <td><obout:OboutTextBox runat="server" ID="FilterCompanyName" /></td>
		    </tr>
		    <tr>
		        <td>Contact Name:</td>
		        <td><obout:OboutTextBox runat="server" ID="FilterContactName" /></td>
		    </tr>
		    <tr>
		        <td>Country:</td>
		        <td><obout:OboutTextBox runat="server" ID="FilterCountry" /></td>
		    </tr>
		    <tr>
		        <td>&#160;</td>
		        <td>
		            <obout:OboutButton ID="OboutButton1" runat="server" Text="Filter" OnClientClick="return filterMainGrid();" Width="73" />
		            <obout:OboutButton ID="OboutButton2" runat="server" Text="Clear" OnClientClick="return clearMainGridFilter();" Width="73" />
		        </td>
		    </tr>
		</table>				
		
		<br />
		
		<span class="tdText">&#160;&#160;Customers:</span>
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		
		<span class="tdText">&#160;&#160;Orders:</span>
		<asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    The two grids are linked in a master/detail relationship. Select a customer in the first grid<br />
		    and his orders will be loaded in the second grid. You can use the external filter to search for <br />
		    specific records in the first grid. <br /><br />
		    <b>
		        All actions are performed using AJAX callbacks. No ASP.NET AJAX UpdatePanels are used.<br />
		        The asynchronous communication with the server is performed using the internal AJAX engine of the Grid,<br />
		        which is triggered by calling the <span class="option2">refresh</span> method on the client-side.
		    </b>
		</span>
			
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>