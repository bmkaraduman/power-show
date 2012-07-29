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
		CreateGrid();
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

		    // Client-Side Events for Add
		    function OnBeforeAdd(record) {
		        if (document.getElementById("chkConfBeforeAdd").checked == true) {
		            if (confirm("Are you sure you want to add a new order?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnAdd(record) {
		        if (document.getElementById("chkConfAfterAdd").checked == true) {
		            document.getElementById("txtEvents").value = "A new order was put in add mode.\n" + document.getElementById("txtEvents").value;
		        }
		        return true;
		    }

		    // Client-Side Events for cancelling Add
		    function OnBeforeCancelAdd(record) {
		        if (document.getElementById("chkConfBeforeCancelAdd").checked == true) {
		            if (confirm("Are you sure you want to cancel the adding of a new order (for " + record.ShipName + ") ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnCancelAdd(record) {
		        if (document.getElementById("chkConfAfterCancelAdd").checked == true) {
		            document.getElementById("txtEvents").value = "The adding of a new order (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
		        }
		        return true;
		    }

		    // Client-Side Events for Insert
		    function OnBeforeInsert(record) {
		        if (document.getElementById("chkConfBeforeInsert").checked == true) {
		            if (confirm("Are you sure you want to insert this new order for " + record.ShipName + " ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnInsert(record) {
		        if (document.getElementById("chkConfAfterInsert").checked == true) {
		            document.getElementById("txtEvents").value = "A new order was created for " + record.ShipName + ".\n" + document.getElementById("txtEvents").value;
		        }
		    }

		    // Client-Side Events for Edit
		    function OnBeforeEdit(record) {
		        if (document.getElementById("chkConfBeforeEdit").checked == true) {
		            if (confirm("Are you sure you want to edit order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnEdit(record) {
		        if (document.getElementById("chkConfAfterEdit").checked == true) {
		            document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was put in edit mode.\n" + document.getElementById("txtEvents").value;
		        }
		        return true;
		    }

		    // Client-Side Events for Canceling Edit
		    function OnBeforeCancelEdit(record) {
		        if (document.getElementById("chkConfBeforeCancelEdit").checked == true) {
		            if (confirm("Are you sure you want to cancel the editing of order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnCancelEdit(record) {
		        if (document.getElementById("chkConfAfterCancelEdit").checked == true) {
		            document.getElementById("txtEvents").value = "The editing of order " + record.OrderID + " (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
		        }
		        return true;
		    }

		    // Client-Side Events for Update
		    function OnBeforeUpdate(record) {
		        if (document.getElementById("chkConfBeforeUpdate").checked == true) {
		            if (confirm("Are you sure you want to update order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnUpdate(record) {
		        if (document.getElementById("chkConfAfterUpdate").checked == true) {
		            document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was updated.\n" + document.getElementById("txtEvents").value;
		        }
		    }

		    // Client-Side Events for Delete
		    function OnBeforeDelete(record) {
		        if (document.getElementById("chkConfBeforeDelete").checked == true) {
		            if (confirm("Are you sure you want to delete order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
		                return false;
		            }
		        }
		        return true;
		    }
		    function OnDelete(record) {
		        if (document.getElementById("chkConfAfterDelete").checked == true) {
		            document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was deleted.\n" + document.getElementById("txtEvents").value;
		        }
		    }
        </script>		
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
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" OnRebind="RebindGrid" 
			OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<ClientSideEvents
			    OnBeforeClientAdd="OnBeforeAdd" OnClientAdd="OnAdd"
			    OnBeforeClientCancelAdd="OnBeforeCancelAdd" OnClientCancelAdd="OnCancelAdd"
			    OnClientInsert="OnInsert" OnBeforeClientInsert="OnBeforeInsert"
			    OnBeforeClientEdit="OnBeforeEdit" OnClientEdit="OnEdit"
			    OnBeforeClientCancelEdit="OnBeforeCancelEdit" OnClientCancelEdit="OnCancelEdit"
			    OnBeforeClientUpdate="OnBeforeUpdate" OnClientUpdate="OnUpdate"
			    OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete"/>
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />				
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>				
		</obout:Grid>		

		<br /><br /><br />
		<span class="tdText">
		The ASP.NET Grid has a number of properties for executing client-side events.<br /><br />
		See the <a href="http://www.obout.com/grid/grid_tutorials_clientside_events.aspx">Client-Side Events</a> tutorial and the <a href="http://www.obout.com/grid/doc_grid_events.aspx">Events documentation</a>.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

