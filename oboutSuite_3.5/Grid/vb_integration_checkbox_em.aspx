<%@ Page Title="" Language="VB" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="vb_integration_checkbox_em.aspx.vb" Inherits="Grid_vb_integration_checkbox_em" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<script type="text/javascript">
    window.onload = function () {
        attachMenuToRecords();
    }

    function attachMenuToRecords() {
        // get a list with all the ids of the records   
        var sRecordsIds = Grid1.getRecordsIds();
        var arrRecordsIds = sRecordsIds.split(",");

        for (var i = 0; i < arrRecordsIds.length; i++) {
            var row = document.getElementById(arrRecordsIds[i]);
            for (var j = 0; j < row.childNodes.length; j++) {
                row.childNodes[j].oncontextmenu = function () { return false; };
                row.childNodes[j].firstChild.oncontextmenu = function () { return false; };
                row.childNodes[j].firstChild.firstChild.oncontextmenu = function () { return false; };
            }
            ob_em_EasyMenu1.detachFromControl(arrRecordsIds[i]);
            ob_em_EasyMenu1.attachToControl(arrRecordsIds[i]);
        }
    }

    var editing = null;

    var rowPrefix;

    // find out the row Prefix 
    function getRowPrefix() {
        var row0 = Grid1.getRecordsIds().split(",")[0];

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

        Grid1.editRecord(OrderID.replace(rowPrefix, ""));
        ob_em_EasyMenu1.detachFromControl(OrderID);
        ob_em_EasyMenu2.attachToControl(OrderID);
        editing = OrderID;

    }

    function deleteRecord(OrderID) {
        if (rowPrefix == null) {
            rowPrefix = getRowPrefix();
        }
        Grid1.deleteRow(OrderID.replace(rowPrefix, ""));

    }

    function update(OrderID) {
        if (rowPrefix == null) {
            rowPrefix = getRowPrefix();
        }
        Grid1.updateRecord(OrderID.replace(rowPrefix, ""));
        ob_em_EasyMenu2.detachFromControl(OrderID);
        ob_em_EasyMenu1.attachToControl(OrderID);
        editing = null;
    }

    function cancelEdit(OrderID) {
        if (rowPrefix == null) {
            rowPrefix = getRowPrefix();
        }
        Grid1.cancelEdit(OrderID.replace(rowPrefix, ""));
        ob_em_EasyMenu2.detachFromControl(OrderID);
        ob_em_EasyMenu1.attachToControl(OrderID);
        editing = null;
    }
           
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />

	<span class="tdText"><b>ASP.NET Grid - Context menu and CheckBoxes</b></span>		
	
    <br /><br />
	
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT TOP 500 [OrderID], [ShipName], [ShipCity], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
        InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity,ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
        DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
        <InsertParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />                
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ShipName" Type="String" />
            <asp:Parameter Name="ShipCity" Type="String" />
            <asp:Parameter Name="ShipPostalCode" Type="String" />
            <asp:Parameter Name="ShipCountry" Type="String" />
            <asp:Parameter Name="OrderID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />                
        </DeleteParameters>
    </asp:SqlDataSource>

    <oem:EasyMenu id="EasyMenu1" AttachTo="div1" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/Styles/windowsxp"
	    Width="200" UseIcons="true" IconsPosition="Left" Align="Under" ZIndex="999">
	    <Components>	    
		    <oem:MenuItem id="menuItem1" OnClientClick="try{ edit(targetEl.id);	} catch(e){}" InnerHtml="Edit"></oem:MenuItem>
		    <oem:MenuItem id="menuItem2" OnClientClick="try{ deleteRecord(targetEl.id);} catch(e){}" InnerHtml="Delete"></oem:MenuItem>
	    </Components>
    </oem:EasyMenu>
    <oem:EasyMenu id="EasyMenu2" AttachTo="div2" ShowEvent="ContextMenu" runat="server" StyleFolder="../EasyMenu/Styles/windowsxp"
	    Width="200" UseIcons="true" IconsPosition="Left" Align="Under" ZIndex="999">
	    <Components>	    
		    <oem:MenuItem id="menuItem3" OnClientClick="try{ update(targetEl.id); }	catch (e) { }" InnerHtml="Update"></oem:MenuItem>
		    <oem:MenuItem id="menuItem4" OnClientClick="try{ cancelEdit(targetEl.id); }	catch (e){}" InnerHtml="Cancel"></oem:MenuItem>
	    </Components>
    </oem:EasyMenu>	
    
    <br />

    <span class="tdText">
        The Grid provides various types of columns that are designed to perform a specific task.<br />
        This example showcases the use of a a <b>CheckBoxSelectColumn</b> along with a context menu for editing / deleting records.<br /><br />
        See also <a href="http://www.obout.com/grid/aspnet_columns_types_select.aspx">CheckBoxSelectColumn</a> example.
    </span>
    	
</asp:Content>
