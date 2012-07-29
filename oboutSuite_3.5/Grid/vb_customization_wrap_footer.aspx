<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()
    Dim grid2 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowFiltering = True
        grid1.DataSourceID = "sds1"
        grid1.PageSizeOptions = "10,20,30,40,50"

        grid2.ID = "grid2"
        grid2.CallbackMode = True
        grid2.Serialize = True
        grid2.AutoGenerateColumns = False
        grid2.AllowFiltering = True
        grid2.DataSourceID = "sds1"
        grid2.PageSizeOptions = "10,20,30,40,50"
		
		' creating the columns
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "OrderID"
        oCol4.ReadOnly = True
        oCol4.Visible = False
        oCol4.HeaderText = "ORDER ID"
        oCol4.Width = "100"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipName"
        oCol5.HeaderText = "NAME"
        oCol5.Width = "200"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipCity"
        oCol6.HeaderText = "CITY"
        oCol6.Width = "185"

        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "100"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
        
		' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        
        grid2.Columns.Add(oCol1)
        grid2.Columns.Add(oCol2)
        
		
		' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        phGrid2.Controls.Add(grid2)

	End Sub

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
	    </style>
		
		<style type="text/css">
		    .ob_gFCont
			{
			    background-color: #B5B5B5 !important;
			    background-image: none !important;
			}
		    
			.two-columns .ob_gFCont
			{
			    height: 81px !important;
			}
			
			.one-column .ob_gFCont
			{
			    height: 54px !important;
			}												
			
			.one-column .ob_gFPT
			{
			    display: none;			    
			}
			
			.one-column .ob_gFP
			{
			    margin-right: 0px !important;
			}
			
			.one-column .ob_gH .ob_gC_Fc div.ob_gHSI
			{			    
                right: 12px !important;
			}
			
			.ob_gFEC
			{
			    position: relative !important;
			}
			
			.ob_gFP
			{
			    float: left !important;
			}
			
			.ob_gALFS
			{
			    visibility: hidden;
			}
			
			.ob_gFALC
			{
			    float: left !important;
			}
			
			.ob_gPLD, .ob_gPLCL, .ob_gPLCLH
			{
			    height: 16px !important;
			}
			
		</style>		
	</head>
	<body>	
		<form id="Form1" runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Wrap Footer Elements</b></span>
		<br /><br />
	    
        <table>
            <tr>
                <td>
                    <div class="two-columns">
		                <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		            </div>
                </td>
                <td width="25">&#160;</td>
                <td valign="top">
                    <div class="one-column">
		                <asp:PlaceHolder ID="phGrid2" runat="server"></asp:PlaceHolder>
					</div>
                </td>
            </tr>
        </table>
         <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
				
		<br /><br /><br />
		
		<span class="tdText">
            In some situations the width of the Grid needs to be very small and thus the elements from the footer <br />
            (e.g. page size selector, paging buttons, won't fit on a single line). Using custom CSS styles the elements<br />
            can be arranged on multiple lines in the footer of the Grid.
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>