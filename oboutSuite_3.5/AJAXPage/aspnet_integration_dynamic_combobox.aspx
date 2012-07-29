<%@ Page Language="C#" Inherits="OboutInc.oboutAJAXPage" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Register TagPrefix="oajax" Namespace="OboutInc" Assembly="obout_AJAXPage" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
    static readonly object obj = new object();
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

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 *, FORMAT(OrderDate, \"mm/dd/yyyy\") AS OrderDateFormatted, FORMAT(RequiredDate, \"mm/dd/yyyy\") AS RequiredDateFormatted, FORMAT(ShippedDate, \"mm/dd/yyyy\") AS ShippedDateFormatted FROM Orders ORDER BY OrderID DESC", myConn);
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

    // update the country list with the countries from the selected continent
    public string SetCountry(string ContinentID)
    {
        // load continent list from the database
        //OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("continent.mdb"));
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DynamicCombobox.mdb"));
        myConn.Open();

        OleDbCommand myComm;
        myComm = new OleDbCommand("select CountryID, CountryName from Country where ContinentID = " + ContinentID + " order by CountryName", myConn);
        OleDbDataReader myReader = myComm.ExecuteReader();
        string responseData = string.Empty;
        lock (obj)
        {
            while (myReader.Read())
            {
                string data = myReader.GetInt32(0).ToString() + "@" + myReader.GetString(1);
                responseData += (responseData.Length == 0) ? data : ("|" + data);
            }
        }
        myReader.Close();
        myConn.Close();

        return responseData;
    }

    // update the city list with the cities from the selected country
    public string SetCity(string CountryID)
    {
        // load continent list from the database
        //OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("continent.mdb"));
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DynamicCombobox.mdb"));
        myConn.Open();

        OleDbCommand myComm;
        myComm = new OleDbCommand("select CityID, CityName from City where CountryID = " + CountryID + " order by CityName", myConn);
        OleDbDataReader myReader = myComm.ExecuteReader();
        string responseData = string.Empty;
        lock (obj)
        {
            while (myReader.Read())
            {
                string data = myReader.GetInt32(0).ToString() + "@" + myReader.GetString(1);
                responseData += (responseData.Length == 0) ? data : ("|" + data);
            }
        }
        myReader.Close();
        myConn.Close();

        return responseData;
    }

    public string SetContinent(string Country)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/DynamicCombobox.mdb"));
        myConn.Open();

        OleDbCommand myComm;
        myComm = new OleDbCommand("select ContinentName from Continent where ContinentID = (select ContinentID from Country where CountryName = '"+Country+"')", myConn);
        OleDbDataReader myReader = myComm.ExecuteReader();
        string continentName = string.Empty;
        while (myReader.Read())
        {
            continentName = myReader.GetString(0);
        }
        myReader.Close();
        myComm = new OleDbCommand("select ContinentID, ContinentName from Continent", myConn);
        myReader = myComm.ExecuteReader();
        string continentsForCombo = string.Empty;
        while (myReader.Read())
        {
            string data = myReader.GetInt32(0).ToString() + "@" + myReader.GetString(1);
            continentsForCombo += (continentsForCombo.Length == 0) ? data : ("|" + data);
        }
        myReader.Close();
        myConn.Close();
        return (continentName + "^" + continentsForCombo);
    }
</script>

<html>
<head runat="server">
    <title>obout AJAXPage examples</title>
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
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
    </style>

    <script type="text/javascript">
        var currentCity = "";
        var currentCountry = "";
        function LoadData(iRecordIndex,Mode){
            var orId=grid1.Rows[iRecordIndex].Cells[0].Value;
            ob_post.AddParam("orderId",orId);
            ob_post.post(null, "LoadRecord", Mode=="Edit"?PopulateEdit:PopulateView);
            ob_post.ResetParams(); 
        }
        
        function PopulateView(iRecord) {
            document.getElementById("lblShipName").value = iRecord[0].toString();
            document.getElementById("lblShipAddress").value =iRecord[1].toString();
            document.getElementById("lblShipCity").value = iRecord[2].toString();
            document.getElementById("lblShipRegion").value =iRecord[3].toString();
            document.getElementById("lblShipPostalCode").value =iRecord[4].toString();
            document.getElementById("lblCountry").value = iRecord[5].toString();
            document.getElementById("lblOrderDate").value = iRecord[7].toString();
            document.getElementById("lblRequiredDate").value = iRecord[8].toString();
            document.getElementById("lblShippedDate").value = iRecord[9].toString();
            document.getElementById("lblShipVia").value = iRecord[10].toString();
            document.getElementById("chkSent").checked = iRecord[11].toString().toLowerCase() == "true" ? true : false;
            
            }
            
        function PopulateEdit(iRecord) {
            document.getElementById('cityRow').style.display = 'none';
            document.getElementById("txtShipName").value = iRecord[0].toString();
            document.getElementById("txtShipAddress").value =iRecord[1].toString();
            //document.getElementById("txtShipCity").value = iRecord[2].toString();
            document.getElementById("txtShipRegion").value =iRecord[3].toString();
            document.getElementById("txtShipPostalCode").value =iRecord[4].toString();
            //document.getElementById("ob_ddlCountriesTextbox").value= iRecord[5].toString();
            document.getElementById("txtOrderID").value=iRecord[6].toString();
            document.getElementById("txtOrderDate").value = iRecord[7].toString();
            document.getElementById("txtRequiredDate").value = iRecord[8].toString();
            document.getElementById("txtShippedDate").value = iRecord[9].toString();
            document.getElementById("txtShipVia").value = iRecord[10].toString();
            document.getElementById("chkSentEdit").checked = iRecord[11].toString().toLowerCase() == "true" ? true : false;
            currentCity = iRecord[2].toString();
            currentCountry = iRecord[5].toString();
            ob_post.AddParam("Country", currentCountry);
            ob_post.post(null, "SetContinent", populateContinents);
        }

        function populateContinents(response) {
            var continent = response.split('^')[0];
            var continentList = response.split('^')[1].split('|');
            cboContinent.options.clear();
            var id = "";
            for (var p = 0; p < continentList.length; p++)
            {
                var data = continentList[p].split('@');
                cboContinent.options.add(data[1], data[0]);
            }

            if (cboContinent.selectedIndex() >= 0 && cboContinent.options[cboContinent.selectedIndex()].text == continent) {
                ob_post.AddParam("ContinentID", cboContinent.value());
                ob_post.post(null, "SetCountry", populateCountries);
                return;
            }
            for(var opts = 0; cboContinent.options.length; opts++)
            {
                if (cboContinent.options[opts].text == continent) 
                {
                    cboContinent.value(cboContinent.options[opts].value);
                    break;
                }
            }
        }
        
        function populateCountries(response)
        {
            var countryList = response.split('|');
            cboCountry.options.clear();
            
            for(var n = 0; n < countryList.length; n++)
            {
                var data = countryList[n].split('@');
                cboCountry.options.add(data[1], data[0]);
            }
            if (cboCountry.selectedIndex() >= 0 && cboCountry.options[cboCountry.selectedIndex()].text.length > 0 && cboCountry.options[cboCountry.selectedIndex()].text == currentCountry) {
                ob_post.AddParam("CountryID", cboCountry.value());
                ob_post.post(null, "SetCity", populateCities);
                return;
            }
            cboCountry.value('');
            for(var opts = 0; opts < cboCountry.options.length; opts++)
            {
                if(cboCountry.options[opts].text == currentCountry) 
                {
                    cboCountry.value(cboCountry.options[opts].value);
                    break;
                }
            }
            currentCountry = '';
            //if(cboCountry.value() == '')cboCountry.setText('');
        }
        
        function populateCities(response)
        {
            var cityList = response.split('|');
            document.getElementById('cityRow').style.display = '';
            cboCity.options.clear();
            cboCity.value('');
            for(var n = 0; n < cityList.length; n++)
            {
                var data = cityList[n].split('@');
                if(data.length > 1)
                {
                    cboCity.options.add(data[1], data[0]);
                }
            }
            if(currentCity.length)
            {
                if(cboCity.options.length)
                {
                    var flag = false;
                    for(var opts = 0; opts < cboCity.options.length; opts++)
                    {
                        if(cboCity.options[opts].oext == currentCity) 
                        {
                            cboCity.value(cboCity.options[opts].value);
                            flag = true;
                            break;
                        }
                    }
                    if(!flag)
                    {
                        cboCity.options.add(currentCity, "-1");
                        cboCity.value("-1");
                    }
                }
                else 
                {
                        cboCity.options.add(currentCity, "-1");
                        cboCity.value("-1");
                }
            }
            currentCountry = '';
            currentCity = '';
            //if(cboCity.getValue()=='') cboCity.setText('');
        }

        function saveChanges() {
            if (cboCity.selectedIndex() >= 0 && cboCountry.selectedIndex() >= 0) {
                var oRecord = new Object();
                oRecord.OrderID = document.getElementById("txtOrderID").value;
                oRecord.ShipName = document.getElementById("txtShipName").value;
                oRecord.ShipAddress = document.getElementById("txtShipAddress").value;
                oRecord.ShipCity = cboCity.options[cboCity.selectedIndex()].text;
                oRecord.ShipRegion = document.getElementById("txtShipRegion").value;
                oRecord.ShipPostalCode = document.getElementById("txtShipPostalCode").value;
                oRecord.ShipCountry = cboCountry.options[cboCountry.selectedIndex()].text;
                oRecord.OrderDate = document.getElementById("txtOrderDate").value;
                oRecord.RequiredDate = document.getElementById("txtRequiredDate").value;
                oRecord.ShippedDate = document.getElementById("txtShippedDate").value;
                oRecord.ShipVia = document.getElementById("txtShipVia").value;
                oRecord.Sent = document.getElementById("chkSentEdit").checked;

                grid1.executeUpdate(oRecord);
            } else {
                alert("Set Country and City fields!");
            }
        }
    			
		function ShowDetails(e)	{
		    if(grid1.RecordInEditMode!=null) {
		        grid1.cancel();
		    }
		    
		    grid1.edit_record(e)

		    detailsContainer= document.getElementById("DetailsContainer");
		    editContainer=document.getElementById("EditContainer");

		    OrderID=e.id.split('_')[1];
		    if(e.value=="Edit") {
		        editContainer.style.display="block";
		        detailsContainer.style.display="none";
		
		        LoadData(OrderID,"Edit");
		    } else {
		        editContainer.style.display="none";
		        detailsContainer.style.display="block";

		        LoadData(OrderID,"View");
		    }
		}
		
		function SelectContinent()
        {
	        var ContinentID = cboContinent.value();	
	        if(ContinentID)
	        {
	            document.getElementById('cityRow').style.display = 'none';
	            ob_post.AddParam("ContinentID", ContinentID);
	            cboCountry.options.clear();
	            ob_post.post(null, "SetCountry", populateCountries);
	        }
        }
        function SelectCountry()
        {
	        var CountryID = cboCountry.value();
	        if(CountryID)
	        {
	            ob_post.AddParam("CountryID", CountryID);
	            cboCity.options.clear();
	            ob_post.post(null, "SetCity", populateCities);
	        }
        }
		
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid Integration with Dynamic Combobox</b></span>
    
    <br />
    <br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
        FolderStyle="../grid/styles/premiere_blue" AllowAddingRecords="false" OnRebind="RebindGrid"
        OnUpdateCommand="UpdateRecord" RowEditTemplateId="tplRowEdit"
        AllowPageSizeSelection="false" >
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
        <TemplateSettings RowEditTemplateId="tplRowEdit" />
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
            <obout:GridTemplate runat="server" ID="updateBtnTemplate">
            <Template>&#160;</Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="tplRowEdit">
                <Template>
                <div style="text-align:center"> 
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
                                                    <input id="lblShipName" style="width: 150px;" class="txtText" readonly="readonly" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Address:
                                                </td>
                                                <td>
                                                    <input id="lblShipAddress" style="width: 150px;" class="txtText" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship City:
                                                </td>
                                                <td>
                                                    <input id="lblShipCity" style="width: 150px;" class="txtText" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Region:
                                                </td>
                                                <td>
                                                    <input id="lblShipRegion" style="width: 150px;" class="txtText" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Postal Code:
                                                </td>
                                                <td>
                                                    <input id="lblShipPostalCode" style="width: 150px;" class="txtText" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Country:
                                                </td>
                                                <td>
                                                    <input id="lblCountry" style="width: 150px;" class="txtText" />
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
                                                    <input id="lblOrderDate" style="width: 150px;" class="txtText" />
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Required Date:
                                                </td>
                                                <td valign="middle">
                                                    <input id="lblRequiredDate" style="width: 150px;" class="txtText" />
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Shipped Date:
                                                </td>
                                                <td>
                                                    <input id="lblShippedDate" style="width: 150px;" class="txtText" />
                                                </td>
                                                <td valign="middle">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="txtText">
                                                    Ship Via:
                                                </td>
                                                <td>
                                                    <input id="lblShipVia" style="width: 150px;" class="txtText" />
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
                                    <fieldset style="height: 216px; width:300px;">
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
                                                    Ship Continent:
                                                </td>
                                                <td>
                                                    <div style="text-align:left;" id="divContinent">
		                                                <obout:Combobox id="cboContinent" Width="200" runat="server" >
                                                            <ClientSideEvents 
                                                                OnSelectedIndexChanged="SelectContinent"
                                                             />
		                                                </obout:Combobox> 
			                                        </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Ship Country:
                                                </td>
                                                <td>
                                                    <div id="divCountryCombo" style="text-align:left;">
				                                        <obout:Combobox id="cboCountry" Width="200" Height="200" runat="server">
                                                            <ClientSideEvents 
                                                                OnSelectedIndexChanged="SelectCountry"
                                                             />
				                                        </obout:Combobox> 
				                                    </div>
                                                </td>
                                            </tr>
                                            <tr id="cityRow" style="display:none;">
		                                        <td>
			                                        Ship City:
		                                        </td>
		                                        <td>
		                                            <div id="divCityCombo" style="text-align:left;">
				                                        <obout:Combobox id="cboCity" Width="200" Height="200" runat="server">
				                                        </obout:Combobox> 
			                                        </div>
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
                                    <fieldset style="width: 300px; height: 216px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td>
                                                    Order ID:
                                                </td>
                                                <td>
                                                    <input id="txtOrderID" style="width: 150px;" class="txttext" />
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
        The details are displayed / edited using row templates. <br />
The list of City/Country/Continent are loaded dynamically in combobox.
    </span>
    
    <br /><br />
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    </form>
</body>
</html>

