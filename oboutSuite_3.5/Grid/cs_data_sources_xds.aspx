<%@ Page Language="C#"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
	Grid grid1 = new Grid();
		
	void Page_load(object sender, EventArgs e){	 								
		grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
		grid1.AllowAddingRecords = false;
		
		grid1.FolderStyle = "styles/grand_gray";
        grid1.DataSourceID = "XmlDataSource1";
        grid1.AllowFiltering = true;


		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ClientID";
		oCol1.HeaderText = "CLIENT ID";
		oCol1.Width = "100";

		Column oCol2 = new Column();
		oCol2.DataField = "FirstName";
		oCol2.HeaderText = "FIRST NAME";
		oCol2.Width = "200";

		Column oCol3 = new Column();
		oCol3.DataField = "LastName";
		oCol3.HeaderText = "LAST NAME";
		oCol3.Width = "150";

		Column oCol4 = new Column();
		oCol4.DataField = "Email";
		oCol4.HeaderText = "EMAIL";
		oCol4.Width = "150";

		Column oCol5 = new Column();
		oCol5.DataField = "Country";
		oCol5.HeaderText = "COUNTRY";
		oCol5.Width = "150";



		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
	}

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
		<span class="tdText"><b>ASP.NET Grid - Binding to XmlDataSource</b></span>
		<br /><br />
				
		<asp:XmlDataSource runat="server" ID="XmlDataSource1" DataFile="~/App_Data/xml/Grid.xml" />
		
        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		<br /><br /><br />
		
		<span class="tdText">
		    You can load XML documents into the Grid by using a XmlDataSource control.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>