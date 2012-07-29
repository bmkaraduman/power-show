<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_mask_masks.aspx.cs" Inherits="SuperForm_cs_mask_masks" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Edit Masks</b></span>
    
    <br /><br />

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

     <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
     
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT EmployeeID, FirstName, LastName, BirthDate, HireDate, HomePhone, Salary, HomePhone FROM [Employees] ORDER BY EmployeeID DESC"
        UpdateCommand="UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, BirthDate=@BirthDate, HireDate=@HireDate, 
                        Salary=@Salary, HomePhone=@HomePhone WHERE EmployeeID=@EmployeeID"
        InsertCommand="INSERT INTO Employees (FirstName, LastName, BirthDate, HireDate, Salary, HomePhone) 
                        VALUES (@FirstName, @LastName, @BirthDate, @HireDate, @Salary, @HomePhone)"
        DeleteCommand="DELETE FROM Employees WHERE EmployeeID=@EmployeeID"
        />
    
    <br /><br />
    
    <span class="tdText">
        The Super Form provides built-in support for attaching ASP.NET AJAX ControlToolkit MaskedEditExtender controls to the fields of the form.<br />
        Using this feature, you can enhance the experience of your end users and increase the usability of the form.<br /><br />
        
        Use the <b>Masks</b> collection to add extenders to the fields of the form.<br /><br />

        This example showcases the use of various types of masks:<br />
        <ul>
            <li><b>dates</b> - for the "Birth Date" and "Hire Date" fields.</li>
            <li><b>numbers/money amounts</b> - for the "Salary" field.</li>
            <li><b>phone numbers</b> - for the "Phone" field.</li>
        </ul>
        <br />
        Click in any of these fields to see the edit masks.
    </span>
</asp:Content>

