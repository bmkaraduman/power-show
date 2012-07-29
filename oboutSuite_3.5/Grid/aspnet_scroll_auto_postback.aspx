<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<script language="C#" runat="server">
    void Page_load(object sender, EventArgs e)
    {
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
    		
		    <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true"
			     FolderStyle="styles/black_glass" AutoGenerateColumns="false"			
			     AutoPostBackOnSelect="true" AllowMultiRecordSelection="false" AllowAddingRecords="false"
			     PageSize="50">
			    <Columns>
				    <obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="SUPPLIER ID" Width="125" runat="server"/>				
				    <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="250" runat="server"/>				
				    <obout:Column DataField="Address" HeaderText="ADDRESS" Width="185" runat="server" />
				    <obout:Column DataField="Country" HeaderText="COUNTRY" Width="135" runat="server" />
			    </Columns>
			    <ScrollingSettings ScrollHeight="250"/>
		    </obout:Grid>
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
