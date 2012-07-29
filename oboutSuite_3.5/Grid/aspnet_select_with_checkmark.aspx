<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
 
    void Page_load(object sender, EventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    protected void grid1_RowDataBound(object sender, GridRowEventArgs e)
    {
        string id = e.Row.Cells[0].Text;
        for (int i = 0; i < e.Row.Cells.Count; i++)
        {
            e.Row.Cells[i].Attributes.Add("onclick", "OnRecordClick(" + id + ")");
        }
    }
</script>


<html>
<head>
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        a {
			font:11px Verdana;
			color:#315686;
			text-decoration:underline;
			white-space: nowrap;
		}

		a:hover {
			color:crimson;
			white-space: nowrap;
		}
        .hidden
        {
            display: none;
            width: 20px;
        }
        .visible
        {
            display: ;
            width:20px;
        }
        
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        
        </style>

    <script type="text/javascript" language="javascript">
               
        function OnRecordClick(e)
        {
            var img = document.getElementById("SelectImage_" + e);
            if (img) {
                if (img.className == 'visible') {
                    img.className = 'hidden';
                }
                else {
                    img.className = 'visible';
                } 
            }
        }
        
        function OnSelect(arrSelectedRecords) {
            SelectWithImage();
        }

        function SelectWithImage() {
        
            var images = document.getElementsByName('SelectImage');

            for (var i = 0; i < images.length; i++) {
                images[i].className = 'hidden';
                for (var j = 0; j < grid1.PageSelectedRecords.length; j++) {
                    selectedId = 'SelectImage_' + grid1.PageSelectedRecords[j].OrderID;
                    if (images[i].id == selectedId) {
                        images[i].className = 'visible';
                    }
                }
            }
        }

        window.onload = SelectWithImage;
               
    </script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Select using Checkmark</b></span>
    
    <br />
    <br />
    
    <obout:Grid ID="grid1" runat="server" CallbackMode="true" Serialize="false" AutoGenerateColumns="false"
        AllowAddingRecords="false" FolderStyle="styles/grand_gray" AllowFiltering="false" KeepSelectedRecords="true"
        AllowMultiRecordSelection="true" OnRowDataBound="grid1_RowDataBound">
        <ClientSideEvents OnClientSelect="OnSelect" OnClientCallback="SelectWithImage" />
        <Columns>
            <obout:Column ID="Column1" Width="50" HeaderText=" ">
                <TemplateSettings TemplateId="ImageTemplate" />
            </obout:Column>
            <obout:Column DataField="OrderID" Visible="false" />
            <obout:Column ID="Column2" DataField="ShipName" HeaderText="NAME" Width="180" runat="server" />
            <obout:Column ID="Column3" DataField="ShipCity" HeaderText="CITY" Width="180" runat="server" />
            <obout:Column ID="Column4" DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="120" runat="server" />
            <obout:Column id="Column5" DataField="ShipCountry" HeaderText="COUNTRY" Width="100" runat="server"></obout:Column>
        </Columns>
        <Templates>
            <obout:GridTemplate runat="server" ID="ImageTemplate">
                <Template>
                    <img src="resources/images/tick.gif" name="SelectImage" id="SelectImage_<%# Container.DataItem["OrderID"] %>"
                        alt="" class="hidden" />
                </Template>
            </obout:GridTemplate>
        </Templates>
    </obout:Grid>
    
    <br />
    <br />
    <br />
    
    <span class="tdText">You can use templates to display a checkmark indicating the selected records.</span>
    <br />
    <br />
    <br />
    
    <a href="Default.aspx?type=ASPNET">« Back to examples</a>
    
    </form>
</body>
</html>
