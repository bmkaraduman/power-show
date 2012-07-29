<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
	Dim grid1 As Obout.Grid.Grid = New Grid()
	
	Sub Page_load(ByVal sender As Object, ByVal e As EventArgs )
		grid1.ID = "grid1"
		grid1.CallbackMode = True
		grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.DataSourceID = "sds1"
        grid1.FolderExports = "resources/exports"
        grid1.ExportingSettings.ExportedFilesLifeTime = 5
		
		' creating the columns
		Dim oCol1 As Column = new Column()
        oCol1.DataField = "OrderID"
        oCol1.Visible = False
		oCol1.ReadOnly = True
		oCol1.HeaderText = "ORDER ID"
		oCol1.Width = "100"

		Dim oCol2 As Column = new Column()
		oCol2.DataField = "ShipName"
		oCol2.HeaderText = "NAME"
        oCol2.Width = "250"

		Dim oCol3 As Column = new Column()
		oCol3.DataField = "ShipCity"
		oCol3.HeaderText = "CITY"
		oCol3.Width = "150"

		Dim oCol4 As Column = new Column()
		oCol4.DataField = "ShipPostalCode"
		oCol4.HeaderText = "POSTAL CODE"
        oCol4.Width = "150"
        oCol3.Align = "right"
        oCol3.HeaderAlign = "right"

		Dim oCol5 As Column = new Column()
		oCol5.DataField = "ShipCountry"
		oCol5.HeaderText = "COUNTRY"
		oCol5.Width = "150"

		' add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1)
		grid1.Columns.Add(oCol2)
		grid1.Columns.Add(oCol3)
		grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        
        
        
        grid1.ExportingSettings.AppendTimeStamp = AppendTimeStamp.Checked
        grid1.ExportingSettings.ExportAllPages = ExportAllPages.Checked
        grid1.ExportingSettings.ExportHiddenColumns = ExportHiddenColumns.Checked
        grid1.ExportingSettings.FileName = FileName.Text
        grid1.ExportingSettings.KeepColumnSettings = KeepColumnSettings.Checked

        ExportOrderID.Enabled = SelectColumns.Checked
        ExportShipName.Enabled = SelectColumns.Checked
        ExportShipCity.Enabled = SelectColumns.Checked
        ExportShipAddress.Enabled = SelectColumns.Checked
        ExportShipPostalCode.Enabled = SelectColumns.Checked
        ExportShipCountry.Enabled = SelectColumns.Checked

        Dim columnsToExport As String = ""

        If SelectColumns.Checked Then        
            If ExportOrderID.Checked Then
                columnsToExport += "OrderID,"
            End If

            If ExportShipName.Checked Then
                columnsToExport += "ShipName,"
            End If

            If ExportShipCity.Checked Then
                columnsToExport += "ShipCity,"
            End If

            If ExportShipAddress.Checked Then
                columnsToExport += "ShipAddress,"
            End If

            If ExportShipPostalCode.Checked Then
                columnsToExport += "ShipPostalCode,"
            End If

            If ExportShipCountry.Checked Then
                columnsToExport += "ShipCountry,"
            End If
        End If

        If Not String.IsNullOrEmpty(columnsToExport) Then
            grid1.ExportingSettings.ColumnsToExport = columnsToExport.Substring(0, columnsToExport.Length - 1)
        Else
            grid1.ExportingSettings.ColumnsToExport = ""
        End If
        
        
        		
        ' add the grid to the controls collection of the PlaceHolder
        phGrid1.Controls.Add(grid1)
		
        Downloader.Text = ""
    End Sub
    
    Protected Sub OboutButton1_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim fileName As String = grid1.ExportToExcel()

        Downloader.Text = "The Grid has been exported to an Excel file on the server. <br /><a href=""resources/exports/" + fileName + """>Click here to download the file.</a>"
    End Sub

    Protected Sub OboutButton2_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim fileName As String = grid1.ExportToWord()

        Downloader.Text = "The Grid has been exported to a Word file on the server. <br /><a href=""resources/exports/" + fileName + """>Click here to download the file.</a>"
    End Sub
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
		<form id="Form1" runat="server">
					
		<br />

		<span class="tdText"><b>ASP.NET Grid - Export to Excel / Word on Server-Side</b></span>
		
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
		        <td valign="top" class="tdText">
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Export to Excel" OnClick="OboutButton1_Click" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Export to Word" OnClick="OboutButton2_Click" />

                    <br /><br />

                    <asp:Literal runat="server" ID="Downloader" />
		        </td>
		    </tr>
		</table>		
		
		<br /><br />		
		
		<asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
					
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br /><br />
		
		<div class="tdText">
            The Grid exposes two server-side methods that allow users to export the data to Excel / Word:
            <ul>
                <li><b>ExportToExcel</b> - exports the Grid to Excel.</li>
                <li><b>ExportToWord</b> - exports the Grid to Word.</li>
            </ul>
            
            <br />

            The Grid is exported according to the settings specified using the <b>ExportingSettings</b> property.

            <br /><br />

            When using the server-side exporting feature, the exported files will be created on the server and won't be served to the user's browser. <br />
            Special security permissions are required on the server, otherwise the files cannot be created.<br />
            The files will be saved in the location specified by the <b>FolderExports</b> property.
		</div>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>