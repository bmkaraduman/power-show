<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_layout_tabs.aspx.cs" Inherits="SuperForm_cs_layout_tabs" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor" TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.Popups" TagPrefix="obout" %>
<%@ Register TagPrefix="oem" Namespace="OboutInc.EasyMenu_Pro" Assembly="obout_EasyMenu_Pro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Field Sets with Tabs</b></span>
    
    <br /><br />
    
     <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    
     <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, 
                        Address, City, Region, PostalCode, Country, Notes,
                        HomePhone, Extension, Salary FROM [Employees] ORDER BY EmployeeID DESC"
        UpdateCommand="UPDATE Employees SET LastName=@LastName, FirstName=@FirstName, Title=@Title, TitleOfCourtesy=@TitleOfCourtesy, 
                        BirthDate=@BirthDate, HireDate=@HireDate, Address=@Address, City=@City, Region=@Region,
                        PostalCode=@PostalCode, Country=@Country, Notes=@Notes, HomePhone=@HomePhone, Extension=@Extension, Salary=@Salary
                         WHERE EmployeeID=@EmployeeID"
        InsertCommand="INSERT INTO Employees (LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, Notes, HomePhone, Extension, Salary) 
                        VALUES (@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @Region, @PostalCode, @Country, @Notes, @HomePhone, @Extension, @Salary)"
        DeleteCommand="DELETE FROM Employees WHERE EmployeeID=@EmployeeID">
        <UpdateParameters>
            <asp:Parameter Name="LastName" DbType="String" />
            <asp:Parameter Name="FirstName" DbType="String" />
            <asp:Parameter Name="Title" DbType="String" />            
            <asp:Parameter Name="TitleOfCourtesy" DbType="String" />
            <asp:Parameter Name="BirthDate" DbType="DateTime" />
            <asp:Parameter Name="HireDate" DbType="DateTime" />
            <asp:Parameter Name="Address" DbType="String" />
            <asp:Parameter Name="City" DbType="String" />
            <asp:Parameter Name="Region" DbType="String" />
            <asp:Parameter Name="PostalCode" DbType="String" />
            <asp:Parameter Name="Country" DbType="String" />
            <asp:Parameter Name="Notes" DbType="String" />
            <asp:Parameter Name="HomePhone" DbType="String" />
            <asp:Parameter Name="Extension" DbType="String" />
            <asp:Parameter Name="Salary" DbType="Double" />
            <asp:Parameter Name="EmployeeID" DbType="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" DbType="String" />
            <asp:Parameter Name="FirstName" DbType="String" />
            <asp:Parameter Name="Title" DbType="String" />            
            <asp:Parameter Name="TitleOfCourtesy" DbType="String" />
            <asp:Parameter Name="BirthDate" DbType="DateTime" />
            <asp:Parameter Name="HireDate" DbType="DateTime" />
            <asp:Parameter Name="Address" DbType="String" />
            <asp:Parameter Name="City" DbType="String" />
            <asp:Parameter Name="Region" DbType="String" />
            <asp:Parameter Name="PostalCode" DbType="String" />
            <asp:Parameter Name="Country" DbType="String" />
            <asp:Parameter Name="Notes" DbType="String" />
            <asp:Parameter Name="HomePhone" DbType="String" />
            <asp:Parameter Name="Extension" DbType="String" />
            <asp:Parameter Name="Salary" DbType="Double" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT DISTINCT ShipCountry FROM [Orders] ORDER BY ShipCountry ASC" />
    
    <br /><br />
    
    <span class="tdText">
        The fields of the Super Form can be grouped in field sets. Use the <b>FieldSets</b> collection to define field sets for the form.<br />
        The field sets are grouped in field set rows, which allow developers to organize the field sets in a tabular structure.<br />
        To designate a field as member of a field set, use the <b>FieldSetID</b> property of the field.<br /><br />
        By combining template fields with field sets you can achieve highly complex form layouts.<br />
        This example showcases the use of tabs inside the form, that allow users to switch between tab panels that contain different field sets.<br />
        Using this approach you can fit a large form structure in less space on your web page.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .ob_fRwF span
        {
            position: static !important;            
        }
        
        td.field-set
        {
            padding-left: 0px !important;
            padding-right:0px !important;
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
        
        td.field-set .ob_fRwH, td.field-set .ob_fRwF
        {
            padding-bottom: 0px !important;
            padding-top: 0px !important;
        }
        
        .field-set-visible
        {
            display: block;
        }
        
        .field-set-hidden
        {
            display: none;
        }
        
        .field-set-hidden-editor
        {
            visibility: hidden;
        }
        
        .field-set-hidden-editor #EditorContainer
        {
            position: absolute;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }
        
        .tabs-border
        {
            height: 2px;
            width: 100%;
            background-image: url(styles/black_glass/images/separator.png);
            top: 38px;
            position: absolute;
        }
    </style>

    <script type="text/javascript">
        var lastVisibleFieldSetIndex = 3;

        function SelectTab(fieldSetIndex, typeIndex) {
            ob_em_SelectItem('Item_' + fieldSetIndex + '_' + typeIndex);
            var container = document.getElementById('__dvctl00_ContentPlaceHolder1_SuperForm1__div').firstChild;
            while (container.className != 'ob_fC') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TABLE') {
                container = container.nextSibling;
            }

            container = container.firstChild;
            while (container.nodeName != 'TBODY') {
                container = container.nextSibling;
            }

            var increment = 1;

            if (container.firstChild.nodeName != 'TR') {
                increment++;
            }

            var previousFieldSet = container.childNodes[lastVisibleFieldSetIndex - increment].firstChild
            while (previousFieldSet.nodeName != 'TD') {
                previousFieldSet = previousFieldSet.nextSibling;
            }
            previousFieldSet.className = previousFieldSet.className.replace('field-set-visible', 'field-set-hidden');

            var fieldSet = container.childNodes[fieldSetIndex - increment].firstChild;
            while (fieldSet.nodeName != 'TD') {
                fieldSet = fieldSet.nextSibling;
            }
            fieldSet.className = fieldSet.className.replace('field-set-hidden', 'field-set-visible');

            lastVisibleFieldSetIndex = fieldSetIndex;
        }
	</script>
</asp:Content>

