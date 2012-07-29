<%@ Page Language="VB" EnableViewState="true"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        If Not Page.IsPostBack Then
            CreateGrid()
        End If
    End Sub
        	
    Sub CreateGrid()
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

        Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 Orders.*, OrderID as EMOrderID FROM Orders", myConn)
        myConn.Open()
        'Dim da = new OleDbDataAdapter()
        'Dim ds = new DataSet()
        'da.SelectCommand = myComm
        'da.Fill(ds, "Orders")
        Dim myReader As OleDbDataReader = myComm.ExecuteReader()


        grid1.DataSource = myReader
        grid1.DataBind()

        myConn.Close()
        
        EasyMenu1.AttachTo = ""
		      
    End Sub
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
        CreateGrid()
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
            .ob_gPST
            {
                display: none;
            }
            .ob_gPSS
            {
                display: none;
            }			
		</style>
        <script type="text/javascript">
            var editing = null;

            var rowPrefix;

            // find out the row Prefix 
            function getRowPrefix() {
                var row0 = grid1.getRecordsIds().split(",")[0];

                if (row0 != null) {
                    var lastPos = -1;
                    for (var i = row0.length - 1; i >= 0; i--) {
                        if (row0.charAt(i) == '_') {
                            lastPos = i;
                            break;
                        }
                    }

                    if (lastPos > -1) {
                        // get Prefix
                        return row0.substring(0, lastPos + 1);
                    }
                }



                return "";
            }

            function edit(OrderID) {
                if (editing != null) {
                    //cancel previous edit
                    cancelEdit(editing);
                }

                if (rowPrefix == null) {
                    rowPrefix = getRowPrefix();
                }

                grid1.editRecord(OrderID.replace(rowPrefix, ""));
                ob_em_EasyMenu1.detachFromControl(OrderID);
                ob_em_EasyMenu2.attachToControl(OrderID);
                editing = OrderID;

            }

            function deleteRecord(OrderID) {
                if (rowPrefix == null) {
                    rowPrefix = getRowPrefix();
                }
                grid1.deleteRow(OrderID.replace(rowPrefix, ""));

            }

            function update(OrderID) {
                if (rowPrefix == null) {
                    rowPrefix = getRowPrefix();
                }
                grid1.updateRecord(OrderID.replace(rowPrefix, ""));
                ob_em_EasyMenu2.detachFromControl(OrderID);
                ob_em_EasyMenu1.attachToControl(OrderID);
                editing = null;
            }

            function cancelEdit(OrderID) {
                if (rowPrefix == null) {
                    rowPrefix = getRowPrefix();
                }
                grid1.cancelEdit(OrderID.replace(rowPrefix, ""));
                ob_em_EasyMenu2.detachFromControl(OrderID);
                ob_em_EasyMenu1.attachToControl(OrderID);
                editing = null;
            }

            var previousSelectedRecord = null;
            function attachMenuToRecords() {
                // get a list with all the ids of the records	  
                var sRecordsIds = grid1.getRecordsIds();
                var arrRecordsIds = sRecordsIds.split(",");

                for (var i = 0; i < arrRecordsIds.length; i++) {
                    ob_em_EasyMenu1.detachFromControl(arrRecordsIds[i]);
                    ob_em_EasyMenu1.attachToControl(arrRecordsIds[i]);

                    var row = document.getElementById(arrRecordsIds[i]);

                    for (var j = 0; j < row.childNodes.length; j++) {
                        row.childNodes[j].oncontextmenu = function () { selectRecord(this); };
                    }
                }
            }

            function selectRecord(cell) {
                for (i = 0; i < grid1.Rows.length; i++) {
                    grid1.deselectRecord(i);
                }

                var row = cell.parentNode;
                var rowIndex = 0;
                while (row.previousSibling) {
                    row = row.previousSibling;
                    rowIndex++;
                }

                grid1.selectRecord(rowIndex);
            }
    </script>
		
	</head>

	
	
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Edit records using Context-Menu</b></span>
		<br /><br />		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" GenerateRecordIds="true" 	 AllowAddingRecords="false"
			AllowColumnResizing="true" ShowHeader="true" PageSize="10" ShowFooter="true" AllowMultiRecordSelection="false"
			AutoGenerateColumns="false" AllowFiltering="true"
			OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord" OnInsertCommand="InsertRecord" OnRebind="RebindGrid">
			<ClientSideEvents OnClientCallback="attachMenuToRecords"/>
			<Columns>
				<obout:Column ID="Column1" DataField="OrderID" HeaderText="Order ID" Width="105" runat="server" ReadOnly="true"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="Name" Width="200" runat="server"/>			
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="City" Width="155" runat="server" />			
                <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />				
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="Country" Width="125" runat="server" />
			</Columns>
		</obout:Grid>
		
		<br /><br /><br />
		
		<span class="tdText">
		Right-click on the records inside the grid.<br />
		The Context-Menu will pop-up, allowing you to edit/delete/update/cancel records.
        </span>		
		<br /><br /><br />
        
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
        <div id="div1" style="display: none"></div>
        <div id="div2" style="display: none"></div>		
        		
		</form>
	</body>
</html>


<oem:easymenu id="EasyMenu1" AttachTo="div1" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/styles/windowsxp"
	Width="200" UseIcons="true" IconsPosition="Left" Align="Under">
	<Components>	    
		<oem:MenuItem id="menuItem1" OnClientClick="try{ edit(targetEl.id);	} catch(e){}" InnerHtml="Edit"></oem:MenuItem>
		<oem:MenuItem id="menuItem2" OnClientClick="try{ deleteRecord(targetEl.id);} catch(e){}" InnerHtml="Delete"></oem:MenuItem>
	</Components>
</oem:easymenu>
<oem:easymenu id="EasyMenu2" AttachTo="div2" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/styles/windowsxp"
	Width="200" UseIcons="true" IconsPosition="Left" Align="Under">
	<Components>	    
		<oem:MenuItem id="menuItem3" OnClientClick="try{ update(targetEl.id); }	catch (e) { }" InnerHtml="Update"></oem:MenuItem>
		<oem:MenuItem id="menuItem4" OnClientClick="try{ cancelEdit(targetEl.id); }	catch (e){}" InnerHtml="Cancel"></oem:MenuItem>
	</Components>
</oem:easymenu>

<script type="text/javascript"> 
    // attach the menu to the records of the Grid       
    attachMenuToRecords();
</script>
