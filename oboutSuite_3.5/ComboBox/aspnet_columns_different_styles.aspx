<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
    
		protected void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        e.Row.Cells[3].CssClass = "cssDate";
        e.Row.Cells[4].CssClass = "cssDate";
        e.Row.Cells[5].CssClass = "cssFreight";
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
			background-color___:#f6f9fc;
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
 
        .verticaltext
        {
            font: bold 13px Arial;
            position: absolute;
            right: 3px;
            top: 20px;
            width: 15px;
            writing-mode: tb-rl;
            layout-flow: vertical-ideographic;
            filter: flipv fliph;
        }
        .ob_gRS td.cssDate
        {
        background-image: url(../grid/styles/grand_gray/row_selected.gif);
		background-position:bottom;
		background-repeat:repeat-x;
		background-color:#d6dae1;
		color: #515a6e;
        }
       .cssDate
        {
            border-top: 1px solid #E6E6E6;
            color: #5E5E70;
		cursor: default;
		margin: 0px;
		padding-right: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		padding-left: 0px;
		border-left: 1px solid #E6E6E6;
		border-right: 1px solid transparent;
		*border-right: 0px solid transparent;
		border-bottom: 0px solid #C3C9CE;
		font-family: Verdana;
		font-size: 10px;
		height: 25px;	
		vertical-align: middle;	
        
        background-image: none;
        background-color: #dddddd;
        }
        .cssDate div.ob_gRC
        {
            overflow: hidden;
            padding-left: 19px;
            white-space: nowrap;
        }
        .cssFreight
        {
        border-top: 1px solid #E6E6E6;
        color: #5E5E70;
		cursor: default;
		margin: 0px;
		padding-right: 0px;
		padding-top: 0px;
		padding-bottom: 0px;
		padding-left: 0px;
		border-left: 1px solid #E6E6E6;
		border-right: 1px solid transparent;
		*border-right: 0px solid transparent;
		border-bottom: 0px;
		font-family: Verdana;
		font-size: 10px;
		height: 25px;	
		vertical-align: middle;	
		background-image: url(nill);
        background-color: #ccccdd;
        }
        cssFreight div.ob_gRC
        {
            overflow: hidden;
            padding-left: 19px;
            white-space: nowrap;
        }
        .ob_gRS td.cssFreight
        {
        background-image: url(../grid/styles/grand_gray/row_selected.gif);
		background-position:bottom;
		background-repeat:repeat-x;
		background-color:#d6dae1;
		color: #515a6e;
        }
    </style>
	</head>
	<body>
		<form runat="server">
					
		<br />
		
		<span class="tdText"><b>ASP.NET Grid - Columns - Different Styles</b></span>
		
		<br /><br />	

        <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
            FolderStyle="../grid/styles/grand_gray" AllowFiltering="false" AllowAddingRecords="false" DataSourceID="sds1" OnRowDataBound="grid1_RowDataBound">
            <Columns>
                <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID"
                    Width="100" runat="server" Visible="false" />
                <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="150" runat="server" />
                <obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="110"
                    runat="server" />
                <obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}"
                    Width="130">
                </obout:Column>
                <obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:MM/dd/yyyy}"  Width="130" SortOrder="Desc">
                </obout:Column>
                <obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}"  Width="100">
                </obout:Column>
            </Columns>
        </obout:Grid>
        
        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
        
        <br /><br /><br />
        
        <span class="tdText">
            You can use customized css classes for each Cells in the Row.<br /> <br /> 
            Use the OnRowDataBound event to modify the properties and values of the cells inside the Grid.<br /> 
            Using this approach you can also customize the styles for a set of columns. <br /> 
            The RowDataBound event is raised after the row is bound to its data source. <br /> <br /> 
            See the <a href="http://www.obout.com/grid/grid_event_row.aspx">RowCreated/RowDataBound</a> example as well. 
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>

	

