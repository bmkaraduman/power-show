<%@ Page Language="C#" MasterPageFile="~/Grid/Grid.master" AutoEventWireup="true" CodeFile="aspnet_commands_excel_style_full.aspx.cs" Inherits="Grid_aspnet_commands_excel_style_full" %>
<%@  Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="resources/custom_scripts/excel-style/excel-style.css" type="text/css" rel="Stylesheet" />
    <style type="text/css">
    .ob_gFAL
    {
        position: relative;
        top: -3px;
    }
</style>
    <script type="text/javascript">
        window.onload = function () {
            Grid1.convertToExcel(
                ['ReadOnly', 'TextBox', 'TextBox', 'MultiLineTextBox', 'ComboBox', 'TextBox', 'CheckBox', 'Actions'],
                '<%=Grid1ExcelData.ClientID %>',
                '<%=Grid1ExcelDeletedIds.ClientID %>'
                );
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
		
    <span class="tdText"><b>ASP.NET Grid - Excel-Style</b></span>
		
    <br /><br /> 
    
    <asp:HiddenField runat="server" ID="Grid1ExcelDeletedIds" />
    <asp:HiddenField runat="server" ID="Grid1ExcelData" />   
				
	<obout:Grid id="Grid1" runat="server" CallbackMode="false" Serialize="false" AutoGenerateColumns="false"
		FolderStyle="styles/premiere_blue" AllowRecordSelection="false" AllowAddingRecords="true"
		ShowFooter="true" AllowSorting="false" PageSize="-1" ShowLoadingMessage="false" AllowPageSizeSelection="false" AllowPaging="false"
		DataSourceID="SqlDataSource1" AllowMultiRecordAdding="true">
		<PagingSettings ShowRecordsCount="false" />
        <TemplateSettings NewRecord_TemplateId="ButtonsTemplate" MultiRecordSaveCancel_TemplateId="ButtonsTemplate2" />
        <Columns>
			<obout:Column ID="Column1" DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server" Visible="false">
                <TemplateSettings TemplateId="ReadOnlyTemplate" />
            </obout:Column>			
			<obout:Column ID="Column3" DataField="ShipName" HeaderText="NAME" Width="175" runat="server">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>				
			<obout:Column ID="Column4" DataField="ShipCity" HeaderText="CITY" Width="100" runat="server">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>			
			<obout:Column ID="Column6" DataField="ShipAddress" HeaderText="ADDRESS" Width="100" runat="server">
				<TemplateSettings TemplateId="MultiLineTextBoxEditTemplate" />
			</obout:Column>
			<obout:Column ID="Column7" DataField="ShipCountry" HeaderText="COUNTRY" Width="100" runat="server">
				<TemplateSettings TemplateId="ComboBoxEditTemplate" />
			</obout:Column>
            <obout:Column ID="Column2" DataField="OrderDate" HeaderText="DATE" Width="110" runat="server" DataFormatString="{0:MM/dd/yyyy}">
				<TemplateSettings TemplateId="TextBoxEditTemplate" />
			</obout:Column>
            <obout:Column ID="Column8" DataField="Sent" HeaderText="SENT" Width="40" runat="server">
				<TemplateSettings TemplateId="CheckBoxEditTemplate" />
			</obout:Column>
            <obout:Column ID="Column9" DataField="" Width="30" runat="server">
				<TemplateSettings TemplateId="ActionsTemplate" />
			</obout:Column>
		</Columns>
		<Templates>
            <obout:GridTemplate runat="server" ID="ReadOnlyTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="TextBoxEditTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
                        onfocus="Grid1.editWithTextBox(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="MultiLineTextBoxEditTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
                        onfocus="Grid1.editWithMultiLineTextBox(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="ComboBoxEditTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
                        onfocus="Grid1.editWithComboBox(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="CheckBoxEditTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value == "True" ? "yes" : "no" %>' readonly="readonly"
                        onfocus="Grid1.editWithCheckBox(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="DatePickerEditTemplate">
                <Template>
                    <input type="text" name="TextBox1" class="excel-textbox" value='<%# Container.Value %>' readonly="readonly"
                        onfocus="Grid1.editWithDatePicker(this)" />
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="ActionsTemplate">
                <Template>
                    <a href="javascript: //" onclick="Grid1.removeRow(this)"><img src="resources/images/Delete.png" alt="Delete" title="Delete" height="21" border="0" /></a>
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="ButtonsTemplate">
                <Template>                    
                    <obout:OboutButton ID="OboutButton1" runat="server" Text="Add New Row" OnClientClick="Grid1.addNewRow(); return false;" />
                    <obout:OboutButton ID="OboutButton2" runat="server" Text="Save Changes" OnClientClick="return Grid1.saveExcelChanges()" OnClick="SaveChanges" />
                    <obout:OboutButton ID="OboutButton3" runat="server" Text="Cancel Changes" />                    
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="ButtonsTemplate2">
                <Template>
                </Template>
            </obout:GridTemplate>
		</Templates>
	</obout:Grid>

    <div style="display: none;" id="FieldEditorsContainer">
        <div id="TextBoxEditorContainer" style="width: 100%">
            <obout:OboutTextBox runat="server" ID="TextBoxEditor" FolderStyle="~/Interface/styles/premiere_blue/OboutTextBox" Width="100%" AutoCompleteType="None">
                <ClientSideEvents OnKeyDown="navigateThroughCells" />
            </obout:OboutTextBox>
        </div>
        <div id="MultiLineTextBoxEditorContainer" style="width: 100%">
            <obout:OboutTextBox runat="server" ID="MultiLineTextBoxEditor" TextMode="MultiLine" FolderStyle="~/Interface/styles/premiere_blue/OboutTextBox" Width="100%" Height="40" AutoCompleteType="None">
                <ClientSideEvents OnKeyDown="navigateThroughCells" />
            </obout:OboutTextBox>
        </div>
        <div id="ComboBoxEditorContainer" style="width: 100%">
            <obout:ComboBox runat="server" ID="ComboBoxEditor" FolderStyle="~/ComboBox/styles/premiere_blue" Width="100%" Height="150" MenuWidth="175"
                DataSourceID="SqlDataSource2" DataTextField="CountryName" DataValueField="CountryName" OpenOnFocus="false">
                <ClientSideEvents OnBlur="persistFieldValue" OnOpen="ComboBox_Open" />    
            </obout:ComboBox>
        </div>
        <div id="CheckBoxEditorContainer" style="width: 100%">
            <obout:OboutCheckBox runat="server" ID="CheckBoxEditor" FolderStyle="~/Interface/styles/premiere_blue/OboutCheckBox">
                <ClientSideEvents OnBlur="persistFieldValue" />
            </obout:OboutCheckBox>
        </div>
        <div id="DatePickerEditorContainer" style="width: 100%">
            <obout:OboutTextBox runat="server" ID="DatePickerEditor" FolderStyle="~/Interface/styles/premiere_blue/OboutTextBox" Width="70%">
                <ClientSideEvents OnKeyDown="navigateThroughCells" />
            </obout:OboutTextBox>
            <obout:Calendar ID="gridCal1" runat="server" 
				StyleFolder="../Calendar/styles/expedia" 
				DatePickerMode="true"
                TextBoxId="DatePickerEditor"
				DatePickerImagePath ="../Calendar/styles/date_picker1.gif"/>
        </div>
    </div>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT * FROM [Orders] WHERE OrderID > 11061 ORDER BY OrderID DESC">
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|continent.mdb;"
        ProviderName="System.Data.OleDb"
        SelectCommand="SELECT * FROM Country ORDER BY CountryName ASC">
    </asp:SqlDataSource>	
		
	<br /><br />
		
	<div class="tdText">
		This example showcases the ability to edit the cells of the Grid similar to an Excel spreadsheet.<br />
        To edit a cell simply click it with the mouse. You can use the keyboard to navigate through cells.<br />        
        When clicking the "Save Changes" button all the changes from the Grid are saved into the database at once.<br />
        You can also add new records or delete existing ones.<br /><br />

        Currently the excel style feature may be enabled only as a custom solution using templates. <br />
        First, you need to load the "excel-style.js" file from the "oboutSuite / Grid / resources / custom_scripts / excel-style" folder at the bottom of your page<br />
        <span class="option2">&lt;script type="text/javascript" src="resources/custom_scripts/excel-style/excel-style.js"&gt;&lt;/script&gt;</span><br /><br />

        You also need to load the custom stylesheet required by this feature (e.g. in the <span class="option2">&lt;head&gt;</span> section):<br />
        <span class="option2">&lt;link href="resources/custom_scripts/excel-style/excel-style.css" rel="stylesheet" type="text/css" /&gt;</span><br /><br />

        Then, call the <b>convertToExcel</b> client-side method for the Grid that you want to expose excel-style features:<br />
        <pre><span class="option2">Grid1.convertToExcel(
                        columnTypes
                        dataContainerHiddenId,
                        deletedIdsHiddenId
                        );</span></pre><br />

        <b>columnTypes</b> - an array indicating the type of each column;<br />
        <b>dataContainerHiddenId</b> - the client-side ID of a hidden field which will store the data for the Grid;<br />
        <b>endColumnIndex</b> - the client-side ID of a hidden field which will store the ids of the deleted rows;<br /><br />

        For example:
        <pre><span class="option2">Grid1.convertToExcel(
                    ['ReadOnly', 'TextBox', 'TextBox', 'MultiLineTextBox', 'ComboBox', 'TextBox', 'CheckBox', 'Actions'],
                    '&lt;%=Grid1ExcelData.ClientID %&gt;',
                    '&lt;%=Grid1ExcelDeletedIds.ClientID %&gt;'
                    );</span></pre>
	</div>

    <script src="resources/custom_scripts/excel-style/excel-style.js" type="text/javascript"></script>
</asp:Content>