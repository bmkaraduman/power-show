<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    void Page_Load(object sender, EventArgs e)
    {
        grid1.LocalizationSettings.AddLink = txtAddNewLink.Text;
        grid1.LocalizationSettings.SaveLink = txtSaveLink.Text;
        grid1.LocalizationSettings.CancelLink = txtCancelLink.Text;
        grid1.LocalizationSettings.EditLink = txtEditLink.Text;
        grid1.LocalizationSettings.DeleteLink = txtDeleteLink.Text;
        grid1.LocalizationSettings.Paging_PageSizeText = txtRecordsPerPageText.Text;
        grid1.LocalizationSettings.LoadingText = txtLoadingMessage.Text;

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
		<span class="tdText"><b>ASP.NET Grid - Customizing the Localization Properties</b></span>		
		
		<br /><br />
				
	    <table>
	        <tr>
	            <td class="tdText">"Add New" link</td>
	            <td><asp:TextBox runat="server" ID="txtAddNewLink" CssClass="tdText" Text="Add New" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Save" link</td>
	            <td><asp:TextBox runat="server" ID="txtSaveLink" CssClass="tdText" Text="Save" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Cancel" link</td>
	            <td><asp:TextBox runat="server" ID="txtCancelLink" CssClass="tdText" Text="Cancel" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Edit" link</td>
	            <td><asp:TextBox runat="server" ID="txtEditLink" CssClass="tdText" Text="Edit" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Delete" link</td>
	            <td><asp:TextBox runat="server" ID="txtDeleteLink" CssClass="tdText" Text="Delete" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Records per page:" text</td>
	            <td><asp:TextBox runat="server" ID="txtRecordsPerPageText" CssClass="tdText" Text="Records per page:" /></td>
	        </tr>
	        <tr>
	            <td class="tdText">"Loading..." message</td>
	            <td><asp:TextBox runat="server" ID="txtLoadingMessage" CssClass="tdText" Text="Loading..." /></td>
	        </tr>
	        <tr>
	            <td class="tdText" align="right" colspan="2"><asp:Button runat="server" ID="btnPostback" Text="Configure Grid" CssClass="tdText" /></td>	            
	        </tr>
	    </table>	
		
		<br /><br />
		
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" PageSize="10" AllowAddingRecords="true" DataSourceID="sds1" AllowPaging="false">
			<Columns>				
			    <obout:Column DataField="OrderID" HeaderText="ORDER ID" Visible="false" ReadOnly="true" Width="150" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="150" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />				
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column DataField="" AllowEdit="true" AllowDelete="true" runat="server" />
			</Columns>
			<LocalizationSettings AddLink="Add New" SaveLink="Save" CancelLink="Cancel" 
			    EditLink="Edit" DeleteLink="Delete" Paging_PageSizeText="Records per page:" LoadingText="Loading..." />
		</obout:Grid>
		
		<br />
		<span class="tdText">Use the <b>LocalizationSettings</b> property to customize the localization settings of the grid.</span>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>