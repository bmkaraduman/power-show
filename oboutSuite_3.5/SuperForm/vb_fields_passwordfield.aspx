<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_fields_passwordfield.aspx.vb" Inherits="SuperForm_vb_fields_passwordfield" %>
<%@ Register TagPrefix="obout" Namespace="Obout.SuperForm" Assembly="obout_SuperForm" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Password Field</b></span>
    
    <br /><br />

    <asp:PlaceHolder runat="server" ID="SuperForm1Container" /> 
        
    <asp:Panel runat="server" ID="MessagePanel" Visible="false" CssClass="tdText">        
        Thank you for your registration.
    </asp:Panel>

    <br /><br />
    
    <span class="tdText">
        A <b>BoundField</b> can easily be converted to a <b>Password</b> field, by following these steps:<br />
        <ul>
            <li>Add an event handler for the <b>DataBound</b> event of the form.</li>
            <li>
                In this event handler access the underlying text box controls for the fields you want to convert <br />
                to Password fields and change their <b>TextMode</b> property:<br />
                <span class="option2">
                    &#160;&#160;&#160;&#160;OboutTextBox password = SuperForm1.GetFieldControl(1) as OboutTextBox;<br />
                    &#160;&#160;&#160;&#160;&#160;password.TextMode = TextBoxMode.Password;
                </span>
            </li>
        </ul>
    </span>
</asp:Content>


    
    
    
   