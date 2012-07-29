<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_validation_compare.aspx.vb" Inherits="SuperForm_vb_validation_compare" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Validate using CompareValidator</b></span>
    
    <br /><br />

     <asp:PlaceHolder runat="server" ID="SuperForm1Container" />

    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">        
        Thank you for your registration.
    </asp:Panel>

    <br /><br />
    
    <span class="tdText">
        The Super Form allows developers to validate the data typed by the end users into the fields using various approaches.<br /><br />
        This sample shows how to use a <b>CompareValidator</b> control to ensure that two fields of the form contain the same data.<br />
        Use the <b>Validators</b> collection to add a <b>CompareValidator</b> to one of the fields. When setting the <b>ControlToCompare</b><br />
        property of the validator, use the DataField of the field that will be used in the comparison,<br /> preceded by the ID of the form and a underline.<br /><br />
        In this sample we added a <b>CompareValidator</b> validator in the <b>Validators</b> collection of the "ComfirmEmailAddress" field,<br />
        to compare it against the "EmailAddress" field. Thus, we set the <b>ControlToCompare</b> property of the validator to <br />
        "SuperForm1_EmailAddress" ("SuperForm1" is the ID of the form control).
    </span>
</asp:Content>