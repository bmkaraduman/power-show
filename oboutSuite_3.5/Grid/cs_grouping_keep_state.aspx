<%@ Page Language="C#" EnableEventValidation="false" %>
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
		grid1.Serialize = false;
		grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AllowGrouping = true;
        grid1.ShowCollapsedGroups = true;
        grid1.GroupBy = "ShipCountry,ShipCity";
        grid1.PageSize = -1;
        grid1.ClientSideEvents.OnClientCallback = "onCallback";

        grid1.FolderStyle = "styles/grand_gray";                
		
		// creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "ShipCountry";
        oCol1.HeaderText = "COUNTRY";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipCity";
        oCol2.HeaderText = "CITY";
        oCol2.Width = "150";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipPostalCode";
        oCol3.HeaderText = "POSTAL CODE";
        oCol3.Width = "150";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipName";
        oCol4.HeaderText = "NAME";
        oCol4.Width = "200";
        

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
				
		BindGrid();
	}	

	void BindGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
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
		<script type="text/javascript">
		    var lastExpandedGroupValues = new Array();
		    var groupingColumns = null;

		    function onCallback() {
		        groupingColumns = grid1.getColumnNamesUsedInGrouping();

		        var gridRows = grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes;

		        for (var i = 0; i < gridRows.length; i++) {
		            if (gridRows[i].className == 'ob_gRGH') {
		                var index = grid1.getGroupFirstRowIndex(gridRows[i]);

		                var cellValue = grid1.getCellValue(index);
		                var found = false;
		                for (var j = 0; j < lastExpandedGroupValues.length; j++) {
		                    if (grid1.compareCellValues(cellValue, lastExpandedGroupValues[j].cells) && grid1.getLevel(gridRows[i]) == lastExpandedGroupValues[j].level) {
		                        grid1.expandGroup(gridRows[i]);
		                        break;
		                    }
		                }
		            }
		        }
		    }

		    window.onload = function() {
		        setInterval(refreshGrid, 4000);
		    }

		    function refreshGrid() {
		        if (typeof (grid1) != 'undefined') {
		            grid1.refresh();
		        }
		    }
        </script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Keeping Groups Expanded</b></span>				
		
		<br /><br />
		
		<asp:RadioButton runat="server" ID="LastExpanded" GroupName="ExpandedType" Text="Keep the Last Expanded Group" AutoPostBack="true" CssClass="tdText" /><br />
		<asp:RadioButton runat="server" ID="AllExpanded" GroupName="ExpandedType" Text="Keep all Expanded Groups" AutoPostBack="true" CssClass="tdText" Checked="true" />
		
		<br /><br />
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<br /><br /><br />
		
		<span class="tdText">
		    The Grid is refreshed using a timer. The expanded groups keep their state across callbacks.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>

<script type="text/javascript">
    var Radio_LastExpanded = document.getElementById('LastExpanded');
    var Radio_AllExpanded = document.getElementById('AllExpanded');
    var trace = false;

    oboutGrid.prototype.manageGroupExpandCollapseOld = grid1.manageGroupExpandCollapse;
    oboutGrid.prototype.manageGroupExpandCollapse = function(obj, state) {
        this.manageGroupExpandCollapseOld(obj, state);

        if (groupingColumns == null) {
            groupingColumns = grid1.getColumnNamesUsedInGrouping();
        }

        var value = this.getGroupValue(obj);

        state = this.isExpandedGroup(obj);

        if (state == true) {
            if (Radio_LastExpanded.checked == true) {
                if (lastExpandedGroupValues.length > 0 && this.compareCellValues(lastExpandedGroupValues[lastExpandedGroupValues.length - 1].cells, value.cells)) {
                    lastExpandedGroupValues.push(value);
                } else {
                    lastExpandedGroupValues = new Array();
                    lastExpandedGroupValues[0] = value;

                    if (value.level > 0) {
                        var currentLevel = value.level;
                        var groupHeaderRow = this.getGroupHeaderRow(obj);
                        while (groupHeaderRow.previousSibling && currentLevel > 0) {
                            groupHeaderRow = groupHeaderRow.previousSibling;
                            if (groupHeaderRow.className == 'ob_gRGH') {
                                if (this.getLevel(groupHeaderRow) < currentLevel) {
                                    var tempValue = this.getGroupValue(groupHeaderRow.firstChild.firstChild.lastChild)
                                    for (var i = 0; i < lastExpandedGroupValues.length; i++) {
                                        if (!(this.compareCellValues(lastExpandedGroupValues[i].cells, tempValue.cells) && currentLevel == lastExpandedGroupValues[i].level)) {
                                            lastExpandedGroupValues.push(tempValue);
                                            break;
                                        }
                                    }

                                    currentLevel--;
                                }
                            }
                        }
                    }
                }
            } else {
                lastExpandedGroupValues.push(value);
            }
        } else {
            for (var i = 0; i < lastExpandedGroupValues.length; i++) {
                if (this.compareCellValues(lastExpandedGroupValues[i].cells, value.cells) && this.getLevel(this.getGroupHeaderRow(obj)) == lastExpandedGroupValues[i].level) {
                    lastExpandedGroupValues[i] = null;
                    lastExpandedGroupValues.splice(i, 1);
                }
            }
        }
    }

    oboutGrid.prototype.getGroupHeaderRow = function(obj) {
        if (obj.nodeName == 'IMG') {
            var row = obj.parentNode.parentNode.parentNode.parentNode;
        } else {
            var row = obj.parentNode.parentNode.parentNode;
        }

        return row;
    }

    oboutGrid.prototype.getGroupValue = function(obj) {
        var row = this.getGroupHeaderRow(obj);

        var levelsContainer = obj.parentNode;
        if (obj.nodeName == 'IMG') {
            levelsContainer = levelsContainer.parentNode;
        }

        var index = this.getGroupFirstRowIndex(row);

        var cells = this.getCellValue(index);

        var level = levelsContainer.childNodes.length - 3;

        return { cells: cells, level: level };
    }

    oboutGrid.prototype.getGroupFirstRowIndex = function(row) {
        var index = 0;
        var tempRow = row;
        while (row.previousSibling) {
            index++;
            row = row.previousSibling;
        }

        while (tempRow.className == 'ob_gRGH') {
            index++;
            tempRow = tempRow.nextSibling;
        }

        return index;
    }


    oboutGrid.prototype.getCellValue = function(index) {
        return this.Rows[index].Cells;
    }


    oboutGrid.prototype.expandGroup = function(groupHeader) {
        var container = this.getLevelsContainer(groupHeader);
        var img = container.childNodes[container.childNodes.length - 3].firstChild;
        this.manageGroupExpandCollapseOld(img, false);
    }

    oboutGrid.prototype.getLevelsContainer = function(groupHeader) {
        return groupHeader.firstChild.firstChild;
    }

    oboutGrid.prototype.getLevel = function(groupHeader) {
        var container = this.getLevelsContainer(groupHeader);

        return container.childNodes.length - 3;
    }

    oboutGrid.prototype.compareCellValues = function(cells1, cells2) {
        for (var i = 0; i < groupingColumns.length; i++) {
            if (cells1[groupingColumns[i]].Value != cells2[groupingColumns[i]].Value) {
                return false;
            }
        }

        return true;
    }

    oboutGrid.prototype.getColumnNamesUsedInGrouping = function() {
        var groupingArea = this.GridMainContainer.firstChild.childNodes[1];

        var columns = new Array();
        for (var i = 0; i < groupingArea.childNodes.length; i++) {
            if (groupingArea.childNodes[i].childNodes.length == 4) {
                columns.push(groupingArea.childNodes[i].childNodes[2].firstChild.nodeValue);
            }
        }

        return columns;
    }

    oboutGrid.prototype.isExpandedGroup = function(obj) {
        if (obj.nodeName == 'DIV') {
            obj = obj.previousSibling.firstChild;
        }

        return obj.src.toString().indexOf('group_btn_open.gif') == -1;
    }
</script>