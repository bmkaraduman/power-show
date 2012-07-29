<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

<html>
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
		<form runat="server">					
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
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1" AllowFiltering="true">
			<Columns>
			    <obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="125" runat="server"/>
				<obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
				<obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column ID="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server" />
			</Columns>
			<FilteringSettings FilterPosition="Top" />
		</obout:Grid>
		
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
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>