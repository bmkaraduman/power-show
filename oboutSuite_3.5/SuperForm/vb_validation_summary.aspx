<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_summary.aspx.vb" Inherits="SuperForm_vb_validation_summary" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET SuperForm - Validation Summary</b></span>
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
    
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Group1" />

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
        The SuperForm allows developers to validate the data typed by the end users into the fields using various approaches.<br />
        You can add any number of validators to a field, by means of the <b>Validators</b> collection.<br /><br />

        This sample showcases the use of the <b>ValidationSummary</b> control for displaying the error messages raised by all the validators.<br />
        Use the <b>Text</b> property of the ASP.NET validation controls to specify the error message that will be displayed near the field ("*" in this sample).<br />
        Use the <b>ErrorMessage</b> property of the ASP.NET validation controls to specify the error message that will be displayed in the validation summary.
    </span>
</asp:Content>

