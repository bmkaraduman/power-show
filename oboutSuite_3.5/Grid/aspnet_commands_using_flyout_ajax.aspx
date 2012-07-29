<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Flyout2" Assembly="obout_Flyout2_NET" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    void Page_load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {

        OleDbConnection myConn = new
        OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 OrderId,ShipName,ShipCountry,Sent, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }
    
    public string[] LoadRecord(string orderId)
    {
        OleDbConnection myConn = new
        OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT *,FORMAT(OrderDate,\"mm/dd/yyyy\") AS OrderDateFormatted,FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted,FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders WHERE OrderId=@OrderID", myConn);
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = int.Parse(orderId);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();
        string[] sRecord = new string[12];
        while (myReader.Read())
        {
            sRecord[0] = myReader["ShipName"].ToString();
            sRecord[1] = myReader["ShipAddress"].ToString();
            sRecord[2] = myReader["ShipCity"].ToString();
            sRecord[3] = myReader["ShipRegion"].ToString();
            sRecord[4] = myReader["ShipPostalCode"].ToString();
            sRecord[5] = myReader["ShipCountry"].ToString();
            sRecord[6] = myReader["OrderID"].ToString();
            sRecord[7] = myReader["OrderDate"].ToString();
            sRecord[8] = myReader["RequiredDate"].ToString();
            sRecord[9] = myReader["ShippedDate"].ToString();
            sRecord[10] = myReader["ShipVia"].ToString();
            sRecord[11] = myReader["Sent"].ToString();

        }
        myConn.Close();
        return sRecord;
        
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new
        OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand(@"UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity,ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode, ShipCountry =@ShipCountry, Sent = @Sent, OrderDate=@OrderDate,RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia
        WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDate"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDate"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDate"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new
        OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand(@"INSERT INTO Orders(ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode,
        ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia)
        VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion,
        @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate,
        @ShippedDate, @ShipVia)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@Sent", OleDbType.Boolean).Value = e.Record["Sent"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDate"];
        myComm.Parameters.Add("@RequiredDate", OleDbType.Date).Value = e.Record["RequiredDate"];
        myComm.Parameters.Add("@ShippedDate", OleDbType.Date).Value = e.Record["ShippedDate"];
        myComm.Parameters.Add("@ShipVia", OleDbType.Integer).Value = e.Record["ShipVia"];

        myComm.ExecuteNonQuery();
        myConn.Close();
        CreateGrid();
    }
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }

</script>

<html>
<head id="Head1" runat="server">
    <title>Using Flyout and AJAX</title>
    <style type="text/css">
           .tdText {
                   font:11px Verdana;
                   color:#333333;
           }
           .option2{
                   font:11px Verdana;
                   color:#0033cc;
                   background-color___:#f6f9fc;
                   padding-left:4px;
                   padding-right:4px;
           }
           .tdTextLink {
                   font:11px Verdana;
                   color:#315686;
                   text-decoration:underline;
           }
           a {
                   font:11px Verdana;
                   color:#315686;
                   text-decoration:underline;
           }

           a:hover {
                   color:crimson;
           }
           .rowEditTable {
                background-color: #EEEEEE;
                border: 1px solid #000000;
            }
        	
            .rowEditTable td {
                font-family: Verdana;
                font-size: 10px;
                color: #000000;		        
            }
               </style>
</head>

<script type="text/javascript" language="javascript">
     
        function LoadPanel1(iRecordIndex){
            var orId=grid1.Rows[iRecordIndex].Cells[0].Value;
            ob_post.AddParam("orderId",orId);
            ob_post.post(null, "LoadRecord", populateEditControls);
            ob_post.ResetParams(); 
        }
        
        function populateEditControls(iRecord) {
        
            document.getElementById("txtShipName").value = iRecord[0].toString();
            document.getElementById("txtShipAddress").value =iRecord[1].toString();
            document.getElementById("txtShipCity").value = iRecord[2].toString();
            document.getElementById("txtShipRegion").value =iRecord[3].toString();
            document.getElementById("txtShipPostalCode").value =iRecord[4].toString();
            document.getElementById("<%=ddlCountries.ClientID%>").value = iRecord[5].toString();
            document.getElementById("txtOrderID").firstChild.nodeValue=iRecord[6].toString();
            document.getElementById("txtOrderDate").value = iRecord[7].toString();
            document.getElementById("txtRequiredDate").value = iRecord[8].toString();
            document.getElementById("txtShippedDate").value = iRecord[9].toString();
            document.getElementById("txtShipVia").value = iRecord[10].toString();
            document.getElementById("txtSent").checked = iRecord[11].toString().toLowerCase() == "true" ? true : false;
        }
          
        function saveChanges() {
            var oRecord = new Object();
            oRecord.OrderID = document.getElementById("txtOrderID").firstChild.nodeValue;
            oRecord.ShipName = document.getElementById("txtShipName").value;
            oRecord.ShipAddress = document.getElementById("txtShipAddress").value;
            oRecord.ShipCity = document.getElementById("txtShipCity").value;
            oRecord.ShipRegion = document.getElementById("txtShipRegion").value;
            oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode").value;
            oRecord.ShipCountry = document.getElementById("<%=ddlCountries.ClientID%>").value;
            oRecord.OrderDate = document.getElementById("txtOrderDate").value;
            oRecord.RequiredDate = document.getElementById("txtRequiredDate").value;
            oRecord.ShippedDate = document.getElementById("txtShippedDate").value;
            oRecord.ShipVia = document.getElementById("txtShipVia").value;
            oRecord.Sent = document.getElementById("txtSent").checked;
            
            grid1.executeUpdate(oRecord);
           
            <%=Flyout1.getClientID()%>.Close()
        }
        
        function saveNew() {
            var oRecord = new Object();
            oRecord.ShipName = document.getElementById("txtShipName2").value;
            oRecord.ShipAddress = document.getElementById("txtShipAddress2").value;
            oRecord.ShipCity = document.getElementById("txtShipCity2").value;
            oRecord.ShipRegion = document.getElementById("txtShipRegion2").value;
            oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode2").value;
            oRecord.ShipCountry = document.getElementById("<%=ddlCountries2.ClientID%>").value;
            oRecord.OrderDate = document.getElementById("txtOrderDate2").value;
            oRecord.RequiredDate = document.getElementById("txtRequiredDate2").value;
            oRecord.ShippedDate = document.getElementById("txtShippedDate2").value;
            oRecord.ShipVia = document.getElementById("txtShipVia2").value;
            oRecord.Sent = document.getElementById("txtSent2").checked;
            
            grid1.executeInsert(oRecord);
            <%=Flyout2.getClientID()%>.Close()
        }
    
        function clearForm() {
            document.getElementById("txtShipName").value = "";
            document.getElementById("txtShipAddress").value = "";
            document.getElementById("txtShipCity").value = "";
            document.getElementById("txtShipRegion").value = "";
            document.getElementById("txtShipPostalCode").value = "";
            document.getElementById("<%=ddlCountries.ClientID%>").value = "Argentina";
            document.getElementById("txtOrderDate").value = "";
            document.getElementById("txtRequiredDate").value = "";
            document.getElementById("txtShippedDate").value = "";
            document.getElementById("txtShipVia").value = "";
            document.getElementById("txtSent").checked = "";
        }
        
        function clearForm2() {
            document.getElementById("txtShipName2").value = "";
            document.getElementById("txtShipAddress2").value = "";
            document.getElementById("txtShipCity2").value = "";
            document.getElementById("txtShipRegion2").value = "";
            document.getElementById("txtShipPostalCode2").value = "";
            document.getElementById("<%=ddlCountries2.ClientID%>").value = "Argentina";
            document.getElementById("txtOrderDate2").value = "";
            document.getElementById("txtRequiredDate2").value = "";
            document.getElementById("txtShippedDate2").value = "";
            document.getElementById("txtShipVia2").value = "";
            document.getElementById("txtSent2").checked = "";
	    }
	    
        function popUpdate(e)
        {
            try
            {
                <%=Flyout1.getClientID()%>.AttachTo(e.id);
                <%=Flyout1.getClientID()%>.setPosition("BOTTOM_CENTER");
                <%=Flyout1.getClientID()%>.Open();
                LoadPanel1(e.id.toString().replace("grid_link_", ""));
            } 
            catch(ex){
		        alert(ex);
		    }
        }
        
        function popNew(e)
        { 
            try
            {
                clearForm2()
                <%=Flyout2.getClientID()%>.AttachTo(e.id);
                <%=Flyout2.getClientID()%>.setPosition("TOP_RIGHT");
                <%=Flyout2.getClientID()%>.Open(); 
            } 
            catch(ex){
		        alert(ex);
		    }
        }

</script>

<body>

    <form id="Form1" runat="server">
		<br />

        <span class="tdText"><b>ASP.NET Grid - Using the Flyout control and Ajax</b></span><br /><br />

        <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
            FolderStyle="styles/premiere_blue" AllowAddingRecords="true" ShowLoadingMessage="false"
            OnRebind="RebindGrid" OnInsertCommand="InsertRecord"
            OnUpdateCommand="UpdateRecord">
            <TemplateSettings NewRecord_TemplateId="tplAddBtn" />
            <Columns>
                <obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="220" ReadOnly="true"
                    HeaderText="ORDER ID" runat="server" />
                <obout:Column ID="Column2" DataField="ShipName" Width="200" HeaderText="NAME" runat="server" />
                <obout:Column ID="Column7" DataField="ShipCountry" AllowFilter="true" Visible="true"
                    Width="200" Wrap="false" HeaderText="COUNTRY" runat="server" />
                <obout:Column ID="Column3" DataField="OrderDateFormatted" AllowFilter="true" Visible="true"
                    Width="170" Wrap="false" HeaderText="ORDER DATE" runat="server" />
                <obout:Column ID="Column14" HeaderText="EDIT" Width="200" AllowEdit="true" AllowDelete="true"
                    runat="server">
                    <TemplateSettings TemplateId="tplEditBtn" />
                </obout:Column>
            </Columns>
            <Templates>
                <obout:GridTemplate runat="server" ID="tplEditBtn">
                    <Template>
                        <a href="#" id="grid_link_<%#Container.PageRecordIndex %>" onclick="popUpdate(this);"
                            class="ob_gAL">Edit</a>
                    </Template>
                </obout:GridTemplate>
                <obout:GridTemplate runat="server" ID="tplAddBtn">
                    <Template>
                        <a id="btAdd" class="ob_gAL" href="#" onclick="popNew(this);">Add New</a>
                    </Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
        <obout:Flyout runat="server" ID="Flyout1" zIndex="20" Align="RIGHT" Position="BOTTOM_RIGHT" CloseEvent="NONE"
            OpenEvent="NONE" DelayTime="500">
            <table width="400px" height="100px" class="rowEditTable">
                <tr>
                    <td class="option2" align="left">
                        <a href="javascript:<%=Flyout1.getClientID()%>.Close()">[Close]</a></td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" class="tdText">
                                    <fieldset style="width: 275px; height: 175px;">
                                        <legend>Ship Information</legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    Ship Name:</td>
                                                <td>
                                                    <input type="text" id="txtShipName" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Address:</td>
                                                <td>
                                                    <input type="text" id="txtShipAddress" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship City:</td>
                                                <td>
                                                    <input type="text" id="txtShipCity" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Region:</td>
                                                <td>
                                                    <input type="text" id="txtShipRegion" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship PostalCode:</td>
                                                <td>
                                                    <input type="text" id="txtShipPostalCode" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Country:</td>
                                                <td>
                                                    <asp:DropDownList runat="server" ID="ddlCountries" CssClass="ob_gEC" Width="150">
                                                        <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                                        <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                                        <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                                        <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                                        <asp:ListItem Value="France">France</asp:ListItem>
                                                        <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                                        <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                                        <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                                        <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                                        <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                                        <asp:ListItem Value="UK">UK</asp:ListItem>
                                                        <asp:ListItem Value="USA">USA</asp:ListItem>
                                                        <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                                <td valign="top">
                                    <fieldset style="width: 300px; height: 175px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    Order ID:</td>
                                                <td>
                                                    <span id="txtOrderID" style="width: 150px;">&#160;</span></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Order Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtOrderDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Required Date:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtRequiredDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Shipped Date:</td>
                                                <td>
                                                    <input type="text" id="txtShippedDate" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Via:</td>
                                                <td>
                                                    <input type="text" id="txtShipVia" style="width: 150px;" class="ob_gEC" /></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Sent:</td>
                                                <td>
                                                    <input type="checkbox" id="txtSent" /></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <input type="button" id="btnSave" onclick="saveChanges()" value="Save" class="tdText" />
                                    <input type="button" value="Cancel" onclick="<%=Flyout1.getClientID()%>.Close()" class="tdText" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <obout:Flyout runat="server" ID="Flyout2" zIndex="20" AttachTo="btAdd" Align="LEFT" Position="ABSOLUTE"
            CloseEvent="NONE" OpenEvent="NONE" DelayTime="500" RelativeLeft="-200" RelativeTop="-200">
            <table class="rowEditTable">
                <tr>
                    <td valign="top">
                        <fieldset style="width: 275px; height: 175px;">
                            <legend>Ship Information</legend>
                            <table>
                                <tr>
                                    <td>
                                        Ship Name:</td>
                                    <td>
                                        <input type="text" id="txtShipName2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship Address:</td>
                                    <td>
                                        <input type="text" id="txtShipAddress2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship City:</td>
                                    <td>
                                        <input type="text" id="txtShipCity2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship Region:</td>
                                    <td>
                                        <input type="text" id="txtShipRegion2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship Postal Code:</td>
                                    <td>
                                        <input type="text" id="txtShipPostalCode2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship Country:</td>
                                    <td>
                                        <asp:DropDownList runat="server" ID="ddlCountries2" CssClass="ob_gEC" Width="150">
                                            <asp:ListItem Value="Argentina">Argentina</asp:ListItem>
                                            <asp:ListItem Value="Austria">Austria</asp:ListItem>
                                            <asp:ListItem Value="Brazil">Brazil</asp:ListItem>
                                            <asp:ListItem Value="Denmark">Denmark</asp:ListItem>
                                            <asp:ListItem Value="France">France</asp:ListItem>
                                            <asp:ListItem Value="Germany">Germany</asp:ListItem>
                                            <asp:ListItem Value="Ireland">Ireland</asp:ListItem>
                                            <asp:ListItem Value="Italy">Italy</asp:ListItem>
                                            <asp:ListItem Value="Mexico">Mexico</asp:ListItem>
                                            <asp:ListItem Value="Switzerland">Switzerland</asp:ListItem>
                                            <asp:ListItem Value="UK">UK</asp:ListItem>
                                            <asp:ListItem Value="USA">USA</asp:ListItem>
                                            <asp:ListItem Value="Venezuela">Venezuela</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                    <td valign="top">
                        <fieldset style="width: 300px; height: 175px;">
                            <legend>Order Information</legend>
                            <table>
                                <tr>
                                    <td>
                                        Order Date:</td>
                                    <td valign="middle">
                                        <input type="text" id="txtOrderDate2" style="width: 150px;" class="ob_gEC" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Required Date:</td>
                                    <td valign="middle">
                                        <input type="text" id="txtRequiredDate2" style="width: 150px;" class="ob_gEC" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Shipped Date:</td>
                                    <td>
                                        <input type="text" id="txtShippedDate2" style="width: 150px;" class="ob_gEC" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Ship Via:</td>
                                    <td>
                                        <input type="text" id="txtShipVia2" style="width: 150px;" class="ob_gEC" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        Sent:</td>
                                    <td>
                                        <input type="checkbox" id="txtSent2" /></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="button" id="Button1" onclick="saveNew()" value="Save" class="tdText" />
                        <input type="button" value="Cancel" onclick="<%=Flyout2.getClientID()%>.Close()" class="tdText" />
                    </td>
                </tr>
            </table>
        </obout:Flyout>
        <br />
        <br />
      <span class="tdText">
		Using Grid with Flyout and Ajax will enable you to add and edit all the fields from the database table even though only a few columns are loaded in the grid.
		</span>
        <br />
        <br />
        <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>
