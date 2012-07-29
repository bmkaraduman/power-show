<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_oboutWindow.aspx.cs" Inherits="HTMLEditor_cs_oboutWindow" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
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
    </style>
</head>
<script type="text/javascript">
    function pageLoad() {
        function invokingRequest() {
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                document.getElementById("<%=Submit.ClientID%>").style.display = "none";
                document.getElementById("<%=CancelButton.ClientID%>").style.display = "none";
                document.getElementById("wait").style.visibility = "visible";
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
        document.getElementById("wait").style.visibility = "hidden";
        if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
            var editor = $get("<%= editor.ClientID %>");
            var submit = $get("<%= Submit.ClientID %>");
            submit.parentNode.insertBefore(editor, submit);
            editor.style.display = "";
            // Trick for IE9 - Editable iframe is not editable after its parents moving
            //-------------------------------------------------------------------------
            if (Obout.Ajax.UI.HTMLEditor.isIE && Sys.Browser.version >= 9) {
                setTimeout(function () {
                    var editPanel = $find("<%= editor.ClientID %>").get_editPanel();
                    var activeMode = editPanel.get_activeMode();
                    if (activeMode != Obout.Ajax.UI.HTMLEditor.ActiveModeType.Html) {
                        var content = editPanel.get_content();
                        var myHandler = function (sender, args) {
                            setTimeout(function () {
                                editPanel.remove_activeModeChanged(myHandler);
                                editPanel.set_activeMode(activeMode);
                                editPanel.set_content(content);
                                setTimeout(function () {
                                    editPanel.add_activeModeChanged(function () { setTimeout(function () { windowResize() }, 0) });
                                }, 0);
                            }, 0);
                        };
                        editPanel.add_activeModeChanged(myHandler);
                        editPanel.set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Html);
                    }
                }, 0);
            }
            //-------------------------------------------------------------------------
            if (typeof myWindow != "undefined") {
                myWindow.Close();
            }
        }
    }

    function cancelPopup() {
        myWindow.Close();
        return false;
    }

    function windowResize() {
        var container = $get("<%= editor.ClientID%>");
        var submit = $get("<%= Submit.ClientID %>");
        if (submit.parentNode != container.parentNode) return;
        var step = 20;
        var temp;
        var innerTable = container.firstChild;

        while (innerTable.nodeType != 1 || innerTable.tagName.toUpperCase() != "TABLE") {
            innerTable = innerTable.nextSibling;
        }
        while ((temp = IsInScroll(container)) == 0) {
            innerTable.style.height = parseInt(innerTable.style.height) + step + "px";
        }
        innerTable.style.height = parseInt(innerTable.style.height) - temp + "px";
    }

    function IsInScroll(elem) {
        elem = elem.parentNode.parentNode;
        if (elem.clientHeight > 0 && elem.scrollHeight && elem.scrollHeight > 0) {
            if (elem.scrollHeight > elem.clientHeight) {
                return elem.scrollHeight - elem.clientHeight;
            }
        }
        return 0;
    }

    function windowOpen() {
        windowResize();
    }

    function windowPreClose() {
        if (Obout.Ajax.UI.HTMLEditor.DesignPanel.isPopup()) {
            setTimeout(function() { alert("Close Editor's popups!!!"); }, 0);
            return false;
        }
        return true;
    }
</script>
<style type="text/css">
    #<%= ContentPanel.ClientID %> p { padding: 0px;}
    #<%= ContentPanel.ClientID %> { font-family: verdana,sans-serif;font-size: 10pt; }
    #<%= ContentPanel.ClientID %> p, #<%= ContentPanel.ClientID %> td { font-family: verdana,sans-serif;font-size: 10pt; }
</style>
<body style="font:12px Verdana;" scroll="no">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> inside the <b>Window</b> control</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:PopupHolder runat="server" id="popupHolder" DefaultAddPolicy="Demand" PopupsZIndex="200000" />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor style="display:none" runat="server" Id="editor" Height="300px" Width="100%" PopupHolderID="popupHolder" />
               <asp:LinkButton ID="LinkButton1" runat="server" Text="Edit content" OnClientClick="myWindow.Open(); return false;" />
               <hr />
               <asp:Label ID="ContentPanel" runat="server" />
               <obout:Window runat="server" ShowMaximizeButton="true" Title="Edit" Overflow="HIDDEN" ID="myWindow"
                           Width="800" Height="550" Left="200" Top="100" VisibleOnLoad="false"
                           OnClientResize="windowResize();" OnClientOpen="windowOpen();" OnClientPreClose="return windowPreClose();"
                           StyleFolder="../window/wdstyles/default" ShowStatusBar="true">
                   <asp:LinkButton runat="server" onclick="SubmitClick" Text="Save content" ID="Submit" />
                   &nbsp;
                   <asp:LinkButton ID="CancelButton" runat="server" Text="Cancel" OnClientClick="return cancelPopup();" />
                   <img id="wait" align="absMiddle" style="visibility:hidden; height:30px;" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
               </obout:Window>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>