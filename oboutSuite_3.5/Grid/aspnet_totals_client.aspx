<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    
    public void RowDataBound(object sender, GridRowEventArgs e)
    {

        if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            e.Row.Cells[1].Text = "Selected record total:";
            e.Row.Cells[2].Text = " ";
            e.Row.Cells[3].Text = " ";
            e.Row.Cells[4].Text = " ";
        }
    }
    
</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
    </style>
		<script type="text/javascript">
		    var isIE = (window.navigator.userAgent.indexOf("MSIE") > 0);

		    if (!isIE) {
		        HTMLElement.prototype.__defineGetter__("innerText",
              function() { return (this.textContent); });
		        HTMLElement.prototype.__defineSetter__("innerText",
              function(txt) { this.textContent = txt; });
		    }

		    function Load() {
		        window.setTimeout("FindFooter();", 250);
		    }

		    var columnFooterContainer = null;
		    function FindFooter() {
		        if (columnFooterContainer == null) {
		            var trElements = document.getElementsByTagName('TR');

		            for (var i = 0; i < trElements.length; i++) {
		                if (trElements[i].className == 'ob_gCFR') {
		                    columnFooterContainer = trElements[i];
		                    break;
		                }
		            }
		        }
		    }

		    function OnSelect(arrSelectedRecords) {

		        var totUnitPrice = 0;
		        var totUnitsInStock = 0;
		        var totUnitsOnOrder = 0;

		        for (var i = 0; i < grid1.SelectedRecords.length; i++) {
		            var record = grid1.SelectedRecords[i];

		            totUnitPrice += eval(record.UnitPrice);
		            totUnitsInStock += eval(record.UnitsInStock);
		            totUnitsOnOrder += eval(record.UnitsOnOrder);

		        }

		        var row = grid1.GridColumnsFooterContainer.firstChild.firstChild.firstChild.firstChild;

		        row.childNodes[2].firstChild.firstChild.innerText = totUnitPrice;
		        row.childNodes[3].firstChild.firstChild.innerText = totUnitsInStock;
		        row.childNodes[4].firstChild.firstChild.innerText = totUnitsOnOrder;
		    }

		    function addLoadEvent(func) {
		        var oldonload = window.onload;
		        if (typeof window.onload != 'function') {
		            window.onload = func;
		        } else {
		            window.onload = function() {
		                if (oldonload) {
		                    oldonload();
		                }
		                func();
		            }
		        }
		    }

		    addLoadEvent(function() {
		        Load();
		    });

		    function OnCallback() {
		        columnFooterContainer = null;
		        FindFooter();
		    }	    

		    
		</script>

	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Calculating totals of selected records</b></span>		
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowAddingRecords="false" DataSourceID="sds1" 
			ShowColumnsFooter="true" OnRowDataBound="RowDataBound">
			<ClientSideEvents OnClientSelect="OnSelect" OnClientCallback = "OnCallback"/>
			<Columns>
			    <obout:Column DataField="ProductID" HeaderText="PRODUCT ID" Visible="false" ReadOnly="true" Width="150" />
				<obout:Column DataField="ProductName" HeaderText="PRODUCT NAME" Width="150" />				
				<obout:Column DataField="UnitPrice" HeaderText="PRICE" Width="150" />
				<obout:Column DataField="UnitsInStock" HeaderText="UNITS IN STOCK" Width="150" />
				<obout:Column DataField="UnitsOnOrder" HeaderText="UNITS ON ORDER" Width="150" />
			</Columns>
		</obout:Grid>
		
		<br />
		
		<span class="tdText">
            This sample demonstrates how to show total of selected records from client side.
        </span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>