<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/C#" runat="server">

    protected string GetDayOfWeek(string dayNo)
    {
        switch (dayNo)
        {
            case "1":
                return "Sunday";
            case "2":
                return "Monday";
            case "3":
                return "Tuesday";
            case "4":
                return "Wednesday";
            case "5":
                return "Thursday";
            case "6":
                return "Friday";
            case "7":
                return "Saturday";    
        }        
        
        return "";
    }
    
</script>

<html>
	<head runat="server">
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
					
		<br /><br />
		
		<span class="tdText"><b>ASP.NET Grid - Sorting Week Days</b></span>
		
		<br /><br />
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
		    DataSourceID="sds1" AllowAddingRecords="false"
			AutoGenerateColumns="false" FolderStyle="" EnableRecordHover="true" AllowPageSizeSelection="true" >
			<Columns>
				<obout:Column DataField="OrderID" Visible="false" Width="150" ReadOnly="true" HeaderText="ORDER ID" runat="server"/>
                <obout:Column DataField="ShipName" Width="250" HeaderText="NAME" runat="server"/>    
                <obout:Column DataField="ShipAddress" Visible="false" Width="125" HeaderText="ADDRESS" runat="server"/>
                <obout:Column DataField="ShipCity" Width="150" HeaderText="CITY" runat="server"/>
                <obout:Column DataField="ShipCountry" Visible="true" Width="175" Wrap="false" HeaderText="COUNTRY" runat="server"/>           
                <obout:Column DataField="OrderDay" Width="175" HeaderText="ORDER DAY" runat="server">
                    <TemplateSettings TemplateID="TemplateOrderDay"/>
				</obout:Column>
            </Columns>
       
            <Templates>
		        <obout:GridTemplate runat="server" ID="TemplateOrderDay">
				    <Template>
					    <%# GetDayOfWeek(Container.Value) %>
				    </Template>
			    </obout:GridTemplate>
		   </Templates>
        </obout:Grid> 
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 50 ShipName, ShipAddress, ShipCity, ShipCountry, Weekday(OrderDate) AS OrderDay FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		
		<br /><br /><br />
		
		<span class="tdText">
		Using the Grid, you can easily display week days for regular date fields. The week days will be sorted correctly, <br />
		based on their position in the week, not based on their name. The magic is achieved using a simple GridTemplate<br />
		along with a simple formatting in the SQL query that loads the data from the database.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


