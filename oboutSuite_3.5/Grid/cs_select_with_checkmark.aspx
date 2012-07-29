<%@ Page Language="C#" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="C#" runat="server">
 
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/premiere_blue";
        grid1.AllowAddingRecords = false;

        grid1.ClientSideEvents.OnClientSelect = "OnSelect";
        grid1.ClientSideEvents.OnClientCallback = "SelectWithImage";

        // creating the template for the Image column (view mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate ImageTemplate = new GridRuntimeTemplate();
        ImageTemplate.ID = "ImageTemplate";
        ImageTemplate.Template = new Obout.Grid.RuntimeTemplate();
        ImageTemplate.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateImageTemplate);
        //------------------------------------------------------------------------		

        // adding the template to the Templates collection
        grid1.Templates.Add(ImageTemplate);

        // setting the event handlers
        grid1.RowDataBound += new GridRowEventHandler(OnRowDataBound);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = " ";
        oCol1.Width = "50";
        oCol1.TemplateSettings.TemplateId = "ImageTemplate";

        Column oCol1_2 = new Column();
        oCol1_2.DataField = "OrderID";
        oCol1_2.Visible = false;

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.HeaderText = "NAME";
        oCol2.Width = "180";

        Column oCol3 = new Column();
        oCol3.DataField = "ShipCity";
        oCol3.HeaderText = "CITY";
        oCol3.Width = "180";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipPostalCode";
        oCol4.HeaderText = "POSTAL CODE";
        oCol4.Width = "120";

        Column oCol5 = new Column();
        oCol5.DataField = "ShipCountry";
        oCol5.HeaderText = "COUNTRY";
        oCol5.Width = "100";

        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol1_2);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        // add the grid to the controls collection of the PlaceHolder        

        phGrid1.Controls.Add(grid1);

        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    // Create the methods that will load the data into the templates
    //------------------------------------------------------------------------

    public void CreateImageTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        Literal oLiteral = new Literal();
        e.Container.Controls.Add(oLiteral);
        oLiteral.DataBinding += new EventHandler(DataBindImageTemplate);
    }

    protected void DataBindImageTemplate(Object sender, EventArgs e)
    {
        Literal oLiteral = sender as Literal;
        Obout.Grid.TemplateContainer oContainer = oLiteral.NamingContainer as Obout.Grid.TemplateContainer;

        oLiteral.Text = "<img src=\"resources/images/tick.gif\" alt=\"\" name=\"SelectImage\" id=\"SelectImage_" + oContainer.DataItem["OrderID"] + "\" class=\"hidden\"  />";
    }

    //------------------------------------------------------------------------


    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    void OnRowDataBound(object sender, GridRowEventArgs e)
    {
        string id = e.Row.Cells[0].Text;
        for (int i = 0; i < e.Row.Cells.Count; i++)
        {
            e.Row.Cells[i].Attributes.Add("onclick", "OnRecordClick(" + id + ")");
        }
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    
    <br />
    <br />
    <br />
    
    <span class="tdText">You can use templates to display a checkmark indicating the selected records.</span>
    
    <br />
    <br />
    <br />
    
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    
    </form>
</body>
</html>
