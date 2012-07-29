<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    Grid grid0 = new Grid();
    Grid grid1 = new Grid();
    Grid grid2 = new Grid();
    Grid grid3 = new Grid();
    void Page_load(object sender, EventArgs e)
    {

        grid0.ID = "grid0";
        grid0.CallbackMode = true;
        grid0.Serialize = true;
        grid0.AutoGenerateColumns = false;
        grid0.FolderStyle = "../Grid/styles/black_glass";
        grid0.PageSize = 2;
        grid0.AllowAddingRecords = false;
        grid0.DataSourceID = "sds1";

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "125";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "175";

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

        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "../Grid/styles/black_glass";
        grid1.PageSize = 2;
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";

        oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "175";

        oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

        grid2.ID = "grid2";
        grid2.CallbackMode = true;
        grid2.Serialize = true;
        grid2.AutoGenerateColumns = false;
        grid2.FolderStyle = "../Grid/styles/black_glass";
        grid2.PageSize = 2;
        grid2.AllowAddingRecords = true;
        grid2.DataSourceID = "sds1";
        grid2.AllowPageSizeSelection = false;
        

        oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "175";

        oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

        grid3.ID = "grid3";
        grid3.CallbackMode = true;
        grid3.Serialize = true;
        grid3.AutoGenerateColumns = false;
        grid3.FolderStyle = "../Grid/styles/black_glass";
        grid3.PageSize = 2;
        grid3.AllowAddingRecords = true;
        grid3.DataSourceID = "sds1";
        grid3.AllowPaging = false;
        grid3.AllowFiltering = true;
        grid3.AllowPageSizeSelection = true;

        oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.Visible = false;
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "100";

        oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "175";

        oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";

        oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "150";

        oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "150";

        // add the columns to the Columns collection of the grid
        grid0.Columns.Add(oCol1);
        grid0.Columns.Add(oCol2);
        grid0.Columns.Add(oCol3);
        grid0.Columns.Add(oCol4);
        grid0.Columns.Add(oCol5);

        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        grid2.Columns.Add(oCol1);
        grid2.Columns.Add(oCol2);
        grid2.Columns.Add(oCol3);
        grid2.Columns.Add(oCol4);
        grid2.Columns.Add(oCol5);

        grid3.Columns.Add(oCol1);
        grid3.Columns.Add(oCol2);
        grid3.Columns.Add(oCol3);
        grid3.Columns.Add(oCol4);
        grid3.Columns.Add(oCol5);


        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid0);
        phGrid2.Controls.Add(grid1);
        phGrid3.Controls.Add(grid2);
        phGrid4.Controls.Add(grid3);
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
		
		<style type="text/css">
		    .custom .ob_gPSTT
	        {
	            float: right !important;		        
	        }
    	    
	        .custom .ob_gFCont
	        {
	            padding-right: 80px !important;
	        }		    
    	    
	        .custom .ob_gFEC
	        {
	            left: 0px !important;
	            right: auto !important;
	        }
    	    
	        .custom .ob_gFALC
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gFAL
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gALFS
	        {
	            float: left !important;
	        }
    	    
	        .custom .ob_gFP
	        {
	            float: left !important;
	            margin-left: 20px !important;
	            width: auto;
	            #width: 390px;
	        }
	        
	        .custom .ob_gPBC
	        {
	        }
	        
	        .custom .ob_gPLC
	        {
	            
	        }
	        
	        .custom .ob_gFPT
	        {
	            
	        }
	        
	        .custom .no-paging .ob_gFP
	        {
	            width: auto !important;
	        }
	        
	        .custom .no-paging .ob_gFP .ob_gFPT
            {
                float: left !important;
            }
		</style>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Align Elements in Footer</b></span>
		
		<br /><br />
				
		<br />
        
        <span class="tdText">Standard alignment - page size selector on the left / paging buttons on the right:</span>
       <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
		
		<br /><br />
		
		<div class="custom">
		
		    <span class="tdText">Custom alignment - paging buttons on the left / page size selector on the right:</span>
		    <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>		
    		
		    <br /><br />
    		
    		<span class="tdText">Custom alignment - paging buttons and "Add New" link on the left:</span>
    		<asp:PlaceHolder ID="phGrid3" runat="server"></asp:PlaceHolder>		

		    <br /><br />
    		
            <div class="no-paging">
    		    <span class="tdText">Custom alignment - "Add New" and filter links on the left / page size selector on the right:</span>
    		    <asp:PlaceHolder ID="phGrid4" runat="server"></asp:PlaceHolder>		
		    </div
		</div>
		
		<br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<span class="tdText">
		    You can easily change the position of the elements in the footer of the Grid using CSS.
		</span>
					
		<br /><br /><br />
				
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>