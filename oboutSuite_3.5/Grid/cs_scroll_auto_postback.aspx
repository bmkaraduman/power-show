<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();
    void Page_load(object sender, EventArgs e)
    { 
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.AutoPostBackOnSelect = true;
        grid1.AllowMultiRecordSelection = false;
        grid1.PageSize = 50;

        grid1.ScrollingSettings.ScrollHeight = 250;
        
        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.Visible = false;
        oCol1.HeaderText = "SUPPLIER ID";
        oCol1.Width = "125";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "COMPANY NAME";
        oCol2.Width = "250";

        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "ADDRESS";
        oCol3.Width = "185";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "COUNTRY";
        oCol4.Width = "135";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);

        // add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1);

        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Suppliers", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();


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
	</head>
    <body>
        <form runat="server"><br />
		    <span class="tdText"><b>ASP.NET Grid - Auto-scroll to selected row during postback</b></span>
    		
		    <br /><br />	
    		
    		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		    
		    <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
	    </form>
	</body>
</html>	

<script type="text/javascript">
var t;

function scrollSelectedRecord() 
{ 
    if(typeof(grid1) == 'undefined') 
    { 
        t = window.setTimeout("scrollSelectedRecord()", 500);
        return; 
    } 
    if(grid1 != null)
    {        
        if(grid1.Rows != null)
        {
            if(grid1.PageSelectedRecords != null &&  grid1.PageSelectedRecords.length > 0) 
            { 
                for(var i=0; i < grid1.Rows.length; i++) 
                { 
                    if(grid1.Rows[i].Cells['SupplierID'].Value ==  grid1.PageSelectedRecords[0].SupplierID) 
                    {
                        grid1.GridBodyContainer.firstChild.firstChild.childNodes[1].childNodes[i].scrollIntoView(true);
                    } 
                }       
            }
        } else {
            t = window.setTimeout("scrollSelectedRecord()", 500);
            return;
        }
        
        window.clearTimeout(t); 
    }
} 
scrollSelectedRecord();

</script>
