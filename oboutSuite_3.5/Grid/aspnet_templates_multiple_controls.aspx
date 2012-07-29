<%@ Page Language="C#" EnableEventValidation="false" %>
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
		<script type="text/JavaScript">
		    function onAddEdit() {
		        var phoneContent = document.getElementById('PhoneContent').value;
		        phoneContent = phoneContent.replace('(', '').replace(')', '').replace(/-/g, '').replace(/ /g, '');
		        OboutTextBox1.value(phoneContent.substr(0, 3));
		        OboutTextBox2.value(phoneContent.substr(3, 3));
		        OboutTextBox3.value(phoneContent.substr(6, 4));

		    }

		    function onBeforeInsertUpdate() {
		        document.getElementById('PhoneContent').value = '(' + OboutTextBox1.value() + ') ' + OboutTextBox2.value() + '-' + OboutTextBox3.value();
		    }
        </script>	
	</head>
	<body>	
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Multiple Controls inside Template </b></span>
		<br /><br />			
		
	    <obout:Grid id="grid1" runat="server"  CallbackMode="true" Serialize="true" 
	    AutoGenerateColumns="false"  DataSourceID="sds1">
	        <ClientSideEvents OnClientEdit="onAddEdit" OnClientAdd="onAddEdit" OnBeforeClientUpdate="onBeforeInsertUpdate"/>
		    <Columns>
	            <obout:Column DataField="SupplierID" Visible="false" ReadOnly="true" HeaderText="SUPPLIER ID" Width="100" runat="server"/>
	            <obout:Column DataField="CompanyName" HeaderText="NAME" Width="250" runat="server"/>				
	            <obout:Column DataField="Address"  HeaderText="ADDRESS" Width="150" runat="server" />	       
	            <obout:Column DataField="Country" HeaderText="COUNTRY" Width="150" runat="server" />
	            <obout:Column DataField="Phone" HeaderText="Phone" Width="170" runat="server">
		            <TemplateSettings EditTemplateID="EditPhoneTemplate"/>
	            </obout:Column>
		        <obout:Column ID="Column1" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
	        </Columns>
		    <Templates>
		        <obout:GridTemplate runat="server" ID="EditPhoneTemplate" ControlID="PhoneContent">
			        <Template>
				       <obout:OboutTextBox runat="server" ID="OboutTextBox1" Width="28%" MaxLength="3" />
				       <obout:OboutTextBox runat="server" ID="OboutTextBox2" Width="28%" MaxLength="3" />
				       <obout:OboutTextBox runat="server" ID="OboutTextBox3" Width="38%" MaxLength="4" />
				       <input type="hidden" id="PhoneContent" />
			        </Template>
		        </obout:GridTemplate>
		    </Templates>	
	    </obout:Grid>
	
		<br /><br /><br />
		
		<span class="tdText">
		    This example showcases the use of multiple controls inside a single edit template. <br />
		    Out of the box the Grid can link a template with a single control, but you can override this behavior <br />
		    by using some JavaScript code that will take care of the interaction between the Grid and the controls.<br />
	    </span>

		<br /><br /><br />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Suppliers ORDER BY SupplierID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>