<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_CustomImagesBrowser.aspx.vb" Inherits="HTMLEditor_vb_CustomImagesBrowser" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
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
    </style>
</head>
<body style="font:12px Verdana;">
<script type="text/JavaScript">
    function popupStateChanged(sender, args) {
        // on popup loaded only
        if (args.get_state() == Obout.Ajax.UI.HTMLEditor.PopupStateType.LoadEnd) {
            // 'Image properties' popup only
            if (args.get_name().split(",")[0] == "Obout.Ajax.UI.HTMLEditor.Popups.ImageProperties") {
                // find the popup component 
                var popup = $find(sender.findPopup(args.get_name()).clientID);
                // when popup's content will be complete
                popup.onReload = function (contentWindow) {
                    // get the 'browse' button handler
                    var browseHandler = contentWindow.popupMediator.getHandler("browse");
                    // set the 'call method' of the button handler to this new function
                    browseHandler.autoCallMethod = function () {
                        // open our custom images selector
                        var browseWindow = window.open("CustomImageSelector.aspx", "customImagesBrowseWindow", "location=0,toolbar=0,status=0,resizable=0,width=500,height=520,menubar=0");
                        // set the opener's content window
                        browseWindow.opener.contentWindow = contentWindow;
                        // Opera doesn' support 'onbeforeunload' event
                        if (window.opera) { // emulate 'onbeforeunload' behavior
                            var _intervalHandler = setInterval(function () {
                                if (browseWindow.closed) { // test the window is still opened
                                    contentWindow._processResult(null);
                                    clearInterval(_intervalHandler);
                                }
                            }, 100);
                        }
                    };
                    // this function will be called when our custom window loaded
                    contentWindow._processWindowLoaded = function () {
                        // disable all fields in the 'Image properties' popup
                        popup.disable();
                    };
                    // this function will be called on the custom window closed, OK and Cancel
                    contentWindow._processResult = function (result) {
                        // enable all fields in the 'Image properties' popup
                        popup.enable();
                        if (result != null) { // OK clicked
                            // set fields of the 'Image properties' popup
                            contentWindow.popupMediator.getField("url").value = result.url;
                            contentWindow.popupMediator.getField("width").value = result.width;
                            contentWindow.popupMediator.getField("height").value = result.height;
                            contentWindow.popupMediator.getField("tooltip").value = result.title;
                            // notify the 'browse' button handler that 'browse window' is closed on OK
                            browseHandler.raise_okCallback(new Sys.EventArgs());
                        }
                    };

                };
                // if popup load fired already (IE)
                if (typeof popup._iframe.contentWindow.popupMediator != "undefined") {
                    popup.onReload(popup._iframe.contentWindow);
                }
            }
        }
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Custom images browser</span>
    <br /><br />
    Try to insert/edit images
    <img style="background-color: blue;margin:0px;" align="absmiddle" alt=""
        src="<%= Page.ClientScript.GetWebResourceUrl(GetType(Obout.Ajax.UI.HTMLEditor.ToolbarButton.CommonButton), "Obout.Ajax.UI.HTMLEditor.Images.ed_image_n.gif") %>" />
    . Also you can edit the image properties with the context menu.
    <br />
    Click the <b>Browse</b> button in the opened popup:
    <img alt="" align="absMiddle" src="SiteImages/OpenCustomImagesBrowser.gif" />
    <br /><br />
    A Window with the custom images browser will be opened:
    <img alt="" align="absMiddle" src="SiteImages/CustomImagesBrowser.gif" />
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
               <obout:Editor runat="server" Id="editor" EditPanel-Height="280px" TopToolbar-PreservePlace="true" Width="100%">
                  <PopupHolder ID="PopupHolder1" runat="server" OnClientPopupStateChanged="popupStateChanged" />
               </obout:Editor>
               <br />
               <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>
