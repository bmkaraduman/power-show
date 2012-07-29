<%@ Page Language="C#" EnableEventValidation="false" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	    string number = "#,##0.00;(#,##0.00);Zero";
		string currency = "$#,##0.00;($#,##0.00);Zero";
		string date = "dd/MM/yyyy";
		string phone = "1-###-###-####";

		void Page_Load(object sender, EventArgs e)
		{
            setValue();
            CreateGrid();
		}

		void setValue(){
			number = cbNumberFormat.Text;
			currency = cbCurrencyFormat.Text;
			date = cbDateFormat.Text;
			phone = cbPhoneFormat.Text;
		}

		void CreateGrid()
		{
			OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/format.mdb"));

			OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM format ORDER BY id DESC", myConn);
			myConn.Open();
    		OleDbDataReader myReader = myComm.ExecuteReader();

            grid1.DataSource = myReader;
			grid1.DataBind();

			myConn.Close();
		}
		void RebindGrid(object sender, EventArgs e)
		{
			CreateGrid();		
			setValue();
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
		<form runat="server">
		<br />
		<span class="tdText"><b>ASP.NET Grid - Formatting Numbers, Currencies, Dates and Phone Numbers  </b></span>
		<br /><br />			
			<table>
				<tr>
					<td class="tdText">Number Format</td>
					<td class="tdText">Currency Format</td>
					<td class="tdText">Date Format</td>
					<td class="tdText">Phone Format</td>
				</tr>
				<tr>
					<td >
					<asp:DropDownList runat="server" ID="cbNumberFormat" CssClass="tdText" AutoPostBack="true">
						<asp:ListItem Value="{0:n:1}">{0:n:1}</asp:ListItem>
						<asp:ListItem Value="#,###;-#,###;0">#,###</asp:ListItem>
						<asp:ListItem Value="#,##0.00" Selected="true">#,##0.00</asp:ListItem>
						<asp:ListItem Value="#,##0.00;(#,##0.00);Zero" >#,##0.00;(#,##0.00);Zero</asp:ListItem>
						<asp:ListItem Value="#,###;-#,###;Hiding Zero" >#,###;-#,###;Hiding Zero</asp:ListItem>
						<asp:ListItem Value="#%;-#%;0%">#%</asp:ListItem>
					</asp:DropDownList>
					</td>
					<td >
						<asp:DropDownList runat="server" ID="cbCurrencyFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="$#,##0.00;($#,##0.00);0">$#,##0.00;($#,##0.00);0</asp:ListItem>
							<asp:ListItem Value="¥#,##0.00;(¥#,##0.00);Zero" Selected="true">¥#,##0.00;(¥#,##0.00);Zero</asp:ListItem>
							<asp:ListItem Value="¥#,##0.00;-¥#,##0.00;Zero" >¥#,##0.00;-¥#,##0.00;Zero</asp:ListItem>
							<asp:ListItem Value="£#,##0;(£#,##0);Zero" >£#,##0;(£#,##0);Zero</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td >
						<asp:DropDownList runat="server" ID="cbDateFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="dd-MM-yy">dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="ddd dd-MM-yy">ddd dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="dddd dd-MM-yy">dddd dd-MM-yy</asp:ListItem>
							<asp:ListItem Value="dd-MM-yyyy" >dd-MM-yyyy</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy">dd MMM yyyy</asp:ListItem>
							<asp:ListItem Value="dd-MMM-yyyy">dd-MMM-yyyy</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy" Selected="true">dd/MM/yyyy</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy HH:mm:ff">dd/MM/yyyy HH:mm:ff</asp:ListItem>
							<asp:ListItem Value="dd/MM/yyyy hh:mm tt">dd/MM/yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy hh:mm tt">dd MMM yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="dd MMM yyyy hh:mm tt">dd MMM yyyy hh:mm AM</asp:ListItem>
							<asp:ListItem Value="HH:MM:ff" >HH:MM:ff</asp:ListItem>
							<asp:ListItem Value="hh:MM tt" >hh:MM AM</asp:ListItem>
						</asp:DropDownList>
					</td>
					<td>
						<asp:DropDownList runat="server" ID="cbPhoneFormat" CssClass="tdText" AutoPostBack="true">
							<asp:ListItem Value="(###) ###-####">(###) ###-####</asp:ListItem>
							<asp:ListItem Value="###-###-####">###-###-####</asp:ListItem>
							<asp:ListItem Value="1-###-###-####" Selected="true">1-###-###-####</asp:ListItem>
						</asp:DropDownList>
					</td>
				</tr>

			</table>
			



			<br />             
			<span class="tdText">To change the format of the columns, please select different formats from the drop-down lists.</span>
			<br /><br />
			
			<obout:Grid id="grid1" runat="server" CallbackMode="false" AutoGenerateColumns="false" AllowFiltering="false" Serialize="false"  AllowAddingRecords="false"
				FolderLocalization="localization"  FolderStyle="styles/grand_gray"
				OnRebind="RebindGrid">
				<Columns>
					<obout:Column DataField="id" ReadOnly="true" HeaderText="Row ID" Width="70" runat="server"/>
					<obout:Column DataField="number" HeaderText="Number" Width="150" runat="server">
						<TemplateSettings TemplateId="numberTemplate"/>
					</obout:Column>
					<obout:Column DataField="currency" HeaderText="Currency" Width="150" runat="server">
						<TemplateSettings TemplateId="currencyTemplate"/>
					</obout:Column>

					<obout:Column DataField="date" HeaderText="Date Time" Width="180" runat="server">
						<TemplateSettings TemplateId="dateTemplate"/>
					</obout:Column>

					<obout:Column DataField="phone" HeaderText="Phone" Width="150" runat="server">
						<TemplateSettings TemplateId="phoneTemplate"/>
					</obout:Column>

				</Columns>
				<Templates>
					<obout:GridTemplate runat="server" ID="numberTemplate">
						<Template>
							<%# Container.Value != String.Empty && Container.Value != "&#160;" ?  (number == "{0:n:1}")? 
							String.Format( number, Container.Value + "") : Convert.ToDecimal( Container.Value).ToString( number )   : ""%>
						</Template>
					</obout:GridTemplate>
					<obout:GridTemplate runat="server" ID="currencyTemplate">
						<Template>
							<%# Container.Value != String.Empty && Container.Value != "&#160;" ? Convert.ToDecimal( Container.Value ).ToString ( currency ) : ""%>
						</Template>
					</obout:GridTemplate>
					<obout:GridTemplate runat="server" ID="dateTemplate">
						<Template>
							<%# Container.Value != String.Empty && Container.Value != "&#160;" ? Convert.ToDateTime(Container.Value.Replace("&#160;", " ")).ToString(date) : ""%>
						</Template>
					</obout:GridTemplate>
					<obout:GridTemplate runat="server" ID="phoneTemplate">
						<Template>
							<%# Container.Value != String.Empty && Container.Value != "&#160;" ?  Convert.ToDecimal( Container.Value ).ToString ( phone ) : ""%>
						</Template>
					</obout:GridTemplate>
				</Templates>	
			</obout:Grid>
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>