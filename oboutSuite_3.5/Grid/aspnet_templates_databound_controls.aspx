<%@ Page Language="C#" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CreateGrid();
        }
    }

    void CreateGrid()
    {
        //DropDownList ddlCountries = (DropDownList)grid1.Templates[1].Container.FindControl("ddlCountries");
        
        
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

        OleDbCommand myComm = new OleDbCommand(@"SELECT Em.EmployeeID, Em.FirstName, Em.LastName, Em.SexID, Em.PositionID, Em.CountryID, C.CountryName, P.PositionName  
                                                FROM (Employees Em LEFT OUTER JOIN Countries C ON Em.CountryID=C.CountryID)
                                                  LEFT OUTER JOIN Positions P ON P.PositionID=Em.PositionID", myConn);
        myConn.Open();
        OleDbDataReader myReader = myComm.ExecuteReader();

        grid1.DataSource = myReader;
        grid1.DataBind();

        myConn.Close();
    }

    //void PopulateDropdown(DropDownList ddlCountry)
    //{
    //    OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));

    //    OleDbCommand myComm = new OleDbCommand(@"SELECT * FROM Countries", myConn);
    //    myConn.Open();
    //    OleDbDataReader myReader = myComm.ExecuteReader();

    //    ddlCountry.DataSource = myReader;
    //    ddlCountry.DataBind();

    //    myConn.Close();
    //}
    void DeleteRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Employees WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@EmployeeID", OleDbType.Integer).Value = e.Record["EmployeeID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    void UpdateRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, SexID = @SexID, PositionID=@PositionID, CountryID=@CountryID WHERE EmployeeID = @EmployeeID", myConn);

        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record["FirstName"];
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record["LastName"];
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record["SexID"];
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record["PositionID"];
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record["CountryID"];
        myComm.Parameters.Add("@EmployeeID", OleDbType.VarChar).Value = e.Record["EmployeeID"];

        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/NorthWind.mdb"));
        myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Employees (FirstName, LastName, SexID, PositionID, CountryID) VALUES(@FirstName, @LastName, @SexID,@PositionID, @CountryID)", myConn);

        myComm.Parameters.Add("@FirstName", OleDbType.VarChar).Value = e.Record["FirstName"];
        myComm.Parameters.Add("@LastName", OleDbType.VarChar).Value = e.Record["LastName"];
        myComm.Parameters.Add("@SexID", OleDbType.VarChar).Value = e.Record["SexID"];
        myComm.Parameters.Add("@PositionID", OleDbType.VarChar).Value = e.Record["PositionID"];
        myComm.Parameters.Add("@CountryID", OleDbType.VarChar).Value = e.Record["CountryID"];
        
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
    
    void RebindGrid(object sender, EventArgs e)
    {
        CreateGrid();
    }
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>obout ASP.NET Grid examples</title>
	<style type="text/css">
		.tdText {
			font:11px Verdana;
			color:#333333;
		}
		.option2{
			font:11px Verdana;
			color:#0033cc;				
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
    <script language="javascript" type="text/javascript">	

        function OnBeforeInsert(record) {
            SetSexID();
            return true;
        }
    		
        function OnEdit(record) {
            var sexID=grid1.Rows[grid1.RecordInEditMode].Cells["SexID"].Value;
        	
            if(sexID=="0"){
                document.getElementById("rFemale").checked=true;
            }
            else{
               document.getElementById("rMale").checked=true;
            }
	        return true;
        }
    	
        // Client-Side Events before Update
        function OnBeforeUpdate(record) {
            SetSexID();
	        return true;
        }
    	
        function SetSexID()
        {
            if(document.getElementById("rFemale").checked){
                document.getElementById("hidSex").value="0";
            }
            else if(document.getElementById("rMale").checked){
                document.getElementById("hidSex").value="1";
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    	
    	<br />
		<span class="tdText"><b>ASP.NET Grid - Edit with databound controls</b></span>
		<br /><br />
    
        <obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/grand_gray" AutoGenerateColumns="false"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">

		 <ClientSideEvents OnBeforeClientUpdate="OnBeforeUpdate" OnClientEdit="OnEdit" OnBeforeClientInsert="OnBeforeInsert" />
			    
			<Columns>
				<obout:Column ID="Column1" DataField="EmployeeID" ReadOnly="true" HeaderText="ID" Width="60" runat="server" Visible="false"/>				
				<obout:Column ID="Column2" DataField="FirstName" HeaderText="FIRST NAME" Width="125" runat="server"/>
				<obout:Column ID="Column3" DataField="LastName" HeaderText="LAST NAME" Width="130" runat="server"/>
				<obout:Column ID="Column4" DataField="SexID" HeaderText="SEX" Width="130" runat="server">
				    <TemplateSettings TemplateId="TemplateSex" EditTemplateID="TemplateEditSex" />
				</obout:Column>
				<obout:Column ID="Column5" DataField="PositionID" HeaderText="POSITION" Width="125" runat="server">
				    <TemplateSettings TemplateID="TemplatePosition" EditTemplateID="TemplateEditPosition" />
				</obout:Column>
                <obout:Column ID="Column6" DataField="CountryID" HeaderText="COUNTRY" Width="125" runat="server">
				    <TemplateSettings TemplateID="TemplateCountry" EditTemplateID="TemplateEditCountry" />
				</obout:Column>
				<obout:Column ID="Column7" AllowEdit="true" AllowDelete="true" HeaderText="" Width="125" runat="server" />
			</Columns>
			
			<Templates>

				<obout:GridTemplate ID="TemplateSex" runat="server">
				    <Template>
				        <%# (Container.Value == "1" ? "Male" : (Container.Value== "0" ? "Female" : "")) %>
				    </Template>
				</obout:GridTemplate>
				
                <obout:GridTemplate ID="TemplateEditSex" runat="server" ControlID="hidSex" ControlPropertyName="value">
				    <Template>
                        <input type="radio" value="1" name="radioSex" id="rMale" class="option2" />Male<br />
                        <input type="radio" value="0" name="radioSex" id="rFemale" class="option2" />Female
                        <input id="hidSex" type="hidden" />
				    </Template>
				</obout:GridTemplate>
				
				<obout:GridTemplate runat="server" ID="TemplatePosition" >
				    <Template>
				      <%# Container.DataItem["PositionName"]%>			      		       
				    </Template>
				</obout:GridTemplate>
				
				<obout:GridTemplate runat="server" ID="TemplateEditPosition" ControlID="ddlPosition" ControlPropertyName="value">
				    <Template>
                        <asp:DropDownList ID="ddlPosition" runat="server" AppendDataBoundItems="True" Width="99%" DataSourceID="sds2" CssClass="ob_gEC" DataTextField="PositionName" DataValueField="PositionID">
                            <asp:ListItem Text="Please select one..." Value="" Selected="True" />
                        </asp:DropDownList>	
		                <asp:SqlDataSource runat="server" ID="sds2" SelectCommand="SELECT * FROM Positions"
		                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		                </asp:SqlDataSource>	
				    </Template>
				</obout:GridTemplate>
				
				<obout:GridTemplate runat="server" ID="TemplateCountry" >
				    <Template>
				     <%# Container.DataItem["CountryName"] %>
				    </Template>
				</obout:GridTemplate>

				<obout:GridTemplate runat="server" ID="TemplateEditCountry" ControlID="ddlCountries" ControlPropertyName="value">
				    <Template>
                        <asp:DropDownList ID="ddlCountries" runat="server" AppendDataBoundItems="True" Width="99%" DataSourceID="sds1" CssClass="ob_gEC" DataTextField="CountryName" DataValueField="CountryID">
                            <asp:ListItem Text="Please select one..." Value="" Selected="True" />
                        </asp:DropDownList>	
		                <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT * FROM Countries"
		                    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		                </asp:SqlDataSource>	
				    </Template>
				</obout:GridTemplate>
			</Templates>
		</obout:Grid>
        
        <br /><br /><br />
		
		<span class="tdText">
		   The records of the Grid can be edited using databound controls by means of Templates.
    	</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>

    </form>
</body>
</html>
