<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">
	Grid grid1 = new Grid();
	
	void Page_load(object sender, EventArgs e)		
	{
		grid1.ID = "grid1";		
		grid1.CallbackMode = true;				
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;
        grid1.DataSourceID = "sds1";
		        		
		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "OrderID";
        oCol1.Visible = false;
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "ORDER ID";
		oCol1.Width = "100";
		
		Column oCol2 = new Column();
		oCol2.DataField = "ShipName";		
		oCol2.HeaderText = "NAME";
        oCol2.Width = "250";
		
		Column oCol3 = new Column();
		oCol3.DataField = "ShipCity";		
		oCol3.HeaderText = "CITY";
		oCol3.Width = "150";
        oCol3.Align = "right";
        oCol3.HeaderAlign = "right";

        Column oCol4 = new Column();
        oCol4.DataField = "ShipAddress";
        oCol4.HeaderText = "ADDRESS";
        oCol4.Width = "150";
        oCol4.Visible = false;
		
		Column oCol5 = new Column();
		oCol5.DataField = "ShipPostalCode";		
		oCol5.HeaderText = "POSTAL CODE";
		oCol5.Width = "150";
											
		Column oCol6 = new Column();
        oCol6.DataField = "ShipCountry";
        oCol6.HeaderText = "COUNTRY";
        oCol6.Width = "150";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);
		grid1.Columns.Add(oCol6);


        
        grid1.ExportingSettings.AppendTimeStamp = AppendTimeStamp.Checked;
        grid1.ExportingSettings.ExportAllPages = ExportAllPages.Checked;
        grid1.ExportingSettings.ExportHiddenColumns = ExportHiddenColumns.Checked;
        grid1.ExportingSettings.FileName = FileName.Text;
        grid1.ExportingSettings.KeepColumnSettings = KeepColumnSettings.Checked;

        ExportOrderID.Enabled = SelectColumns.Checked;
        ExportShipName.Enabled = SelectColumns.Checked;
        ExportShipCity.Enabled = SelectColumns.Checked;
        ExportShipAddress.Enabled = SelectColumns.Checked;
        ExportShipPostalCode.Enabled = SelectColumns.Checked;
        ExportShipCountry.Enabled = SelectColumns.Checked;

        string columnsToExport = "";

        if (SelectColumns.Checked)
        {
            if (ExportOrderID.Checked)
            {
                columnsToExport += "OrderID,";
            }

            if (ExportShipName.Checked)
            {
                columnsToExport += "ShipName,";
            }

            if (ExportShipCity.Checked)
            {
                columnsToExport += "ShipCity,";
            }

            if (ExportShipAddress.Checked)
            {
                columnsToExport += "ShipAddress,";
            }

            if (ExportShipPostalCode.Checked)
            {
                columnsToExport += "ShipPostalCode,";
            }

            if (ExportShipCountry.Checked)
            {
                columnsToExport += "ShipCountry,";
            }
        }

        if (!string.IsNullOrEmpty(columnsToExport))
        {
            grid1.ExportingSettings.ColumnsToExport = columnsToExport.Substring(0, columnsToExport.Length - 1);
        }
        else
        {
            grid1.ExportingSettings.ColumnsToExport = "";
        }
        
		
        
		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
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
		        grid1.exportToExcel();
		    }

		    function exportToWord() {
		        grid1.exportToWord();
		    }
		</script>
	</head>
	<body>	
		<form runat="server">
					
		<br />

		<span class="tdText"><b>ASP.NET Grid - Export to Excel / Word on Client-Side</b></span>
		
		<br /><br />
		
		<table>
		    <tr>
		        <td valign="top">
		            <table border="0">
		                <tr>
		                    <td class="tdText" valign="middle" colspan="2">Set the properties for exporting:</td>		        
		                </tr>
		                <tr>
		                    <td class="tdText">
                                <asp:TextBox runat="server" ID="FileName" Text="OboutGrid" CssClass="tdText" AutoPostBack="true" Width="60" />
                                File Name (without extension)
                             </td>
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="AppendTimeStamp" Text="Append TimeStamp" AutoPostBack="true" Checked="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="ExportAllPages" Text="Export All Pages" AutoPostBack="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="KeepColumnSettings" Text="Keep Column Settings" AutoPostBack="true" />
                            </td>		                    
		                </tr>
		                <tr>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="ExportHiddenColumns" Text="Export Hidden Columns" AutoPostBack="true" />
                            </td>		                    
		                </tr>
                        <tr>
                            <td class="tdText">
                                <br />
                                <obout:OboutCheckBox runat="server" ID="SelectColumns" Text="Select the Columns to Export" AutoPostBack="true" />

                                <table cellspacing="3" style="margin-left: 20px;">
                                    <tr>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportOrderID" Text="ORDER ID" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipName" Text="NAME" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipCity" Text="CITY" AutoPostBack="true" Checked="true" /></td>
                                    </tr>
                                    <tr>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipAddress" Text="ADDRESS" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipPostalCode" Text="POSTAL CODE" AutoPostBack="true" Checked="true" /></td>
                                        <td><obout:OboutCheckBox runat="server" ID="ExportShipCountry" Text="COUNTRY" AutoPostBack="true" Checked="true" /></td>
                                    </tr>
                                </table>
                            </td>		                    
		                </tr>
		            </table>
		        </td>
                <td width="50">&#160;</td>
		        <td valign="top">
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClientClick="exportToExcel();return false;" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClientClick="exportToWord();return false;" />
		        </td>
		    </tr>
		</table>		
		
		<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<div class="tdText">
            The Grid exposes two client-side methods that allow users to export the data to Excel / Word:
            <ul>
                <li><b>exportToExcel</b> - exports the Grid to Excel.</li>
                <li><b>exportToWord</b> - exports the Grid to Word.</li>
            </ul>
            
            <br />

            The Grid is exported according to the settings specified using the <b>ExportingSettings</b> property.

            <br /><br />

            When using the client-side exporting feature, the exported files will be served directly to the user's browser. <br />
            <b>No files are created on the server</b>, and thus no special security permissions are required on the server.
		</div>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">« Back to examples</a>
		
		</form>
	</body>
</html>