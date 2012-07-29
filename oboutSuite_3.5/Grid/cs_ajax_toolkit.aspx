<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Grid grid1 = new Grid();
    protected void Page_Load(object sender, EventArgs e)
    {
        grid1.ID = "grid1";
        grid1.CallbackMode = true;
        grid1.Serialize = true;
        grid1.AutoGenerateColumns = false;
        grid1.AllowAddingRecords = false;
        grid1.ShowLoadingMessage = false;

        grid1.FolderStyle = "styles/premiere_blue";

        grid1.UpdateCommand += new Obout.Grid.Grid.EventHandler(UpdateRecord);
        grid1.DeleteCommand += new Obout.Grid.Grid.EventHandler(DeleteRecord);
        grid1.Rebind += new Obout.Grid.Grid.DefaultEventHandler(RebindGrid);

        GridRuntimeTemplate TemplateEditBirthDate = new GridRuntimeTemplate();
        TemplateEditBirthDate.ID = "TemplateEditBirthDate";
        TemplateEditBirthDate.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditBirthDate.Template.CreateTemplate+=new GridRuntimeTemplateEventHandler(BirthDateTemplate);
        TemplateEditBirthDate.ControlID = "txtBirthDate";
        TemplateEditBirthDate.ControlPropertyName = "value";

        GridRuntimeTemplate TemplateEditSalary = new GridRuntimeTemplate();
        TemplateEditSalary.ID="TemplateEditSalary";
        TemplateEditSalary.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditSalary.Template.CreateTemplate+=new GridRuntimeTemplateEventHandler(SalaryTemplate);
        TemplateEditSalary.ControlID = "txtSalary";
        TemplateEditSalary.ControlPropertyName = "value";

        GridRuntimeTemplate TemplateEditHomePhone = new GridRuntimeTemplate();
        TemplateEditHomePhone.ID = "TemplateEditHomePhone";
        TemplateEditHomePhone.Template = new Obout.Grid.RuntimeTemplate();
        TemplateEditHomePhone.Template.CreateTemplate += new GridRuntimeTemplateEventHandler(HomePhoneTemplate);
        TemplateEditHomePhone.ControlID = "txtHomePhone";
        TemplateEditHomePhone.ControlPropertyName = "value";

        grid1.Templates.Add(TemplateEditBirthDate);
        grid1.Templates.Add(TemplateEditSalary);
        grid1.Templates.Add(TemplateEditHomePhone);

        Column oCol1 = new Column();
        oCol1.DataField = "EmployeeId";
        oCol1.Visible = false;
        oCol1.HeaderText = "ID";

        Column oCol2 = new Column();
        oCol2.DataField = "BirthDate";
        oCol2.DataFormatString = "{0:dddd, dd MMMM yyyy hh:mm tt}";
        oCol2.HeaderText = "BIRTH DATE";
        oCol2.Width = "270";
        oCol2.TemplateSettings.EditTemplateId = "TemplateEditBirthDate";

        Column oCol3 = new Column();
        oCol3.DataField = "Salary";
        oCol3.DataFormatString = "{0:c}";
        oCol3.HeaderText = "SALARY";
        oCol3.Width = "175";
        oCol3.TemplateSettings.EditTemplateId = "TemplateEditSalary";

        Column oCol4 = new Column();
        oCol4.DataField = "HomePhone";
        oCol4.HeaderText = "HOME PHONE";
        oCol4.Width = "200";
        oCol4.TemplateSettings.EditTemplateId = "TemplateEditHomePhone";
            

        Column oCol5 = new Column();
        oCol5.Width = "125";
        oCol5.AllowEdit = true;
        oCol5.AllowDelete = true;

        grid1.Columns.Add(oCol1);
        grid1.Columns.Add(oCol2);
        grid1.Columns.Add(oCol3);
        grid1.Columns.Add(oCol4);
        grid1.Columns.Add(oCol5);

        phGrid1.Controls.Add(grid1);

        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
        
    }

    public void BirthDateTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        TextBox txtBirthdate = new TextBox();
        txtBirthdate.ID = "txtBirthDate";
        txtBirthdate.CssClass = "ob_gEC";
        e.Container.Controls.Add(txtBirthdate);
        
        AjaxControlToolkit.MaskedEditExtender maskEditExtenderBDate = new MaskedEditExtender();
        maskEditExtenderBDate.ID = "maskEditExtenderBDate";
        maskEditExtenderBDate.TargetControlID = "txtBirthDate";
        maskEditExtenderBDate.Mask = "99/99/9999 99:99:99";
        maskEditExtenderBDate.MaskType = AjaxControlToolkit.MaskedEditType.DateTime;
        maskEditExtenderBDate.AcceptAMPM = true;
        e.Container.Controls.Add(maskEditExtenderBDate);
    }

    public void SalaryTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        TextBox txtSalary = new TextBox();
        txtSalary.ID = "txtSalary";
        txtSalary.CssClass = "ob_gEC";
        e.Container.Controls.Add(txtSalary);

        AjaxControlToolkit.MaskedEditExtender maskEditExtenderSalary = new MaskedEditExtender();
        maskEditExtenderSalary.ID = "maskEditExtenderSalary";
        maskEditExtenderSalary.TargetControlID = "txtSalary";
        maskEditExtenderSalary.Mask = "99,99,999.99";
        maskEditExtenderSalary.MaskType = AjaxControlToolkit.MaskedEditType.Number;
        maskEditExtenderSalary.InputDirection = AjaxControlToolkit.MaskedEditInputDirection.RightToLeft;
        maskEditExtenderSalary.DisplayMoney = AjaxControlToolkit.MaskedEditShowSymbol.Left;
        e.Container.Controls.Add(maskEditExtenderSalary);
        
    }

    public void HomePhoneTemplate(Object sender, Obout.Grid.GridRuntimeTemplateEventArgs e)
    {
        TextBox txtHomePhone = new TextBox();
        txtHomePhone.ID = "txtHomePhone";
        txtHomePhone.CssClass = "ob_gEC";
        e.Container.Controls.Add(txtHomePhone);

        AjaxControlToolkit.MaskedEditExtender maskEditExtenderHPhone = new MaskedEditExtender();
        maskEditExtenderHPhone.ID = "maskEditExtenderHPhone";
        maskEditExtenderHPhone.TargetControlID = "txtHomePhone";
        maskEditExtenderHPhone.Mask = "(999) 999-9999";
        maskEditExtenderHPhone.MaskType = AjaxControlToolkit.MaskedEditType.Number;
        maskEditExtenderHPhone.InputDirection = AjaxControlToolkit.MaskedEditInputDirection.LeftToRight;
        maskEditExtenderHPhone.ClearMaskOnLostFocus = false;
        e.Container.Controls.Add(maskEditExtenderHPhone);
        
    }

    void CreateGrid()
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

        OleDbCommand myComm = new OleDbCommand("SELECT * FROM Employees", myConn);
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

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Employees WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@EmployeeID", OleDbType.Integer).Value = e.Record["EmployeeId"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        string phNumber = e.Record["HomePhone"].ToString().Replace("_", string.Empty);

        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Employees SET BirthDate = @BirthDate, Salary = @Salary, HomePhone=@HomePhone WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@BirthDate", OleDbType.VarChar).Value = e.Record["BirthDate"];
        myComm.Parameters.Add("@Salary", OleDbType.Currency).Value = e.Record["Salary"];
        myComm.Parameters.Add("@HomePhone", OleDbType.VarChar).Value = phNumber;
        myComm.Parameters.Add("@EmployeeId", OleDbType.Integer).Value = e.Record["EmployeeId"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }

    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<title>obout ASP.NET Grid examples</title>
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
        <form id="Form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>					
		    <br />
		    <span class="tdText"><b>ASP.NET Grid - Integration with ASP.NET AJAX Control Toolkit</b> </span>		
		    <br /><br />
		
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>		
				
		    <br /><br />
		    <span class="tdText">
		         The controls from the ASP.NET AJAX Control Toolkit can be used inside GridTemplates to improve the user experience.
		    </span>
		    
		    <br /><br /><br />
		    
		    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
    </body>
</html>
