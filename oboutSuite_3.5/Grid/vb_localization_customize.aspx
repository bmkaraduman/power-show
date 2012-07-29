<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
    Dim grid1 As Obout.Grid.Grid = New Grid()

    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "grid1"
        grid1.CallbackMode = true
        grid1.Serialize = false
        grid1.AutoGenerateColumns = false
        grid1.FolderStyle = "styles/premiere_blue"
        grid1.AllowAddingRecords = true
        grid1.AllowPaging = false
        grid1.DataSourceID = "sds1"

        grid1.LocalizationSettings.AddLink = "Add New"
        grid1.LocalizationSettings.SaveLink = "Save"
        grid1.LocalizationSettings.CancelLink = "Cancel"
        grid1.LocalizationSettings.EditLink = "Edit"
        grid1.LocalizationSettings.DeleteLink = "Delete"
        grid1.LocalizationSettings.Paging_PageSizeText = "Records per page:"
        grid1.LocalizationSettings.LoadingText = "Loading..."
        
        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = true
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
        oCol1.Visible = false

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "150"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipCity"
        oCol3.HeaderText = "CITY"
        oCol3.Width = "150"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipPostalCode"
        oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipCountry"
        oCol5.HeaderText = "COUNTRY"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = ""
        oCol6.AllowEdit = true
        oCol6.AllowDelete = true

        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)

        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
        
        grid1.LocalizationSettings.AddLink = txtAddNewLink.Text
        grid1.LocalizationSettings.SaveLink = txtSaveLink.Text
        grid1.LocalizationSettings.CancelLink = txtCancelLink.Text
        grid1.LocalizationSettings.EditLink = txtEditLink.Text
        grid1.LocalizationSettings.DeleteLink = txtDeleteLink.Text
        grid1.LocalizationSettings.Paging_PageSizeText = txtRecordsPerPageText.Text
        grid1.LocalizationSettings.LoadingText = txtLoadingMessage.Text
    End Sub
   
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">Use the <b>LocalizationSettings</b> property to customize the localization settings of the grid.</span>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 10 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>