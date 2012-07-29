<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Dim totalFreight As Double = 0
    Dim ShipCount As Integer = 0

    Dim countryNames As ArrayList = New ArrayList()
    Dim countryCount As ArrayList = New ArrayList()
    Dim firstShipping As Date = Date.MaxValue
    Dim lastShipping As Date = Date.MinValue
       
    Dim grid1 As Grid = New Grid()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

        grid1.ID = "grid1"
        grid1.CallbackMode = True
        grid1.Serialize = True
        grid1.AutoGenerateColumns = False
        grid1.AllowAddingRecords = False
        grid1.ShowLoadingMessage = False
        grid1.ShowColumnsFooter = True
        grid1.DataSourceID = "sds1"
        grid1.FolderStyle = "styles/premiere_blue"

        AddHandler CType(grid1, Grid).RowDataBound, AddressOf RowdataBound
        
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.Visible = False
        oCol1.HeaderText = "ORDER ID"

        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.Visible = True
        oCol2.HeaderText = "SHIP NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShippedDate"
        oCol3.Visible = True
        oCol3.DataFormatString = "{0:dd-MMM-yyyy}"
        oCol3.HeaderText = "SHIPPED DATE"
        oCol3.Width = "200"
        
        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCountry"
        oCol4.Visible = True
        oCol4.HeaderText = "SHIP COUNTRY"
        oCol4.Width = "200"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "Freight"
        oCol5.HeaderText = "FREIGHT"
        oCol5.Width = "150"
        
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        
        phGrid1.Controls.Add(grid1)
        
    End Sub
    
    
    Sub RowdataBound(ByVal sender As Object, ByVal e As GridRowEventArgs)

        Dim cnt As Integer = 0
        Dim index As Integer = 0
        Dim avg As Double = 0
        Dim country As String = String.Empty
        
        If e.Row.RowType = GridRowType.DataRow Then
            
            ShipCount += 1
            totalFreight += e.Row.Cells(4).Text
            
            If lastShipping < e.Row.Cells(2).Text Then
                lastShipping = e.Row.Cells(2).Text
            End If
            
            If firstShipping > e.Row.Cells(2).Text Then
                firstShipping = e.Row.Cells(2).Text
            End If

            If Not countryNames.Contains(e.Row.Cells(3).Text) Then
                countryNames.Add(e.Row.Cells(3).Text)
                countryCount.Add(1)
            Else
                country = e.Row.Cells(3).Text
                index = countryNames.IndexOf(country)
                cnt = countryCount(index)
                countryCount.RemoveAt(index)
                countryCount.Insert(index, cnt + 1)
            End If

        End If
        
        
        If e.Row.RowType = GridRowType.ColumnFooter Then
            
            Dim large As Integer = 0
            
            avg = totalFreight / ShipCount
            
            For i As Integer = 0 To countryCount.Count - 1
                If large < countryCount(i) Then
                    large = countryCount(i)
                End If
            Next

            Dim indx As Integer = countryCount.IndexOf(large)
            
            e.Row.Cells(1).Text = "Count: " & ShipCount
            e.Row.Cells(2).Text = "First Shipping: " & firstShipping.ToString("dd MMM yyyy") & "<br>Last Shipping: " & lastShipping.ToString("dd MMM yyyy")
            e.Row.Cells(4).Text = "Total: $" & totalFreight & "<br /> Average: $" & avg
            e.Row.Cells(3).Text = "Most Orders: " & countryNames(indx).ToString()

        End If

        
    End Sub

    
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
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
		<form id="Form1" runat="server">					
		    <br />
		    <span class="tdText"><b>ASP.NET Grid - Aggregates</b></span>		
		    <br /><br />
		    
		    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		    	
		    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Orders"
		        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb">
		    </asp:SqlDataSource>
		
		    <br />
		    
		    <span class="tdText">
		        You can easily display aggregates in the footer of the Grid using the <b>RowDataBound</b> event and the <b>ShowColumnsFooter</b> property.
		    </span>
		    
		    <br /><br /><br />
		
		    <a href="Default.aspx?type=VBNET">« Back to examples</a>
		
		</form>
	</body>
</html>
