<%@ Page Language="C#" AutoEventWireup="true"%>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders", myConn);
        myConn.Open();

        OleDbDataReader myReader = myComm.ExecuteReader();

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
<script type="text/javascript">	

    var myconfirm = 0;
    
    
	// Client-Side Events for Add
	function OnBeforeAdd(record) {
		if(myconfirm == 1)
		{
		    return true;
		}
		else
		{
		    if(document.getElementById("chkConfBeforeAdd").checked == true) {
	            myConfirmBeforeAdd.Open();
		    }
		    return false;
		}
	}
	
	function OnAdd(record) {
	    if(document.getElementById("chkConfAfterAdd").checked == true) {									
			document.getElementById("txtEvents").value = "A new order was put in add mode.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for cancelling Add
	function OnBeforeCancelAdd(record) {
        if(myconfirm == 1)
		{
		    return true;
		}
		else
		{
		    if(document.getElementById("chkConfBeforeCancelAdd").checked == true) {
		        document.getElementById('myConfirmBeforeCancelAddContent').innerHTML = "Are you sure you want to cancel the adding of a new order (for " + record.ShipName + ") ?";
	            myConfirmBeforeCancelAdd.Open();
		    }
		    return false;
		}
	}
	
	function OnCancelAdd(record) {
	    if(document.getElementById("chkConfAfterCancelAdd").checked == true) {									
			document.getElementById("txtEvents").value = "The adding of a new order (for " + record.ShipName + ") was canceled.\n" + document.getElementById("txtEvents").value;
		}
		return true;
	}
	
	// Client-Side Events for Insert
	function OnBeforeInsert(record) {
		if(myconfirm == 1)
		{
		    return true;
		}
		else
		{
		    if(document.getElementById("chkConfBeforeInsert").checked == true) {
		        document.getElementById('myConfirmBeforeInsertContent').innerHTML = "Are you sure you want to insert this new order for " + record.ShipName + " ?";
	            myConfirmBeforeInsert.Open();
		    }
		    return false;
		}
	}
	function OnInsert(record) {
		if(document.getElementById("chkConfAfterInsert").checked == true) {			
			document.getElementById("txtEvents").value = "A new order was created for " + record.ShipName;
		}
	}
	
	// Client-Side Events for Update
	function OnBeforeUpdate(record) {
//		if(document.getElementById("chkConfBeforeUpdate").checked == true) {						
//			if(confirm("Are you sure you want to update order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
//				return false;
//			}
//		}
//		return true;
		
		if(myconfirm == 1)
		{
		    return true;
		}
		else
		{
		    if(document.getElementById("chkConfBeforeUpdate").checked == true) {
		        document.getElementById('myConfirmBeforeUpdateContent').innerHTML = "Are you sure you want to update order " + record.OrderID + " (for " + record.ShipName + ") ?";
	            myConfirmBeforeUpdate.Open();
		    }
		    return false;
		}
	}
	function OnUpdate(record) {
		if(document.getElementById("chkConfAfterUpdate").checked == true) {			
			document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was updated.";
		}
	}
		
	// Client-Side Events for Delete
	function OnBeforeDelete(record) {
//		if(document.getElementById("chkConfBeforeDelete").checked == true) {
//			if(confirm("Are you sure you want to delete order " + record.OrderID + " (for " + record.ShipName + ") ?") == false) {
//				 return false;
//			}
//		}
//		return true;
		
		if(myconfirm == 1)
		{
		    return true;
		}
		else
		{
		    if(document.getElementById("chkConfBeforeDelete").checked == true) {
		        document.getElementById('myConfirmBeforeDeleteContent').innerHTML = "Are you sure you want to delete order " + record.OrderID + " (for " + record.ShipName + ") ?";
	            document.getElementById('myConfirmBeforeDeleteHidden').value = findIndex(record);
	            myConfirmBeforeDelete.Open();
		    }
		    return false;
		}
	}
	function OnDelete(record) {
		if(document.getElementById("chkConfAfterDelete").checked == true) {			
			document.getElementById("txtEvents").value = "The order " + record.OrderID + " (for " + record.ShipName + ") was deleted.";
		}
	}
	
	function findIndex(record)
	{
	    var index = -1;
        for(var i=0; i<grid1.Rows.length; i++) {
            if(grid1.Rows[i].Cells[0].Value == record.OrderID) {
                index = i;
                break;
            }
        }
        return index;
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
<form runat="server">
	<span class="tdText"><b>ASP.NET Grid - Confirmation Using Window</b></span>
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
		FolderStyle="../grid/styles/black_glass" OnRebind="RebindGrid" 
		OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
		<ClientSideEvents
		    OnBeforeClientAdd="OnBeforeAdd" OnClientAdd="OnAdd"
		    OnBeforeClientCancelAdd="OnBeforeCancelAdd" OnClientCancelAdd="OnCancelAdd"
		    OnClientInsert="OnInsert" OnBeforeClientInsert="OnBeforeInsert"
		    OnBeforeClientUpdate="OnBeforeUpdate" OnClientUpdate="OnUpdate"
		    OnBeforeClientDelete="OnBeforeDelete" OnClientDelete="OnDelete"/>
		<Columns>
			<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
			<obout:Column DataField="ShipName" HeaderText="NAME" Width="190" runat="server"/>				
			<obout:Column DataField="ShipCity" HeaderText="CITY" Width="130" runat="server" />				
			<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="110" runat="server" />
			<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
		</Columns>				
	</obout:Grid>

	<owd:Dialog ID="myAlert" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Alert" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center"><div id="dAlertContent"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="left"><input type="button" value="OK" onclick="" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <owd:Dialog ID="myConfirmBeforeAdd" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Confirm" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center">Are you sure you want to add a new order?</td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="center">
                                <input type="button" value="Yes" onclick="ConfirmBeforeAddOnclick();" />
                                <input type="button" value="No" onclick="myConfirmBeforeAdd.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <owd:Dialog ID="myConfirmBeforeCancelAdd" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Confirm" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center"><div id="myConfirmBeforeCancelAddContent"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="center">
                                <input type="button" value="Yes" onclick="ConfirmBeforeCancelAddOnClick();" />
                                <input type="button" value="No" onclick="myConfirmBeforeCancelAdd.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <owd:Dialog ID="myConfirmBeforeInsert" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Confirm" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center"><div id="myConfirmBeforeInsertContent"></div></td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="center">
                                <input type="button" value="Yes" onclick="ConfirmBeforeInsertOnClick();" />
                                <input type="button" value="No" onclick="myConfirmBeforeInsert.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <owd:Dialog ID="myConfirmBeforeUpdate" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Confirm" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center"><div id="myConfirmBeforeUpdateContent"></div>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="center">
                                <input type="button" value="Yes" onclick="ConfirmBeforeUpdateOnClick();" />
                                <input type="button" value="No" onclick="myConfirmBeforeUpdate.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <owd:Dialog ID="myConfirmBeforeDelete" runat="server" Height="180" StyleFolder="../window/wdstyles/default" Title="Confirm" Width="300" IsModal="true">
       <center>
       <br />
        <table>
            <tr>
                <td align="center"><div id="myConfirmBeforeDeleteContent"></div>
                <input type="hidden" value="" id="myConfirmBeforeDeleteHidden" />
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />
                    <table style="width:150px">
                        <tr>
                            <td align="center">
                                <input type="button" value="Yes" onclick="ConfirmBeforeDeleteOnClick();" />
                                <input type="button" value="No" onclick="myConfirmBeforeDelete.Close();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        </center>
    </owd:Dialog>
    <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
<script type="text/javascript">
function ConfirmBeforeAddOnclick()
{
    myconfirm = 1;
    grid1.addRecord();
    myConfirmBeforeAdd.Close(); 
    myconfirm = 0;
}

function ConfirmBeforeCancelAddOnClick()
{
    myconfirm = 1;
    grid1.cancelNewRecord();
    myConfirmBeforeCancelAdd.Close(); 
    myconfirm = 0;
}

function ConfirmBeforeInsertOnClick()
{
    myconfirm = 1;
    grid1.insertRecord();
    myConfirmBeforeInsert.Close(); 
    myconfirm = 0;
}

function ConfirmBeforeUpdateOnClick()
{
    myconfirm = 1;
    grid1.update_record(grid1.RecordInEditMode);
    myConfirmBeforeUpdate.Close(); 
    myconfirm = 0;
}

function ConfirmBeforeDeleteOnClick()
{
    myconfirm = 1;
    grid1.delete_record(document.getElementById('myConfirmBeforeDeleteHidden').value);
    myConfirmBeforeDelete.Close(); 
    myconfirm = 0;
}
</script>