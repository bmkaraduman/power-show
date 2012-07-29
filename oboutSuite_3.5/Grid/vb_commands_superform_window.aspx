<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="VB" runat="server">
    Dim grid1 As New Grid()
    Dim window1 As New Window()
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1 = New Grid()
        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False
        grid1.ClientSideEvents.OnBeforeClientEdit = "Grid1_ClientEdit"
        grid1.ClientSideEvents.OnBeforeClientAdd = "Grid1_ClientAdd"
        grid1.ClientSideEvents.ExposeSender = True

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.ID = "Column1"
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
        oCol1.Visible = False

        Dim oCol2 As Column = New Column()
        oCol2.ID = "Column2"
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"

        Dim oCol3 As Column = New Column()
        oCol3.ID = "Column3"
        oCol3.DataField = "ShipAddress"
        oCol3.Visible = False
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "125"

        Dim oCol4 As Column = New Column()
        oCol4.ID = "Column4"
        oCol4.DataField = "ShipCity"
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"

        Dim oCol5 As Column = New Column()
        oCol5.ID = "Column5"
        oCol5.DataField = "ShipRegion"
        oCol5.Visible = False
        oCol5.HeaderText = "REGION"
        oCol5.Width = "150"

        Dim oCol6 As Column = New Column()
        oCol6.ID = "Column6"
        oCol6.DataField = "ShipPostalCode"
        oCol6.HeaderText = "POSTAL CODE"
        oCol6.Width = "150"

        Dim oCol7 As Column = New Column()
        oCol7.ID = "Column7"
        oCol7.DataField = "ShipCountry"
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "125"

        Dim oCol8 As Column = New Column()
        oCol8.ID = "Column8"
        oCol8.DataField = "OrderDate"
        oCol8.HeaderText = "ORDER DATE"
        oCol8.Width = "125"
        oCol8.DataFormatString = "{0:MM/dd/yyyy}"
        oCol8.ApplyFormatInEditMode = True

        Dim oCol9 As Column = New Column()
        oCol9.ID = "Column9"
        oCol9.DataField = "RequiredDate"
        oCol9.Visible = False
        oCol9.HeaderText = "REQUIRED DATE"
        oCol9.ApplyFormatInEditMode = True
        oCol9.DataFormatString = "{0:MM/dd/yyyy}"
        oCol9.Width = "200"

        Dim oCol10 As Column = New Column()
        oCol10.ID = "Column10"
        oCol10.DataField = "ShippedDate"
        oCol10.Visible = False
        oCol10.ApplyFormatInEditMode = True
        oCol10.DataFormatString = "{0:MM/dd/yyyy}"
        oCol10.HeaderText = "SHIPPED DATE"
        oCol10.Width = "200"

        Dim oCol11 As Column = New Column()
        oCol11.ID = "Column11"
        oCol11.DataField = "ShipVia"
        oCol11.Visible = False
        oCol11.HeaderText = "SHIP VIA"
        oCol11.Width = "200"

        Dim oCol12 As Column = New Column()
        oCol12.ID = "Column12"
        oCol12.DataField = "Sent"
        oCol12.Visible = False
        oCol12.HeaderText = "SENT"
        oCol12.Width = "175"

        Dim oCol13 As Column = New Column()
        oCol13.DataField = ""
        oCol13.ID = "Column12"
        oCol13.HeaderText = "EDIT"
        oCol13.Width = "150"
        oCol13.AllowEdit = True
        oCol13.AllowDelete = True


        ' add the columns to the Columns collection of the grid
        grid1.Columns.Add(oCol1)
        grid1.Columns.Add(oCol2)
        grid1.Columns.Add(oCol3)
        grid1.Columns.Add(oCol4)
        grid1.Columns.Add(oCol5)
        grid1.Columns.Add(oCol6)
        grid1.Columns.Add(oCol7)
        grid1.Columns.Add(oCol8)
        grid1.Columns.Add(oCol9)
        grid1.Columns.Add(oCol10)
        grid1.Columns.Add(oCol11)
        grid1.Columns.Add(oCol12)
        grid1.Columns.Add(oCol13)

        'add the grid to the controls collection of the PlaceHolder        
        Grid1Container.Controls.Add(grid1)


        window1 = New Window()
        window1.ID = "Window1"
        window1.IsModal = True
        window1.ShowCloseButton = True
        window1.Status = ""
        window1.RelativeElementID = "WindowPositionHelper"
        window1.Top = -25
        window1.Left = 100
        window1.Height = 370
        window1.Width = 551
        window1.VisibleOnLoad = False
        window1.StyleFolder = "../window/wdstyles/blue"
        window1.Title = "Add / Edit Record"

        SuperForm1Container.Controls.Add(window1)

        Dim hiddenInput As Literal = New Literal()
        hiddenInput.Text = "<input type=""hidden"" id=""OrderID"" />"
        window1.Controls.Add(hiddenInput)

        Dim superFormPlaceHolder As PlaceHolder = New PlaceHolder()
        window1.Controls.Add(superFormPlaceHolder)

        Dim div1 As Literal = New Literal()
        div1.Text = "<div class=""super-form"" >"
        superFormPlaceHolder.Controls.Add(div1)

        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Width = 525
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = False
        SuperForm1.AutoGenerateEditButton = False
        SuperForm1.AutoGenerateDeleteButton = False
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.DefaultMode = DetailsViewMode.Insert

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "ShipName"
        field1.HeaderText = "Ship Name"
        field1.FieldSetID = "FieldSet1"

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipAddress"
        field2.HeaderText = "Ship Address"
        field2.FieldSetID = "FieldSet1"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipCity"
        field3.HeaderText = "Ship City"
        field3.FieldSetID = "FieldSet1"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipRegion"
        field4.HeaderText = "Ship Region"
        field4.FieldSetID = "FieldSet1"

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "ShipPostalCode"
        field5.HeaderText = "Zip Code"
        field5.FieldSetID = "FieldSet1"

        Dim field6 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field6.DataField = "ShipCountry"
        field6.HeaderText = "Ship Country"
        field6.FieldSetID = "FieldSet1"
        field6.DataSourceID = "SqlDataSource3"

        Dim field7 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field7.DataField = "OrderDate"
        field7.HeaderText = "Order Date"
        field7.FieldSetID = "FieldSet2"
        field7.DataFormatString = "{0:MM/dd/yyyy}"
        field7.ApplyFormatInEditMode = True

        Dim field8 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field8.DataField = "RequiredDate"
        field8.HeaderText = "Required Date"
        field8.FieldSetID = "FieldSet2"
        field8.DataFormatString = "{0:MM/dd/yyyy}"
        field8.ApplyFormatInEditMode = True

        Dim field9 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field9.DataField = "ShippedDate"
        field9.HeaderText = "Shipped Date"
        field9.FieldSetID = "FieldSet2"
        field9.DataFormatString = "{0:MM/dd/yyyy}"
        field9.ApplyFormatInEditMode = True

        Dim field10 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field10.DataField = "ShipVia"
        field10.HeaderText = "Ship Via"
        field10.FieldSetID = "FieldSet2"

        Dim field11 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field11.DataField = "Sent"
        field11.HeaderText = "Sent"
        field11.FieldSetID = "FieldSet2"

        Dim field12 As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        field12.FieldSetID = "FieldSet4"
        field12.EditItemTemplate = New AddButtonsItemTemplate()

        Dim fieldSetRow1 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet1 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet1.ID = "FieldSet1"
        fieldSet1.Title = "Ship Information"

        Dim fieldSet2 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet2.ID = "FieldSet2"
        fieldSet2.Title = "Order Information"
        fieldSetRow1.Items.Add(fieldSet1)
        fieldSetRow1.Items.Add(fieldSet2)

        Dim fieldSetRow2 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet4 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet4.ID = "FieldSet4"
        fieldSet4.ColumnSpan = 2
        fieldSet4.CssClass = "command-row"
        fieldSetRow2.Items.Add(fieldSet4)
        SuperForm1.FieldSets.Add(fieldSetRow1)
        SuperForm1.FieldSets.Add(fieldSetRow2)

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)
        SuperForm1.Fields.Add(field4)
        SuperForm1.Fields.Add(field5)
        SuperForm1.Fields.Add(field6)
        SuperForm1.Fields.Add(field7)
        SuperForm1.Fields.Add(field8)
        SuperForm1.Fields.Add(field9)
        SuperForm1.Fields.Add(field10)
        SuperForm1.Fields.Add(field11)
        SuperForm1.Fields.Add(field12)

        superFormPlaceHolder.Controls.Add(SuperForm1)
        Dim div2 As Literal = New Literal()
        div2.Text = "</div>"
        superFormPlaceHolder.Controls.Add(div2)

        window1.Controls.Add(hiddenInput)
    End Sub

    Public Class AddButtonsItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn

            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim button1 As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()
            button1.ID = "OboutButton1"
            button1.Text = "Save"
            button1.OnClientClick = "saveChanges(); return false;"
            button1.Width = 75

            Dim button2 As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()
            button2.ID = "OboutButton2"
            button2.Text = "Cancel"
            button2.OnClientClick = "cancelChanges(); return false;"
            button2.Width = 75

            templatePlaceHolder.Controls.Add(button1)
            templatePlaceHolder.Controls.Add(button2)
        End Sub
    End Class
	
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
			.super-form {
                margin: 12px;
            }
        
            .ob_fC table td {
                white-space: normal !important;
            }
        
            .command-row .ob_fRwF {
                padding-left: 50px !important;
            }
		</style>	
		<script type="text/javascript">
		    function Grid1_ClientEdit(sender, record) {

		        Window1.Open();

		        document.getElementById('OrderID').value = record.OrderID;
		        SuperForm1_ShipName.value(record.ShipName);
		        SuperForm1_ShipAddress.value(record.ShipAddress);
		        SuperForm1_ShipCity.value(record.ShipCity);
		        SuperForm1_ShipRegion.value(record.ShipRegion);
		        SuperForm1_ShipPostalCode.value(record.ShipPostalCode);
		        SuperForm1_ShipCountry.value(record.ShipCountry);
		        SuperForm1_OrderDate.value(record.OrderDate);
		        SuperForm1_RequiredDate.value(record.RequiredDate);
		        SuperForm1_ShippedDate.value(record.ShippedDate);
		        SuperForm1_ShipVia.value(record.ShipVia);
		        SuperForm1_Sent.checked(record.Sent.toLowerCase() == 'true' ? true : false);

		        return false;
		    }

		    function Grid1_ClientAdd(sender, record) {

		        Window1.Open();

		        document.getElementById('OrderID').value = 0;
		        SuperForm1_ShipName.value('');
		        SuperForm1_ShipAddress.value('');
		        SuperForm1_ShipCity.value('');
		        SuperForm1_ShipRegion.value('');
		        SuperForm1_ShipPostalCode.value('');
		        SuperForm1_ShipCountry.value('');
		        SuperForm1_OrderDate.value('');
		        SuperForm1_RequiredDate.value('');
		        SuperForm1_ShippedDate.value('');
		        SuperForm1_ShipVia.value('');
		        SuperForm1_Sent.checked(false);

		        return false;
		    }

		    function saveChanges() {
		        Window1.Close();

		        var orderId = document.getElementById('OrderID').value;

		        var data = new Object();

		        data.ShipName = SuperForm1_ShipName.value();
		        data.ShipAddress = SuperForm1_ShipAddress.value();
		        data.ShipCity = SuperForm1_ShipCity.value();
		        data.ShipRegion = SuperForm1_ShipRegion.value();
		        data.ShipPostalCode = SuperForm1_ShipPostalCode.value();
		        data.ShipCountry = SuperForm1_ShipCountry.value();
		        data.OrderDate = SuperForm1_OrderDate.value();
		        data.RequiredDate = SuperForm1_RequiredDate.value();
		        data.ShippedDate = SuperForm1_ShippedDate.value();
		        data.ShipVia = SuperForm1_ShipVia.value();
		        data.Sent = SuperForm1_Sent.checked();

		        if (orderId != 0) {
		            data.OrderID = orderId;

		            Grid1.executeUpdate(data);
		        } else {
		            Grid1.executeInsert(data);
		        }
		    }

		    function cancelChanges() {
		        Window1.Close();
		    }
    </script>	
	</head>
	<body>	
		<form id="Form1" runat="server">
					   
            <span class="tdText"><b>ASP.NET Grid - Using Super Form in Window</b></span>
            
            <br /><br />

            <span id="WindowPositionHelper"></span>

           <asp:PlaceHolder runat="server" ID="Grid1Container" /> 

           <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT TOP 25 * FROM [Orders] ORDER BY OrderID DESC"
                UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode,
                               ShipCountry=@ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent=@Sent
                               WHERE OrderID=@OrderID"
                InsertCommand="INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, 
                                    OrderDate, RequiredDate, ShippedDate, ShipVia, Sent)
                                VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, 
                                    @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent)"
                DeleteCommand="DELETE FROM Orders WHERE OrderID=@OrderID">
                <UpdateParameters>
                    <asp:Parameter Name="ShipName" Type="String" />
                    <asp:Parameter Name="ShipAddress" Type="String" />
                    <asp:Parameter Name="ShipCity" Type="String" />
                    <asp:Parameter Name="ShipRegion" Type="String" />
                    <asp:Parameter Name="ShipPostalCode" Type="String" />
                    <asp:Parameter Name="ShipCountry" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="RequiredDate" Type="DateTime" />
                    <asp:Parameter Name="ShippedDate" Type="DateTime" />
                    <asp:Parameter Name="ShipVia" Type="Int32" />
                    <asp:Parameter Name="Sent" Type="Boolean" />
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ShipName" Type="String" />
                    <asp:Parameter Name="ShipAddress" Type="String" />
                    <asp:Parameter Name="ShipCity" Type="String" />
                    <asp:Parameter Name="ShipRegion" Type="String" />
                    <asp:Parameter Name="ShipPostalCode" Type="String" />
                    <asp:Parameter Name="ShipCountry" Type="String" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="RequiredDate" Type="DateTime" />
                    <asp:Parameter Name="ShippedDate" Type="DateTime" />
                    <asp:Parameter Name="ShipVia" Type="Int32" />
                    <asp:Parameter Name="Sent" Type="Boolean" />
                </InsertParameters>
                <DeleteParameters>
                    <asp:Parameter Name="OrderID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>

            <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		         ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
                SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
            
            <br /><br />
            
            <span class="tdText">
                The Super Form control can be placed inside a Window control and be used for adding/editing the records of a Grid.<br />
                This approach will increase the usability of the site, because you can display much more fields in the Super Form in Window<br />
                than you can display in a Grid row.
            </span>
            <br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>
   
