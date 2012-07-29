<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script runat="server" language="c#">
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
		
        <obout:OboutDropDownList runat="server" ID="ddl1" Width="275" Height="250"
            DataSourceID="sds1" DataTextField="CompanyName" DataValueField="CustomerID"
            AppendDataBoundItems="true" FolderStyle="styles/premiere_blue/OboutDropDownList"
            OnSelectedIndexChanged="ddl1_OnSelectedIndexChanged" AutoPostBack="true"
            >
            <Items>
                <asp:ListItem Value="0">Select a customer ...</asp:ListItem>
            </Items>		    
        </obout:OboutDropDownList>
		
        <br /><br />
		
        <obout:OboutDropDownList runat="server" ID="ddl2" Width="275" Height="200" Enabled="false"
            DataSourceID="sds2" DataTextField="OrderID" DataValueField="OrderID"
            AppendDataBoundItems="true" FolderStyle="styles/premiere_blue/OboutDropDownList"
            OnSelectedIndexChanged="ddl2_OnSelectedIndexChanged" AutoPostBack="true"
            >
            <Items>
                <asp:ListItem Value="0">Select an order ...</asp:ListItem>
            </Items>
        </obout:OboutDropDownList>
        
        <br /><br />
		
        <obout:OboutDropDownList runat="server" ID="ddl3" Width="275" Enabled="false"
            DataSourceID="sds3" DataTextField="CompanyName" DataValueField="SupplierID"
            AppendDataBoundItems="true" FolderStyle="styles/premiere_blue/OboutDropDownList"
            >
            <Items>
                <asp:ListItem Value="0">Select a supplier ...</asp:ListItem>
            </Items>
        </obout:OboutDropDownList>
		
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
		        <asp:ControlParameter Name="OrderID" Type="Int32" ControlID="ddl2" PropertyName="SelectedValue"  />
		    </SelectParameters>
		 </asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    OboutDropDownLists can be linked in a cascading manner. By placing these cascading drop down lists inside <br />
		    an ASP.NET AJAX UpdatePanel or an obout AJAXPage CallbackPanel, the linked drop down lists will be loaded <br />
		    via AJAX (no page refresh).
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>		
		
		</form>    
	</body>
</html>