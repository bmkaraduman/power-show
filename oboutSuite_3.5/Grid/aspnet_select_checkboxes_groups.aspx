<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

            .ob_gGA
            {
                  display: none;
            }
            .ob_gBLSWG, .ob_gBRSWG
            {
                  top: 17px !important;
            }
            .ob_gGACont
            {
                  height: 17px !important;
                  position: relative !important;
                  background-image: url(styles/black_glass/header_corner_middle.png) !important;
                  background-repeat: repeat-x !important;
                  font-size: 1px !important;
                  margin-left: 20px !important;
                  margin-right: 20px !important;
            }
            .ob_gGACnL
            {
                  background-image: url(styles/black_glass/header_corner_left.png) !important;
                  height: 17px !important;
                  width: 25px !important;
                  background-repeat: no-repeat !important;
                  position: absolute !important;
                  left: -25px !important;
            }
            .ob_gGACnR
            {
                  background-image: url(styles/black_glass/header_corner_right.png) !important;
                  height: 17px !important;
                  width: 25px !important;
                  background-repeat: no-repeat !important;
                  position: absolute !important;
                  right: -25px !important;
            }
		</style>
		<script type="text/javascript">
            function SelectDeselect(oCheckbox) {
                var oElement = oCheckbox.parentNode;
                while(oElement != null && oElement.nodeName != "TR") {
                    oElement = oElement.parentNode;
                }

                if(oElement != null) {
                    // oElement represents the row where the clicked      
                            // checkbox reside
                    var oContainer = oElement.parentNode;
                    var iRecordIndex = -1;
                    for(var i=0; i<oContainer.childNodes.length; i++) {
                        if(oContainer.childNodes[i] == oElement) {
                            iRecordIndex = i;
                            break;
                        }
                    }
                   
                    if(iRecordIndex != -1) {
                        if(oCheckbox.checked == true) {
                            // select the record
                            grid1.selectRecord(iRecordIndex);
                        } else {
                            // deselect the record
                            grid1.deselectRecord(iRecordIndex);
                        }
                    }
                }
            }

            function stopEventPropagation(e) {
                if(!e){e=window.event;}
	            if(!e){return false;}
	            e.cancelBubble=true;
	            if(e.stopPropagation){e.stopPropagation();}
            }

            function assignEventsToCheckboxes() {

                document.getElementById('ChkSelector').checked = false;
            
                // disable the record selection feature by clicking on the records
                var sRecordsIds = grid1.getRecordsIds();                
                var arrRecordsIds = sRecordsIds.split(",");
                for(var i=0; i<arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    if (oRecord) {
                        oRecord.onmousedown = function (e) { stopEventPropagation(e); };
                        oRecord.onclick = function (e) { stopEventPropagation(e); };
                    }
                }
                
                // populate the previously checked checkboxes
                var arrPageSelectedRecords = grid1.PageSelectedRecords;
                for(var i=0; i<arrPageSelectedRecords.length; i++) {
                    var oCheckbox = document.getElementById("chk_grid_" + arrPageSelectedRecords[i].ProductID);
                    if (oCheckbox) {
                        oCheckbox.checked = true;
                    }
                }
            
                // enable the record selection feature by selecting the checkboxes
                var arrCheckboxes = document.getElementsByTagName("INPUT");    
                for(var i=0; i<arrCheckboxes.length; i++) {
                    if (arrCheckboxes[i].type == "checkbox" && (arrCheckboxes[i].id.indexOf("chk_grid_") == 0 || arrCheckboxes[i].id.indexOf("ChkGroupSelector_") == 0)) {
                        arrCheckboxes[i].onmousedown = function (e) { stopEventPropagation(e); };
                        if (arrCheckboxes[i].id.indexOf("chk_grid_") == 0) {
                            arrCheckboxes[i].onclick = function (e) { SelectDeselect(this); stopEventPropagation(e); manageMasterState(); };
                        } else {
                            arrCheckboxes[i].onclick = function (e) { toggleGroupSelection(this); stopEventPropagation(e); };
                        }
                    }
                }

                manageMasterState();
            }

            function toggleSelection(checkbox) {
                var arrCheckboxes = document.getElementsByTagName("INPUT");
                for (var i = 0; i < arrCheckboxes.length; i++) {
                    if (arrCheckboxes[i].type == "checkbox" && (arrCheckboxes[i].id.indexOf("chk_grid_") == 0 || arrCheckboxes[i].id.indexOf("ChkGroupSelector_") == 0)) {
                        if (arrCheckboxes[i].checked != checkbox.checked) {
                            arrCheckboxes[i].checked = checkbox.checked;
                            if (arrCheckboxes[i].id.indexOf("chk_grid_") == 0) {
                                SelectDeselect(arrCheckboxes[i]);
                            } else {
                                toggleGroupSelection(arrCheckboxes[i]);
                            }
                        }
                    }
                }
            }

            function toggleGroupSelection(groupCheckBox) {
                var element = groupCheckBox.parentNode;
                while (element != null && element.nodeName != "TR") {
                    element = element.parentNode;
                }

                var index = 0;
                while (element.previousSibling != null) {
                    index++;
                    element = element.previousSibling;
                }

                var categoryId = 0;
                for (var i = index + 1; i < grid1.Rows.length; i++) {
                    if (grid1.Rows[i] && grid1.Rows[i].Cells) {
                        categoryId = grid1.Rows[i].Cells['CategoryID'].Value;
                        index = i;
                        break;
                    }
                }

                for (var i = index; i < grid1.Rows.length; i++) {
                    if (grid1.Rows[i] == null || grid1.Rows[i].Cells['CategoryID'].Value != categoryId) {
                        break;
                    }

                    var checkBox = document.getElementById('chk_grid_' + grid1.Rows[i].Cells['ProductID'].Value)
                 
                    if (checkBox.checked != groupCheckBox.checked) {
                        checkBox.checked = groupCheckBox.checked;
                        SelectDeselect(checkBox);
                    }
                }
            }

            function manageMasterState() {
                var newState = true;

                var groupCheckBox = null;
                var groupState = true;

                var arrCheckboxes = document.getElementsByTagName("INPUT");    
                for(var i=0; i<arrCheckboxes.length; i++) {
                    if (arrCheckboxes[i].type == "checkbox") {
                        if (arrCheckboxes[i].id.indexOf("chk_grid_") == 0) {
                            if (arrCheckboxes[i].checked == false) {
                                newState = false;
                                groupState = false;
                                break;
                            }
                        } else if (arrCheckboxes[i].id.indexOf("ChkGroupSelector_") == 0) {
                            if (groupCheckBox != null) {
                                groupCheckBox.checked = groupState;
                                groupState = true;
                            }
                            groupCheckBox = arrCheckboxes[i];
                        }
                    }
                }

                if (groupCheckBox != null) {
                    groupCheckBox.checked = groupState;
                    groupState = true;
                }

                document.getElementById('ChkSelector').checked = newState;
            }
          
		</script>		
	</head>
	<body>		
		<form id="Form1" runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select All Group Records using CheckBoxes</b></span>
		<br /><br />
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
			GenerateRecordIds="true" AllowGrouping="true" GroupBy="CategoryName" DataSourceID="sds1">
			<ClientSideEvents OnClientCallback="assignEventsToCheckboxes" />
            <TemplateSettings GroupHeaderTemplateId="GroupTemplate" />
            <Columns>
	            <obout:Column HeaderText="Select" runat="server" Width="60">
		            <TemplateSettings TemplateID="CheckTemplate"  HeaderTemplateId="HeaderTemplate" />
	            </obout:Column>
                <obout:Column DataField="CategoryID" Visible="false" HeaderText="Category ID" runat="server"/>
                <obout:Column DataField="CategoryName" Visible="false" HeaderText="Category Name" runat="server"/>
	            <obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" runat="server"/>				
	            <obout:Column DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
	            <obout:Column DataField="UnitPrice" HeaderText="Unit Price" runat="server" />					            
            </Columns>
            <Templates>
	            <obout:GridTemplate runat="server" ID="HeaderTemplate">
		            <Template>
			            <input type="checkbox" onclick="toggleSelection(this)" id="ChkSelector" />
		            </Template>
	            </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="CheckTemplate">
	                <Template>
	                    <input type="checkbox" id="chk_grid_<%# Container.DataItem["ProductID"] %>"/>
	                </Template>
                </obout:GridTemplate> 
                <obout:GridTemplate runat="server" ID="GroupTemplate">
			        <Template>
                        <div style="position: relative; width: 300px;">
                            <div style="position: absolute;left: -2px;top: 2px;">
                                <input type="checkbox" onclick="toggleGroupSelection(this)" name="ChkGroupSelector" id="ChkGroupSelector_<%# Container.PageRecordIndex %>" /> 
                            </div>
                            <div style="position: absolute; left: 17px;">
                                <%# Container.Column.HeaderText %> : <%# Container.Value %>
                            </div>
                        </div>			            
			        </Template>
			    </obout:GridTemplate>       
            </Templates>
		</obout:Grid>

        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 P.*, C.CategoryName FROM Products P INNER JOIN Categories C ON P.CategoryID = C.CategoryID ORDER BY C.CategoryID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
							
		<br /><br /><br />
		
		<span class="tdText">
		    Use the checkboxes to select records from the Grid. <br />
		    The checkbox from the header can be used to select / deselect all the records from the current page.<br />
            The checkboxes from the group headers can be used to select / deselect all the records from the group.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

<script type="text/javascript">
var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = assignEventsToCheckboxes;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    assignEventsToCheckboxes();
    }
}
</script>
