<%@ Page Language="VB"  %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
		
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )		 								
		grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
			
		
		grid1.FolderStyle = "styles/grand_gray"
        grid1.FolderLocalization = "localization"
        grid1.AllowFiltering = True

		' setting the event handlers
		AddHandler CType(grid1, Grid).InsertCommand, AddressOf InsertRecord
		AddHandler CType(grid1, Grid).DeleteCommand, AddressOf DeleteRecord
		AddHandler CType(grid1, Grid).UpdateCommand, AddressOf UpdateRecord
		AddHandler CType(grid1, Grid).Rebind, AddressOf RebindGrid

		' creating the columns
		Dim oCol1 As Column = new Column()
		oCol1.DataField = "OrderID"
		oCol1.ReadOnly = true
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
		oCol2.Width = "200"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
		oCol4.Width = "150"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		Dim oCol6 As Column = new Column()
		oCol6.HeaderText = ""
		oCol6.Width = "175"
		oCol6.AllowEdit = True
        oCol6.AllowDelete = True

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
		grid1.Columns.Add(oCol5)
		grid1.Columns.Add(oCol6)

		' add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1)
		
		If Not Page.IsPostBack Then
			BindGrid()
		End If

        If ComboBox1.SelectedValue <> Nothing And ComboBox1.SelectedValue <> String.Empty Then
		
            If ComboBox1.SelectedValue <> "__" Then
                grid1.Language = ComboBox1.SelectedValue
			
            Else
                grid1.Language = Obout.Grid.Library.AccessibleLanguage(Page, grid1.FolderLocalization)
            End If
        End If
	End Sub

	Sub BindGrid()	
		Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))

		Dim myComm As OleDbCommand = New OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn)
		myConn.Open()
		'Dim da = New OleDbDataAdapter()
		'Dim ds = New DataSet()
		'da.SelectCommand = myComm
		'da.Fill(ds, "Orders")
		Dim myReader As OleDbDataReader = myComm.ExecuteReader()


		grid1.DataSource = myReader
		grid1.DataBind()

		myConn.Close()
	End Sub
	
    Sub DeleteRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("DELETE FROM Orders WHERE OrderID = @OrderID", myConn)
        
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub UpdateRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
        
        Dim myComm As OleDbCommand = New OleDbCommand("UPDATE Orders SET ShipName = @ShipName, ShipCity = @ShipCity, ShipPostalCode=@ShipPostalCode, ShipCountry = @ShipCountry WHERE OrderID = @OrderID", myConn)

        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
        myComm.Parameters.Add("@OrderID", OleDbType.Integer).Value = e.Record("OrderID")
        
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
    Sub InsertRecord(ByVal sender As Object, ByVal e As GridRecordEventArgs)
        Dim myConn As OleDbConnection = New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"))
        myConn.Open()
		
        Dim myComm As OleDbCommand = New OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipPostalCode, ShipCountry) VALUES(@ShipName, @ShipCity, @ShipPostalCode, @ShipCountry)", myConn)
		
        myComm.Parameters.Add("@ShipName", OleDbType.VarChar).Value = e.Record("ShipName")
        myComm.Parameters.Add("@ShipCity", OleDbType.VarChar).Value = e.Record("ShipCity")
        myComm.Parameters.Add("@ShipPostalCode", OleDbType.VarChar).Value = e.Record("ShipPostalCode")
        myComm.Parameters.Add("@ShipCountry", OleDbType.VarChar).Value = e.Record("ShipCountry")
  
        myComm.ExecuteNonQuery()
        myConn.Close()
    End Sub
	
	Sub RebindGrid(ByVal sender As Object, ByVal e As EventArgs)
		BindGrid()
	End Sub
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html>
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
			        <obout:ComboBoxItem ID="ComboBoxItem1" runat="server" Text="Bulgarian" Value="bg" ImageUrl="../combobox/resources/images/flags/flag_bulgaria.png"/>
                    <obout:ComboBoxItem ID="ComboBoxItem2" runat="server" Text="Catalan" Value="ca" ImageUrl="../combobox/resources/images/flags/flag_spain.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem3" runat="server" Text="Chinese - Simplified" Value="cn" ImageUrl="../combobox/resources/images/flags/flag_china.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem4" runat="server" Text="Chinese - Traditional" Value="ct" ImageUrl="../combobox/resources/images/flags/flag_china.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem5" runat="server" Text="Danish"  Value="dk" ImageUrl="../combobox/resources/images/flags/flag_denmark.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem6" runat="server" Text="Dutch" Value="nl" ImageUrl="../combobox/resources/images/flags/flag_netherlands.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem7" runat="server" Text="English" Selected="true" Value="en" ImageUrl="../combobox/resources/images/flags/flag_usa.png"/>		
				    <obout:ComboBoxItem ID="ComboBoxItem8" runat="server" Text="French" Value="fr" ImageUrl="../combobox/resources/images/flags/flag_france.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem9" runat="server" Text="German" Value="de" ImageUrl="../combobox/resources/images/flags/flag_germany.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem10" runat="server" Text="Greek" Value="gr" ImageUrl="../combobox/resources/images/flags/flag_greece.png"/>
                    <obout:ComboBoxItem ID="ComboBoxItem11" runat="server" Text="Hebrew" Value="he" ImageUrl="../combobox/resources/images/flags/flag_israel.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem12" runat="server" Text="Italian" Value="it" ImageUrl="../combobox/resources/images/flags/flag_italy.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem13" runat="server" Text="Japanese" Value="jp" ImageUrl="../combobox/resources/images/flags/flag_japan.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem14" runat="server" Text="Persian (Farsi)" Value="fa" ImageUrl="../combobox/resources/images/flags/flag_iran.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem15" runat="server" Text="Polish" Value="pl" ImageUrl="../combobox/resources/images/flags/flag_poland.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem16" runat="server" Text="Portuguese" Value="pt" ImageUrl="../combobox/resources/images/flags/flag_portugal.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem17" runat="server" Text="Romanian" Value="ro" ImageUrl="../combobox/resources/images/flags/flag_romania.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem18" runat="server" Text="Russian" Value="ru" ImageUrl="../combobox/resources/images/flags/flag_russia.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem19" runat="server" Text="Serbian" Value="sr" ImageUrl="../combobox/resources/images/flags/flag_serbia_montenegro.png"/>				
				    <obout:ComboBoxItem ID="ComboBoxItem20" runat="server" Text="Spanish" Value="es" ImageUrl="../combobox/resources/images/flags/flag_spain.png"/>
				    <obout:ComboBoxItem ID="ComboBoxItem21" runat="server" Text="Swedish" Value="se" ImageUrl="../combobox/resources/images/flags/flag_sweden.png"/>
			        <obout:ComboBoxItem ID="ComboBoxItem22" runat="server" Text="Norwegian" Value="no" ImageUrl="../combobox/resources/images/flags/flag_norway.png"/>				
				    <obout:ComboBoxItem ID="ComboBoxItem23" runat="server" Text="Turkish" Value="tr" ImageUrl="../combobox/resources/images/flags/flag_turkey.png"/>				
				    <obout:ComboBoxItem ID="ComboBoxItem24" runat="server" Text="Autodetection" Value="__"/>
			    </Items>
             </obout:ComboBox>
			<br /><br/>       
			<span class="tdText">Please scroll down the page to see How To set any language.</span>
			<br /><br />
			
			<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
			
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
		
			<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>