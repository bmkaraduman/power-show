<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">

	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.FilteringSettings.FilterPosition = GridFilterPosition.Top;

        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowFiltering = true;
        grid1.ShowLoadingMessage = false;

		// setting the event handlers
		grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);
		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "125";
		
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
		oCol5.Width = "175";

		

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		
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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders", myConn);
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

   
	void RebindGrid(object sender, EventArgs e)
	{
		BindGrid();
	}


</script>
<script type="text/javascript">
    var isAppliedFilter = false;
    function applyFilter() {

        document.getElementById('apply').style.display = '';
        document.getElementById('remove').style.display = '';
        document.getElementById('hide').style.display = '';
        document.getElementById('show').style.display = 'none';

        grid1.filter()
        isAppliedFilter = true;
        return false;
    }
    function hideFilter() {

        if (isAppliedFilter == true) {
            document.getElementById('remove').style.display = '';
        } else {
            document.getElementById('remove').style.display = 'none';
        }
        document.getElementById('show').style.display = '';
        document.getElementById('hide').style.display = 'none';
        document.getElementById('apply').style.display = 'none';

        grid1.hideFilter()

        return false;
    }
    function showFilter() {

        if (isAppliedFilter == true) {
            document.getElementById('remove').style.display = '';
        } else {
            document.getElementById('remove').style.display = 'none';
        }
        document.getElementById('apply').style.display = '';
        document.getElementById('hide').style.display = '';
        document.getElementById('show').style.display = 'none';
        grid1.showFilter();

        return false;
    }

    function removeFilter() {

        document.getElementById('show').style.display = '';
        document.getElementById('apply').style.display = 'none';
        document.getElementById('hide').style.display = 'none';
        document.getElementById('remove').style.display = 'none';

        grid1.removeFilter();
        grid1.hideFilter();
        isAppliedFilter = false;
        return false;
    }
</script>

	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.floating
			{
			    float: left;
			    padding-right: 10px;
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
			.ob_gFALC
            {
             display: none;
            }
		</style>
	</head>
	<body>	
		<form id="Form1" runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - External Filter Buttons</b></span>		
		
		<br /><br /><br />
		
		<div class="tdText">
		    <div class="floating">
		    </div>		    
		    <div class="floating">
		        <span id="show" style='display:""'>
		            <obout:OboutButton ID="ShowFilter" runat="server" Text="Show Filter" OnClientClick="return showFilter()" /> 
		        </span>	
		        <span id="apply" style="display:none">	        
		        <obout:OboutButton ID="ApplyFilter" runat="server" Text="Apply Filter" OnClientClick="return applyFilter()" /> 
		        </span>	
		        <span id="hide" style="display:none">
		        <obout:OboutButton ID="HideFilter" runat="server" Text="Hide Filter" OnClientClick="return hideFilter()" /> 
		        </span>	
		        <span id="remove" style="display:none">
		        <obout:OboutButton ID="RemoveFilter" runat="server" Text="Remove Filter" OnClientClick="return removeFilter()" /> 
		        </span>	
		    </div>		    
		</div>
		
		<br />
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		
		<span class="tdText">
		    You can manipulate the filters from outside the Grid. This example showcases the use of external buttons <br />
		    that can be used to show/apply/hide/remove the filter for the Grid.<br /><br />

            The buttons call the following client-side methods exposed by the Grid:<br />
            <ul>
                <li>showFilter</li>
                <li>filter</li>
                <li>hideFilter</li>
                <li>removeFilter</li>
            </ul>
            <br />

            Read more about these methods in the <a href="http://www.obout.com/grid/doc_client_side_api.aspx#grid_client_side_methods_filtering">client-side API</a> docs.
		</span>
				
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>