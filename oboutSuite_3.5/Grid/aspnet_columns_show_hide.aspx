<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{		
		if (!Page.IsPostBack)
		{
			CreateGrid();			
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

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
		function show_hide_Column(index) {
	        var oChk = document.getElementById("chkCol" + index);
	        if(oChk.checked == true) {  
	            grid1.showColumn(index);
	        } else {
	            grid1.hideColumn(index);
	        }
	    }
		</script>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Show/Hide columns</b></span>
		<br /><br /><br />
		<span class="tdText">Check/uncheck the checkboxes to show/hide the columns</span>
		<table>
		    <tr>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol0" onclick="show_hide_Column(0)" checked="checked" /> ORDER ID
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol1" onclick="show_hide_Column(1)" checked="checked" /> NAME
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol2" onclick="show_hide_Column(2)" checked="checked" /> CITY
		        </td>
		    </tr>
		    <tr>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol3" onclick="show_hide_Column(3)" checked="checked" /> POSTAL CODE
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol4" onclick="show_hide_Column(4)" checked="checked" /> COUNTRY
		        </td>
		        <td class="tdText">
		            <input type="checkbox" id="chkCol5" onclick="show_hide_Column(5)" checked="checked" /> ORDER DATE
		        </td>
		    </tr>
		</table>
		<br />		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" ShowFooter="true"
			 FolderStyle="styles/black_glass" AllowColumnResizing="true" AllowAddingRecords="false"
			 AllowPaging="false" AllowPageSizeSelection="true">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column DataField="OrderDate" HeaderText="ORDER DATE" Width="200" runat="server" />
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>showColumn</b> and <b>hideColumn</b> client-side methods to show/hide columns from the Grid.<br />
		Use the index or the DataField of the column as the parameter for these methods.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>		
	</body>
</html>