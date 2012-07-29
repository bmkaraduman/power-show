<%@ Page Language="C#" %>
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
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AutoPostBackOnSelect = true;

        grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowRecordSelection = true;
        grid1.AllowMultiRecordSelection = true;
        grid1.KeepSelectedRecords = true;
        grid1.AllowAddingRecords = false;
        grid1.Select += new Grid.EventHandler(OnSelectRecords);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "SupplierID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ID";
        oCol1.Width = "45";

        Column oCol2 = new Column();
        oCol2.DataField = "CompanyName";
        oCol2.HeaderText = "Company Name";
        oCol2.Width = "275";


        Column oCol3 = new Column();
        oCol3.DataField = "Address";
        oCol3.HeaderText = "Address";
        oCol3.Width = "200";

        Column oCol4 = new Column();
        oCol4.DataField = "Country";
        oCol4.HeaderText = "Country";
        oCol4.Width = "115";

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

    void OnSelectRecords(object sender, GridRecordEventArgs e)
    {
        if (grid1.SelectedRecords != null)
        {
            string sText = "These are the selected records (server-side):";
            foreach (Hashtable oRecord in grid1.SelectedRecords)
            {
                sText += "<br />" + oRecord["SupplierID"] + " --- " + oRecord["CompanyName"] + " --- " + oRecord["Address"] + " --- " + oRecord["Country"];
            }

            divSelectedRecords.Text = sText;
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
	</head>
	<body>	
		<form runat="server">	
				
		<br />
		<span class="tdText"><b>ASP.NET Grid - PostBack on Select</b></span>
		<br /><br />	
			
		
		<table>
		    <tr>
		        <td valign="top" class="tdText">
		            <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		            
		            <br />
		            <asp:Literal runat="server" id="divSelectedRecords" EnableViewState="false"  />
		            <br />
		        </td>
		    </tr>		    		    
		</table>		
		

		<br /><br /><br />
		<span class="tdText">
		    Set the <b>AutoPostBackOnSelect</b> property to <span class="option2">true</span> to post the page <br />
		    back to the server after selecting records.
		</span>
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>


