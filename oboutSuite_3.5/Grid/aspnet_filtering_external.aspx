<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        PopulateMainGrid();
        PopulateDetailGrid();
    }

    protected void PopulateMainGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        string commandText = "SELECT * FROM Customers";
        string whereClause = "";

        if (IsAppliedFilter.Value == "1")
        {
            if (FilterCustomerID.Text != "")
            {
                whereClause += "CustomerID LIKE '%" + FilterCustomerID.Text.Replace("'", "''") + "%'";
            }

            if (FilterCompanyName.Text != "")
            {
                if (whereClause != "")
                {
                    whereClause += " AND ";
                }

                whereClause += "CompanyName LIKE '%" + FilterCompanyName.Text.Replace("'", "''") + "%'";
            }

            if (FilterContactName.Text != "")
            {
                if (whereClause != "")
                {
                    whereClause += " AND ";
                }


                whereClause += "ContactName LIKE '%" + FilterContactName.Text.Replace("'", "''") + "%'";
            }

            if (FilterCountry.Text != "")
            {
                if (whereClause != "")
                {
                    whereClause += " AND ";
                }


                whereClause += "Country LIKE '%" + FilterCountry.Text.Replace("'", "''") + "%'";
            }

            if (whereClause != "")
            {
                commandText += " where " + whereClause;
            }
        }
        

        OleDbCommand myComm = new OleDbCommand(commandText, myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    protected void PopulateDetailGrid()
    {
        string customerID = CurrentCustomerID.Value;
        
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Orders where CustomerID = '" + customerID + "'", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid2.DataSource = myReader;
        grid2.DataBind();

        myConn.Close();
    }
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
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false"
			AllowMultiRecordSelection="false">
			<ClientSideEvents OnClientSelect="grid1_Select" ExposeSender="true" />
			<Columns>			    
				<obout:Column DataField="CustomerID" HeaderText="CUSTOMER ID" Visible="false"></obout:Column>
                <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250"></obout:Column>
                <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Width="250"></obout:Column>
                <obout:Column DataField="Country" HeaderText="COUNTRY"></obout:Column> 
			</Columns>
			<FilteringSettings />
		</obout:Grid>
		
		<br />
		
		<span class="tdText">&#160;&#160;Orders:</span>
		<obout:Grid id="grid2" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false"
			AllowFiltering="true" FilterType="ProgrammaticOnly">
			<Columns>			    
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server" />
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />	
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>
				<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" Visible="false" HeaderText="ORDER ID" Width="125" runat="server"/>
			</Columns>
			<FilteringSettings />
		</obout:Grid>
		
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