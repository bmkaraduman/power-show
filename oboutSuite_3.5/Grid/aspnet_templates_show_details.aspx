<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

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
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
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
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, Sent, OrderDate, RequiredDate, ShippedDate, ShipVia) VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, @Sent, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia)", myConn);

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
        .txtText
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
            background-color: Transparent;
            width: 96%;
            border: 0px solid #FFFFFF;
            text-align: left;
        }
        td.txtText
        {
            width: 110px;
        }        
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
        .tdTextSmall {
            font:9px Verdana;
            color:#333333;
        }
    </style>

    <script type="text/javascript">

        function LoadData(iRecordIndex, Mode) {
            if (iRecordIndex >= 0) {
                var orId = grid1.Rows[iRecordIndex].Cells[0].Value;
                ob_post.AddParam("orderId", orId);
                ob_post.post(null, "LoadRecord", Mode == "Edit" ? PopulateEdit : PopulateView);
                ob_post.ResetParams();
            } else {
                var emptyRecord = new Array();
                for (var i = 0; i < 12; i++) {
                    emptyRecord.push('');
                }
                PopulateEdit(emptyRecord);
            }
        }
        
        function PopulateView(iRecord) {
            document.getElementById("lblShipName").innerHTML = iRecord[0].toString();
            document.getElementById("lblShipAddress").innerHTML = iRecord[1].toString();
            document.getElementById("lblShipCity").innerHTML = iRecord[2].toString();
            document.getElementById("lblShipRegion").innerHTML = iRecord[3].toString();
            document.getElementById("lblShipPostalCode").innerHTML = iRecord[4].toString();
            document.getElementById("lblCountry").innerHTML = iRecord[5].toString();
            document.getElementById("lblOrderDate").innerHTML = iRecord[7].toString();
            document.getElementById("lblRequiredDate").innerHTML = iRecord[8].toString();
            document.getElementById("lblShippedDate").innerHTML = iRecord[9].toString();
            document.getElementById("lblShipVia").innerHTML = iRecord[10].toString();
            document.getElementById("chkSent").checked = iRecord[11].toString().toLowerCase() == "true" ? true : false;
            
            }
            
        function PopulateEdit(iRecord) {
            document.getElementById("txtShipName").value = iRecord[0].toString();
            document.getElementById("txtShipAddress").value =iRecord[1].toString();
            document.getElementById("txtShipCity").value = iRecord[2].toString();
            document.getElementById("txtShipRegion").value =iRecord[3].toString();
            document.getElementById("txtShipPostalCode").value =iRecord[4].toString();
            ddlCountries.value(iRecord[5].toString());
            document.getElementById("txtOrderID").value=iRecord[6].toString();
            document.getElementById("txtOrderDate").value = iRecord[7].toString();
            document.getElementById("txtRequiredDate").value = iRecord[8].toString();
            document.getElementById("txtShippedDate").value = iRecord[9].toString();
            document.getElementById("txtShipVia").value = iRecord[10].toString();
            document.getElementById("chkSentEdit").checked = iRecord[11].toString().toLowerCase() == "true" ? true : false;
            
        }
        
        function saveChanges() {
            var oRecord = new Object();
            oRecord.OrderID = document.getElementById("txtOrderID").value;
            oRecord.ShipName = document.getElementById("txtShipName").value;
            oRecord.ShipAddress = document.getElementById("txtShipAddress").value;
            oRecord.ShipCity = document.getElementById("txtShipCity").value;
            oRecord.ShipRegion = document.getElementById("txtShipRegion").value;
            oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode").value;
            oRecord.ShipCountry = ddlCountries.value();
            oRecord.OrderDate = document.getElementById("txtOrderDate").value;
            oRecord.RequiredDate = document.getElementById("txtRequiredDate").value;
            oRecord.ShippedDate = document.getElementById("txtShippedDate").value;
            oRecord.ShipVia = document.getElementById("txtShipVia").value;
            oRecord.Sent = document.getElementById("chkSentEdit").checked;

            if (isAddMode) {
                grid1.executeInsert(oRecord);
            } else {
                grid1.executeUpdate(oRecord);
            }
        }

        var isAddMode = false;		
		function ShowDetails(e)	{		    
		    if(grid1.RecordInEditMode!=null) {
		        grid1.cancel();
		    }
		    
		    if (e.value == "Edit" || e.value == "View Details") {
		        isAddMode = false;
		        grid1.edit_record(e);
		    } else {
		        isAddMode = true;
		        grid1.addRecord();
		    }

		    detailsContainer= document.getElementById("DetailsContainer");
		    editContainer=document.getElementById("EditContainer");

		    if (e.value != "Add New") {
		        OrderID = e.id.split('_')[1];
		    } else {
		        OrderID = -1;
		    }
		    
		    if(e.value=="Edit" || e.value == "Add New") {
		        editContainer.style.display="block";
		        detailsContainer.style.display="none";		        
		        LoadData(OrderID,"Edit");
		    } else {
		        editContainer.style.display="none";
		        detailsContainer.style.display="block";

		        LoadData(OrderID,"View");
		    }
		}
		
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - View / Edit Details</b></span>
    
    <br />
    <br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
        FolderStyle="styles/grand_gray" OnRebind="RebindGrid" 
        OnUpdateCommand="UpdateRecord" OnInsertCommand="InsertRecord">
        <TemplateSettings RowEditTemplateId="tplRowEdit" />
        <Columns>
            <obout:Column ID="Column1" DataField="OrderID" Visible="false" Width="220" ReadOnly="true"
                HeaderText="ORDER ID" runat="server" />
            <obout:Column ID="Column2" DataField="ShipName" Width="200" HeaderText="NAME" runat="server" />
            <obout:Column ID="Column7" DataField="ShipCountry" AllowFilter="true" Visible="true"
                Width="200" Wrap="false" HeaderText="COUNTRY" runat="server" />
            <obout:Column ID="Column3" DataField="OrderDateFormatted" AllowFilter="true" Visible="true"
                Width="170" Wrap="false" HeaderText="ORDER DATE" runat="server" />
            <obout:Column ID="Column4" Width="200" AllowEdit="true" AllowDelete="true" runat="server">
                <TemplateSettings TemplateId="editBtnTemplate" EditTemplateId="updateBtnTemplate" />
            </obout:Column>
        </Columns>
        <TemplateSettings RowEditTemplateId="tplRowEdit" NewRecord_TemplateId="addTemplate" NewRecord_EditTemplateId="saveTemplate"/>
        <Templates>
            <obout:GridTemplate runat="server" ID="editBtnTemplate">
                <Template>
                    <input type="button" id="btnEdit_<%#Container.PageRecordIndex %>" class="tdText"
                        value="Edit" onclick="ShowDetails(this)" />
                    |
                    <input type="button" id="btnDetails_<%#Container.PageRecordIndex %>" class="tdText"
                        value="View Details" onclick="ShowDetails(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="addTemplate">
                <Template>
                    <input type="button" id="btnAddNew" class="tdTextSmall" value="Add New" onclick="ShowDetails(this)"/>
                </Template>
            </obout:GridTemplate>
             <obout:GridTemplate runat="server" ID="saveTemplate">
                    <Template>
                        
                    </Template>
                </obout:GridTemplate>	
            <obout:GridTemplate runat="server" ID="updateBtnTemplate">
            <Template>&#160;</Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="tplRowEdit">
                <Template>
                <div style=""> 
                    <div style="display: none" id="DetailsContainer">
                        <table class="rowEditTable">
                            <tr>
                                <td valign="top" class="tdText">
                                    <fieldset style="width: 275px; height: 150px;">
                                        <legend>Ship Information</legend>
                                        <table>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Name:
                                                </td>
                                                <td>
                                                    <span id="lblShipName" style="width: 150px;" class="txtText" readonly="readonly"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Address:
                                                </td>
                                                <td>
                                                    <span id="lblShipAddress" style="width: 150px;" class="txtText"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship City:
                                                </td>
                                                <td>
                                                    <span id="lblShipCity" style="width: 150px;" class="txtText"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Region:
                                                </td>
                                                <td>
                                                    <span id="lblShipRegion" style="width: 150px;" class="txtText"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Postal Code:
                                                </td>
                                                <td>
                                                    <span id="lblShipPostalCode" style="width: 150px;" class="txtText"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Country:
                                                </td>
                                                <td>
                                                    <span id="lblCountry" style="width: 150px;" class="txtText"></span>
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
                                <td valign="top" class="tdText">
                                    <fieldset style="width: 275px; height: 150px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td class="txtText">
                                                    Order Date:
                                                </td>
                                                <td valign="middle">
                                                    <span id="lblOrderDate" style="width: 150px;" class="txtText"></span>
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Required Date:
                                                </td>
                                                <td valign="middle">
                                                    <span id="lblRequiredDate" style="width: 150px;" class="txtText"></span>
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Shipped Date:
                                                </td>
                                                <td>
                                                    <span id="lblShippedDate" style="width: 150px;" class="txtText"></span>
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Via:
                                                </td>
                                                <td>
                                                    <span id="lblShipVia" style="width: 150px;" class="txtText"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Sent:
                                                </td>
                                                <td class="txtText" align="left">
                                                    <input id="chkSent" type="checkbox" disabled="disabled" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="Hide Details" onclick="grid1.cancel()" class="tdText" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="EditContainer" style="display: none">
                        <table class="rowEditTable">
                            <tr>
                                <td valign="top">
                                    <fieldset style="width: 275px; height: 175px;">
                                        <legend>Ship Information</legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    Ship Name:
                                                </td>
                                                <td>
                                                    <input type="text" id="txtShipName" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Address:
                                                </td>
                                                <td>
                                                    <input type="text" id="txtShipAddress" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship City:
                                                </td>
                                                <td>
                                                    <input type="text" id="txtShipCity" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Region:
                                                </td>
                                                <td>
                                                    <input type="text" id="txtShipRegion" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Postal Code:
                                                </td>
                                                <td>
                                                    <input type="text" id="txtShipPostalCode" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Country:
                                                </td>
                                                <td>
                                                    <obout:ComboBox runat="server" ID="ddlCountries" Height="150" Width="150"
                                                        FolderStyle="../ComboBox/styles/grand_gray">
                                                        <Items>
                                                            <obout:ComboBoxItem ID="Option16" runat="server" Value="Australia" Text="Australia" ImageUrl="../combobox/resources/images/flags/flag_australia.png" />
                                                            <obout:ComboBoxItem ID="Option17" runat="server" Value="Brazil" Text="Brazil" ImageUrl="../combobox/resources/images/flags/flag_brazil.png" />
                                                            <obout:ComboBoxItem ID="Option18" runat="server" Value="Canada" Text="Canada" ImageUrl="../combobox/resources/images/flags/flag_canada.png" />
                                                            <obout:ComboBoxItem ID="Option19" runat="server" Value="Denmark" Text="Denmark" ImageUrl="../combobox/resources/images/flags/flag_denmark.png" />
                                                            <obout:ComboBoxItem ID="Option20" runat="server" Value="Finland" Text="Finland" ImageUrl="../combobox/resources/images/flags/flag_finland.png" />
                                                            <obout:ComboBoxItem ID="Option21" runat="server" Value="France" Text="France" ImageUrl="../combobox/resources/images/flags/flag_france.png" />
                                                            <obout:ComboBoxItem ID="Option22" runat="server" Value="Germany" Text="Germany" ImageUrl="../combobox/resources/images/flags/flag_germany.png" />
                                                            <obout:ComboBoxItem ID="Option23" runat="server" Value="Italy" Text="Italy" ImageUrl="../combobox/resources/images/flags/flag_italy.png" />
                                                            <obout:ComboBoxItem ID="Option24" runat="server" Value="Japan" Text="Japan" ImageUrl="../combobox/resources/images/flags/flag_japan.png" />
                                                            <obout:ComboBoxItem ID="Option25" runat="server" Value="Norway" Text="Norway" ImageUrl="../combobox/resources/images/flags/flag_norway.png" />
                                                            <obout:ComboBoxItem ID="Option26" runat="server" Value="Singapore" Text="Singapore" ImageUrl="../combobox/resources/images/flags/flag_singapore.png" />
                                                            <obout:ComboBoxItem ID="Option27" runat="server" Value="Spain" Text="Spain" ImageUrl="../combobox/resources/images/flags/flag_spain.png" />
                                                            <obout:ComboBoxItem ID="Option28" runat="server" Value="Sweden" Text="Sweden" ImageUrl="../combobox/resources/images/flags/flag_sweden.png" />
                                                            <obout:ComboBoxItem ID="Option29" runat="server" Value="UK" Text="UK" ImageUrl="../combobox/resources/images/flags/flag_england.png" />
                                                            <obout:ComboBoxItem ID="Option30" runat="server" Value="USA" Text="USA" ImageUrl="../combobox/resources/images/flags/flag_usa.png" />
                                                        </Items>
                                                    </obout:ComboBox>
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
                                                    Order ID:
                                                </td>
                                                <td>
                                                    <input id="txtOrderID" style="width: 150px;" class="ob_gEC" readonly="readonly" />
                                                </td>
                                            </tr>
                                            <td>
                                                Order Date:
                                            </td>
                                            <td valign="middle">
                                                <input type="text" id="txtOrderDate" style="width: 150px;" class="ob_gEC" />
                                            </td>
                                            <td valign="middle">
                                                <obout:Calendar ID="gridCal1" runat="server" StyleFolder="../Calendar/styles/expedia"
                                                    DatePickerMode="true" TextBoxId="txtOrderDate" TextArrowLeft="" TextArrowRight=""
                                                    DatePickerImagePath="../Calendar/styles/icon2.gif" />
                                            </td>
                            </tr>
                            <tr>
                                <td>
                                    Required Date:
                                </td>
                                <td valign="middle">
                                    <input type="text" id="txtRequiredDate" style="width: 150px;" class="ob_gEC" />
                                </td>
                                <td valign="middle">
                                    <obout:Calendar ID="gridCal2" runat="server" StyleFolder="../Calendar/styles/expedia"
                                        DatePickerMode="true" TextBoxId="txtRequiredDate" TextArrowLeft="" TextArrowRight=""
                                        DatePickerImagePath="../Calendar/styles/icon2.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Shipped Date:
                                </td>
                                <td>
                                    <input type="text" id="txtShippedDate" style="width: 150px;" class="ob_gEC" />
                                </td>
                                <td valign="middle">
                                    <obout:Calendar ID="gridCal3" runat="server" StyleFolder="../Calendar/styles/expedia"
                                        DatePickerMode="true" TextBoxId="txtShippedDate" TextArrowLeft="" TextArrowRight=""
                                        DatePickerImagePath="../Calendar/styles/icon2.gif" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Ship Via:
                                </td>
                                <td>
                                    <input type="text" id="txtShipVia" style="width: 150px;" class="ob_gEC" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Sent:
                                </td>
                                <td>
                                    <input id="chkSentEdit" type="checkbox" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                </td>
                            </tr>
                        </table>
                        </fieldset> </td> </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="button" value="Save" onclick="saveChanges()" class="tdText" />
                                <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" />
                            </td>
                        </tr>
                        </table>
                    </div></div>
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>
    
    <br />
    <br />
    
    <span class="tdText">
        The details are displayed / edited using row templates, that are configured using the <b>RowEditTemplateId</b> property.
    </span>
    
    <br /><br />
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    </form>
</body>
</html>

