<%@ Page Language="VB" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script language="VB" runat="server">
Dim grid1 As Obout.Grid.Grid = New Grid()
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        grid1.ID = "Grid1"
        grid1.DataSourceID = "SqlDataSource1"
        grid1.Serialize = False
        grid1.AutoGenerateColumns = False

        grid1.TemplateSettings.RowEditTemplateId = "tplRowEdit"

        ' creating the Template for editing Rows
        '------------------------------------------------------------------------
        Dim RowEditTemplate As GridRuntimeTemplate = New GridRuntimeTemplate()
        RowEditTemplate.ID = "tplRowEdit"
        RowEditTemplate.Template = New Obout.Grid.RuntimeTemplate()
        AddHandler CType(RowEditTemplate.Template, Obout.Grid.RuntimeTemplate).CreateTemplate, AddressOf CreateRowEditTemplate

        grid1.Templates.Add(RowEditTemplate)

        ' creating the columns
        Dim oCol1 As Column = New Column()
        oCol1.DataField = "OrderID"
        oCol1.ReadOnly = True
        oCol1.HeaderText = "ORDER ID"
        oCol1.Width = "150"
        oCol1.Visible = False
        oCol1.TemplateSettings.RowEditTemplateControlId = "OrderID"
        oCol1.TemplateSettings.RowEditTemplateControlPropertyName = "value"


        Dim oCol2 As Column = New Column()
        oCol2.DataField = "ShipName"
        oCol2.HeaderText = "NAME"
        oCol2.Width = "200"
        oCol2.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipName"
        oCol2.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol3 As Column = New Column()
        oCol3.DataField = "ShipAddress"
        oCol3.Visible = False
        oCol3.HeaderText = "ADDRESS"
        oCol3.Width = "125"
        oCol3.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipAddress"
        oCol3.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol4 As Column = New Column()
        oCol4.DataField = "ShipCity"
        oCol4.Visible = True
        oCol4.HeaderText = "CITY"
        oCol4.Width = "150"
        oCol4.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCity"
        oCol4.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol5 As Column = New Column()
        oCol5.DataField = "ShipRegion"
        oCol5.Visible = False
        oCol5.HeaderText = "REGION"
        oCol5.Width = "150"
        oCol5.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipRegion"
        oCol5.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol6 As Column = New Column()
        oCol6.DataField = "ShipPostalCode"
        oCol6.Visible = True
        oCol6.HeaderText = "POSTAL CODE"
        oCol6.Width = "150"
        oCol6.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipPostalCode"
        oCol6.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol7 As Column = New Column()
        oCol7.DataField = "ShipCountry"
        oCol7.Visible = True
        oCol7.HeaderText = "COUNTRY"
        oCol7.Width = "125"
        oCol7.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipCountry"
        oCol7.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol8 As Column = New Column()
        oCol8.DataField = "OrderDate"
        oCol8.Visible = True
        oCol8.HeaderText = "ORDER DATE"
        oCol8.DataFormatString = "{0:MM/dd/yyyy}"
        oCol8.ApplyFormatInEditMode = True
        oCol8.Width = "125"
        oCol8.TemplateSettings.RowEditTemplateControlId = "SuperForm1_OrderDate"
        oCol8.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol9 As Column = New Column()
        oCol9.DataField = "RequiredDate"
        oCol9.Visible = False
        oCol9.HeaderText = "REQUIRED DATE"
        oCol9.ApplyFormatInEditMode = True
        oCol9.Width = "200"
        oCol9.TemplateSettings.RowEditTemplateControlId = "SuperForm1_RequiredDate"
        oCol9.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol10 As Column = New Column()
        oCol10.DataField = "ShippedDate"
        oCol10.Visible = False
        oCol10.ApplyFormatInEditMode = True
        oCol10.HeaderText = "SHIPPED DATE"
        oCol10.Width = "200"
        oCol10.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShippedDate"
        oCol10.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol11 As Column = New Column()
        oCol11.DataField = "ShipVia"
        oCol11.Visible = False
        oCol11.HeaderText = "SHIP VIA"
        oCol11.Width = "200"
        oCol11.TemplateSettings.RowEditTemplateControlId = "SuperForm1_ShipVia"
        oCol11.TemplateSettings.RowEditTemplateControlPropertyName = "value"

        Dim oCol12 As Column = New Column()
        oCol12.DataField = "Sent"
        oCol12.Visible = False
        oCol12.HeaderText = "SENT"
        oCol12.Width = "175"
        oCol12.TemplateSettings.RowEditTemplateControlId = "SuperForm1_Sent"
        oCol12.TemplateSettings.RowEditTemplateControlPropertyName = "checked"
        oCol12.TemplateSettings.RowEditTemplateUseQuotes = False

        Dim oCol13 As Column = New Column()
        oCol13.DataField = "AdditionalInformation"
        oCol13.Visible = False
        oCol13.HeaderText = "ADDITIONAL INFORMATION"
        oCol13.Width = "200"
        oCol13.TemplateSettings.RowEditTemplateControlId = "SuperForm1_AdditionalInformation"
        oCol13.TemplateSettings.RowEditTemplateControlPropertyName = "value"


        Dim oCol14 As Column = New Column()
        oCol14.DataField = ""
        oCol14.Visible = True
        oCol14.HeaderText = "EDIT"
        oCol14.Width = "200"
        oCol14.AllowEdit = True
        oCol14.AllowDelete = True


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
        grid1.Columns.Add(oCol14)

        'add the grid to the controls collection of the PlaceHolder        
        phGrid1.Controls.Add(grid1)
    End Sub


    Sub CreateRowEditTemplate(ByVal sender As Object, ByVal e As Obout.Grid.GridRuntimeTemplateEventArgs)
        Dim oPH1 As PlaceHolder = New PlaceHolder()
        e.Container.Controls.Add(oPH1)
        AddHandler CType(oPH1, PlaceHolder).DataBinding, AddressOf DataBindRowEditTemplate
    End Sub

    Public Sub DataBindRowEditTemplate(ByVal sender As Object, ByVal e As EventArgs)
        Dim oPH1 As PlaceHolder = CType(sender, PlaceHolder)
        Dim oContainer As Obout.Grid.TemplateContainer = CType(oPH1.NamingContainer, Obout.Grid.TemplateContainer)

        Dim hiddenInput As Literal = New Literal()
        hiddenInput.Text = "<input type=""hidden"" id=""OrderID"" />"

        Dim SuperForm1 As SuperForm = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.DataSourceID = "SqlDataSource2"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = False
        SuperForm1.AutoGenerateEditButton = False
        SuperForm1.AutoGenerateDeleteButton = False
        SuperForm1.AutoGenerateDateFields = True
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.Width = Unit.Percentage(99)
        SuperForm1.DefaultMode = DetailsViewMode.Insert

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "OrderID"
        field1.HeaderText = "Order ID"
        field1.ReadOnly = True
        field1.InsertVisible = False
        field1.FieldSetID = "FieldSet1"

        Dim field2 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field2.DataField = "ShipName"
        field2.HeaderText = "Ship Name"
        field2.FieldSetID = "FieldSet1"

        Dim field3 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field3.DataField = "ShipAddress"
        field3.HeaderText = "Ship Address"
        field3.FieldSetID = "FieldSet1"

        Dim field4 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field4.DataField = "ShipCity"
        field4.HeaderText = "Ship City"
        field4.FieldSetID = "FieldSet1"

        Dim field5 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field5.DataField = "ShipRegion"
        field5.HeaderText = "Ship Region"
        field5.FieldSetID = "FieldSet1"

        Dim field6 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field6.DataField = "ShipPostalCode"
        field6.HeaderText = "Zip Code"
        field6.FieldSetID = "FieldSet1"

        Dim field7 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field7.DataField = "ShipCountry"
        field7.HeaderText = "Ship Country"
        field7.FieldSetID = "FieldSet1"
        field7.DataSourceID = "SqlDataSource3"

        Dim field8 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field8.DataField = "OrderDate"
        field8.HeaderText = "Order Date"
        field8.FieldSetID = "FieldSet2"
        field8.DataFormatString = "{0:MM/dd/yyyy}"
        field8.ApplyFormatInEditMode = True

        Dim field9 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field9.DataField = "RequiredDate"
        field9.HeaderText = "Required Date"
        field9.FieldSetID = "FieldSet2"
        field9.DataFormatString = "{0:MM/dd/yyyy}"
        field9.ApplyFormatInEditMode = True

        Dim field10 As Obout.SuperForm.DateField = New Obout.SuperForm.DateField()
        field10.DataField = "ShippedDate"
        field10.HeaderText = "Shipped Date"
        field10.FieldSetID = "FieldSet2"
        field10.DataFormatString = "{0:MM/dd/yyyy}"
        field10.ApplyFormatInEditMode = True

        Dim field11 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field11.DataField = "ShipVia"
        field11.HeaderText = "Ship Via"
        field11.FieldSetID = "FieldSet2"

        Dim field12 As Obout.SuperForm.CheckBoxField = New Obout.SuperForm.CheckBoxField()
        field12.DataField = "Sent"
        field12.HeaderText = "Sent"
        field12.FieldSetID = "FieldSet2"

        Dim field13 As Obout.SuperForm.MultiLineField = New Obout.SuperForm.MultiLineField()
        field13.DataField = "AdditionalInformation"
        field13.HeaderText = "Additional Information"
        field13.FieldSetID = "FieldSet3"
        field13.HeaderStyle.Width = 1

        Dim field14 As Obout.SuperForm.TemplateField = New Obout.SuperForm.TemplateField()
        field14.FieldSetID = "FieldSet4"
        field14.EditItemTemplate = New ButtonsEditItemTemplate()

        Dim fieldSetRow1 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet1 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet1.ID = "FieldSet1"
        fieldSet1.Title = "Ship Information"


        Dim fieldSet2 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet2.ID = "FieldSet2"
        fieldSet2.Title = "Order Information"


        Dim fieldSet3 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet3.ID = "FieldSet3"
        fieldSet3.Title = "Additional Information"

        fieldSetRow1.Items.Add(fieldSet1)
        fieldSetRow1.Items.Add(fieldSet2)
        fieldSetRow1.Items.Add(fieldSet3)

        Dim fieldSetRow2 As Obout.SuperForm.FieldSetRow = New Obout.SuperForm.FieldSetRow()
        Dim fieldSet4 As Obout.SuperForm.FieldSet = New Obout.SuperForm.FieldSet()
        fieldSet4.ID = "FieldSet4"
        fieldSet4.ColumnSpan = 3
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
        SuperForm1.Fields.Add(field13)
        SuperForm1.Fields.Add(field14)

        oPH1.Controls.Add(hiddenInput)
        oPH1.Controls.Add(SuperForm1)
    End Sub

    Public Class ButtonsEditItemTemplate
        Implements ITemplate
        Sub InstantiateIn(ByVal container As Control) Implements ITemplate.InstantiateIn
            Dim templatePlaceHolder As PlaceHolder = New PlaceHolder()
            container.Controls.Add(templatePlaceHolder)

            Dim save As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()
            Dim cancel As Obout.Interface.OboutButton = New Obout.Interface.OboutButton()

            save.Text = "Save"
            save.OnClientClick = "Grid1.save(); return false;"
            save.Width = Unit.Pixel(75)
            templatePlaceHolder.Controls.Add(save)

            cancel.Text = "Cancel"
            cancel.OnClientClick = "Grid1.cancel(); return false;"
            cancel.Width = Unit.Pixel(75)

            templatePlaceHolder.Controls.Add(cancel)
        End Sub

End Class
</script>
<html>
	<head id="Head1" runat="server">
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
			
			.ob_fC table td
            {
                white-space: normal !important;
            }
        
            .command-row .ob_fRwF
            {
                padding-left: 200px !important;
            }
        
            .ob_gRETpl #ob_iTSuperForm1_AdditionalInformationContainer
            {
                height: 160px !important;
            }
		</style>		
	</head>
	<body>
		<form id="Form1" runat="server">
					
		<br />
    
        <span class="tdText"><b>ASP.NET Grid - Using Super Form to Add/Edit Records</b></span>
    
        <br /><br />

        <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>	
		
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT TOP 25 * FROM [Orders] ORDER BY OrderID DESC"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipAddress=@ShipAddress, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipPostalCode=@ShipPostalCode,
                           ShipCountry=@ShipCountry, OrderDate=@OrderDate, RequiredDate=@RequiredDate, ShippedDate=@ShippedDate, ShipVia=@ShipVia, Sent=@Sent,
                           AdditionalInformation=@AdditionalInformation WHERE OrderID=@OrderID"
            InsertCommand="INSERT INTO Orders (ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry, 
                                OrderDate, RequiredDate, ShippedDate, ShipVia, Sent, AdditionalInformation)
                            VALUES(@ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry, 
                                @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Sent, @AdditionalInformation)"
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
                <asp:Parameter Name="AdditionalInformation" Type="String" />
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
                <asp:Parameter Name="AdditionalInformation" Type="String" />
            </InsertParameters>
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		     ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [Orders] WHERE OrderID = @OrderID"
            UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry,
                             OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate WHERE OrderID=@OrderID">
            <SelectParameters>
                <asp:Parameter Name="OrderID" Type="Int32" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
            SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
        <br /><br />
    
        <span class="tdText">
            The Super Form control can be placed inside the row edit template of a Grid to generate the form used for adding/editing records.<br />
            Using this approach makes development easier because the code is smaller and cleaner, as opposed to the standard approach of using <br />
            HTML markup and ASP.NET controls inside the row edit template of the Grid.
        </span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">« Back to examples</a>
		
		</form>
	</body>
</html>


