<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_custom.aspx.vb" Inherits="SuperForm_vb_validation_custom" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #ctl00_ContentPlaceHolder1_SuperForm1_RegularExpressionValidator1, #ctl00_ContentPlaceHolder1_SuperForm1_CustomValidator1
        {
            position: relative !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Custom Validation</b></span>
    
    <br /><br />
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

        This sample showcases the use of the <b>RegularExpressionValidator</b> control for validating phone numbers and <br />
        the use of the <b>CustomValidator</b> control for performing custom validation at run time - the 'Courtesy Title' field <br />
        is validated against a set of predetermined possible values.
    </span>
</asp:Content>


