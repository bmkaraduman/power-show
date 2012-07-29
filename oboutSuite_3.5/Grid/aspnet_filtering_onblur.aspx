<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
		<script type="text/javascript">
		    window.onload = function() {
		        var elements = document.getElementsByTagName('INPUT');
		        for (var i = 0; i < elements.length; i++) {
		            if (elements[i].type == 'text' && elements[i].id.indexOf('FilterControl') != -1) {
		                attachEventHandler(elements[i], 'blur', applyFilter)
		            }
		        }
		    }

		    function applyFilter() {
		        grid1.filter();
		    }

		    function standardizeEvent(e) {
		        if (!e) var e = window.event;
		        if (!e.target) e.target = e.srcElement
		        return e
		    }

		    function createHandlerFunction(obj, fn) {
		        var o = new Object;
		        o.myObj = obj;
		        o.calledFunc = fn;

		        o.myFunc = function(e) {
		            var e = standardizeEvent(e);
		            return o.calledFunc.call(o.myObj, e);
		        }
		        return o.myFunc;
		    }

		    function attachEventHandler(obj, evType, fn) {
		        var handler = null;

		        if (obj.addEventListener) {
		            var handler = createHandlerFunction(obj, fn);
		            obj.addEventListener(evType, handler, null);
		        } else if (obj.attachEvent) {
		            var handler = createHandlerFunction(obj, fn);
		            obj.attachEvent("on" + evType, handler);
		        }
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Filter On Blur</b></span>
		<br /><br />
				
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowAddingRecords="false"
			FolderStyle="styles/black_glass" AllowFiltering="true" ShowLoadingMessage="true" DataSourceID="sds1" AllowPageSizeSelection="false"
			>
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" Visible="false" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" ShowFilterCriterias="false" Width="200" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" ShowFilterCriterias="false" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" ShowFilterCriterias="false" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY"  ShowFilterCriterias="false" Width="150" runat="server" />
			</Columns>
			<FilteringSettings InitialState="Visible" />
		</obout:Grid>
					
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		<br /><br /><br />
		
		<span class="tdText">
    		This example demonstrates the ability to automatically filter the Grid when the filter text boxes lose the focus.<br />
    		Type a search string in one of the filter text boxes and then hit the TAB key or click outside the text box to trigger the filtering.<br /><br />
    		
    		This sample uses custom JavaScript code that attaches <span class="option2">onblur</span> event handlers to the filter text boxes. <br />
    		These event handlers call the client-side "filter" method of the Grid, which performs the filtering.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>