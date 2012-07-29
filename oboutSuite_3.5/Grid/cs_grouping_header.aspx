<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script language="C#" runat="server">
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/grand_gray";
        grid1.DataSourceID = "sds1";
        grid1.AllowAddingRecords = false;
        grid1.AllowGrouping = true;
        grid1.GroupBy = "ShipCountry";
        
        grid1.TemplateSettings.GroupHeaderTemplateId = "GroupTemplate";
        
        GridRuntimeTemplate GroupTemplate = new GridRuntimeTemplate();
		GroupTemplate.ID = "GroupTemplate";
		GroupTemplate.Template = new Obout.Grid.RuntimeTemplate();
		GroupTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateGroupTemplate);
        
		grid1.Templates.Add(GroupTemplate);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";
        oCol1.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "SHIP NAME";
        oCol2.Width = "200";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "SHIP CITY";
        oCol3.Width = "125";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipCountry";
        oCol4.HeaderText = "SHIP COUNTRY";
        oCol4.Width = "150";
        
        Column oCol5 = new Column();
        oCol5.DataField = "OrderDate";
        oCol5.HeaderText = "ORDER DATE";
        oCol5.DataFormatString = "{0:MM/dd/yyyy}";
        oCol5.Width = "150";
        
        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        phGrid1.Controls.Add(grid1);
    }
    
    public void CreateGroupTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
	{
		Literal oLiteral = new Literal();	
		e.Container.Controls.Add(oLiteral);		
		oLiteral.DataBinding += new EventHandler(DataBindGroupTemplate);
	}
	protected void DataBindGroupTemplate(Object sender, EventArgs e)
	{
		Literal oLiteral = sender as Literal;
		Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<u>" + oContainer.Column.HeaderText + "</u> : <i>" + oContainer.Value + "</i> (" + oContainer.Group.PageRecordsCount.ToString() + " " + (oContainer.Group.PageRecordsCount > 1 ? "records" : "record") + ")";
	}
</script>

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
			
	</head>
	<body>	
		<form runat="server">					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Customize the Group Headers</b></span>		
		
		<br /><br />				
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
		
		<br />
		<span class="tdText">
		    Use the <b>TemplateSettings.GroupHeaderTemplateId</b> property of the <b>Grid</b> class to customize the group headers.<br />
		    Beside the row data, the <b>Container</b> object of the template exposes two objects - <b>Group</b> and <b>Column</b> <br />
		    which can be used to retrieve information about the group and the column used in the grouping.
		</span>
				
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>