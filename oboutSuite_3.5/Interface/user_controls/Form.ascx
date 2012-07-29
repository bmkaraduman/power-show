<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Form.ascx.cs" Inherits="Interface_user_controls_Form" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<fieldset style="width: 250px;">
    <legend class="tdText">Login Form</legend>
    
    <table>
        <tr>
            <td class="tdText">Username:</td>
            <td>
                <obout:OboutTextBox runat="server" ID="Username" />
            </td>
        </tr>
        <tr>
            <td class="tdText">Password:</td>
            <td>
                <obout:OboutTextBox runat="server" ID="Password" />
            </td>
        </tr>
        <tr>
            <td class="tdText">&#160;</td>
            <td>
                <obout:OboutCheckBox runat="server" ID="RememberMe" Text="Remember Me" />
            </td>
        </tr>
        <tr>
            <td class="tdText">&#160;</td>
            <td>
                <obout:OboutButton runat="server" ID="Login" Text="Log In" Width="75" />
            </td>
        </tr>
    </table>
</fieldset>