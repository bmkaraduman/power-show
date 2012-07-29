<%@ Page Title="" Language="VB" AutoEventWireup="true" MasterPageFile="~/Poll/Poll.master" CodeFile="vb_appearance_customizestyles.aspx.vb" Inherits="Poll_vb_appearance_customizestyles" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Ajax.UI.Poll" Assembly="Obout.Ajax.UI" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager runat="server" />
    
    <br />

	<span class="tdText"><b>ASP.NET Poll - Appearance - Customize Styles</b></span>
    
    <br />
    <br />

    <table class="tdText">
        <tr>
            <td valign="middle">
                <asp:PlaceHolder ID="phPoll1" runat="server"></asp:PlaceHolder>
            </td>
            <td width="10">&#160;</td>
            <td>
                <fieldset class="floating">
                    <legend>Answers Font</legend>

                    <table class="tdText">
                        <tr>
                            <td>
                                Size:
                            </td>
                            <td>                        
                                <obout:OboutDropDownList runat="server" ID="AnswersFontSize" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="10px" Selected="True" />
                                    <asp:ListItem Text="11px" />
                                    <asp:ListItem Text="12px" />
                                    <asp:ListItem Text="13px" />
                                    <asp:ListItem Text="14px" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Styles:</td>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="AnswersFontBold" Text="Bold" AutoPostBack="true" />

                                <obout:OboutCheckBox runat="server" ID="AnswersFontItalic" Text="Italic" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>Color:</td>
                            <td>
                                <obout:OboutDropDownList runat="server" ID="AnswersForeColor" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="Black" Selected="True" />
                                    <asp:ListItem Text="Blue" />
                                    <asp:ListItem Text="Green" />
                                    <asp:ListItem Text="Red" />
                                    <asp:ListItem Text="Yellow" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="floating">
                    <legend>Results Font</legend>

                    <table class="tdText">
                        <tr>
                            <td>
                                Size:
                            </td>
                            <td>                        
                                <obout:OboutDropDownList runat="server" ID="ResultsFontSize" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="10px" />
                                    <asp:ListItem Text="11px" Selected="True" />
                                    <asp:ListItem Text="12px" />
                                    <asp:ListItem Text="13px" />
                                    <asp:ListItem Text="14px" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Styles:</td>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="ResultsFontBold" Text="Bold" AutoPostBack="true" />

                                <obout:OboutCheckBox runat="server" ID="ResultsFontItalic" Text="Italic" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>Color:</td>
                            <td>
                                <obout:OboutDropDownList runat="server" ID="ResultsForeColor" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="Black" Selected="True" />
                                    <asp:ListItem Text="Blue" />
                                    <asp:ListItem Text="Green" />
                                    <asp:ListItem Text="Red" />
                                    <asp:ListItem Text="Yellow" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <div class="floating-clear"></div>

                <br /><br />

                <fieldset class="floating">
                    <legend>Title Font</legend>

                    <table class="tdText">
                        <tr>
                            <td>
                                Size:
                            </td>
                            <td>                        
                                <obout:OboutDropDownList runat="server" ID="TitleFontSize" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="14px" />
                                    <asp:ListItem Text="16px" />
                                    <asp:ListItem Text="18px" Selected="True" />
                                    <asp:ListItem Text="20px" />
                                    <asp:ListItem Text="22px" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Styles:</td>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="TitleFontBold" Text="Bold" AutoPostBack="true" />

                                <obout:OboutCheckBox runat="server" ID="TitleFontItalic" Text="Italic" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>Color:</td>
                            <td>
                                <obout:OboutDropDownList runat="server" ID="TitleForeColor" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="Black" Selected="True" />
                                    <asp:ListItem Text="Blue" />
                                    <asp:ListItem Text="Green" />
                                    <asp:ListItem Text="Red" />
                                    <asp:ListItem Text="Yellow" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="floating">
                    <legend>Question Font</legend>

                    <table class="tdText">
                        <tr>
                            <td>
                                Size:
                            </td>
                            <td>                        
                                <obout:OboutDropDownList runat="server" ID="QuestionFontSize" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="9px" />
                                    <asp:ListItem Text="11px" />
                                    <asp:ListItem Text="13px" Selected="True" />
                                    <asp:ListItem Text="15px" />
                                    <asp:ListItem Text="17px" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Styles:</td>
                            <td>
                                <obout:OboutCheckBox runat="server" ID="QuestionFontBold" Text="Bold" AutoPostBack="true" />

                                <obout:OboutCheckBox runat="server" ID="QuestionFontItalic" Text="Italic" Checked="true" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>Color:</td>
                            <td>
                                <obout:OboutDropDownList runat="server" ID="QuestionForeColor" Width="100" AutoPostBack="true">
                                    <asp:ListItem Text="Black" Selected="True" />
                                    <asp:ListItem Text="Blue" />
                                    <asp:ListItem Text="Green" />
                                    <asp:ListItem Text="Red" />
                                    <asp:ListItem Text="Yellow" />
                                </obout:OboutDropDownList>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PollConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:PollConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM [Answers] WHERE PollID = 1"
        UpdateCommand="UPDATE Answers SET Votes = Votes + 1 WHERE AnswerID = @AnswerID" />

    <br /><br /><br />

    <div style="width: 600px;" class="tdText">
        The Poll control offers various properties for customizing the styles of its elements:<br />
        <ul>
            <li><b>AnswerStyle</b> - used to specify the styles for the answers;</li>
            <li><b>ResultStyle</b> - used to specify the styles for the results;</li>
            <li><b>QuestionStyle</b> - used to specify the styles for the question line;</li>
            <li><b>TitleStyle</b> - used to specify the styles for the title heading.</li>
        </ul>
    </div>
</asp:Content>

