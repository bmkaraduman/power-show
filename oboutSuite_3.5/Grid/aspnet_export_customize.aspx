<%@ Page Language="C#" %>
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
        
        // set the styles for the exported file            
        string sHeaderStyle = "";
        string sCellsStyle = "";

        
        // Header
        if (chkHeaderBold.Checked == true)
        {
            sHeaderStyle += "font-weight: bold;";
        }
        else
        {
            sHeaderStyle += "font-weight: normal;";
        }

        if (chkHeaderItalic.Checked == true)
        {
            sHeaderStyle += "font-style: italic;";
        }
        else
        {
            sHeaderStyle += "font-style: normal;";
        }

        if (chkHeaderUnderline.Checked == true)
        {
            sHeaderStyle += "text-decoration: underline;";
        }
        else
        {
            sHeaderStyle += "text-decoration: none;";
        }

        sHeaderStyle += "color: " + ddlHeaderColor.SelectedValue + ";";
        sHeaderStyle += "background-color: " + ddlHeaderBgColor.SelectedValue + ";";
        
        
        
        
        // Cells
        if (chkCellsBold.Checked == true)
        {
            sCellsStyle += "font-weight: bold;";
        }
        else
        {
            sCellsStyle += "font-weight: normal;";
        }

        if (chkCellsItalic.Checked == true)
        {
            sCellsStyle += "font-style: italic;";
        }
        else
        {
            sCellsStyle += "font-style: normal;";
        }

        if (chkCellsUnderline.Checked == true)
        {
            sCellsStyle += "text-decoration: underline;";
        }
        else
        {
            sCellsStyle += "text-decoration: none;";
        }

        sCellsStyle += "color: " + ddlCellsColor.SelectedValue + ";";
        sCellsStyle += "background-color: " + ddlCellsBgColor.SelectedValue + ";";
        
        
        grid1.CssSettings.CSSExportHeaderCellStyle = sHeaderStyle;
        grid1.CssSettings.CSSExportCellStyle = sCellsStyle;
        
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 250 * FROM Orders ORDER BY OrderID DESC", myConn);
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
		<script type="text/javascript">
		
		function exportToExcel() {		    		    
		    grid1.exportToExcel("OboutGrid", false, false, true)
		}
		
		function exportToWord() {		    
		    grid1.exportToWord("OboutGrid", false, false, true)
		}	
		
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Customizing the Exported files</b></span>
		<br /><br />
		
		
		<span class="tdText">Set the style properties for the Header and Cells from the exported file.</span>
		<br /><br />
		<table>
		    <tr>
		    
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2"><b><u>Header</u></b></td>		        
		                </tr>
		                <tr>		                    
		                    <td class="tdText" valign="middle">Bold</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderBold" Checked="true" /></td>
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Italic</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderItalic" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Underline</td>
		                    <td class="tdText" valign="middle" ><asp:CheckBox runat="server" AutoPostBack="true" id="chkHeaderUnderline" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlHeaderColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#000000">Black</asp:ListItem>
		                            <asp:ListItem Value="#0000FF" Selected="true">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>	
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Bg Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlHeaderBgColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#FFFFFF">White</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00" Selected="true">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>		    		    
		            </table>
		        </td>
		        
                <td width="50">&#160;</td>
                
                <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2"><b><u>Cells</u></b></td>		        
		                </tr>
		                <tr>		                    
		                    <td class="tdText" valign="middle">Bold</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsBold"/></td>
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Italic</td>
		                    <td class="tdText" valign="middle"><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsItalic" Checked="true"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle">Underline</td>
		                    <td class="tdText" valign="middle" ><asp:CheckBox runat="server" AutoPostBack="true" id="chkCellsUnderline"/></td>		                    
		                </tr>
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlCellsColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#000000">Black</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000" Selected="true">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>	
		                <tr>
		                    <td class="tdText" valign="middle" align="left">
		                        Bg Color:
		                    </td>
		                    <td class="tdText">
		                        <asp:DropDownList runat="server" ID="ddlCellsBgColor" AutoPostBack="true" CssClass="tdText">
		                            <asp:ListItem Value="#FFFFFF" Selected="true">White</asp:ListItem>
		                            <asp:ListItem Value="#0000FF">Blue</asp:ListItem>
		                            <asp:ListItem Value="#00FF00">Green</asp:ListItem>
		                            <asp:ListItem Value="#FF0000">Red</asp:ListItem>
		                        </asp:DropDownList>
		                    </td>		                    
		                </tr>		    		    
		            </table>
		        </td>		        		        
		    </tr>
		    <tr>
		        <td valign="top" colspan="3">
		            <br /><br />
		            <input type="button" class="tdText" value="Export to Excel" onclick="exportToExcel()" />
		            <input type="button" class="tdText" value="Export to Word" onclick="exportToWord()" />		
		        </td>
		    </tr>
		</table>		
		
		<br /><br />		
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			 FolderStyle="styles/grand_gray" AllowFiltering="true"
			OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord"
			FolderExports="resources/exports">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="250" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="150" runat="server" />
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server" />
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="150" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="125" runat="server" />
			</Columns>					
		</obout:Grid>					
		
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>CSSExportHeaderCellStyle</b>, <b>CSSExportCellStyle</b> and <b>CSSExportTableStyle</b> properties of the Grid class<br />
		to customize the layout of the file which contains the exported data from the Grid.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>