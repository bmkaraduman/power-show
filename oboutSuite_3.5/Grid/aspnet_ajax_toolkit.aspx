<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
        string phNumber = e.Record["HomePhone"].ToString().Replace("_",string.Empty);
        
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

<html>
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
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AllowAddingRecords="false"
			 FolderStyle="styles/premiere_blue" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
			<obout:Column ID="Column1" DataField="EmployeeId" HeaderText="ID" runat="server" Visible="false"></obout:Column>
				<obout:Column ID="Column2" DataField="BirthDate" HeaderText="BIRTH DATE" Width="270" runat="server" DataFormatString="{0:dddd, dd MMMM yyyy hh:mm tt}">
				    <TemplateSettings EditTemplateID="TemplateEditBirthDate" />
				</obout:Column>
				<obout:Column ID="Column3" DataField="Salary" HeaderText="SALARY" Width="175" runat="server" DataFormatString="{0:c}" >
				    <TemplateSettings EditTemplateID="TemplateEditSalary" />
				</obout:Column>
				<obout:Column ID="Column4" DataField="HomePhone" HeaderText="HOME PHONE" Width="200" runat="server">
				    <TemplateSettings EditTemplateID="TemplateEditHomePhone" />
				</obout:Column>
				<obout:Column ID="Column5" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			<Templates>

				<obout:GridTemplate runat="server" ID="TemplateEditBirthDate" ControlID="txtBirthDate" ControlPropertyName="value">
					<Template>
				        <asp:TextBox ID="txtBirthDate" CssClass="ob_gEC" runat="server" Width="170px" style="text-align:justify" />
                         <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderBdate" runat="server" 
                            TargetControlID="txtBirthDate"
                            Mask="99/99/9999 99:99:99"
                            MaskType="DateTime"
                            AcceptAMPM="true" />
					    </Template>
				</obout:GridTemplate>
				
				<obout:GridTemplate runat="server" ID="TemplateEditSalary" ControlID="txtSalary" ControlPropertyName="value">
					<Template>
				        <asp:TextBox ID="txtSalary" CssClass="ob_gEC" runat="server" Width="130px" style="text-align:justify" />
                         <ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderSalary" runat="server" 
                            TargetControlID="txtSalary"
                            Mask="99,99,999.99"
                            InputDirection="RightToLeft"
                            MaskType="Number"
                            DisplayMoney="Left"
                            ErrorTooltipEnabled="True" />
					</Template>
				</obout:GridTemplate>

				<obout:GridTemplate runat="server" ID="TemplateEditHomePhone" ControlID="txtHomePhone" ControlPropertyName="value">
					<Template>
						<asp:TextBox ID="txtHomePhone" CssClass="ob_gEC" runat="server" Width="130px" style="text-align:justify" ValidationGroup="MKE" />
						<ajaxToolkit:MaskedEditExtender ID="MaskedEditExtenderPhone" runat="server" 
						    TargetControlID="txtHomePhone"
                            Mask="(999) 999-9999"
                            ClearMaskOnLostFocus="false"
                            InputDirection="LeftToRight"
                            MaskType="Number"/>
					</Template>
				</obout:GridTemplate>
				
			</Templates>
		</obout:Grid>				

		<br /><br />
		
	    <span class="tdText">
	         The controls from the ASP.NET AJAX Control Toolkit can be used inside GridTemplates to improve the user experience.
	    </span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>