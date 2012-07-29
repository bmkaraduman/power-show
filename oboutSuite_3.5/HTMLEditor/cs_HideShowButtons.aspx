<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cs_HideShowButtons.aspx.cs" Inherits="HTMLEditor_cs_HideShowButtons" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="obout" %>
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
    <style type="text/css">
	.ob_iCChk
	{
	    top: 3px !important;
	}
	.ob_iCTxt
	{
	    line-height: 0px !important;
	    height: 21px !important;
	}
	.ob_iCCUN
	{
        height: 23px !important;
	}
	.ob_iCCUO
	{
        height: 23px !important;
	}
	.ob_iCCUF
	{
        height: 23px !important;
	}
	.ob_iCCUD
	{
        height: 23px !important;
	}
	.ob_iCCCN
	{
        height: 23px !important;
	}
	.ob_iCCCO
	{
        height: 23px !important;
	}
	.ob_iCCCF
	{
        height: 23px !important;
	}
	.ob_iCCCD
	{
        height: 23px !important;
	}
    </style>
</head>
<body style="font:12px Verdana;">
<script type="text/JavaScript">
    function pageLoad() {
        function invokingRequest() {
            Sys.Net.WebRequestManager.remove_invokingRequest(invokingRequest);
            if (!Obout.Ajax.UI.HTMLEditor.AjaxPopupLoadingInProgress) {
                document.getElementById("wait").style.visibility = "visible";
            }
        }
        Sys.Net.WebRequestManager.add_invokingRequest(invokingRequest);
        document.getElementById("wait").style.visibility = "hidden";
        document.getElementById("wait").style.height = document.getElementById("<%=Submit.ClientID%>").offsetHeight + "px";
    }
    function setButton(buttonName, toolbar, enabled) {
        var buttons = toolbar.get_buttons();
        for (var i = 0; i < buttons.length; i++) {
            var button = buttons[i];
            if (button.get_buttonName() == buttonName) {
                if (enabled) {
                    button.canBeShown = function () { return true; };
                    button.showButton();
                } else {
                    button.canBeShown = function () { return false; };
                    button.hideButton();
                }
            }
        }
    }
    function onBoldCheckedChanged(sender, isChecked) {
        var toolbar = $find("<%= editor.ClientID %>").get_topToolbar();
        setButton("Bold", toolbar, isChecked);
    }
    function onPreviewCheckedChanged(sender, isChecked) {
        var toolbar = $find("<%= editor.ClientID %>").get_bottomToolbar();
        setButton("PreviewMode", toolbar, isChecked);
    }
    function beforeActiveModeChanged(sender, args) {
        OboutCheckBox1.disable();
        OboutCheckBox2.disable();
    }
    function afterActiveModeChanged(sender, args) {
        var editor = $find("<%= editor.ClientID %>");
        if (args.get_newMode() == Obout.Ajax.UI.HTMLEditor.ActiveModeType.Design) {
            OboutCheckBox1.enable();
            setButton("Bold", editor.get_topToolbar(), OboutCheckBox1.checked());
        } else {
            OboutCheckBox1.disable();
        }
        OboutCheckBox2.enable();
        setButton("PreviewMode", editor.get_bottomToolbar(), OboutCheckBox2.checked());
    }
    function editPanelLoaded(sender, args) {
        var editor = $find("<%= editor.ClientID %>");
        var activeMode = editor.get_editPanel().get_activeMode();

        afterActiveModeChanged(sender, { get_newMode: function () { return activeMode; } });
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - Hide/show button in toolbar</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:OboutCheckBox runat="server" ID="OboutCheckBox1" Enabled="false" Checked="true"
            FolderStyle="../interface/styles/premiere_blue/OboutCheckBox" Text="Bold button Enabled">
            <ClientSideEvents OnCheckedChanged="onBoldCheckedChanged" />
        </obout:OboutCheckBox>
        <br />
        <obout:OboutCheckBox runat="server" ID="OboutCheckBox2" Enabled="false" Checked="true"
            FolderStyle="../interface/styles/premiere_blue/OboutCheckBox" Text="Bold button Enabled">
            <ClientSideEvents OnCheckedChanged="onPreviewCheckedChanged" />
        </obout:OboutCheckBox>
        <asp:UpdatePanel ID="updatePanel1" runat="server">
            <ContentTemplate>
                <obout:Editor runat="server" Id="editor" Height="330px" Width="100%" TopToolbar-Appearance="Lite" >
                    <EditPanel OnClientBeforeActiveModeChanged="beforeActiveModeChanged"
                                OnClientActiveModeChanged="afterActiveModeChanged"
                                OnClientLoaded="editPanelLoaded" />
                </obout:Editor>
                <asp:Button runat="server" Text="Submit content" ID="Submit" OnClick="Submit_click" />
                <img alt="" id="wait" align="absMiddle" style="visibility:hidden; height: 30px" src="<%=Page.ClientScript.GetWebResourceUrl(typeof(Obout.Ajax.UI.HTMLEditor.Editor), "Obout.Ajax.UI.HTMLEditor.Images.ed_wait.gif")%>" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <br /><br /><a href="Default.aspx?type=CSHARP">< Back to examples</a>
</body>
</html>