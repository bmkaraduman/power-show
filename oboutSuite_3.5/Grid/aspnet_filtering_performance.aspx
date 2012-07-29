<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            FilterCriteria criteria = new FilterCriteria();
            criteria.Option.Type = FilterOptionType.EqualTo;
            criteria.Value = "USA";

            grid1.Columns[4].FilterCriteria = criteria;
            
            

            FilterCriteria criteria2 = new FilterCriteria();
            criteria2.Option.Type = FilterOptionType.StartsWith;
            criteria2.Value = "Albuq";

            grid1.Columns[2].FilterCriteria = criteria2;


            
            FilterCriteria criteria3 = new FilterCriteria();
            criteria3.Option.Type = FilterOptionType.EndsWith;
            criteria3.Value = "110";

            grid1.Columns[3].FilterCriteria = criteria3;
        }
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
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Filter with Paged ObjectDataSource</b></span>
		<br /><br />
		
		<asp:ObjectDataSource runat="server" ID="ods1" TypeName="OrdersDataPerformance"
		    SelectMethod="GetOrders" SelectCountMethod="GetOrdersCount" EnablePaging="true" SortParameterName="sortExpression" />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false" AllowAddingRecords="false"
			FolderStyle="styles/black_glass" AllowFiltering="true" DataSourceID="ods1" EmbedFilterInSortExpression="true">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="250" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="200" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="225" runat="server" />				
			</Columns>
			<FilteringSettings FilterPosition="Top" />					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		    To achieve the best performance you need to bind the Grid to an ObjectDataSource control that has the Paging feature enabled.<br />
		    By setting the <b>EmbedFilterInSortExpression</b> property to true, the filter expression will be passed down to the SelectMethod method of the ObjectDataSource.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>