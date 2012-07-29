<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["customerId"] != null && !grid1.IsCallback && !grid2.IsCallback)
        {
            ListOrders(Session["customerId"].ToString());
        }

        if (grid2.IsCallback)
        {
            if (Session["customerId"] != null)
                ListOrders(Session["customerId"].ToString());
        }

    }

    void ListOrders(string customerId)
    {

        OleDbConnection myConn = new
        OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders WHERE CustomerId=@CustomerId", myConn);//
        myComm.Parameters.AddWithValue("@CustomerId", customerId);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid2.DataSource = myReader;
        grid2.DataBind();
    }

    public void CreateOrderList(string CustomerId)
    {
        Session["customerId"] = CustomerId;
    }
    
    
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script language="javascript" type="text/javascript">



        function ShowOrders(customerId) {

            ob_post.AddParam("CustomerId", customerId);
            ob_post.post(null, "CreateOrderList", LoadRecord);

            myWindow.Title = "Order details for Customer: " + customerId;

        }


        function LoadRecord() {
            myWindow.Open();
            ob_post.UpdatePanel('CallbackPanel2');
        }
    </script>
    <style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
    </style>
</head>
<body>
    <form id="Form1" runat="Server">
    <span class="tdText"><b>ASP.NET Grid - Inside Window </b></span>
    <br /><br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
        DataSourceID="sds1" FolderStyle="styles/premiere_blue" AllowAddingRecords="false" ShowColumnsFooter="false"
        PageSize="10">
        <Columns>
            <obout:Column DataField="CustomerId" HeaderText="CUSTOMER ID" Width="110" />
            <obout:Column DataField="CompanyName" HeaderText="COMPANY NAME" Width="220" />
            <obout:Column DataField="ContactName" HeaderText="CONTACT NAME" Width="158" />
            <obout:Column DataField="ContactTitle" HeaderText="CONTACT TITLE" Width="160" />
            <obout:Column HeaderText="ShowOrders" DataField="CustomerId">
                <TemplateSettings TemplateId="tplShowOrder" />
            </obout:Column>
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="tplShowOrder">
                <Template>
                    <a href="#" onclick="ShowOrders('<%#Container.Value %>')">Show Orders</a>
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT CustomerId,CompanyName,ContactName,ContactTitle FROM Customers"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    <owd:Window ID="myWindow" runat="server" IsModal="false" ShowCloseButton="true" Status=""
        Left="200" Top="100" Height="350" Width="520" VisibleOnLoad="false" StyleFolder="../window/wdstyles/blue"
        Title="Obout Window">
        <oajax:CallbackPanel ID="CallbackPanel2" runat="server">
            <Content>
                <obout:Grid ID="grid2" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
                    FolderStyle="styles/premiere_blue" AllowAddingRecords="false" ShowLoadingMessage="true"
                    ShowColumnsFooter="false" PageSize="-1" ShowFooter="false">
                    <Columns>
                        <obout:Column DataField="ShipCountry" HeaderText="SHIP COUNTRY" Width="125" />
                        <obout:Column DataField="ShipCity" HeaderText="SHIP CITY" Width="120" />
                        <obout:Column DataField="ShippedDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="SHIPPED DATE"
                            Width="150" />
                        <obout:Column DataField="Freight" HeaderText="FREIGHT" Width="100" />
                        <obout:Column DataField="OrderDate" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="ORDER DATE"
                            Width="153" />
                    </Columns>
                    <ScrollingSettings ScrollHeight="230" ScrollWidth="515" />
                </obout:Grid>
            </Content>
            <Loading>
                <table width="100%" height="150px" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="center">
                            <img src="../AJAXPage/loading_icons/6.gif">
                        </td>
                    </tr>
                </table>
            </Loading>
        </oajax:CallbackPanel>
    </owd:Window>
    
        <span class="tdText"><br />
            Grid inside window is used to show the details.
            <br /> </span>
    <br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
				
    </form>
</body>
</html>
