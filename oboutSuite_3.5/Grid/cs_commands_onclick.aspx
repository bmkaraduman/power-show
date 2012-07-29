<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
 private Grid grid1;
    void Page_load(object sender, EventArgs e)
    {
        grid1 = new Grid();
        grid1.ID = "grid1";
        grid1.DataSourceID = "SqlDataSource1";
        grid1.AutoGenerateColumns = false;
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.FolderStyle = "styles/black_glass";
        grid1.AllowFiltering = true;
        grid1.AllowMultiRecordSelection = false;
        grid1.ClientSideEvents.OnClientSelect = "grid1_Select";
        grid1.ClientSideEvents.ExposeSender = true;

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";
        oCol1.Visible = false;
        
        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "200";
      
        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.Visible = true;
        oCol3.HeaderText = "CITY";
        oCol3.Width = "150";
        
        Column oCol4 = new Column();
        oCol4.DataField = "ShipRegion";
        oCol4.Visible = false;
        oCol4.HeaderText = "REGION";
        oCol4.Width = "150";
       
        Column oCol5 = new Column();
        oCol5.DataField = "ShipPostalCode";
        oCol5.Visible = true;
        oCol5.HeaderText = "POSTAL CODE";
        oCol5.Width = "150";
        
        Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.Visible = true;
        oCol6.HeaderText = "COUNTRY";
        oCol6.Width = "125";
        
        Column oCol7 = new Column();
        oCol7.DataField = "";
        oCol7.Visible = true;
        oCol7.HeaderText = "EDIT";
        oCol7.Width = "200";
        oCol7.AllowEdit = true;
        oCol7.AllowDelete = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);
        grid1.Columns.Add(oCol6);
        grid1.Columns.Add(oCol7);
       
        // add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);
    }
   
  </script>
   <script type="text/javascript">
       function grid1_Select(sender, records) {
           for (var i = 0; i < grid1.Rows.length; i++) {
               if (grid1.Rows[i] && grid1.Rows[i].Cells) {
                   if (grid1.Rows[i].Cells['OrderID'].Value == records[0].OrderID) {
                       grid1.editRecord(i);
                       return;
                   }
               }
           }
       }    
        </script>
<html>
	<head id="Head1" runat="server">
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
		<form id="Form1" runat="server">
					
		<br />
    
        <span class="tdText"><b>ASP.NET Grid - Edit on Click</b></span>
    
        <br /><br />

        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
            ProviderName="System.Data.OleDb"
            SelectCommand="SELECT TOP 50 [OrderID], [OrderDate], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry] FROM [Orders] ORDER BY OrderID DESC"
            InsertCommand="INSERT INTO Orders(ShipName, ShipCity, ShipRegion, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry)"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry=@ShipCountry WHERE OrderID=@OrderID"
            DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
            <InsertParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShipName" Type="String" />
                <asp:Parameter Name="ShipCity" Type="String" />
                <asp:Parameter Name="ShipRegion" Type="String" />
                <asp:Parameter Name="ShipPostalCode" Type="String" />
                <asp:Parameter Name="ShipCountry" Type="String" />
                <asp:Parameter Name="OrderID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />                
            </DeleteParameters>
        </asp:SqlDataSource>
					
		<br /><br />
		
		<span class="tdText">
		    By attaching an event handler to the <b>OnClientSelect</b> event you can use the record selection feature of the Grid<br />
            to put the selected record in edit mode. This approach makes it easier for end users to edit records, without being needed<br />
            to locate and click the "Edit" links.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
