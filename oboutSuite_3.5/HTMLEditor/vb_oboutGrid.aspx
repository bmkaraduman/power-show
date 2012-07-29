<%@ Page Language="VB" AutoEventWireup="true" CodeFile="vb_oboutGrid.aspx.vb" Inherits="HTMLEditor_vb_oboutGrid" ValidateRequest="false" %>
<%@ Register
    Assembly="Obout.Ajax.UI"
    Namespace="Obout.Ajax.UI.HTMLEditor"
    TagPrefix="obout" %>
<%@ Register Assembly="Obout.Ajax.UI" Namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" TagPrefix="obout" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_Net" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head id="Head1" runat="server">
    <title>Editor Sample</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
        .rowEditTable td
        {
            font-family: Verdana;
            font-size: 10px;
            color: #4B555E;
        }
    </style>
</head>
<body style="font:12px Verdana;">
<script type="text/JavaScript">
    function onAddEdit() {
        var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
        editorObject.set_content(document.getElementById('EditorContent').value);
    }

    function onBeforeInsertUpdate() {
        var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
        document.getElementById('EditorContent').value = editorObject.get_content();
        editorObject.clearHistory();
    }

    function onBeforeClientCancelEdit() {
        var editorObject = $find(document.getElementById("<%= EditorID.ClientID %>").value);
        var editPanel = editorObject.get_editPanel();
        editPanel.ensurePopupsClosed();
        editorObject.clearHistory();
    }
</script>
    <span class="tdText"><b>Obout.Ajax.UI.HTMLEditor controls</b> - <b>Editor</b> in the edit template of the <b>Grid</b> control</span>
    <br /><br />
    <form id="form1" runat="server">
        <asp:ScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        <obout:EditorPopupHolder runat="Server" ID="popupHolder" />

        <asp:HiddenField ID="EditorID" runat="server" />
    
        <obout:Grid ID="grid1" runat="server" Serialize="true" AutoGenerateColumns="false"
            FolderStyle="../grid/styles/grand_gray" OnRebind="RebindGrid" OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
            <ClientSideEvents OnClientEdit="onAddEdit" OnClientAdd="onAddEdit" OnBeforeClientUpdate="onBeforeInsertUpdate"
                OnBeforeClientInsert="onBeforeInsertUpdate" OnBeforeClientCancelEdit="onBeforeClientCancelEdit" />
            <Columns>
                <obout:Column DataField="OrderID" HeaderText="ID" ReadOnly="true"></obout:Column>
                <obout:Column DataField="ShipName" HeaderText="NAME"></obout:Column>
                <obout:Column DataField="AdditionalInformationHTML" HeaderText="ADDITIONAL INFORMATION" Width="600" ParseHTML="true">
                    <TemplateSettings EditTemplateId="tmpEditor" />
                </obout:Column>
                <obout:Column AllowEdit="true"></obout:Column>
            </Columns>
            <Templates>
                <obout:GridTemplate runat="server" ControlID="EditorContent" ID="tmpEditor" ControlPropertyName="value">
                    <Template>
                        <obout:Editor runat="server" ID="Editor" EditPanel-Height="100px" Width="100%" PopupHolderID="popupHolder">
                            <TopToolbar Appearance="custom" >
                                <AddButtons>
                                   <obout:ButtonsGroup runat="server"><Buttons>
                                       <obout:Undo runat="server" />
                                       <obout:Redo runat="server" />
                                       <obout:HorizontalSeparator runat="server" />
                                   </Buttons></obout:ButtonsGroup>
                                   <obout:ButtonsGroup runat="server"><Buttons>
                                       <obout:Bold runat="server" />
                                       <obout:Italic runat="server" />
                                       <obout:Underline runat="server" />
                                       <obout:HorizontalSeparator runat="server" />
                                   </Buttons></obout:ButtonsGroup>
                                   <obout:ButtonsGroup runat="server"><Buttons>
                                       <obout:FixedForeColor ID="FixedForeColorButton" runat="server" />
                                       <obout:ForeColorSelector FixedColorButtonID="FixedForeColorButton" runat="server" />
                                   </Buttons></obout:ButtonsGroup>
                                   <obout:HorizontalSeparator runat="server" />
                                   <obout:ButtonsGroup runat="server"><Buttons>
                                       <obout:FixedBackColor ID="FixedBackColorButton" runat="server" />
                                       <obout:BackColorSelector FixedColorButtonID="FixedBackColorButton" runat="server" />
                                   </Buttons></obout:ButtonsGroup>
                                   <obout:HorizontalSeparator runat="server" />
                                   <obout:RemoveStyles runat="server" />
                                   <obout:TextIndicator runat="server" />
                                </AddButtons>
                            </TopToolbar>
                            <BottomToolbar ShowDesignButton="false" ShowHtmlTextButton="false" ShowPreviewButton="false" />
                        </obout:Editor>
                        <input type="hidden" id="EditorContent" />
                    </Template>
                </obout:GridTemplate>
            </Templates>
        </obout:Grid>
        <br />
        <br />
        <span class="tdText">The <b>Editor</b> control can be used inside the <b>Grid</b> to edit fields that
            contain data in <i>HTML</i> format.</span>
    </form>
    <br /><br /><a href="Default.aspx?type=VBNET">< Back to examples</a>
</body>
</html>