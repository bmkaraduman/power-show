<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
		
	void Page_load(object sender, EventArgs e)		
	{													
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
		
		grid1.FolderStyle = "styles/grand_gray";

		// setting the client-side events
		grid1.ClientSideEvents.OnClientDelete = "OnDelete";
        grid1.ClientSideEvents.OnClientUpdate = "OnUpdate";
        grid1.ClientSideEvents.OnClientInsert = "OnInsert";
        grid1.ClientSideEvents.OnBeforeClientDelete = "OnBeforeDelete";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert";
        
        grid1.ClientSideEvents.OnBeforeClientAdd = "OnBeforeAdd";
        grid1.ClientSideEvents.OnClientAdd = "OnAdd";
        grid1.ClientSideEvents.OnBeforeClientCancelAdd = "OnBeforeCancelAdd";
        grid1.ClientSideEvents.OnClientCancelAdd = "OnCancelAdd";
        grid1.ClientSideEvents.OnClientInsert = "OnInsert";
        grid1.ClientSideEvents.OnBeforeClientInsert = "OnBeforeInsert";
        grid1.ClientSideEvents.OnBeforeClientEdit = "OnBeforeEdit";
        grid1.ClientSideEvents.OnClientEdit = "OnEdit";
        grid1.ClientSideEvents.OnBeforeClientCancelEdit = "OnBeforeCancelEdit";
        grid1.ClientSideEvents.OnClientCancelEdit = "OnCancelEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "OnBeforeUpdate";
        grid1.ClientSideEvents.OnClientUpdate = "OnUpdate";
        grid1.ClientSideEvents.OnBeforeClientDelete = "OnBeforeDelete";
        grid1.ClientSideEvents.OnClientDelete = "OnDelete";
		
		// setting the event handlers
		grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
		grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
		grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);		

		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "100";

		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";
		oCol2.HeaderText = "NAME";
		oCol2.Width = "200";

		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";

		Column oCol4 = new Column();
		oCol4.DataField = "ShipPostalCode";
		oCol4.HeaderText = "POSTAL CODE";
		oCol4.Width = "150";

		Column oCol5 = new Column();
		oCol5.DataField = "ShipCountry";
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";

		Column oCol6 = new Column();
		oCol6.HeaderText = "EDIT";
		oCol6.Width = "125";
		oCol6.AllowEdit = true;
        oCol6.AllowDelete = true;

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
		if (!Page.IsPostBack)
		{
			BindGrid();			
		}
	}

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();


        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipCountry)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
	}
	</script>

<script type="text/javascript">
	// Client-Side Events for Add
	function OnBeforeAdd(record) {
	    if(document.getElementById("chkConfBeforeAdd").checked == true) {						
			if(confirm("Are you sure you want to add a new order?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnAdd(record) {
	    if(document.getElementById("chkConfAfterAdd").checked == true) {									
			document.getElementById("txtEvents").value = "A new order was put in add mode.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for cancelling Add
	function OnBeforeCancelAdd(record) {
	    if(document.getElementById("chkConfBeforeCancelAdd").checked == true) {						
			if(confirm("Are you sure you want to cancel the adding of a new order (for " + record.ShipName + ") ?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnCancelAdd(record) {
	    if(document.getElementById("chkConfAfterCancelAdd").checked == true) {									
			document.getElementById("txtEvents").value = "The adding of a new order (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for Insert
	function OnBeforeInsert(record) {
		if(document.getElementById("chkConfBeforeInsert").checked == true) {
			if(confirm("Are you sure you want to insert this new order for " + record.ShipName + " ?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnInsert(record) {
		if(document.getElementById("chkConfAfterInsert").checked == true) {			
			document.getElementById("txtEvents").value = "A new order was created for " + record.ShipName + ".\n" + document.getElementById("txtEvents").value;
		}
	}
	
	// Client-Side Events for Edit
	function OnBeforeEdit(record) {
	    if(document.getElementById("chkConfBeforeEdit").checked == true) {						
			if(confirm("Are you sure you want to edit order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnEdit(record) {
	    if(document.getElementById("chkConfAfterEdit").checked == true) {									
			document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was put in edit mode.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for Canceling Edit
	function OnBeforeCancelEdit(record) {
	    if(document.getElementById("chkConfBeforeCancelEdit").checked == true) {						
			if(confirm("Are you sure you want to cancel the editing of order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnCancelEdit(record) {
	    if(document.getElementById("chkConfAfterCancelEdit").checked == true) {									
			document.getElementById("txtEvents").value = "The editing of order " + record.OrderID + " (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for Update
	function OnBeforeUpdate(record) {
		if(document.getElementById("chkConfBeforeUpdate").checked == true) {						
			if(confirm("Are you sure you want to update order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
				return false;
			}
		}
		return true;
	}
	function OnUpdate(record) {
		if(document.getElementById("chkConfAfterUpdate").checked == true) {			
			document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was updated.\n" + document.getElementById("txtEvents").value;
		}
	}
		
	// Client-Side Events for Delete
	function OnBeforeDelete(record) {
		if(document.getElementById("chkConfBeforeDelete").checked == true) {
			if(confirm("Are you sure you want to delete order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
				 return false;
			}
		}
		return true;
	}
	function OnDelete(record) {
		if(document.getElementById("chkConfAfterDelete").checked == true) {			
			document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was deleted.\n" + document.getElementById("txtEvents").value;
		}
	}
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
	</head>
	<body>		
		<form runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Client-Side Events</b></span>
		<br /><br />
		
		<table cellspacing="2" cellpadding="0">
			<tr>
				<td valign="top">
				    <fieldset class="tdText">
				        <legend>Add/Insert</legend>
					    <table cellspacing="2" cellpadding="0">
					        <tr>
							    <td class="tdText">Confirmation before add</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeAdd" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after add</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterAdd" class="tdText" checked="checked" /></td>
						    </tr>
					        <tr>
							    <td class="tdText">Confirmation before cancelling add</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeCancelAdd" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after cancelling add</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterCancelAdd" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Confirmation before insert</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeInsert" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after insert</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterInsert" class="tdText" checked="checked" /></td>
						    </tr>
					    </table>
					</fieldset>
				</td>
				<td class="tdText" width="20">&#160;</td>
				<td valign="top">
				    <fieldset class="tdText">
				        <legend>Edit/Update/Cancel</legend>
					    <table cellspacing="2" cellpadding="0">
					        <tr>
							    <td class="tdText">Confirmation before edit</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeEdit" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after edit</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterEdit" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Confirmation before cancelling edit</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeCancelEdit" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after cancelling edit</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterCancelEdit" class="tdText" checked="checked" /></td>
						    </tr>
                            <tr>
							    <td class="tdText">Confirmation before update</td>
							    <td class="tdText"><input type="checkbox" id="chkConfBeforeUpdate" class="tdText" checked="checked" /></td>
						    </tr>
						    <tr>
							    <td class="tdText">Message after update</td>
							    <td class="tdText"><input type="checkbox" id="chkConfAfterUpdate" class="tdText" checked="checked" /></td>
						    </tr>
					    </table>
					</fieldset>
				</td>
				<td class="tdText" width="20">&#160;</td>
				<td valign="top">
				    <fieldset class="tdText">
				        <legend>Delete</legend>
				        <table cellspacing="2" cellpadding="0">
				            <tr>
						        <td class="tdText">Confirmation before delete</td>
						        <td class="tdText"><input type="checkbox" id="chkConfBeforeDelete" class="tdText" checked="checked" /></td>
					        </tr>
					        <tr>
						        <td class="tdText">Message after delete</td>
						        <td class="tdText"><input type="checkbox" id="chkConfAfterDelete" class="tdText" checked="checked" /></td>
					        </tr>
				        </table>
			        </fieldset>
				</td>
			</tr>
		</table>
		
		<br /><br />
		<span class="tdText">Events:<br /></span>
		<textarea rows="9" cols="100" class="tdText" id="txtEvents"></textarea>
		<br /><br />
						
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>

		<br /><br /><br />
		<span class="tdText">
		The ASP.NET Grid has a number of properties for executing client-side events.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_clientside_events.aspx">Client-Side Events</a> tutorial and the <a href="http://www.obout.com/grid/doc_grid_events.aspx">Events documentation</a>.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>

