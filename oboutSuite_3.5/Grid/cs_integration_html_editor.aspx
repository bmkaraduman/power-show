<%@ Page Language="C#" ValidateRequest="false" %>

<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
    Grid grid1 = new Grid();

    void Page_load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.FolderStyle = "styles/grand_gray";
        
        grid1.ClientSideEvents.OnClientEdit = "onAddEdit";
        grid1.ClientSideEvents.OnClientAdd = "onAddEdit";
        grid1.ClientSideEvents.OnBeforeClientUpdate = "onBeforeInsertUpdate";
        grid1.ClientSideEvents.OnBeforeClientInsert = "onBeforeInsertUpdate";
        grid1.ClientSideEvents.OnBeforeClientCancelEdit = "onBeforeClientCancelEdit";

        // setting the event handlers
        grid1.InsertCommand += new Obout.Grid.Grid.EventHandler(InsertRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        // creating the template for the Country column (edit mode)
        //------------------------------------------------------------------------
        GridRuntimeTemplate TemplateAdditionalInformation = new GridRuntimeTemplate();
        TemplateAdditionalInformation.ID = "tmpEditor";
        TemplateAdditionalInformation.Template = new Obout.Grid.RuntimeTemplate();
        TemplateAdditionalInformation.Template.CreateTemplate += new Obout.Grid.GridRuntimeTemplateEventHandler(CreateAdditionalInformationTemplate);
        TemplateAdditionalInformation.ControlID = "EditorContent";
        TemplateAdditionalInformation.ControlPropertyName = "value";
        //------------------------------------------------------------------------

        // adding the templates to the Templates collection
        grid1.Templates.Add(TemplateAdditionalInformation);

        // creating the columns
        Column oCol1 = new Column();
        oCol1.DataField = "OrderID";
        oCol1.ReadOnly = true;
        oCol1.HeaderText = "ORDER ID";
        oCol1.Width = "150";

        Column oCol2 = new Column();
        oCol2.DataField = "ShipName";
        oCol2.Visible = true;
        oCol2.HeaderText = "NAME";
        oCol2.Width = "250";

        Column oCol13 = new Column();
        oCol13.DataField = "AdditionalInformationHTML";
        oCol13.HeaderText = "ADDITIONAL INFORMATION";
        oCol13.Width = "600";
        oCol13.ParseHTML = true;
        oCol13.TemplateSettings.EditTemplateId = "tmpEditor";

        Column oCol14 = new Column();
        oCol14.DataField = "";
        oCol14.Visible = true;
        oCol14.HeaderText = "EDIT";
        oCol14.Width = "150";
        oCol14.AllowEdit = true;
        oCol14.AllowDelete = true;


        // add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol13);
        grid1.Columns.Add(oCol14);

        // add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1);

        if (!Page.IsPostBack)
        {
            BindGrid();
        }

        EditorID.Value = ((Editor)(grid1.Templates[0].Container.FindControl("Editor"))).ClientID;
    }


    //------------------------------------------------------------------------
    public void CreateAdditionalInformationTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        PlaceHolder ph1 = new PlaceHolder();
        e.Container.Controls.Add(ph1);
        
        Editor editor = new Editor();
        editor.ID = "Editor";
        editor.Height = 300;
        editor.Width = 550;
        editor.TopToolbar.Appearance = EditorTopToolbar.AppearanceType.Lite;

        Literal HiddenInput = new Literal();
        HiddenInput.Text = "<input type=\"hidden\" id=\"EditorContent\" />"; 
       
        ph1.Controls.Add(editor);
        ph1.Controls.Add(HiddenInput);
        
    }

   
    //------------------------------------------------------------------------


    void BindGrid()
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

        OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, AdditionalInformationHTML=@AdditionalInformationHTML WHERE OrderID=@OrderID", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, AdditionalInformationHTML) VALUES(@ShipName, @AdditionalInformationHTML)", myConn);

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
        myComm.Parameters.Add("@AdditionalInformationHTML", OleDbType.VarChar).Value = e.Record["AdditionalInformationHTML"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void RebindGrid(object sender, EventArgs e)
    {
        BindGrid();
    }
</script>

<html>
<head id="Head1" runat="server">
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
            background-color: ____:#f6f9fc;padding-left:4px;padding-right:4px;}
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
    <span class="tdText"><b>ASP.NET Grid - HTML Editor Inline</b></span>
    <br />
    <br />
    
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    
    <asp:HiddenField ID="EditorID" runat="server" />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
   
    <br />
    <br />
    <br />
    <span class="tdText">The HTML Editor can be used inside the Grid to edit fields that
        contain data in html format. </span>
    <br />
    <br />
    <br />
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    </form>
</body>
</html>

