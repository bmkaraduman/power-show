<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script runat="server" language="c#">
    OboutDropDownList ddl1;
    OboutDropDownList ddl2;
    OboutDropDownList ddl3;

    void Page_load(object sender, EventArgs e)
    {
        ddl1 = new OboutDropDownList();
        ddl1.ID = "ddl1";
        ddl1.Width = Unit.Pixel(275);
        ddl1.Height = Unit.Pixel(250);
        ddl1.DataSourceID = "sds1";
        ddl1.DataTextField = "CompanyName";
        ddl1.DataValueField = "CustomerID";
        ddl1.AppendDataBoundItems = true;
        ddl1.FolderStyle = "styles/premiere_blue/OboutDropDownList";
        ddl1.AutoPostBack = true;
        
        ddl1.SelectedIndexChanged += ddl1_OnSelectedIndexChanged;

        ddl1.Items.Add(new ListItem("Select a customer ..."));

        ddlPlaceHolder1.Controls.Add(ddl1);



        ddl2 = new OboutDropDownList();
        ddl2.ID = "ddl2";
        ddl2.Width = Unit.Pixel(275);
        ddl2.Height = Unit.Pixel(200);
        ddl2.DataSourceID = "sds2";
        ddl2.DataTextField = "OrderID";
        ddl2.DataValueField = "OrderID";
        ddl2.AppendDataBoundItems = true;
        ddl2.FolderStyle = "styles/premiere_blue/OboutDropDownList";
        ddl2.AutoPostBack = true;
        ddl2.Enabled = false;

        ddl2.SelectedIndexChanged += ddl2_OnSelectedIndexChanged;

        ddl2.Items.Add(new ListItem("Select an order ..."));

        ddlPlaceHolder2.Controls.Add(ddl2);




        ddl3 = new OboutDropDownList();
        ddl3.ID = "ddl3";
        ddl3.Width = Unit.Pixel(275);
        ddl3.Height = Unit.Pixel(200);
        ddl3.DataSourceID = "sds3";
        ddl3.DataTextField = "CompanyName";
        ddl3.DataValueField = "SupplierID";
        ddl3.AppendDataBoundItems = true;
        ddl3.FolderStyle = "styles/premiere_blue/OboutDropDownList";
        ddl3.Enabled = false;

        ddl3.Items.Add(new ListItem("Select a supplier ..."));

        ddlPlaceHolder3.Controls.Add(ddl3);
    }
	
    protected void ddl1_OnSelectedIndexChanged(object sender, EventArgs e)
	{
	    ddl2.Enabled = true;
	    ddl2.Items.Clear();
	    
	    ddl3.Enabled = false;
	    ddl3.Items.Clear();
	    
	    ddl2.Items.Add(new ListItem("Select an order ...", "0"));
	    ddl3.Items.Add(new ListItem("Select a supplier ...", "0"));
	}
	
	protected void ddl2_OnSelectedIndexChanged(object sender, EventArgs e)
	{
	    ddl3.Enabled = true;
	    ddl3.Items.Clear();
	    
	    ddl3.Items.Add(new ListItem("Select a supplier ...", "0"));
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head runat="server">
		<title>obout Interface examples</title>
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<%-- 
		<asp:ScriptManager runat="server" />
		--%>
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - Cascading Drop Down Lists</b></span>
		
		<br /><br />
		
		<%--
		<asp:UpdatePanel runat="server" ID="CascadingPanel">
		    <ContentTemplate>	
		--%>
		
        <asp:PlaceHolder runat="server" ID="ddlPlaceHolder1" />
		
        <br /><br />
		
        <asp:PlaceHolder runat="server" ID="ddlPlaceHolder2" />
        
        <br /><br />
		
		<asp:PlaceHolder runat="server" ID="ddlPlaceHolder3" />
		
		<%--
		    </ContentTemplate>
		</asp:UpdatePanel>
		--%>
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT CustomerID, CompanyName FROM Customers ORDER BY CompanyName ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		 
		 <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID ORDER BY OrderID ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
		        <asp:ControlParameter Name="CustomerID" Type="String" ControlID="ddl1" PropertyName="SelectedValue"  />
		    </SelectParameters>
		 </asp:SqlDataSource>
		 
		 <asp:SqlDataSource runat="server" ID="sds3" SelectCommand="SELECT S.SupplierID, S.CompanyName FROM  (((Suppliers S INNER JOIN Products P ON S.SupplierID = P.SupplierID) INNER JOIN [Order Details] ON P.ProductID = [Order Details].ProductID) INNER JOIN Orders O ON [Order Details].OrderID = O.OrderID) WHERE (O.OrderID = @OrderID) ORDER BY S.CompanyName"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    <SelectParameters>
		       <asp:ControlParameter Name="OrderID" Type="String" ControlID="ddl2" PropertyName="SelectedValue"  />
		    </SelectParameters>
		 </asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    OboutDropDownLists can be linked in a cascading manner. By placing these cascading drop down lists inside <br />
		    an ASP.NET AJAX UpdatePanel or an obout AJAXPage CallbackPanel, the linked drop down lists will be loaded <br />
		    via AJAX (no page refresh).
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>		
		
		</form>    
	</body>
</html>