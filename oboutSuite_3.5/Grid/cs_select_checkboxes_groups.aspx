<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="C#" runat="server">
	Grid grid1 = new Grid();

	void Page_load(object sender, EventArgs e)		
	{			
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.PageSize = 10;
        grid1.AllowMultiRecordSelection = false;
        grid1.GenerateRecordIds = true;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "CategoryName";
        grid1.DataSourceID = "sds1";

        grid1.ClientSideEvents.OnClientCallback = "assignEventsToCheckboxes";
        grid1.TemplateSettings.GroupHeaderTemplateId = "GroupTemplate";	
		
		// creating the Templates
		
		//------------------------------------------------------------------------
		GridRuntimeTemplate GroupTemplate = new GridRuntimeTemplate();
		GroupTemplate.ID = "GroupTemplate";				 
		GroupTemplate.Template = new Obout.Grid.RuntimeTemplate();
		GroupTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateGroupTemplate);
		//------------------------------------------------------------------------
		GridRuntimeTemplate CheckTemplate = new GridRuntimeTemplate();
        CheckTemplate.ID = "CheckTemplate";
        CheckTemplate.Template = new Obout.Grid.RuntimeTemplate();
        CheckTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateCheckTemplate);
        //------------------------------------------------------------------------
        GridRuntimeTemplate HeaderTemplate = new GridRuntimeTemplate();
        HeaderTemplate.ID = "HeaderTemplate";
        HeaderTemplate.Template = new Obout.Grid.RuntimeTemplate();
        HeaderTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateHeaderTemplate);
        //------------------------------------------------------------------------


        // adding the templates to the Templates collection
        grid1.Templates.Add(GroupTemplate);
        grid1.Templates.Add(CheckTemplate);
        grid1.Templates.Add(HeaderTemplate);

		
																						
		// creating the columns
		Column oCol1 = new Column();
        oCol1.HeaderText = "Select";
		oCol1.Width = "60";
        oCol1.TemplateSettings.TemplateId = "CheckTemplate";
        oCol1.TemplateSettings.HeaderTemplateId = "HeaderTemplate";

		Column oCol2 = new Column();
        oCol2.DataField = "CategoryID";
		oCol2.HeaderText = "Category ID";
		oCol2.Visible = false;
	
		Column oCol3 = new Column();
        oCol3.DataField = "CategoryName";
        oCol3.HeaderText = "Category Name";
        oCol3.Visible = false;

		Column oCol4 = new Column();
        oCol4.DataField = "ProductID";
        oCol4.HeaderText = "Product ID";
        oCol4.ReadOnly = true;
	
		Column oCol5 = new Column();
        oCol5.DataField = "ProductName";
        oCol5.HeaderText = "Product Name";
		oCol5.Width = "225";

		Column oCol6 = new Column();
        oCol6.DataField = "UnitPrice";
        oCol6.HeaderText = "Unit Price";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
		
	}

	// Create the methods that will load the data into the templates
	//------------------------------------------------------------------------
     public void CreateCheckTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindCheckTemplate);
    }
    protected void DataBindCheckTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<input type=\"checkbox\" id=\"chk_grid_" + oContainer.DataItem["ProductID"].ToString() + "\"/>";
    }

    public void CreateHeaderTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindHeaderTemplate);
    }
    protected void DataBindHeaderTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        
        oLiteral.Text = "<input type=\"checkbox\" onclick=\"toggleSelection(this)\" id=\"ChkSelector\" />";
    }
    //------------------------------------------------------------------------

	//------------------------------------------------------------------------
    public void CreateGroupTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();		
		e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindGroupTemplate);
	}
    protected void DataBindGroupTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;
        oLiteral.Text = "<div style=\"position: relative; width: 300px;\">";
        oLiteral.Text += "<div style=\"position: absolute;left: -2px;top: 2px;\">";
        oLiteral.Text += "<input type=\"checkbox\" onclick=\"toggleSelection(this)\" name=\"ChkGroupSelector\" id=\"ChkGroupSelector_" + oContainer.PageRecordIndex.ToString() + "\" />";
        oLiteral.Text += "</div>";
        oLiteral.Text += "<div style=\"position: absolute; left: 17px;\">";
        oLiteral.Text += oContainer.Column.HeaderText.ToString() + " : " + oContainer.Value.ToString();
        oLiteral.Text += "</div>";
        oLiteral.Text += "</div>";
	}

	</script>		


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
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Select All Group Records using CheckBoxes</b></span>
		<br /><br />			
			
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 P.*, C.CategoryName FROM Products P INNER JOIN Categories C ON P.CategoryID = C.CategoryID ORDER BY C.CategoryID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
							
		<br /><br /><br />
		
		<span class="tdText">
		    Use the checkboxes to select records from the Grid. <br />
		    The checkbox from the header can be used to select / deselect all the records from the current page.<br />
            The checkboxes from the group headers can be used to select / deselect all the records from the group.
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
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