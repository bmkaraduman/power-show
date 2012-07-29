<%@ Page Language="C#" ValidateRequest="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
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
        
        EditorID.Value = ((Editor)(grid1.Templates[0].Container.FindControl("Editor"))).ClientID;

        OboutInc.Calendar2.Calendar orderDateCalendar = grid1.Templates[0].Container.FindControl("gridCal1") as OboutInc.Calendar2.Calendar;
        OboutTextBox txtOrderDate = grid1.Templates[0].Container.FindControl("txtOrderDate") as OboutTextBox;
        orderDateCalendar.TextBoxId = txtOrderDate.ClientID;
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipAddress=@ShipAddress, ShipCity = @ShipCity, ShipRegion=@ShipRegion, ShipCountry = @ShipCountry, OrderDate=@OrderDate, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID = @OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion,  ShipCountry, OrderDate, AdditionalInformationHTML) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipCountry,@OrderDate, @AdditionalInformationHTML)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@ShipAddress", OleDbType.VarChar).Value = e.Record["ShipAddress"];
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
        myComm.Parameters.Add("@ShipRegion", OleDbType.VarChar).Value = e.Record["ShipRegion"];
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
        myComm.Parameters.Add("@OrderDate", OleDbType.Date).Value = e.Record["OrderDateFormatted"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }


</script>


<html>
<head runat="server">
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
    </style>

    <script type="text/JavaScript">
        function onAddEdit() {
            var editorObject = $find(document.getElementById('EditorID').value);
            editorObject.set_content(document.getElementById('EditorContent').value);
        }

        function onBeforeInsertUpdate() {
            var editorObject = $find(document.getElementById('EditorID').value);
            document.getElementById('EditorContent').value = editorObject.get_content();
        }
        function onBeforeClientCancelEdit() {
            var editorObject = $find(document.getElementById('EditorID').value);
            var editPanel = editorObject.get_editPanel();
            editPanel.ensurePopupsClosed();
        }  
    </script>
</head>
<body>
    <form id="Form1" runat="server">
    <br />
    <span class="tdText"><b>ASP.NET Grid - HTML Editor in Row Template</b></span>
    <br />
    <br />
    
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="Server" ID="popupHolder" DefaultAddPolicy="Demand" />

    <asp:HiddenField ID="EditorID" runat="server" />
     
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
        FolderStyle="styles/grand_gray" EnableTypeValidation="false" OnRebind="RebindGrid"
        OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="150" ReadOnly="true"
                HeaderText="ORDER ID" runat="server">
            </obout:Column>
            <obout:Column ID="Column2" DataField="ShipName" Width="150" HeaderText="NAME" runat="server">
                <TemplateSettings RowEditTemplateControlId="txtShipName" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column3" DataField="ShipAddress" Width="160" HeaderText="ADDRESS"
                runat="server">
                <TemplateSettings RowEditTemplateControlId="txtShipAddress" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column5" DataField="ShipCity" Width="150" Visible="false" HeaderText="CITY"
                runat="server">
                <TemplateSettings RowEditTemplateControlId="txtShipCity" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column6" DataField="ShipRegion" Visible="false" Width="150" HeaderText="REGION"
                runat="server">
                <TemplateSettings RowEditTemplateControlId="txtShipRegion" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column7" DataField="ShipCountry" Visible="true" Width="150" Wrap="false"
                HeaderText="COUNTRY" runat="server">
                <TemplateSettings RowEditTemplateControlId="ddlCountries" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column4" DataField="OrderDateFormatted" Width="160" HeaderText="ORDER DATE"
                runat="server">
                <TemplateSettings RowEditTemplateControlId="txtOrderDate" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column13" DataField="AdditionalInformationHTML" Visible="false" Width="200"
                HeaderText="ADDITIONAL INFORMATION" runat="server" >
                <TemplateSettings RowEditTemplateControlId="EditorContent" RowEditTemplateControlPropertyName="value" />
            </obout:Column>
            <obout:Column ID="Column14" HeaderText="EDIT" Width="150" AllowEdit="true" AllowDelete="true"
                runat="server" />
        </Columns>
         <ClientSideEvents OnClientEdit="onAddEdit" OnClientAdd="onAddEdit" OnBeforeClientUpdate="onBeforeInsertUpdate"
            OnBeforeClientInsert="onBeforeInsertUpdate" OnBeforeClientCancelEdit="onBeforeClientCancelEdit" />
        <TemplateSettings RowEditTemplateId="tplRowEdit" />
        <Templates>
            <obout:GridTemplate runat="server" ID="tplRowEdit">
                <Template>
                    <table class="rowEditTable">
                        <tr>
                            <td valign="top">
                                <fieldset style="width: 300px; height: 75px;">
                                    <legend></legend>
                                    <table>
                                        <tr>
                                            <td>
                                                Ship Name:
                                            </td>
                                            <td>
                                                <obout:OboutTextBox runat="server" ID="txtShipName" Width="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ship Address:
                                            </td>
                                            <td>
                                                <obout:OboutTextBox runat="server" ID="txtShipAddress" Width="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ship Country:
                                            </td>
                                            <td>
                                                <obout:OboutDropDownList runat="server" ID="ddlCountries" Width="150" Height="200"
                                                    MenuWidth="175" DataSourceID="sds1" DataTextField="CountryName" DataValueField="CountryName" />
                                                <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
                                                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
                                                    ProviderName="System.Data.OleDb"></asp:SqlDataSource>
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
                            <td>
                                <fieldset style="width: 300px; height: 75px;">
                                    <legend></legend>
                                    <table>
                                        <tr>
                                            <td>
                                                Ship City:
                                            </td>
                                            <td>
                                                <obout:OboutTextBox runat="server" ID="txtShipCity" Width="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Ship Region:
                                            </td>
                                            <td>
                                                <obout:OboutTextBox runat="server" ID="txtShipRegion" Width="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Order Date:
                                            </td>
                                            <td valign="middle">
                                                <obout:OboutTextBox runat="server" ID="txtOrderDate" Width="150" />
                                            </td>
                                            <td valign="middle">
                                                <obout:Calendar ID="gridCal1" runat="server" StyleFolder="../Calendar/styles/expedia"
                                                    DatePickerMode="true" DatePickerImagePath="../Calendar/styles/icon2.gif" />
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" colspan="2">
                                <fieldset style="width: 630px; height: 270px;">
                                    <legend>Additional Information</legend>
                                   <obout:Editor runat="server" ID="Editor" Height="250" Width="550">
                                        <TopToolbar Appearance="lite" />
                                    </obout:Editor>
                                    <input type="hidden" id="EditorContent" />
                                </fieldset>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input id="btnSave" type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" />
                            </td>
                        </tr>
                    </table>
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>
    <br />
    <br />
    <br />
    <span class="tdText">The HTML Editor can be used inside the Grid to edit fields that
        contain data in html format.</span>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    </form>
</body>
</html>


