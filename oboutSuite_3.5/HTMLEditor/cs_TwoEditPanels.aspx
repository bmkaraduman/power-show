<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_TwoEditPanels.aspx.cs" Inherits="HTMLEditor_cs_TwoEditPanels" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    TagPrefix="obout"
    Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" %>
<%@ Register
    TagPrefix="custom"
    Namespace="CustomToolbarButton" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.Popups"
    TagPrefix="obout" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor.QF"
    TagPrefix="obout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Editor Sample</title>
    <style type="text/css">
        a {
               font-size:10pt;font-family:Tahoma
        }
        a:hover {
               color:crimson;
        }
        .tdText {
                font:11px Verdana;
                color:#333333;
        }
        .toptoolbar
        {
                cursor:text;
                padding: 0px 2px 2px 2px;
                border-top: 1px solid #C2C2C2;
                border-left: 1px solid #C2C2C2;
                border-right: 1px solid #C2C2C2;
        }
        .bottomtoolbar
        {
                cursor:text;
                padding: 0px 0px 2px 2px;
                border-bottom: 1px solid #C2C2C2;
                border-left: 1px solid #C2C2C2;
                border-right: 1px solid #C2C2C2;
        }
        .quickformatting
        {
                cursor:text;
                border-top: 1px solid #C2C2C2;
                border-bottom: 1px solid #C2C2C2;
                border-right: 1px solid #C2C2C2;
        }
    </style>
</head>
<script type="text/JavaScript">

var previousFocusedEditPanel = null;

function onFocused(sender, e) {
    //setTimeout(function() { alert(sender.get_element().id); }, 2000);
    if (previousFocusedEditPanel == null || previousFocusedEditPanel != sender) {
        if (previousFocusedEditPanel != null) {
            var previousElement = previousFocusedEditPanel.get_element();
            if (previousElement != null) {
                previousFocusedEditPanel.get_element().parentNode.style.backgroundImage = "";
            }
        }
        var td = sender.get_element().parentNode;
        td.style.backgroundImage = "url('styles/blue_s.gif')";
        previousFocusedEditPanel = sender;
    }
}

function pageLoad(sender, e) {
    function invokingRequest() {
        Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
        if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
            document.getElementById("wait").style.visibility = "visible";
        }
    }
    Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    document.getElementById("wait").style.visibility = "hidden";
    document.getElementById("wait").style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";

    previousFocusedEditPanel = null;
    var EP1 = $get("<%= EditPanel1.ClientID %>");
    var EP2 = $get("<%= EditPanel2.ClientID %>");
    var EP1_parent = EP1.parentNode;
    var EP2_parent = EP2.parentNode;

    EP1_parent.style.borderWidth = "0px";
    EP2_parent.style.borderWidth = "0px";
    EP1_parent.style.backgroundColor = "#C2C2C2";
    EP2_parent.style.backgroundColor = "#C2C2C2";
    EP1_parent.style.padding = "1px";
    EP2_parent.style.padding = "1px";

    // Tricking IE's bug
    if (Obout.Ajax.UI.HTMLEditor.isIE) {
        EP1.style.backgroundColor = "transparent"
        EP2.style.backgroundColor = "transparent"
    }
}
</script>
<body style="font:12px Verdana;">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> -Two <b>EditPanel</b> controls with common two <b>Toolbar</b> controls and <b>QuickFormatting</b> control</span>
    <br /><br />
    <form id="form1" runat="server">
    <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" >
       <demand>
           <obout:SpellCheckPopup CustomDictionaryOnServer="true" runat="server">
               <Dictionaries>
                 <obout:SpellCheckDictionary FileName="en-US.dic" DisplayName="English(US)" />
                 <obout:SpellCheckDictionary FileName="en-GB.dic" DisplayName="English(GB)" />
               </Dictionaries>
           </obout:SpellCheckPopup>
       </demand>
    </obout:PopupHolder>
        <table border="0" cellspacing="0" cellpadding="0" style="height:400px">
        <tr>
        <td>
          <obout:EditorTopToolbar runat="server" PopupHolderID="popupHolder" Width="618px"
              Id="TopToolbar" CssClass="toptoolbar" IgnoreTab="True" PreservePlace="True" />
            <asp:UpdatePanel ID="updatePanel1" runat="server">
               <ContentTemplate>
                  <table border="0" cellspacing="0" cellpadding="0" style="width:620px;height:400px">
                     <tr>
                        <td style="height:100%; border: 1px solid #C2C2C2; overflow:hidden;">
                           <obout:EditorEditPanel PopupHolderID="popupHolder" runat="server" Id="EditPanel1" OnClientFocused="onFocused"
                                       AutoFocus="true"
                                       LinkedToolbars="TopToolbar;BottomToolbar;QF" Style="height:100%; width:310px; background-color: #FFFFFF; overflow:hidden;" />
                        </td>
                        <td style="height:100%; border: 1px solid #C2C2C2; overflow:hidden;">
                           <obout:EditorEditPanel PopupHolderID="popupHolder" runat="server" Id="EditPanel2" OnClientFocused="onFocused"
                                       AutoFocus="false"
                                       LinkedToolbars="TopToolbar;BottomToolbar;QF" Style="height:100%; width:310px; background-color: #FFFFFF; overflow:hidden;" />
                        </td>
                     </tr>
                  </table>
               </ContentTemplate>
               <Triggers>
                   <asp:AsyncPostBackTrigger ControlID="Submit" /> 
               </Triggers> 
            </asp:UpdatePanel>
           <obout:EditorBottomToolbar runat="server" Id="BottomToolbar" Width="620px" Height="25px"
               CssClass="bottomtoolbar" IgnoreTab="true" />
        </td>
        <td valign="top" Class="quickformatting">
           <obout:QuickFormatting runat="server" Id="QF" Width="150px" Height="100%" />
        </td>
        </tr>
        </table>
       <asp:Button runat="server" Text="Submit content" ID="Submit" />
       <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>
