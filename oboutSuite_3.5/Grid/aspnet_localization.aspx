<%@ Page Language="C#"%>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">		
		void Page_Load(object sender, EventArgs e)
		{				
			if(!Page.IsPostBack)
			{
				CreateGrid();	
			}

            if (ComboBox1.SelectedValue != null && ComboBox1.SelectedValue != String.Empty)
			{
                if (ComboBox1.SelectedValue != "__")
				{
                    grid1.Language = ComboBox1.SelectedValue;
				}
				else
				{
					grid1.Language = Obout.Grid.Library.AccessibleLanguage(Page, grid1.FolderLocalization);
				}
			}			
		 
		}

		void CreateGrid()
		{
			OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

			OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
			myConn.Open();
			/*OleDbDataAdapter da = new OleDbDataAdapter();
			DataSet ds = new DataSet();
			da.SelectCommand = myComm;
			da.Fill(ds, "Orders");*/
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

            OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn);

            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
            myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
            myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record["OrderID"];
			
            myComm.ExecuteNonQuery();
			myConn.Close();
		}
		void InsertRecord(object sender, GridRecordEventArgs e)
		{
			OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
			myConn.Open();

            OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn);

            myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record["ShipName"];
            myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record["ShipCity"];
            myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record["ShipPostalCode"];
            myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record["ShipCountry"];
			
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
			<br/>
			<span class="tdText"><b>ASP.NET Grid Localization</b></span>
			<br/>
			<br/>
			<obout:ComboBox runat="server" ID="ComboBox1" AutoPostBack="true" ShowSelectedImage="false" Height="200" Width="150">
                 <Items>
			        <obout:ComboBoxItem runat="server" Text="Bulgarian" Value="bg" ImageUrl="../combobox/resources/images/flags/flag_bulgaria.png"/>
                    <obout:ComboBoxItem runat="server" Text="Catalan" Value="ca" ImageUrl="../combobox/resources/images/flags/flag_spain.png"/>
				    <obout:ComboBoxItem runat="server" Text="Chinese - Simplified" Value="cn" ImageUrl="../combobox/resources/images/flags/flag_china.png"/>
				    <obout:ComboBoxItem runat="server" Text="Chinese - Traditional" Value="ct" ImageUrl="../combobox/resources/images/flags/flag_china.png"/>
				    <obout:ComboBoxItem runat="server" Text="Danish"  Value="dk" ImageUrl="../combobox/resources/images/flags/flag_denmark.png"/>
				    <obout:ComboBoxItem runat="server" Text="Dutch" Value="nl" ImageUrl="../combobox/resources/images/flags/flag_netherlands.png"/>
				    <obout:ComboBoxItem runat="server" Text="English" Selected="true" Value="en" ImageUrl="../combobox/resources/images/flags/flag_usa.png"/>		
				    <obout:ComboBoxItem runat="server" Text="French" Value="fr" ImageUrl="../combobox/resources/images/flags/flag_france.png"/>
				    <obout:ComboBoxItem runat="server" Text="German" Value="de" ImageUrl="../combobox/resources/images/flags/flag_germany.png"/>
				    <obout:ComboBoxItem runat="server" Text="Greek" Value="gr" ImageUrl="../combobox/resources/images/flags/flag_greece.png"/>
                    <obout:ComboBoxItem runat="server" Text="Hebrew" Value="he" ImageUrl="../combobox/resources/images/flags/flag_israel.png"/>
				    <obout:ComboBoxItem runat="server" Text="Italian" Value="it" ImageUrl="../combobox/resources/images/flags/flag_italy.png"/>
				    <obout:ComboBoxItem runat="server" Text="Japanese" Value="jp" ImageUrl="../combobox/resources/images/flags/flag_japan.png"/>
				    <obout:ComboBoxItem runat="server" Text="Persian (Farsi)" Value="fa" ImageUrl="../combobox/resources/images/flags/flag_iran.png"/>
				    <obout:ComboBoxItem runat="server" Text="Polish" Value="pl" ImageUrl="../combobox/resources/images/flags/flag_poland.png"/>
				    <obout:ComboBoxItem runat="server" Text="Portuguese" Value="pt" ImageUrl="../combobox/resources/images/flags/flag_portugal.png"/>
				    <obout:ComboBoxItem runat="server" Text="Romanian" Value="ro" ImageUrl="../combobox/resources/images/flags/flag_romania.png"/>
				    <obout:ComboBoxItem runat="server" Text="Russian" Value="ru" ImageUrl="../combobox/resources/images/flags/flag_russia.png"/>
				    <obout:ComboBoxItem runat="server" Text="Serbian" Value="sr" ImageUrl="../combobox/resources/images/flags/flag_serbia_montenegro.png"/>				
				    <obout:ComboBoxItem runat="server" Text="Spanish" Value="es" ImageUrl="../combobox/resources/images/flags/flag_spain.png"/>
				    <obout:ComboBoxItem runat="server" Text="Swedish" Value="se" ImageUrl="../combobox/resources/images/flags/flag_sweden.png"/>
			        <obout:ComboBoxItem runat="server" Text="Norwegian" Value="no" ImageUrl="../combobox/resources/images/flags/flag_norway.png"/>				
				    <obout:ComboBoxItem runat="server" Text="Turkish" Value="tr" ImageUrl="../combobox/resources/images/flags/flag_turkey.png"/>				
				    <obout:ComboBoxItem runat="server" Text="Autodetection" Value="__"/>
			    </Items>
             </obout:ComboBox>
			<br /><br/>       
			<span class="tdText">Please scroll down the page to see How To set any language.</span>
			<br /><br />
			
			<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false" AllowFiltering="true" 
				FolderLocalization="localization"  FolderStyle="styles/black_glass"
				OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
				<Columns>
					<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
					<obout:Column DataField="ShipName" HeaderText="NAME" Width="200" runat="server"/>				
					<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
					<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
					<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
					<obout:Column HeaderText="" AllowEdit="true" AllowDelete="true" Width="175" runat="server" />
				</Columns>
			</obout:Grid>
			
			<br /><br />

			<span class="tdText">
				You can make the <b>ASP.NET Grid</b> support your native language.
				It can be done in a few steps.
				<ol>
				<li>
				Make a copy of <span style="color:blue">en.xml</span> file in <span style="color:blue">localization</span> folder.
				<br/>
				<br/>
				</li>
				<li>
				Rename the copy to <span style="color:blue">xx.xml</span> where <span style="color:blue">xx</span>
				is new supported language name (<span style="color:blue">de</span>, <span style="color:blue">es</span> and so on).
				<br/>
				<br/>
				</li>
				<li>
				Translate semantic fields in the file to selected language.
				<br/>
				<br />
				</li>
				</ol>
				Now you can set the <b>Language</b> property of <b>ASP.NET Grid</b> to the new language name.
				<br/>
				Example: Language = "es"
				<br />
				<br />
				See <nobr><a href='http://www.obout.com/grid/doc_grid_properties.aspx'>Grid properties</a> page for details.</nobr>
				<br/>
				<br />
				We ask you to send your new localization <b>XML</b> files using this <a href="http://www.obout.com/inc/support.aspx">page</a>.
				<br/>
				We will make your localized XML file available for everyone and give you credit for it.
				<br/>
				<br/>
				<br/>
				It is also possible to make the Grid autodetect the language.
			</span>
			
			<br /><br /><br />
		
			<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>