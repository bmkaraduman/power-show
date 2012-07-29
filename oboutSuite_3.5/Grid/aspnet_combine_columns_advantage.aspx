<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
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
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_data/stock.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT * FROM Sales", myConn);
		myConn.Open();		
		OleDbDataReader myReader = myComm.ExecuteReader();

		grid1.DataSource = myReader;
		grid1.DataBind();

		myConn.Close();	
	}	
		
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_data/stock.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("DELETE FROM Sales WHERE SalesID = @SalesID", myConn);

        myComm.Parameters.Add("@SalesID", OleDbType.Integer).Value = e.Record["SalesID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_data/stock.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("UPDATE Sales SET Description = @Description, Title1 = @Title1, Title2=@Title2, Title3=@Title3, Value1 = @Value1, Value2=@Value2, Value3=@Value3 WHERE SalesID = @SalesID", myConn);

        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record["Description"];
        myComm.Parameters.Add("@Title1", OleDbType.VarChar).Value = e.Record["Title1"];
        myComm.Parameters.Add("Title2", OleDbType.VarChar).Value = e.Record["Title2"];
        myComm.Parameters.Add("@Title3", OleDbType.VarChar).Value = e.Record["Title3"];        
        myComm.Parameters.Add("@Value1", OleDbType.VarChar).Value = e.Record["Value1"];
        myComm.Parameters.Add("@Value2", OleDbType.VarChar).Value = e.Record["Value2"];
        myComm.Parameters.Add("@Value3", OleDbType.VarChar).Value = e.Record["Value3"];
        myComm.Parameters.Add("@SalesID", OleDbType.Integer).Value = e.Record["SalesID"];
		
        myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void InsertRecord(object sender, GridRecordEventArgs e)
	{
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_data/stock.mdb"));
		myConn.Open();

        OleDbCommand myComm = new OleDbCommand("INSERT INTO Sales (Description,Title1, Title2, Title3, Value1, Value2, Value3) VALUES(@Description, @Title1, @Title2, @Title3, @Value1, @Value2, @Value3)", myConn);

        myComm.Parameters.Add("@Description", OleDbType.VarChar).Value = e.Record["Description"];
        myComm.Parameters.Add("@Title1", OleDbType.VarChar).Value = e.Record["Title1"];
        myComm.Parameters.Add("Title2", OleDbType.VarChar).Value = e.Record["Title2"];
        myComm.Parameters.Add("@Title3", OleDbType.VarChar).Value = e.Record["Title3"];
        myComm.Parameters.Add("@Value1", OleDbType.VarChar).Value = e.Record["Value1"];
        myComm.Parameters.Add("@Value2", OleDbType.VarChar).Value = e.Record["Value2"];
        myComm.Parameters.Add("@Value3", OleDbType.VarChar).Value = e.Record["Value3"];
                
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
			.tdCell{
				border-right: solid  1px;
				border-bottom: solid  1px;
				font:11px Verdana;
				color:#333333;
			}
			.tdCellLeft{
				border-left: solid  1px;
				border-right: solid  1px;
				border-bottom: solid  1px;
				font:11px Verdana;
				color:#333333;
				display: block;
			}
			.rowEditTable td {
			    font-family: Verdana;
		        font-size: 10px;
		        color: #333333;
			}
			
			
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Using more columns in the same Template</b></span>
		<br /><br />			
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" 
			 FolderStyle="styles/black_glass" AutoGenerateColumns="false" AllowAddingRecords="true"  PageSize="4"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord"  OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="SalesID" ReadOnly="true" HeaderText="SalesID" Visible="false" Width="60">
				    <TemplateSettings RowEditTemplateControlId="txtSalesID" RowEditTemplateControlPropertyName="innerHTML"/>
				</obout:Column>				    
				<obout:Column DataField="Description" HeaderText="Description" Visible="false">	
                    <TemplateSettings RowEditTemplateControlId="txtDescription" RowEditTemplateControlPropertyName="value" />
                </obout:Column>							
				<obout:Column DataField="Title1" HeaderText="Title1"  Visible="false">
				    <TemplateSettings RowEditTemplateControlId="txtTitle1" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>						
				<obout:Column DataField="Title2" HeaderText="Title2" Visible="false">
				    <TemplateSettings RowEditTemplateControlId="txtTitle2" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>						
				<obout:Column DataField="Title3" HeaderText="Title3" Visible="false">
				    <TemplateSettings RowEditTemplateControlId="txtTitle3" RowEditTemplateControlPropertyName="value"/>
				</obout:Column>						
				<obout:Column DataField="Value1" HeaderText="Value1" Visible="false">
                    <TemplateSettings RowEditTemplateControlId="txtValue1" RowEditTemplateControlPropertyName="value" />
                </obout:Column>				
				<obout:Column DataField="Value2" HeaderText="Value2"  Visible="false">
                    <TemplateSettings RowEditTemplateControlId="txtValue2" RowEditTemplateControlPropertyName="value" />
                </obout:Column>				
				<obout:Column DataField="Value3" HeaderText="Value3"  Visible="false">
                    <TemplateSettings RowEditTemplateControlId="txtValue3" RowEditTemplateControlPropertyName="value" />
                </obout:Column>				
				<obout:Column DataField="" ReadOnly="true" HeaderText="SALES REPORT" Width="600">
					<TemplateSettings TemplateID="TemplateCombined" />
				</obout:Column>
				<obout:Column AllowEdit="true" AllowDelete="true" HeaderText="EDIT" Width="125"/>
			</Columns>
			<TemplateSettings RowEditTemplateId="tplRowEdit" />
			<Templates>				
				<obout:GridTemplate runat="server" ID="TemplateCombined">
					<Template>
						<table width="100%" height="100%">
							<tr>
								<td align="center" valign="middle">
									 <table cellpadding="0" cellspacing="0" width="99%" height="100%">
										 <tr>
												<td colspan="3" align="left" style="background: #CECBCE;" class="tdCellLeft"><b><%# Container.DataItem["Description"]%></b></td>
										 </tr>
										 <tr >
												<td align="center" style="background: #EFEBEF;" class="tdCellLeft" width="33%"><%# Container.DataItem["Title1"]%></td>
												<td align="center" style="background: #DEDBDE;" class="tdCell"><%# Container.DataItem["Title2"]%></td>
												<td align="center" style="background: #EFEBEF;" class="tdCell" width="33%"><%# Container.DataItem["Title3"]%></td>
										 </tr>
										 <tr>
												<td align="center" style="background: #EFEBEF;" class="tdCellLeft"><%# Container.DataItem["Value1"]%></td>
												<td align="center" style="background: #DEDBDE;" class="tdCell"><%# Container.DataItem["Value2"]%></td>
												<td align="center" style="background: #EFEBEF;" class="tdCell"><%# Container.DataItem["Value3"]%></td>
										 </tr>
									 </table>
								</td>
							</tr>
						</table>
					</Template>
				</obout:GridTemplate>
			    <obout:GridTemplate runat="server" ID="tplRowEdit">
                    <Template>
                        <table class="rowEditTable">
                            <tr>
                                 <td valign="top">
                                    <fieldset style="width: 590px; height: 155px;">
                                        <legend>Order Information</legend>
                                        <table>
                                            <tr>
                                                <td>Sales ID:</td><td><span id="txtSalesID" style="width: 150px;"></span></td>
                                            </tr>					                                            					                                            
                                            <tr>
                                                <td>Description:</td>
                                                <td valign="middle">
                                                    <input type="text" id="txtDescription" style="width: 150px;" class="ob_gEC" />					                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" id="txtTitle1" style="width: 150px;" class="ob_gEC" /></td>
                                                <td valign="middle">
                                                    <input type="text" id="txtValue1" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>	
                                            <tr>
                                                <td><input type="text" id="txtTitle2" style="width: 150px;" class="ob_gEC" /></td>
                                                <td valign="middle">
                                                    <input type="text" id="txtValue2" style="width: 150px;" class="ob_gEC" />
                                                </td>
                                            </tr>	
                                            <tr>
                                                <td><input type="text" id="txtTitle3" style="width: 150px;" class="ob_gEC" /></td>
                                                <td valign="middle">
                                                    <input type="text" id="txtValue3" style="width: 150px;" class="ob_gEC" />
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
                             </tr>
                             <tr>
                                <td colspan="2" align="center">
                                    <input type="button" value="Save" onclick="grid1.save()" class="tdText" />
                                    <input type="button" value="Cancel" onclick="grid1.cancel()" class="tdText" /> 
                                </td>
                             </tr>
                         </table>					                         
                    </Template>
                </obout:GridTemplate>								
			</Templates>
			
		</obout:Grid>				

		<br /><br /><br />
		
		<span class="tdText">
		    Use the <b>Container.DataItem</b> object to access the values from more columns in the same Template.<br />
	        Use the <b>RowEditTemplateId</b> property you can specify a template for the entire row.<br><br>		    
		</span>


		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
<style type="text/css">
	.ob_gRC /*.ob_gridResizableContent*/
	{
		overflow: hidden;		
		white-space: nowrap;
		padding-left: 0px;
	}
</style>