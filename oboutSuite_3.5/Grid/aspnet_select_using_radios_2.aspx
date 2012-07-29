<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">

	void Page_load(object sender, EventArgs e)		
	{		
		if (!Page.IsPostBack)
		{
					

			// initializing the SelectedRecords collection
            grid1.SelectedRecords = new ArrayList();
			
			// creating some records that will be selected
            Hashtable oRecord = new Hashtable();
            oRecord.Add("ProductID", "3");
            oRecord.Add("ProductName", "Aniseed Syrup");
            oRecord.Add("UnitPrice", "10");

            Hashtable oRecord2 = new Hashtable();
            oRecord2.Add("ProductID", "5");
            oRecord2.Add("ProductName", "Chef Anton's Gumbo Mix");
            oRecord2.Add("UnitPrice", "21.35");
            
            // adding the records to the SelectedRecords collection
            grid1.SelectedRecords.Add(oRecord);
            grid1.SelectedRecords.Add(oRecord2);
			CreateGrid();
		}else{
			


			if(grid1.SelectedRecords != null)
			{
				string sText = "<br />The following records have been processed:<b>";
				foreach(Hashtable oRecord in grid1.SelectedRecords)
				{
					sText += "<br />" + oRecord["ProductID"] + " (" + oRecord["ProductName"] + " ) - Price: " + oRecord["UnitPrice"];
				}
				sText += "</b>";
				
				divSelectedRecords.Text = sText;
				
			}
		}

	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 27 * FROM Products", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Products");*/
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
		    function selectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    grid1.selectRecord(iIndex);
                }
            }
            function deselectRecordFromGrid() {
                var iIndex = document.getElementById("txtIndex").value;
                if(iIndex != "") {
                    grid1.deselectRecord(iIndex);
                }
            }

            function SelectDeselect(oRadio) {
                var oElement = oRadio.parentNode;
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
                        if(oRadio.checked == true && oRadio.id.indexOf("rad_grid_yes_") >= 0 ) {
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

            function assignEventsToRadioBtns() {
            
                // disable the record selection feature by clicking on the records
                var sRecordsIds = grid1.getRecordsIds();                
                var arrRecordsIds = sRecordsIds.split(",");
                for(var i=0; i<arrRecordsIds.length; i++) {
                    var oRecord = document.getElementById(arrRecordsIds[i]);
                    oRecord.onmousedown = function(e) {stopEventPropagation(e);};
                    oRecord.onclick = function(e) {stopEventPropagation(e);};
                }
                
                // populate the previously checked checkboxes
                var arrPageSelectedRecords = grid1.PageSelectedRecords;
                for(var i=0; i<arrPageSelectedRecords.length; i++) {                    
                    var oRadio = document.getElementById("rad_grid_yes_" + arrPageSelectedRecords[i].ProductID);
                    oRadio.checked = true;
                }
            
                // enable the record selection feature by selecting the checkboxes
                var arrRadioBtns = document.getElementsByTagName("INPUT");    
                for(var i=0; i<arrRadioBtns.length; i++) {        
                    if(arrRadioBtns[i].type == "radio" && arrRadioBtns[i].id.indexOf("rad_grid_") == 0) {
                        arrRadioBtns[i].onmousedown = function(e) {stopEventPropagation(e);};
                        arrRadioBtns[i].onclick = function(e) {SelectDeselect(this);stopEventPropagation(e);};
                    }
                }
            }                       
            
            function onClientSelect(arrSelectedRecords) {
                //alert("You have selected the product with the ID " + arrSelectedRecords[0].ProductID + " : " + arrSelectedRecords[0].ProductName);
            }
            
            // check/uncheck all rows.
			function checkAll( flag ){
			    var newState = document.getElementById("rad_all_yes").checked;
			    
			    var inputArr = document.getElementsByTagName("INPUT");
			    for ( i=0; i< inputArr.length; i++){
			        var e = inputArr[i];
			        if ( e && e.type == "radio" && e.id != null && e.id.indexOf("rad_grid_") == 0 ){
						if (e.id.indexOf("rad_grid_yes_") >=0 && newState == true)
						{
							e.checked = newState;
						}
						if (e.id.indexOf("rad_grid_no_") >=0 && newState == false)
						{
							e.checked = true;
						}			            
			            
			            var oElement = e.parentNode.parentNode.parentNode;
			            var oContainer = oElement.parentNode;
			            if ( oElement && oContainer){
                            var iRecordIndex = -1;
                            for(var j=0; j<oContainer.childNodes.length; j++) {
                                if(oContainer.childNodes[j] == oElement) {
                                    iRecordIndex = j;
                                    break;
                                }
                            }
                           
                            if(iRecordIndex != -1) {
			                    if(newState == true) {
                                    // select the record
                                    grid1.selectRecord(iRecordIndex);
                                } else {
                                    // deselect the record
                                    grid1.deselectRecord(iRecordIndex);
                                }
                            }
                        }
			        }
			    }
			}
          
		</script>		
	</head>
	<body>		
		<form id="Form1" runat="server">
		
		<br />
		<span class="tdText"><b>ASP.NET Grid - Selecting Records using Radio Buttons</b></span>
		<br /><br />
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/black_glass" AllowAddingRecords="false" PageSize="10" AllowMultiRecordSelection="false"
			 GenerateRecordIds="true">
			 <ClientSideEvents OnClientCallback="assignEventsToRadioBtns" OnClientSelect="onClientSelect" />
			<Columns>
			    <obout:Column HeaderText="Select" runat="server">
			        <TemplateSettings TemplateID="CheckTemplate" HeaderTemplateID="CheckAllTemplate"/>
			    </obout:Column>
				<obout:Column DataField="ProductID" ReadOnly="true" HeaderText="Product ID" Width="125" runat="server"/>				
				<obout:Column DataField="ProductName" HeaderText="Product Name" Width="225" runat="server"/>				
				<obout:Column DataField="UnitPrice" HeaderText="Unit Price" Width="150" runat="server" />					            
			</Columns>
			<Templates>				
                <obout:GridTemplate runat="server" ID="CheckTemplate">
	                <Template>
	                    <input type="radio" name="rad_<%# Container.DataItem["ProductID"] %>" id="rad_grid_yes_<%# Container.DataItem["ProductID"] %>"/> Yes <input type="radio" name="rad_<%# Container.DataItem["ProductID"] %>" id="rad_grid_no_<%# Container.DataItem["ProductID"] %>"/> No
	                </Template>
                </obout:GridTemplate>  
				<obout:GridTemplate runat="server" ID="CheckAllTemplate">
					<Template>
						<input type="radio" name="rad_all" id="rad_all_yes" onclick="checkAll(true);"/> Yes <input type="radio" id="rad_all_no"  name="rad_all" onclick="checkAll(false);"/> No
					</Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
		<br /><br />
		<input type="submit" value="Process" class="tdText" id="Button1"/><br />
		<span class="tdText">
			<asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
		</span>
		<br /><br />
		
		<span class="tdText">
		    Use the radio buttons to select records from the Grid. 		   
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

<script type="text/javascript">
var oldonload = window.onload;
if (typeof window.onload != 'function') {
    window.onload = assignEventsToRadioBtns;
} else {
    window.onload = function() {
    if (oldonload) {
        oldonload();
    }
    assignEventsToRadioBtns();
    }
}

setRadioBtnValue();

function setRadioBtnValue() {
	var sMessage;
	if(grid1.SelectedRecords.length <= 0) {
		return
	}
 
	for(var i=0; i<grid1.SelectedRecords.length;i++) {
		var record = grid1.SelectedRecords[i];
		var rad = document.getElementById ( "rad_grid_yes_" + record.ProductID );
		rad.checked = true;
	}
	
}
</script>
