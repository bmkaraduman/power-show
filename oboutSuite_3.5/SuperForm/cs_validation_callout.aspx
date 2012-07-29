<%@ Page Title="" Language="C#" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="cs_validation_callout.aspx.cs" Inherits="SuperForm_cs_validation_callout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Validator Callout</b></span>
    
    <br /><br />

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT EmployeeID, FirstName, LastName, TitleOfCourtesy, BirthDate, HomePhone FROM [Employees] ORDER BY EmployeeID DESC"
        UpdateCommand="UPDATE Employees SET FirstName=@FirstName, LastName=@LastName, TitleOfCourtesy=@TitleOfCourtesy, BirthDate=@BirthDate, 
                        HomePhone=@HomePhone WHERE EmployeeID=@EmployeeID"
        InsertCommand="INSERT INTO Employees (FirstName, LastName, TitleOfCourtesy, BirthDate, HomePhone) 
                        VALUES (@FirstName, @LastName, @TitleOfCourtesy, @BirthDate, @HomePhone)"
        DeleteCommand="DELETE FROM Employees WHERE EmployeeID=@EmployeeID"
        />    
    
    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to validate the data typed by the end users into the fields using various approaches.<br />
        You can add any number of validators to a field, by means of the <b>Validators</b> collection.<br /><br />

        To make the form more user friendly, you can attach ASP.NET AJAX ControlToolkit <b>ValidatorCalloutExtender</b> controls to the validators,<br />
        to make the error messages be displayed as pop-up boxes.<br />
        The ValidatorCalloutExtender controls are attached to fields using the same approach as when attaching validators - by means of the <b>Validators</b> collection.
    </span>
</asp:Content>

