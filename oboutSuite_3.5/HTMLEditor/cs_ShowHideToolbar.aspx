<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_ShowHideToolbar.aspx.cs" Inherits="HTMLEditor_cs_ShowHideToolbar" %>
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
                border-bottom: 1px solid #C2C2C2;
                border-left: 1px solid #C2C2C2;
                border-right: 1px solid #C2C2C2;
        }
    </style>
</head>
<script type="text/JavaScript">
var editMode = null;
function pageLoad(sender, e) {
    function invokingRequest() {
        Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
        if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
            var editPanel = $find("<%= EditPanel1.ClientID %>");
            editMode = editPanel.get_activeMode();
            editPanel.set_activeMode(Obout.Ajax.UI.HTMLEditor.ActiveModeType.Preview);
            $get("wait").style.visibility = "visible";
            $get("toolbarPlace").style.display = "none";
            var showToolbarImage = $get("showToolbarImage");
            showToolbarImage.style.display = "";
            showToolbarImage.style.MozOpacity = "0.4";
            showToolbarImage.style.opacity = "0.4";
            showToolbarImage.style.filter = "alpha(opacity:40)";
            showToolbarImage.style.cursor = "pointer";
            showToolbarImage.onclick = function() { };
        }
    }
    Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
    var wait = $get("wait");
    wait.style.visibility = "hidden";
    wait.style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";
    var editPanel = $find("<%= EditPanel1.ClientID %>");
    editPanel.set_activeMode(editMode == null ? Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design : editMode);
}
function showToolbar() {
    $get("toolbarPlace").style.display = "";
    $get("showToolbarImage").style.display = "none";
}
function editPanelLoaded(sender, args) {
    var showToolbarImage = $get("showToolbarImage");
    showToolbarImage.style.MozOpacity = "1";
    showToolbarImage.style.opacity = "1";
    showToolbarImage.style.filter = "alpha(opacity:100)";
    showToolbarImage.style.cursor = "pointer";
    showToolbarImage.onclick = showToolbar;
}

</script>
<body style="font:12px Verdana;">
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Show/hide toolbar</span>
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
        Click the
        <img align="absmiddle" title="Show toolbar" alt="Show toolbar" src="SiteImages/ShowToolbar.gif" />
        button below to make the toolbar visible.
        <br /><br />
        <asp:UpdatePanel ID="updatePanel1" runat="server">
           <ContentTemplate>
               <obout:EditorEditPanel PopupHolderID="popupHolder" runat="server" Id="EditPanel1"
                           AutoFocus="true" Width="604px" Height="300px" OnClientLoaded="editPanelLoaded" 
                           LinkedToolbars="TopToolbar" Style="border: 1px solid #C2C2C2;" />
           </ContentTemplate>
           <Triggers>
               <asp:AsyncPostBackTrigger ControlID="Submit" /> 
           </Triggers> 
        </asp:UpdatePanel>
        <img title="Show toolbar" alt="Show toolbar" src="SiteImages/ShowToolbar.gif"
             style="cursor: text; -moz-opacity:0.4; filter:alpha(opacity:40); opacity: 0.4;" id="showToolbarImage" />
        <div id="toolbarPlace" style="display:none">
            <obout:EditorTopToolbar runat="server" PopupHolderID="popupHolder" Width="600px" PreservePlace="true"
                Id="TopToolbar" CssClass="toptoolbar" IgnoreTab="True" >
                <AddButtons>
                    <obout:VerticalSeparator runat="server" />
                    <obout:HorizontalSeparator runat="server" />
                    <obout:VerticalSeparator runat="server" />
                    <obout:DesignMode runat="server" />
                    <obout:HtmlMode runat="server" />
                    <obout:PreviewMode runat="server" />
                </AddButtons>
            </obout:EditorTopToolbar>
        </div>
        <br /><br />
        <asp:Button runat="server" Text="Submit content" ID="Submit" />
        <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
<script type="text/JavaScript">

    // register class for the custom button 'Close toolbar' (see the code file)

    Type.registerNamespace("CustomToolbarButton");

    CustomToolbarButton.CloseToolbarButton = function(element) {
        CustomToolbarButton.CloseToolbarButton.initializeBase(this, [element]);
    }

    CustomToolbarButton.CloseToolbarButton.prototype = {
        // override this base method
        _onclick: function(ev) {
            // call the base method
            if (!CustomToolbarButton.CloseToolbarButton.callBaseMethod(this, "_onclick", [ev])) {
                // it can not be executed now
                return false;
            }
            // hide the toolbar
            $get("toolbarPlace").style.display = "none";
            // show the 'Toolbar' image
            $get("showToolbarImage").style.display = "";
            return true;
        }
    }
    CustomToolbarButton.CloseToolbarButton.registerClass("CustomToolbarButton.CloseToolbarButton", Obout.Ajax.UI.HTMLEditor.ToolbarButton.ImageButton);
</script>
</html>
