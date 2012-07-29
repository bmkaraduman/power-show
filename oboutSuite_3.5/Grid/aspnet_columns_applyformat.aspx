<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server" Language="C#">
    void Page_Load(object sender, EventArgs e)
    {
        for (int i = 0; i < grid1.Columns.Count; i++)
        {
            grid1.Columns[i].ApplyFormatInEditMode = chkSwitchFormatting.Checked;
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
		<span class="tdText"><b>ASP.NET Grid - Formatting data in edit mode using the ApplyFormatInEditMode & DataFormatString properties</b></span>		
		
		<br /><br />
		
		<asp:CheckBox runat="server" ID="chkSwitchFormatting" CssClass="tdText" AutoPostBack="true" Checked="true" Text="Apply formatting in edit mode" />
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/black_glass" AllowAddingRecords="false" DataSourceID="sds1">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false"/>				
				<obout:Column DataField="OrderDate" HeaderText="ORDER DATE" DataFormatString="{0:MM/dd/yyyy}" ApplyFormatInEditMode="true" />
				<obout:Column DataField="ShippedDate" HeaderText="SHIPPED DATE" DataFormatString="{0:dd-MMM-yyyy}" ApplyFormatInEditMode="true" />
				<obout:Column DataField="RequiredDate" HeaderText="REQUIRED DATE" DataFormatString="{0:MMMM dd, yyyy}" ApplyFormatInEditMode="true" />
				<obout:Column DataField="Freight" HeaderText="FREIGHT" DataFormatString="{0:C2}" ApplyFormatInEditMode="true" Width="150" />
				<obout:Column DataField="" AllowEdit="true" Width="125" />
				
			</Columns>
		</obout:Grid>
		
		<br />
		<span class="tdText">
		    If <b>ApplyFormatInEditMode</b> is set to <span class="option2">true</span>, the formatting specified with the <b>DataFormatString</b> property will be applied in edit mode as well.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>